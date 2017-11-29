package com.utonw.dealer.api.entity.erp;

import java.io.Serializable;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.Date;

public class Company implements Serializable {
    private static final long serialVersionUID = -3266529148726747100L;
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column company.id
     *
     */
    private Integer id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column company.name
     *
     */
    private String name;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column company.dialect
     *
     */
    private String dialect;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column company.parent_id
     *
     */
    private Integer parentId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column company.principal
     *
     */
    private String principal;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column company.telephone
     *
     */
    private String telephone;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column company.start_service_date
     *
     */
    private Date startServiceDate;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column company.stop_service_date
     *
     */
    private Date stopServiceDate;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column company.service_version
     *
     */
    private String serviceVersion;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column company.repayment_remind_days
     *
     */
    private Integer repaymentRemindDays;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column company.manage_location
     *
     */
    private String manageLocation;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column company.business_license
     *
     */
    private String businessLicense;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column company.organization_code
     *
     */
    private String organizationCode;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column company.tax_card_code
     *
     */
    private String taxCardCode;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column company.register_at
     *
     */
    private Date registerAt;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column company.pledge_account
     *
     */
    private String pledgeAccount;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column company.pledge_amount
     *
     */
    private String pledgeAmount;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column company.overdue_rate
     *
     */
    private BigDecimal overdueRate;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column company.superminiature_default_money
     *
     */
    private String superminiatureDefaultMoney;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column company.commission_index
     *
     */
    private String commissionIndex;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column company.management_cost_rate
     *
     */
    private String managementCostRate;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column company.valid_flg
     *
     */
    private Boolean validFlg;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column company.updated_at
     *
     */
    private Date updatedAt;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column company.created_at
     *
     */
    private Date createdAt;



    private String registerAtStr;
    private String startServiceDateStr;
    private String stopServiceDateStr;

    private String createdAtStr;

    private BigDecimal creditLimit;

    private BigDecimal limitPercentage;

    public String getRegisterAtStr() {
        return registerAtStr;
    }

    public void setRegisterAtStr(String registerAtStr) {
        this.registerAtStr = registerAtStr;
    }

    public String getStartServiceDateStr() {
        return startServiceDateStr;
    }

    public void setStartServiceDateStr(String startServiceDateStr) {
        this.startServiceDateStr = startServiceDateStr;
    }

    public String getStopServiceDateStr() {
        return stopServiceDateStr;
    }

