package com.utonw.dealer.api.service.erp;


import com.utonw.dealer.api.entity.erp.RoleManage;
import com.utonw.dealer.api.entity.erp.User;

import java.util.List;


public interface IActivitiAccountBS {


    /**
     * 同步用户数据信息到activiti
     *
     * @param userId
     * @throws com.utonw.dealer.api.exception.ClmServiceRuntimeException
     */
    public void saveOrUpdateActivitiUser(String userId, Integer roleId);


    public void saveOrUpdateGroup(Integer roleId);

    /**
     * 保存或修改用户组信息
     *
     * @param roleEntity
     * @throws com.utonw.dealer.api.exception.ClmServiceRuntimeException
     */
    public void saveOrUpdateGroup(RoleManage roleEntity);


    /**
     * 删除用户组信息
     *
     * @param roleId
     * @throws com.utonw.dealer.api.exception.ClmServiceRuntimeException
     */
    public void deleteGroup(Integer roleId);

    public void saveOrUpdate(User userEntity, Integer roleId);

    /**
     * 添加工作流用户以及角色
     *
     * @param userEntity
     */
    public void newActivitiUser(User userEntity, Integer roleId);

    /**
     * 添加用户组关系到activiti
     *
     * @param userId
     */
    public void addMembershipToIdentify(String userId, Integer roleId);



    /**
     * 批量更新工作流用户以及角色信息
     *
     * @param userEntity
     */
    public void updateActivitiDataSet(User userEntity, String[] roleIds);


    /**
     * 删除用户信息
     *
     * @throws com.utonw.dealer.api.exception.ClmServiceRuntimeException
     */
    public void deleteUser(String userId);

}