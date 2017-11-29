package com.utonw.dealer.api.entity.erp;

import com.utonw.dealer.api.entity.erp.Company;

import java.io.Serializable;

public class SystemParameter implements Serializable {
    private static final long serialVersionUID = 8761551651164201936L;
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_paramter.id
     */
    private Integer id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_paramter.sys_name
     */
    private String sysName;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_paramter.sys_value
     */
    private String sysValue;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_paramter.sys_key
     */
    private String sysKey;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_paramter.sys_type
     */
    private String sysType;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_paramter.remark
     */
    private String remark;

    private Integer companyId;

    private Company company;

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Integer companyId) {
        this.companyId = companyId;
    }

    public Company getCompany() {
        return company;
    }

    public void setCompany(Company company) {
        this.company = company;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_paramter.id
     *
     * @return the value of sys_paramter.id
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_paramter.id
     *
     * @param id the value for sys_paramter.id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_paramter.sys_name
     *
     * @return the value of sys_paramter.sys_name
     */
    public String getSysName() {
        return sysName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_paramter.sys_name
     *
     * @param sysName the value for sys_paramter.sys_name
     */
    public void setSysName(String sysName) {
        this.sysName = sysName == null ? null : sysName.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_paramter.sys_value
     *
     * @return the value of sys_paramter.sys_value
     */
    public String getSysValue() {
        return sysValue;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_paramter.sys_value
     *
     * @param sysValue the value for sys_paramter.sys_value
     */
    public void setSysValue(String sysValue) {
        this.sysValue = sysValue == null ? null : sysValue.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_paramter.sys_key
     *
     * @return the value of sys_paramter.sys_key
     */
    public String getSysKey() {
        return sysKey;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_paramter.sys_key
     *
     * @param sysKey the value for sys_paramter.sys_key
     */
    public void setSysKey(String sysKey) {
        this.sysKey = sysKey == null ? null : sysKey.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_paramter.sys_type
     *
     * @return the value of sys_paramter.sys_type
     */
    public String getSysType() {
        return sysType;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_paramter.sys_type
     *
     * @param sysType the value for sys_paramter.sys_type
     */
    public void setSysType(String sysType) {
        this.sysType = sysType == null ? null : sysType.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_paramter.remark
     *
     * @return the value of sys_paramter.remark
     */
    public String getRemark() {
        return remark;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_paramter.remark
     *
     * @param remark the value for sys_paramter.remark
     */
    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}