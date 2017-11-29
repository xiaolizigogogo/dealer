package com.utonw.dealer.api.vo;


import com.utonw.dealer.api.entity.erp.CustomerRegisterInfo;
import com.utonw.dealer.api.entity.erp.GuaranteeEvaluateInfo;
import com.utonw.dealer.api.entity.erp.LoanInfoWithBLOBs;
import com.utonw.dealer.api.entity.erp.User;

import java.io.Serializable;

/**
 * Created by DONG on 2015/10/22.
 */
public class EndedLoan extends LoanInfoWithBLOBs implements Serializable {
    private static final long serialVersionUID = -1721782121119934994L;

    //客户经理用户信息
    private User user;

    //客户信息
    private CustomerRegisterInfo customerRegisterInfo;

    //车辆信息
    private GuaranteeEvaluateInfo guaranteeEvaluateInfo;


    private String companyName;

    private String deptName;


    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    private String responsibleUserId;

    private String guaranteeId;

    private String customerId;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public CustomerRegisterInfo getCustomerRegisterInfo() {
        return customerRegisterInfo;
    }

    public void setCustomerRegisterInfo(CustomerRegisterInfo customerRegisterInfo) {
        this.customerRegisterInfo = customerRegisterInfo;
    }

    public GuaranteeEvaluateInfo getGuaranteeEvaluateInfo() {
        return guaranteeEvaluateInfo;
    }

    public void setGuaranteeEvaluateInfo(GuaranteeEvaluateInfo guaranteeEvaluateInfo) {
        this.guaranteeEvaluateInfo = guaranteeEvaluateInfo;
    }

    public String getResponsibleUserId() {
        return responsibleUserId;
    }

    public void setResponsibleUserId(String responsibleUserId) {
        this.responsibleUserId = responsibleUserId;
    }

    public String getGuaranteeId() {
        return guaranteeId;
    }

    public void setGuaranteeId(String guaranteeId) {
        this.guaranteeId = guaranteeId;
    }

    @Override
    public String getCustomerId() {
        return customerId;
    }

    @Override
    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }
}


