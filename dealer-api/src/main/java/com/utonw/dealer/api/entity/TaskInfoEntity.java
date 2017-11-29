package com.utonw.dealer.api.entity;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.Date;

/**
 * Created by WANGYJ on 2017/5/6.
 */
public class TaskInfoEntity implements Serializable {

    private static final long serialVersionUID = 5518296443190092352L;
    private String accountId;
    private String merchantname;
    private String merchantaddress;
    private String province;
    private String city;
    private String mobile;
    private Date applydate;
    private String reviewStatus;
    private String taskname;
    private Integer total;
    private String roleId;
    private String indentId;
    private Long taskAssigee;//签收人
    private String id;//任务ID
    private String applyState;//申请状态

    public String getApplyState() {
        return applyState;
    }

    public void setApplyState(String applyState) {
        this.applyState = applyState;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Long getTaskAssigee() {
        return taskAssigee;
    }

    public void setTaskAssigee(Long taskAssigee) {
        this.taskAssigee = taskAssigee;
    }

    public String getIndentId() {
        return indentId;
    }

    public void setIndentId(String indentId) {
        this.indentId = indentId;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    public String getAccountId() {
        return accountId;
    }

    public void setAccountId(String accountId) {
        this.accountId = accountId;
    }

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    public String getMerchantname() {
        return merchantname;
    }

    public void setMerchantname(String merchantname) {
        this.merchantname = merchantname;
    }

    public String getMerchantaddress() {
        return merchantaddress;
    }

    public void setMerchantaddress(String merchantaddress) {
        this.merchantaddress = merchantaddress;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public Date getApplydate() {
        return applydate;
    }

    public void setApplydate(Date applydate) {
        this.applydate = applydate;
    }

    public String getReviewStatus() {
        return reviewStatus;
    }

    public void setReviewStatus(String reviewStatus) {
        this.reviewStatus = reviewStatus;
    }

    public String getTaskname() {
        return taskname;
    }

    public void setTaskname(String taskname) {
        this.taskname = taskname;
    }


    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }
}
