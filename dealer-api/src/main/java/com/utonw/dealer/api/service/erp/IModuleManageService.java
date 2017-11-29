package com.utonw.dealer.api.service.erp;


import com.utonw.dealer.api.entity.erp.ModuleManage;
import com.utonw.dealer.api.entity.erp.ModuleManageTree;

import java.util.List;

/**
 * 模块service接口
 * Created by user on 2015/5/26.
 */
public interface IModuleManageService {

    /**
     * 获取所有模块list
     *
     * @return 模块list
     */
    List<ModuleManageTree> getModuleManageList();

    /**
     * 将ModuleManage实体转化为树形ModuleManageTree实体
     *
     * @param moduleManageList ModuleManageList
     * @return <code>ModuleManageTree List</code>
     */
    List<ModuleManageTree> getModuleManageTreeList(List<ModuleManage> moduleManageList);

    /**
     * 根据moduleId获取对象
     *
     * @param moduleId 模块ID
     * @return ModuleManage
     */
    ModuleManage findById(Integer moduleId);

    /**
     * 保存或更新模块
     *
     * @param moduleManage 模块对象
     * @return true/false
     */
    boolean saveOrUpdateModuleManage(ModuleManage moduleManage);

    /**
     * 根据角色Id查询模块列表
     * @param roleId
     * @return
     */
    public List<ModuleManageTree> findModuleByRoleId(Integer roleId);

    /**
     * 根据ID查询ModuleManageTree
     *
     * @param moduleId 模块ID
     * @return ModuleManageTree
     */
    ModuleManageTree findModuleManageById(Integer moduleId);

    /**
     * 删除模块
     *
     * @param moduleId 模块ID
     * @return String
     */
    String deleteModule(Integer moduleId);

    /**
     * 清除模块的授权数据
     *
     * @param moduleId 模块ID
     * @return true/false
     */
    boolean clearRoleModule(Integer moduleId);

    /**
     * 根据角色Id查询模块列表
     * @param roleId
     * @return
     */
    public List<ModuleManageTree> getModuleManageListByRole(Integer roleId);
}
