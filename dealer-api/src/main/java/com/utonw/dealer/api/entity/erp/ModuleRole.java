package com.utonw.dealer.api.entity.erp;

import java.io.Serializable;

public class ModuleRole implements Serializable {
    private static final long serialVersionUID = 8292606484851131960L;
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column module_role.rb_id
     * implements Serializable
     */
    private Integer rbId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column module_role.rb_module_id
     *
     */
    private Integer rbModuleId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column module_role.rb_role_id
     *
     */
    private Integer rbRoleId;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column module_role.rb_id
     *
     * @return the value of module_role.rb_id
     */
    public Integer getRbId() {
        return rbId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column module_role.rb_id
     *
     * @param rbId the value for module_role.rb_id
     */
    public void setRbId(Integer rbId) {
        this.rbId = rbId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column module_role.rb_module_id
     *
     * @return the value of module_role.rb_module_id
     */
    public Integer getRbModuleId() {
        return rbModuleId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column module_role.rb_module_id
     *
     * @param rbModuleId the value for module_role.rb_module_id
     */
    public void setRbModuleId(Integer rbModuleId) {
        this.rbModuleId = rbModuleId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column module_role.rb_role_id
     *
     * @return the value of module_role.rb_role_id
     */
    public Integer getRbRoleId() {
        return rbRoleId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column module_role.rb_role_id
     *
     * @param rbRoleId the value for module_role.rb_role_id
     */
    public void setRbRoleId(Integer rbRoleId) {
        this.rbRoleId = rbRoleId;
    }
}