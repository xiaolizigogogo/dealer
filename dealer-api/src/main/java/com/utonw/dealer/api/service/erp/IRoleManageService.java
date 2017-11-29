package com.utonw.dealer.api.service.erp;


import com.utonw.dealer.api.entity.erp.RoleAssign;
import com.utonw.dealer.api.entity.erp.RoleManage;
import com.utonw.dealer.api.entity.erp.RoleUser;
import com.utonw.dealer.api.exception.ServiceException;
import com.utonw.dealer.api.util.erp.PageModel;

import java.util.List;
import java.util.Map;

/**
 * 角色管理service接口
 * Created by user on 2015/5/26.
 */
public interface IRoleManageService {

    /**
     * 新增编辑角色
     * @param roleId
     * @param roleName
     * @param moduleIds
     * @return
     */
    boolean saveOrUpdateRoleManage(Integer roleId, String roleName, String[] moduleIds, String userId);

    /**
     * 查询角色列表分页
     * @param currentPage
     * @param param
     * @return
     */
    PageModel<RoleManage> getRoleManageList(int currentPage, Map<String, Object> param);

    /**
     * 删除对象
     * @param id
     * @return
     */
    String delete(Integer id);


    /**
     * 根据I查询角色对象
     * @param id
     * @return
     */
    RoleManage findById(Integer id);

    /**
     * 根据用户uuid查询可分配以及已分配的角色
     *
     * @param uuid 用户uuid
     * @param user 用户对象
     * @return <code>Map<String, List<RoleManage>></code>
     */
    Map<String, List<RoleManage>> getRoleManageByUser(String customerId, String userId);

    /**
     * 个人授权
     *
     * @param uuid    用户UUID
     * @param roleIds 授予个人的角色列表
     * @return true/false
     */
    boolean grantRoleUser(String uuid, String[] roleIds);


    /**
     * 更新角色下用户
     * @param roleId
     * @param oldUsers
     * @param newUsers
     * @return
     * @throws ServiceException
     */
    public Map<String, Object> modifyRoleUser(Integer roleId, String oldUsers,
                                              String newUsers) throws ServiceException;

	/**
	 * 查询所有角色列表
	 * @return
	 */
    public  Map<String,List<RoleManage>> getRoleAssignByUser(String customerId, String UserId);
	
    /**
     * 用户授权
     *
     * @param uuid    用户UUID
     * @param roleIds 需要授予的角色列表
     * @return true/false
     */
    boolean asssignRoleUser(String uuid, String[] roleIds, String loginUserId);
    /**
     * 取得用户授权
     *
     * @param uuid    用户UUID
     * @return
     */
    List<RoleUser> getRoleUserList(String uuid);
    /**
     * 插入用户授权
     *
     * @param roleAssign
     * @return
     */
    int insertRoleAssign(RoleAssign roleAssign);
}
