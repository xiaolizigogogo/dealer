package com.utonw.utonerp.service;

import com.utonw.dealer.api.entity.erp.ModuleManage;
import com.utonw.dealer.api.entity.erp.ModuleManageTree;
import com.utonw.dealer.api.entity.erp.ModuleRole;
import com.utonw.dealer.api.service.erp.IModuleManageService;
import com.utonw.dealer.api.util.erp.Constants;
import com.utonw.utonerp.mapper.ModuleManageMapper;
import com.utonw.utonerp.mapper.ModuleRoleMapper;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
 * 模块管理service实现类
 * Created by user on 2015/5/26.
 */
@com.alibaba.dubbo.config.annotation.Service(version = "1.0.0")
@Service("moduleManageService")
public class ModuleManageServiceImpl implements IModuleManageService {

    Logger logger = Logger.getLogger(this.getClass());

    @Autowired
    ModuleManageMapper moduleManageMapper;

    @Autowired
    ModuleRoleMapper moduleRoleMapper;


    @Override
    public List<ModuleManageTree> getModuleManageList() {
        List<ModuleManageTree> tree = new ArrayList<>();
        try {
            List<ModuleManage> moduleManagesList = moduleManageMapper.getList();
            tree = getModuleManageTreeList(moduleManagesList);
        } catch (Exception e) {
            e.printStackTrace();
            logger.debug("操作有误=====" + e);
        }
        return tree;
    }

