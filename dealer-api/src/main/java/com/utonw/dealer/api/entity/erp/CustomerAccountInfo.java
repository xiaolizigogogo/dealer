package com.utonw.dealer.api.entity.erp;

import java.io.Serializable;
import java.util.Date;

public class CustomerAccountInfo implements Serializable {
    private static final long serialVersionUID = 9069361336032747667L;
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column customer_account_info.id
     *
     */
    private Integer id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column customer_account_info.customer_id
     *
     */
    private String customerId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column customer_account_info.account_name
     *
     */
    private String accountName;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column customer_account_info.account_idnum
     *
     */
    private String accountIdnum;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column customer_account_info.mobile
     *
     */
    private String mobile;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column customer_account_info.province
     *
     */
    private String province;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column customer_account_info.city
     *
     */
    private String city;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column customer_account_info.bank_name
     *
     */
    private String bankName;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column customer_account_info.account_num
     *
     */
    private String accountNum;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column customer_account_info.branch_bank_name
     *
     */
    private String branchBankName;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column customer_account_info.created_by_id
     *
     */
    private String createdById;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column customer_account_info.created_at
     *
     */
    private Date createdAt;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column customer_account_info.updated_at
     *
     */
    private Date updatedAt;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column customer_account_info.id
     *
     * @return the value of customer_account_info.id
     */
    
    private String loan_id; //订单ID
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column customer_account_info.id
     *
     * @param id the value for customer_account_info.id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column customer_account_info.customer_id
     *
     * @return the value of customer_account_info.customer_id
     */
    public String getCustomerId() {
        return customerId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column customer_account_info.customer_id
     *
     * @param customerId the value for customer_account_info.customer_id
     */
    public void setCustomerId(String customerId) {
        this.customerId = customerId == null ? null : customerId.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column customer_account_info.account_name
     *
     * @return the value of customer_account_info.account_name
     */
    public String getAccountName() {
        return accountName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column customer_account_info.account_name
     *
     * @param accountName the value for customer_account_info.account_name
     */
    public void setAccountName(String accountName) {
        this.accountName = accountName == null ? null : accountName.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column customer_account_info.account_idnum
     *
     * @return the value of customer_account_info.account_idnum
     */
    public String getAccountIdnum() {
        return accountIdnum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column customer_account_info.account_idnum
     *
     * @param accountIdnum the value for customer_account_info.account_idnum
     */
    public void setAccountIdnum(String accountIdnum) {
        this.accountIdnum = accountIdnum == null ? null : accountIdnum.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column customer_account_info.mobile
     *
     * @return the value of customer_account_info.mobile
     */
    public String getMobile() {
        return mobile;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column customer_account_info.mobile
     *
     * @param mobile the value for customer_account_info.mobile
     */
    public void setMobile(String mobile) {
        this.mobile = mobile == null ? null : mobile.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column customer_account_info.province
     *
     * @return the value of customer_account_info.province
     */
    public String getProvince() {
        return province;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column customer_account_info.province
     *
     * @param province the value for customer_account_info.province
     */
    public void setProvince(String province) {
        this.province = province == null ? null : province.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column customer_account_info.city
     *
     * @return the value of customer_account_info.city
     */
    public String getCity() {
        return city;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column customer_account_info.city
     *
     * @param city the value for customer_account_info.city
     */
    public void setCity(String city) {
        this.city = city == null ? null : city.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column customer_account_info.bank_name
     *
     * @return the value of customer_account_info.bank_name
     */
    public String getBankName() {
        return bankName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column customer_account_info.bank_name
     *
     * @param bankName the value for customer_account_info.bank_name
     */
    public void setBankName(String bankName) {
        this.bankName = bankName == null ? null : bankName.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column customer_account_info.account_num
     *
     * @return the value of customer_account_info.account_num
     */
    public String getAccountNum() {
        return accountNum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column customer_account_info.account_num
     *
     * @param accountNum the value for customer_account_info.account_num
     */
    public void setAccountNum(String accountNum) {
        this.accountNum = accountNum == null ? null : accountNum.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column customer_account_info.branch_bank_name
     *
     * @return the value of customer_account_info.branch_bank_name
     */
    public String getBranchBankName() {
        return branchBankName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column customer_account_info.branch_bank_name
     *
     * @param branchBankName the value for customer_account_info.branch_bank_name
     */
    public void setBranchBankName(String branchBankName) {
        this.branchBankName = branchBankName == null ? null : branchBankName.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column customer_account_info.created_by_id
     *
     * @return the value of customer_account_info.created_by_id
     */
    public String getCreatedById() {
        return createdById;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column customer_account_info.created_by_id
     *
     * @param createdById the value for customer_account_info.created_by_id
     */
    public void setCreatedById(String createdById) {
        this.createdById = createdById == null ? null : createdById.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column customer_account_info.created_at
     *
     * @return the value of customer_account_info.created_at
     */
    public Date getCreatedAt() {
        return createdAt;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column customer_account_info.created_at
     *
     * @param createdAt the value for customer_account_info.created_at
     */
    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column customer_account_info.updated_at
     *
     * @return the value of customer_account_info.updated_at
     */
    public Date getUpdatedAt() {
        return updatedAt;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column customer_account_info.updated_at
     *
     * @param updatedAt the value for customer_account_info.updated_at
     */
    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }
    
    

    public String getLoan_id() {
		return loan_id;
	}

	public void setLoan_id(String loan_id) {
		this.loan_id = loan_id;
	}

	@Override
    public String toString() {
        return "CustomerAccountInfo{" +
                "id=" + id +
                ", customerId='" + customerId + '\'' +
                ", accountName='" + accountName + '\'' +
                ", accountIdnum='" + accountIdnum + '\'' +
                ", mobile='" + mobile + '\'' +
                ", province='" + province + '\'' +
                ", city='" + city + '\'' +
                ", bankName='" + bankName + '\'' +
                ", accountNum='" + accountNum + '\'' +
                ", branchBankName='" + branchBankName + '\'' +
                ", createdById='" + createdById + '\'' +
                ", createdAt=" + createdAt +
                ", updatedAt=" + updatedAt +
                '}';
    }
}