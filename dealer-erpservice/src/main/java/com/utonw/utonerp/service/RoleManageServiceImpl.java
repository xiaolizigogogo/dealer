package com.utonw.utonerp.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.utonw.dealer.api.entity.erp.*;
import com.utonw.dealer.api.exception.ServiceException;
import com.utonw.dealer.api.service.erp.IActivitiAccountBS;
import com.utonw.dealer.api.service.erp.IRoleManageService;
import com.utonw.dealer.api.util.erp.PageModel;
import com.utonw.utonerp.core.dao.BaseDao;
import com.utonw.utonbase.core.erpcommon.utils.MsgUtils;
import com.utonw.utonerp.mapper.*;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.*;

/**
 * 角色管理实现类
 * <p/>
 * Created by user on 2015/5/26.
 */
@Service(version = "1.0.0")
public class RoleManageServiceImpl implements IRoleManageService {

    private static Logger logger = Logger.getLogger(RoleManageServiceImpl.class);

    @Autowired
    private RoleManageMapper roleManageMapper;

    @Autowired
    private ModuleRoleMapper moduleRoleMapper;
    @Autowired
    private RoleUserMapper roleUserMapper;
   
    @Autowired
    private RoleAssignMapper roleAssignMapper;

    @Autowired
    private BaseDao<RoleManage> baseDao;

    @Autowired
    private IActivitiAccountBS activitiAccountBS;


    @Autowired
    private UserMapper userMapper;

    @Override
    public boolean saveOrUpdateRoleManage(Integer roleId, String roleName, String[] moduleIds,String userId) {
        boolean result = false;
        RoleManage roleManage = new RoleManage();
        RoleAssign roleAssign = new RoleAssign();
        //String userId = SysUserUtil.getSessionLoginUser().getUuid();
        logger.info("=====roleId=" + roleId + ";roleName=" + roleName + ";moduleIds=" + Arrays
                .toString(moduleIds));
        try {
            if (null != roleId) {
                /** 更新角色名称 */
                roleManage = roleManageMapper.selectByPrimaryKey(roleId);
                roleManage.setRoleName(roleName);
                roleManageMapper.updateByPrimaryKey(roleManage);

                /** 更新角色拥有菜单权限 */
                saveModuleRoleRelation(roleId, moduleIds);

                result = true;
            } else {
                /** 添加一个新的角色 */
                roleManage.setIsShow("Y");
                roleManage.setRoleName(roleName);
                roleManageMapper.insertSelective(roleManage);//返回添加的主键ID
                logger.debug("========返回添加的主键ID：" + roleManage.getRoleId() + "==========");
                
                /** 更新角色拥有菜单权限 */
                saveModuleRoleRelation(roleManage.getRoleId(), moduleIds);
                
                /** 添加新角色到role_assign表 **/
                roleAssign.setRoleId(roleManage.getRoleId());
                roleAssign.setUserId(userId);
                roleAssign.setCustomerId(userId);  
                roleAssignMapper.insert(roleAssign);

                result = true;
            }
            // 同步更新到activiti的权限设置中
            activitiAccountBS.saveOrUpdateGroup(roleManage);

            /** 删除不包含在moduleIds数组中的模块角色关联关系 */
            Map<String, Object> map = new HashMap<>();
            map.put("roleId", roleId);
            map.put("moduleId", moduleIds == null ? new String[]{} : moduleIds);
            moduleRoleMapper.deleteNotInModule(map);
        } catch (Exception e) {
            e.printStackTrace();
            logger.info("保存/修改角色有误=====" + e);
        }
        return result;

    }

    /**
     * 保存模块与角色关联关系
     *
     * @param roleId    角色ID
     * @param moduleIds 模块ID（数组）
     */
    private void saveModuleRoleRelation(Integer roleId, String[] moduleIds) {
        if (null != moduleIds && moduleIds.length > 0) {
            for (String s : moduleIds) {
                Integer mId = Integer.parseInt(s);
                /** 根据角色ID和模块ID查询角色模块关联表 */
                List<ModuleRole> list = moduleRoleMapper.findListByModuleAndRole(Integer
                        .parseInt(s), roleId);

                if (list == null || list.size() <= 0) {
                    ModuleRole moduleRole = new ModuleRole();
                    moduleRole.setRbModuleId(mId);
                    moduleRole.setRbRoleId(roleId);
                    moduleRoleMapper.insert(moduleRole);
                }
            }
        }
    }