    @Override
    public List<ModuleManageTree> getModuleManageTreeList(List<ModuleManage> list) {
        List<ModuleManageTree> treeList = new ArrayList<>();
        try {
            if (null != list && list.size() > 0) {
                for (ModuleManage mm : list) {
                    logger.info("=====moduleId=" + mm.getModuleId() + "=====");
                    ModuleManageTree mmt = getModuleManageTree(mm);
                    treeList.add(mmt);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            logger.info("查询模块树形列表出错=====" + e);
        }
        return treeList;
    }

    @Override
    public ModuleManage findById(Integer moduleId) {
        return moduleManageMapper.selectByPrimaryKey(moduleId);
    }

    @Override
    public boolean saveOrUpdateModuleManage(ModuleManage moduleManage) {
        boolean result = false;
        try {
            if (null != moduleManage.getModuleId()) {
                logger.info("修改id为" + moduleManage.getModuleId() + "的数据；moduleName=" +
                        moduleManage.getModuleName() + ",moduleParentId" + moduleManage.getModuleParentId()
                        + ",moduleSeq" + moduleManage.getModuleSeq() + ",moduleUrl" + moduleManage.getModuleUrl());
                if (Objects.equals(moduleManage.getModuleId(), moduleManage.getModuleParentId())) {
                    return false;
                }
                moduleManageMapper.updateByPrimaryKey(moduleManage);
                result = true;
            } else {
                logger.info("新增；moduleName=" + moduleManage.getModuleName() + ",moduleParentId" +
                        moduleManage.getModuleParentId() + ",moduleSeq" + moduleManage.getModuleSeq()
                        + ",moduleUrl" + moduleManage.getModuleUrl());
                moduleManageMapper.insert(moduleManage);
                result = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            logger.info("保存/修改模块有误=====" + e);
        }
        return result;
    }

    @Override
    public ModuleManageTree findModuleManageById(Integer moduleId) {
        ModuleManage mm = moduleManageMapper.selectByPrimaryKey(moduleId);
        return this.getModuleManageTree(mm);
    }

    @Override
    public String deleteModule(Integer moduleId) {
        String result = Constants.FAILURE;
        try {
            /** 查询是否存在子级数据 */
            ModuleManage moduleManage = new ModuleManage();
            moduleManage.setModuleId(moduleId);
            List<ModuleManage> mmList = moduleManageMapper.findModuleByPid(moduleManage);
            if (null != mmList && mmList.size() > 0) {
                logger.error("拥有子模块数据");
                return "isSubdata";
            }

            /** 查询是否被授权 */
            List<ModuleRole> mrList = moduleRoleMapper.findRoleByModuleId(moduleId);
            if (null != mrList && mrList.size() > 0) {
                logger.error("该模块已被分配角色!");
                return "isRole";
            }
            moduleManageMapper.deleteByPrimaryKey(moduleId);
            result = Constants.SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("删除模块错误=====" + e);
        }
        return result;
    }

    @Override
    public boolean clearRoleModule(Integer moduleId) {
        try {
            logger.info("删除moduleId为" + moduleId + "的数据");
            int effect = moduleRoleMapper.deleteInModuleId(moduleId);
            logger.info("删除受影响行数：" + effect);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            logger.info("删除授权失败=====" + e);
        }
        return false;
    }

    /**
     * 将ModuleManage实体转化为树形ModuleManageTree实体
     *
     * @param moduleManage moduleManage
     * @return ModuleManageTree
     */
    private ModuleManageTree getModuleManageTree(ModuleManage moduleManage) {
        ModuleManageTree mmt = new ModuleManageTree();
        if (null != moduleManage.getModuleParentId()) {
            ModuleManage m = moduleManageMapper.selectByPrimaryKey(moduleManage.getModuleParentId());
            mmt.setModuleParentName(m.getModuleName());
        }
        mmt.setModuleId(moduleManage.getModuleId());
        mmt.setModuleName(moduleManage.getModuleName());
        mmt.setModuleSeq(moduleManage.getModuleSeq());
        mmt.setModuleIcon(moduleManage.getModuleIcon());
        mmt.setModuleParentId(moduleManage.getModuleParentId());
        mmt.setModuleUrl(moduleManage.getModuleUrl());
        mmt.setModuleType(moduleManage.getModuleType());
        mmt.setModuleType(moduleManage.getModuleType());
        mmt.setModuleDescribe(moduleManage.getModuleDescribe());
        mmt.setModule_icon_class(moduleManage.getModule_icon_class());
        mmt.setModule_menu_id(moduleManage.getModule_menu_id());
        return mmt;
    }

    /**
     * 根据角色Id查询模块列表
     * @param roleId 角色ID
     * @return ModuleManageTree List
     */
    @Override
    public List<ModuleManageTree> findModuleByRoleId(Integer roleId) {
        List<ModuleManageTree> list = new ArrayList<>();
        logger.info("查询roleId为" + roleId + "的数据");
        try {
            List<ModuleRole> moduleManagesList = moduleRoleMapper.findModuleByRoleId(roleId);
            List<ModuleManage> mmList = new ArrayList<>();
            for (ModuleRole mr : moduleManagesList) {
                ModuleManage moduleManage = moduleManageMapper.selectByPrimaryKey(mr.getRbModuleId());
                mmList.add(moduleManage);
            }
            list = this.getModuleManageTreeList(mmList);
        } catch (Exception e) {
            e.printStackTrace();
            logger.info("根据角色查询模块有误=====" + e);
        }
        return list;
    }


    /**
     * 根据角色Id查询模块列表
     * @param roleId
     * @return
     */
    @Override
    public List<ModuleManageTree> getModuleManageListByRole(Integer roleId) {
        List<ModuleManageTree> mmAllTree = new ArrayList<>();
        try {
            List<ModuleManage> mmAll = moduleManageMapper.getList();        //所有的模块
            mmAllTree = this.getModuleManageTreeList(mmAll);
            List<ModuleRole> moduleRole = moduleRoleMapper.findModuleByRoleId(roleId);
            List<ModuleManage> mmRole = new ArrayList<>();        //根据角色ID获取的模块
            for (ModuleRole mr : moduleRole) {
                ModuleManage moduleManage = moduleManageMapper.selectByPrimaryKey(mr.getRbModuleId());
                mmRole.add(moduleManage);
            }
            List<ModuleManageTree> mmRoleTree = this.getModuleManageTreeList(mmRole);
            this.nodeChecked(mmAllTree, mmRoleTree);
        } catch (Exception e) {
            e.printStackTrace();
            logger.debug("操作有误=====" + e.getMessage());
        }
        return mmAllTree;
    }

    protected void nodeChecked(List<ModuleManageTree> ruList, List<ModuleManageTree> list) {
        if (ruList == null) {
            return;
        }
        for (int j = 0; j < list.size(); j++) {
            for (ModuleManageTree ru : ruList) {
                if (ru.getModuleId().longValue() == list.get(j).getModuleId().longValue() || ru
                        .getModuleId().equals(list.get(j).getModuleId())) {
                    ru.setChecked(true);
                    break;
                }
            }
        }
    }

}
