package com.utonw.dealer.api.dto;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by SEELE on 2017/7/7.
 */
public class LoanInfoDTO implements Serializable {
    private static final long serialVersionUID = 6991694843359044480L;
    private String indentNumber;
    private String merchantName;
    private Date createdTime;
    private String repaymentState;
    private BigDecimal approvalAmount;
    private BigDecimal applyMoney;
    private String loanDays;
    private String overdueDays;
    private String repayment;
    private String overdueeRpayment;
    private String repaymentDate;
    private Integer isLegalPerson;

    public String getIndentNumber() {
        return indentNumber;
    }

    public void setIndentNumber(String indentNumber) {
        this.indentNumber = indentNumber;
    }

    public String getMerchantName() {
        return merchantName;
    }

    public void setMerchantName(String merchantName) {
        this.merchantName = merchantName;
    }

    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    public String getRepaymentState() {
        return repaymentState;
    }

    public void setRepaymentState(String repaymentState) {
        this.repaymentState = repaymentState;
    }

    public BigDecimal getApprovalAmount() {
        return approvalAmount;
    }

    public void setApprovalAmount(BigDecimal approvalAmount) {
        this.approvalAmount = approvalAmount;
    }

    public BigDecimal getApplyMoney() {
        return applyMoney;
    }

    public void setApplyMoney(BigDecimal applyMoney) {
        this.applyMoney = applyMoney;
    }

    public String getLoanDays() {
        return loanDays;
    }

    public void setLoanDays(String loanDays) {
        this.loanDays = loanDays;
    }

    public String getOverdueDays() {
        return overdueDays;
    }

    public void setOverdueDays(String overdueDays) {
        this.overdueDays = overdueDays;
    }

    public String getRepayment() {
        return repayment;
    }

    public void setRepayment(String repayment) {
        this.repayment = repayment;
    }

    public String getOverdueeRpayment() {
        return overdueeRpayment;
    }

    public void setOverdueeRpayment(String overdueeRpayment) {
        this.overdueeRpayment = overdueeRpayment;
    }

    public String getRepaymentDate() {
        return repaymentDate;
    }

    public void setRepaymentDate(String repaymentDate) {
        this.repaymentDate = repaymentDate;
    }

    public Integer getIsLegalPerson() {
        return isLegalPerson;
    }

    public void setIsLegalPerson(Integer isLegalPerson) {
        this.isLegalPerson = isLegalPerson;
    }
}