    /**
     * 查询角色列表分页
     *
     * @param currentPage 当前页数
     * @param param       参数
     * @return PageModel
     */
    @Override
    public PageModel<RoleManage> getRoleManageList(int currentPage, Map<String, Object> param) {
        return baseDao.getPage("com.maiqianweng.mapper.RoleManageMapper.getListByParam",
                param,
                currentPage);
    }

    /**
     * 删除对象
     *
     * @param id 角色ID
     * @return true/false
     */
    @Override
    public String delete(Integer id) {
        String result = "";
        try {
            /** 根据角色ID查询出该角色是否分配模块 */
            List<ModuleRole> mrList = moduleRoleMapper.findModuleByRoleId(id);
            if (null != mrList && mrList.size() > 0) {
                logger.info("id为" + id + "的角色下已经分配了模块，请先删除该角色下的模块！");

                return "该角色已经分配了模块，请先删除该角色下的模块！";
            }

            /** 根据角色ID查询出该所有分配该角色的用户 */
            List<RoleUser> ruList = roleUserMapper.findRoleUserById(id, null);
            if (null != ruList && ruList.size() > 0) {
                for (RoleUser ru : ruList) {
                    logger.info("id为" + id + "的角色已有user被授权,已移除！");
                    roleUserMapper.deleteByPrimaryKey(ru.getRbId());
                }
            }

            /** 删除角色 */
            roleManageMapper.deleteByPrimaryKey(id);
            /** 删除activi中的角色*/
            activitiAccountBS.deleteGroup(id);
            result = "0000";
        } catch (Exception e) {
            e.printStackTrace();
            logger.info("删除角色有误=====" + e);
        }
        return result;
    }

    /**
     * 根据ID查询角色对象
     *
     * @param id 角色ID
     * @return RoleManage
     */
    @Override
    public RoleManage findById(Integer id) {
        return roleManageMapper.selectByPrimaryKey(id);
    }

    @Override
    public Map<String, List<RoleManage>> getRoleManageByUser(String customerId, String userId) {
        Map<String, List<RoleManage>> map = new HashMap<>();
        logger.info("查询uuid为" + customerId + "的用户所拥有的角色列表");
        try {
            List<RoleManage> inRoleList = new ArrayList<>();
            /** 根据用户ID查询该用户所拥有的角色 */
            List<RoleUser> roleUserList = roleUserMapper.findRoleUserById(null, customerId);
            for (RoleUser ru : roleUserList) {
                RoleManage rm = roleManageMapper.selectByPrimaryKey(ru.getRbRoleId());
                inRoleList.add(rm);
            }

            /** 查询指定用户未分配的角色 */
            List<RoleManage> noRoleList = roleManageMapper.findRoleManageNotInRoleUser(customerId,userId);
            map.put("inRole", inRoleList);// 拥有的角色
            map.put("noRole", noRoleList);// 未拥有的角色

        } catch (Exception e) {
            e.printStackTrace();
            logger.info("查询角色列表失败-----" + e);
        }
        return map;
    }

    @Override
    public boolean grantRoleUser(String uuid, String[] roleIds) {
        boolean result = false;
        User user = userMapper.selectByPrimaryKey(uuid);
        try {
            if (null != roleIds) {
                for (String s : roleIds) {
                    logger.info("=====userId=" + uuid + ",roleId=" + s);
                    Integer roleId = Integer.parseInt(s);
                    RoleUser roleUser = new RoleUser();
                    roleUser.setRbRoleId(roleId);
                    roleUser.setRbUserId(uuid);
                    /** 根据角色ID和用户UUID查询用户角色关联表，如果无则添加 */
                    List<RoleUser> list = roleUserMapper.findRoleUserById(roleId, uuid);
                    if (list == null || list.size() == 0)
                        roleUserMapper.insert(roleUser);
                }
            }
            /** 删除不包含在roleIds数组中的角色 */
            Map<String, Object> map = new HashMap<>();
            map.put("userId", uuid);
            map.put("roleId", roleIds == null ? new String[]{} : roleIds);
            roleUserMapper.deleteNotInRole(map);
            //更新缓存数据
            //SysUserUtil.refreshModuleCache();
            /** 添加角色到activiti */
            activitiAccountBS.updateActivitiDataSet(user,roleIds);
            result = true;
            //查询最新的角色
        } catch (Exception e) {
            e.printStackTrace();
            logger.info("分配角色失败-----" + e);
        }
        return result;
    }

