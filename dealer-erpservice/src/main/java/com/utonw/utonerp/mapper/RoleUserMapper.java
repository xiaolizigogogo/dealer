package com.utonw.utonerp.mapper;


import com.utonw.dealer.api.entity.erp.RoleUser;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public interface RoleUserMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table role_user
     */
    int deleteByPrimaryKey(Integer rbId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table role_user
     */
    int insert(RoleUser record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table role_user
     */
    int insertSelective(RoleUser record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table role_user
     */
    RoleUser selectByPrimaryKey(Integer rbId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table role_user
     */
    int updateByPrimaryKeySelective(RoleUser record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table role_user
     */
    int updateByPrimaryKey(RoleUser record);

    /**
     * 根据角色ID和用户ID查询关联数据
     *
     * @param roleId 角色Id
     * @param userId 用户ID
     * @return <code> List<RoleUser> </code>
     */
    List<RoleUser> findRoleUserById(@Param("roleId") Integer roleId, @Param("userId") String userId);

    
    /**
     * 删除不存在于roleId中的数据
     *
     * @param map 参数
     * @return 0/1
     */
    int deleteNotInRole(Map<String, Object> map); 
       

    /**
     * 根据roleId 和 userId 删除
     * @param userId
     * @param roleId
     * @return
     */
    int deleteByUserIdAndRoleId(String userId, Integer roleId);

	List<RoleUser> selectByUuid(String uuid);


}