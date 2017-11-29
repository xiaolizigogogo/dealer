package com.utonw.dealer.api.entity.erp;

import com.utonw.dealer.api.util.erp.TreeUtil;

import java.io.Serializable;

/**
 * 菜单树
 * Created by Administrator on 2015/1/20.
 */
public class ModuleManageTree extends TreeUtil<ModuleManageTree> implements Serializable {

    private static final long serialVersionUID = 1509320602080335616L;
    private String name;
    private Integer moduleId;//主键
    private String moduleName;//菜单名称
    private String moduleUrl;//菜单路径
    private Integer moduleParentId;//父菜单Id
    private String moduleParentName;//父菜单名称
    private Integer moduleSeq;//菜单显示顺序
    private String moduleIcon;//菜单图标
    private String moduleDescribe;//菜单描述
    private Integer moduleType;//0菜单 ；1按钮
    private boolean checked;//
    private String module_menu_id;
    private String module_icon_class;

    public String getName() {
        return this.getModuleName();
    }

    public Integer getModuleId() {
        return moduleId;
    }

    public void setModuleId(Integer moduleId) {
        this.moduleId = moduleId;
    }

    public String getModuleName() {
        return moduleName;
    }

    public void setModuleName(String moduleName) {
        this.moduleName = moduleName;
    }

    public String getModuleUrl() {
        return moduleUrl;
    }

    public void setModuleUrl(String moduleUrl) {
        this.moduleUrl = moduleUrl;
    }

    public Integer getModuleParentId() {
        return moduleParentId;
    }

    public void setModuleParentId(Integer moduleParentId) {
        this.moduleParentId = moduleParentId;
    }

    public String getModuleParentName() {
        return moduleParentName;
    }

    public void setModuleParentName(String moduleParentName) {
        this.moduleParentName = moduleParentName;
    }

    public Integer getModuleSeq() {
        return moduleSeq;
    }

    public void setModuleSeq(Integer moduleSeq) {
        this.moduleSeq = moduleSeq;
    }

    public String getModuleIcon() {
        return moduleIcon;
    }

    public void setModuleIcon(String moduleIcon) {
        this.moduleIcon = moduleIcon;
    }

    public void setName(String name) {
        this.name = this.getModuleName();
    }

    public String getModuleDescribe() {
        return moduleDescribe;
    }

    public void setModuleDescribe(String moduleDescribe) {
        this.moduleDescribe = moduleDescribe;
    }

    public Integer getModuleType() {
        return moduleType;
    }

    public void setModuleType(Integer moduleType) {
        this.moduleType = moduleType;
    }

    public boolean isChecked() {
        return checked;
    }

    public void setChecked(boolean checked) {
        this.checked = checked;
    }

    @Override
    public Integer getParentId() {
        try {
            return this.getModuleParentId() == null ? 0 : Integer.parseInt(this.getModuleParentId
                    () + "");
        } catch (Exception e) {
            return 0;
        }
    }

    public String getText() {
        return this.getModuleName();
    }


    @Override
    public Integer getMineId() {
        return this.getModuleId() == null ? 0 : this.getModuleId();
    }

    public String getModule_menu_id() {
        return module_menu_id;
    }
    public void setModule_menu_id(String module_menu_id) {
        this.module_menu_id = module_menu_id;
    }
    public String getModule_icon_class() {
        return module_icon_class;
    }
    public void setModule_icon_class(String module_icon_class) {
        this.module_icon_class = module_icon_class;
    }
}
