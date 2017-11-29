package com.utonw.utonerp.service;

import com.utonw.dealer.api.entity.erp.RoleManage;
import com.utonw.dealer.api.exception.ClmServiceRuntimeException;
import com.utonw.dealer.api.service.erp.IActivitiAccountBS;
import com.utonw.dealer.api.service.erp.IUserService;
import com.utonw.utonerp.mapper.RoleManageMapper;
import com.utonw.utonerp.mapper.UserMapper;
import org.activiti.engine.IdentityService;
import org.activiti.engine.identity.Group;
import org.activiti.engine.identity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service("activitiAccountBS")
@Transactional
public class ActivitiAccountBS implements IActivitiAccountBS {

    @Autowired
    private IdentityService identityService;

    @Autowired
    private UserMapper userDao;

    @Autowired
    private RoleManageMapper roleDao;

    @Autowired
    @Qualifier("userService")
    private IUserService userService;

    /**
     * 同步用户数据信息到activiti
     *
     * @param userId
     * @throws com.utonw.dealer.api.exception.ClmServiceRuntimeException
     */
    @Override
    public void saveOrUpdateActivitiUser(String userId, Integer roleId) throws
            ClmServiceRuntimeException {
        this.saveOrUpdate(userDao.selectByPrimaryKey(userId), roleId);
    }

    @Override
    public void saveOrUpdateGroup(Integer roleId) throws ClmServiceRuntimeException {
        this.saveOrUpdateGroup(roleDao.selectByPrimaryKey(roleId));
    }

    /**
     * 保存或修改用户组信息
     *
     * @param roleEntity
     * @throws com.utonw.dealer.api.exception.ClmServiceRuntimeException
     */
    @Override
    public void saveOrUpdateGroup(RoleManage roleEntity) throws ClmServiceRuntimeException {
        List<Group> activitiGroups = identityService.createGroupQuery().groupId(roleEntity
				.getRoleId().toString()).list();
        if (activitiGroups.size() == 1) {
            this.updateGroup(roleEntity, activitiGroups.get(0));
        } else if (activitiGroups.size() > 1) {
            throw new ClmServiceRuntimeException("存在重复的用户组信息！");
        } else {
            this.saveGroup(roleEntity);
        }
    }


    private void saveGroup(RoleManage roleEntity) {
        Group activitiGroup = identityService.newGroup(roleEntity.getRoleId().toString());
        activitiGroup.setName(roleEntity.getRoleName());
        identityService.saveGroup(activitiGroup);
    }

    private void updateGroup(RoleManage roleEntity, Group activitiGroup) {
        activitiGroup.setName(roleEntity.getRoleName());
        identityService.saveGroup(activitiGroup);
    }

    /**
     * 删除用户组信息
     *
     * @param roleId
     * @throws com.utonw.dealer.api.exception.ClmServiceRuntimeException
     */
    @Override
    public void deleteGroup(Integer roleId) throws ClmServiceRuntimeException {

        List<com.utonw.dealer.api.entity.erp.User> userList = userService.selectUserByRoleId(roleId);

        if (userList == null) {
            throw new ClmServiceRuntimeException("未找到对应的用户组信息");
        }
        for (com.utonw.dealer.api.entity.erp.User user : userList) {
            identityService.deleteMembership(user.getUuid(), roleId.toString());
        }

        identityService.deleteGroup(roleId.toString());
    }
    @Override
    public void saveOrUpdate(com.utonw.dealer.api.entity.erp.User userEntity, Integer roleId) throws
			ClmServiceRuntimeException {
        List<User> activitiUsers = identityService.createUserQuery().userId(userEntity.getUuid())
				.list(); // 查询Activiti中是否有该用户的信息

        if (activitiUsers.size() == 1) {
            this.updateActivitiData(userEntity, activitiUsers.get(0), roleId);
        } else if (activitiUsers.size() > 1) {
            throw new ClmServiceRuntimeException("存在重复用户记录信息");
        } else {
            this.newActivitiUser(userEntity, roleId);
        }
    }

    /**
     * 添加工作流用户以及角色
     *
     * @param userEntity
     */
    @Override
    public void newActivitiUser(com.utonw.dealer.api.entity.erp.User userEntity, Integer roleId) {
        this.saveActivitiUser(userEntity);
        if (null != roleId && !"".equals(roleId)) {
            this.addMembershipToIdentify(userEntity.getUuid(), roleId);
        }
    }

    /**
     * 添加用户组关系到activiti
     *
     * @param userId
     */
    @Override
    public void addMembershipToIdentify(String userId, Integer roleId) {

        identityService.createMembership(userId, roleId.toString());

    }

    /**
     * 添加用户到activiti
     *
     * @param userEntity
     */
    private void saveActivitiUser(com.utonw.dealer.api.entity.erp.User userEntity) {
        User activitiUser = identityService.newUser(userEntity.getUuid());
        this.cloneAndSaveActivitiUser(userEntity, activitiUser);
    }

    /**
     * 复制属性信息
     *
     * @param userEntity
     * @param activitiUser
     */
    private void cloneAndSaveActivitiUser(com.utonw.dealer.api.entity.erp.User userEntity, User
			activitiUser) {
        activitiUser.setFirstName(userEntity.getEmail());
        identityService.saveUser(activitiUser);
    }

    /**
     * 更新工作流用户以及角色信息
     *
     * @param userEntity
     * @param activitiUser
     */
    private void updateActivitiData(com.utonw.dealer.api.entity.erp.User userEntity, User activitiUser,
                                    Integer roleId) {
        this.cloneAndSaveActivitiUser(userEntity, activitiUser);

        if (null != roleId && !"".equals(roleId)) {
            List<Group> activitiGroups = identityService.createGroupQuery().groupMember
					(userEntity.getUuid()).list();
            //删除已有的关系
            for (Group group : activitiGroups) {
                identityService.deleteMembership(userEntity.getUuid(), group.getId());
            }
            this.addMembershipToIdentify(userEntity.getUuid(), roleId);
        }
    }


    /**
     * 批量更新工作流用户以及角色信息
     *
     * @param userEntity
     */
    @Override
    public void updateActivitiDataSet(com.utonw.dealer.api.entity.erp.User userEntity, String[] roleIds) {
//		this.cloneAndSaveActivitiUser(userEntity, activitiUser);
        List<Group> activitiGroups = identityService.createGroupQuery().groupMember(userEntity
				.getUuid()).list();
        //删除已有的关系
        for (Group group : activitiGroups) {
            identityService.deleteMembership(userEntity.getUuid(), group.getId());
        }

        if (null != roleIds && roleIds.length > 0) {
            for (String roleIdStr : roleIds) {
                Integer roleId = Integer.parseInt(roleIdStr);
                this.addMembershipToIdentify(userEntity.getUuid(), roleId);
            }
        }

    }


    /**
     * 删除用户信息
     *
     * @throws com.utonw.dealer.api.exception.ClmServiceRuntimeException
     */
    @Override
    public void deleteUser(String userId) throws ClmServiceRuntimeException {
        com.utonw.dealer.api.entity.erp.User userEntity = userDao.selectByPrimaryKey(userId);
        if (userEntity == null) {
            throw new ClmServiceRuntimeException("未找到用户信息");
        }

        List<RoleManage> roleManageList = userService.selectRoleByUserId(userId);

        for (RoleManage role : roleManageList) {
            identityService.deleteMembership(userEntity.getUuid(), role.getRoleId().toString());
        }

        identityService.deleteUser(userEntity.getUuid());
    }

}