    @Override
    public Map<String, Object> modifyRoleUser(Integer roleId, String oldUsers, String newUsers) throws ServiceException {
      //   RoleManage roleManage = roleManageMapper.selectByPrimaryKey(roleId);
        if (oldUsers != null && !"".equals(oldUsers)) {
            String[] oldUserArray = oldUsers.split(",");
            for (String uoid : oldUserArray) {
                roleUserMapper.deleteByUserIdAndRoleId(uoid, roleId);
                User user = userMapper.selectByPrimaryKey(uoid);
                activitiAccountBS.saveOrUpdate(user, roleId);
            }
        }

        if (newUsers != null && !"".equals(newUsers)) {
            String[] newUserArray = newUsers.split(",");
            for (String unid : newUserArray) {
                User user = userMapper.selectByPrimaryKey(unid);
                RoleUser roleUser = new RoleUser();
                roleUser.setRbRoleId(roleId);
                roleUser.setRbUserId(unid);
                roleUserMapper.insert(roleUser);
                activitiAccountBS.saveOrUpdate(user, roleId);
            }
        }
        return MsgUtils.getSuccessMsgMap("保存成功");
    } 
    @Override
    public  Map<String,List<RoleManage>> getRoleAssignByUser(String customerId,String UserId){
            Map<String, List<RoleManage>> map = new HashMap<>();
            logger.info("查询uuid为" + customerId + "的用户所能分配的角色列表");
            try {
                List<RoleManage> inRoleList = new ArrayList<>();
                /** 根据用户ID查询该用户所拥有的角色 */
                List<RoleAssign> roleAssignList = roleAssignMapper.findRoleAssignById(null,customerId);
                for (RoleAssign ra : roleAssignList) {
                    RoleManage rm = roleManageMapper.selectByPrimaryKey(ra.getRoleId());
                    inRoleList.add(rm);
                }
                /** 查询指定用户未分配的角色 */
                 List<RoleManage> noRoleList = roleManageMapper.findRoleManageNotInRoleAssign(customerId,UserId);
                 map.put("noRole", noRoleList);// 未拥有的角色
                 map.put("inRole", inRoleList);// 拥有的角色

            } catch (Exception e) {
                e.printStackTrace();
                logger.info("查询角色列表失败-----" + e);
            }
            return map;
        }   
    @Override
    public boolean asssignRoleUser(String customerId, String[] roleIds, String loginUserId) {
        boolean result = false;
        try {
            if (null != roleIds) {
                for (String s : roleIds) {
                    logger.info("=====customerId=" + customerId + ",roleId=" + s);
                    Integer roleId = Integer.parseInt(s);
                    RoleAssign roleAssign = new RoleAssign();
                    roleAssign.setUserId(loginUserId);
                    roleAssign.setRoleId(roleId);
                    roleAssign.setCustomerId(customerId);                                   
					/** 根据角色ID和用户UUID查询用户角色关联表，如果无则添加 */
                    List<RoleAssign> list = roleAssignMapper.findRoleAssignById(roleId, customerId);
                    if (list == null || list.size() == 0)
                        roleAssignMapper.insert(roleAssign);
                }
            }
            /** 删除不包含在roleIds数组中的角色 */
            Map<String, Object> map = new HashMap<>();
            map.put("userId", customerId);
            map.put("roleId", roleIds == null ? new String[]{} : roleIds);
            roleAssignMapper.deleteNotInRole(map);
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            logger.info("分配角色失败-----" + e);
        }
        return result;
    }

    @Override
    public List<RoleUser> getRoleUserList(String uuid) {
        return roleUserMapper.selectByUuid(uuid);
    }

    @Override
    public int insertRoleAssign(RoleAssign rs) {
        return roleAssignMapper.insert(rs);
    }
}