    public void setStopServiceDateStr(String stopServiceDateStr) {
        this.stopServiceDateStr = stopServiceDateStr;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column company.id
     *
     * @return the value of company.id
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column company.id
     *
     * @param id the value for company.id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column company.name
     *
     * @return the value of company.name
     */
    public String getName() {
        return name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column company.name
     *
     * @param name the value for company.name
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column company.dialect
     *
     * @return the value of company.dialect
     */
    public String getDialect() {
        return dialect;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column company.dialect
     *
     * @param dialect the value for company.dialect
     */
    public void setDialect(String dialect) {
        this.dialect = dialect == null ? null : dialect.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column company.parent_id
     *
     * @return the value of company.parent_id
     */
    public Integer getParentId() {
        return parentId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column company.parent_id
     *
     * @param parentId the value for company.parent_id
     */
    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column company.principal
     *
     * @return the value of company.principal
     */
    public String getPrincipal() {
        return principal;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column company.principal
     *
     * @param principal the value for company.principal
     */
    public void setPrincipal(String principal) {
        this.principal = principal == null ? null : principal.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column company.telephone
     *
     * @return the value of company.telephone
     */
    public String getTelephone() {
        return telephone;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column company.telephone
     *
     * @param telephone the value for company.telephone
     */
    public void setTelephone(String telephone) {
        this.telephone = telephone == null ? null : telephone.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column company.start_service_date
     *
     * @return the value of company.start_service_date
     */
    public Date getStartServiceDate() {
        return startServiceDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column company.start_service_date
     *
     * @param startServiceDate the value for company.start_service_date
     */
    public void setStartServiceDate(Date startServiceDate) {
        this.startServiceDate = startServiceDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column company.stop_service_date
     *
     * @return the value of company.stop_service_date
     */
    public Date getStopServiceDate() {
        return stopServiceDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column company.stop_service_date
     *
     * @param stopServiceDate the value for company.stop_service_date
     */
    public void setStopServiceDate(Date stopServiceDate) {
        this.stopServiceDate = stopServiceDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column company.service_version
     *
     * @return the value of company.service_version
     */
    public String getServiceVersion() {
        return serviceVersion;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column company.service_version
     *
     * @param serviceVersion the value for company.service_version
     */
    public void setServiceVersion(String serviceVersion) {
        this.serviceVersion = serviceVersion == null ? null : serviceVersion.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column company.repayment_remind_days
     *
     * @return the value of company.repayment_remind_days
     */
    public Integer getRepaymentRemindDays() {
        return repaymentRemindDays;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column company.repayment_remind_days
     *
     * @param repaymentRemindDays the value for company.repayment_remind_days
     */
    public void setRepaymentRemindDays(Integer repaymentRemindDays) {
    	if(repaymentRemindDays!=null){
    		this.repaymentRemindDays = repaymentRemindDays;
    	}
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column company.manage_location
     *
     * @return the value of company.manage_location
     */
    public String getManageLocation() {
        return manageLocation;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column company.manage_location
     *
     * @param manageLocation the value for company.manage_location
     */
    public void setManageLocation(String manageLocation) {
        this.manageLocation = manageLocation == null ? null : manageLocation.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column company.business_license
     *
     * @return the value of company.business_license
     */
    public String getBusinessLicense() {
        return businessLicense;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column company.business_license
     *
     * @param businessLicense the value for company.business_license
     */
    public void setBusinessLicense(String businessLicense) {
        this.businessLicense = businessLicense == null ? null : businessLicense.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column company.organization_code
     *
     * @return the value of company.organization_code
     */
    public String getOrganizationCode() {
        return organizationCode;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column company.organization_code
     *
     * @param organizationCode the value for company.organization_code
     */
    public void setOrganizationCode(String organizationCode) {
        this.organizationCode = organizationCode == null ? null : organizationCode.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column company.tax_card_code
     *
     * @return the value of company.tax_card_code
     */
    public String getTaxCardCode() {
        return taxCardCode;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column company.tax_card_code
     *
     * @param taxCardCode the value for company.tax_card_code
     */
    public void setTaxCardCode(String taxCardCode) {
        this.taxCardCode = taxCardCode == null ? null : taxCardCode.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column company.register_at
     *
     * @return the value of company.register_at
     */
    public Date getRegisterAt() {
        return registerAt;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column company.register_at
     *
     * @param registerAt the value for company.register_at
     */
    public void setRegisterAt(Date registerAt) {
        this.registerAt = registerAt;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column company.pledge_account
     *
     * @return the value of company.pledge_account
     */
    public String getPledgeAccount() {
        return pledgeAccount;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column company.pledge_account
     *
     * @param pledgeAccount the value for company.pledge_account
     */
    public void setPledgeAccount(String pledgeAccount) {
        this.pledgeAccount = pledgeAccount == null ? null : pledgeAccount.trim();
    }


    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column company.overdue_rate
     *
     * @return the value of company.overdue_rate
     */
    public BigDecimal getOverdueRate() {
        return overdueRate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column company.overdue_rate
     *
     * @param overdueRate the value for company.overdue_rate
     */
    public void setOverdueRate(BigDecimal overdueRate) {
    	if(overdueRate!=null){
    		 this.overdueRate = overdueRate;
    	}
    }


    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column company.valid_flg
     *
     * @return the value of company.valid_flg
     */
    public Boolean getValidFlg() {
        return validFlg;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column company.valid_flg
     *
     * @param validFlg the value for company.valid_flg
     */
    public void setValidFlg(Boolean validFlg) {
        this.validFlg = validFlg;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column company.updated_at
     *
     * @return the value of company.updated_at
     */
    public Date getUpdatedAt() {
        return updatedAt;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column company.updated_at
     *
     * @param updatedAt the value for company.updated_at
     */
    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column company.created_at
     *
     * @return the value of company.created_at
     */
    public Date getCreatedAt() {
        return createdAt;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column company.created_at
     *
     * @param createdAt the value for company.created_at
     */
    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }


    public String getCreatedAtStr() {
        return createdAtStr;
    }

    public void setCreatedAtStr(String createdAtStr) {
        this.createdAtStr = createdAtStr;
    }
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column company.superminiature_default_money
     *
     */
    public String getSuperminiatureDefaultMoney() {
        return superminiatureDefaultMoney;
    }

    public void setSuperminiatureDefaultMoney(String superminiatureDefaultMoney) {
        BigDecimal sdm = new BigDecimal(superminiatureDefaultMoney);
        DecimalFormat df4 = new DecimalFormat("###.###");
        this.superminiatureDefaultMoney = df4.format(sdm);
    }

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column company.commission_index
     *
     */
    public String getCommissionIndex() {
        return commissionIndex;
    }

    public void setCommissionIndex(String commissionIndex) {
    	if(commissionIndex!=null&&!"".equals(commissionIndex)){
    		BigDecimal cmssIndex = new BigDecimal(commissionIndex);
            DecimalFormat df4 = new DecimalFormat("###.###");
            this.commissionIndex = df4.format(cmssIndex);
    	}
    }

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column company.management_cost_rate
     *
     */
    public String getManagementCostRate() {
        return managementCostRate;
    }

    public void setManagementCostRate(String managementCostRate) {
    	if(managementCostRate!=null&&!"".equals(managementCostRate)){
    		BigDecimal mngCostRate = new BigDecimal(managementCostRate);
            DecimalFormat df4 = new DecimalFormat("###.###");
            this.managementCostRate = df4.format(mngCostRate);
    	}
    }

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column company.pledge_amount
     *
     */
    public String getPledgeAmount() {
        return pledgeAmount;
    }

    public void setPledgeAmount(String pledgeAmount) {
    	if(pledgeAmount!=null&&!"".equals(pledgeAmount)){
    		BigDecimal pda = new BigDecimal(pledgeAmount);
            DecimalFormat df4 = new DecimalFormat("###.###");
            this.pledgeAmount = df4.format(pda);
    	}
    }

    public BigDecimal getCreditLimit() { return creditLimit; }

    public void setCreditLimit(BigDecimal creditLimit) { this.creditLimit = creditLimit; }

    public BigDecimal getLimitPercentage() { return limitPercentage; }

    public void setLimitPercentage(BigDecimal limitPercentage) { this.limitPercentage = limitPercentage; }
}
