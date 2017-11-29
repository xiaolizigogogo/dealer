package com.utonw.utonerp.mapper;

import java.util.List;
import java.util.Map;

import com.utonw.dealer.api.entity.erp.RoleAssign;
import org.apache.ibatis.annotations.Param;



public interface RoleAssignMapper {
	
    int insert(RoleAssign record);
    
    /**
     * 根据角色ID和用户ID查询关联数据
     *
     * @param roleId 角色Id
     * @param userId 用户ID
     * @return <code> List<RoleUser> </code>
     */
    //List<RoleUser> findRoleUserById(@Param("roleId") Integer roleId, @Param("userId") String userId);
	List<RoleAssign> findRoleAssignById(@Param("roleId") Integer roleId, @Param("customerId") String customerId);
	

    /**
     * 查询用户UUID未分配的个人角色
     *
     * @param uuid 用户UUID
     * @return <code>List<RoleManage></code>
     */
    List<RoleAssign> findRoleAssignNotInRoleUser(@Param("userId") String uuid);
    
	
	   /**
     * 删除不存在于roleId中的数据
     *
     * @param map 参数
     * @return 0/1
     */
    int deleteNotInRole(Map<String, Object> map);
    
    
    
}
