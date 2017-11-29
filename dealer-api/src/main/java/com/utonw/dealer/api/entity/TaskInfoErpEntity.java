package com.utonw.dealer.api.entity;


import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by WANGYJ on 2017/5/12.
 */
public class TaskInfoErpEntity implements Serializable {
    private static final long serialVersionUID = 855067991546674765L;
    private String id;
    private String merchantName;
    private String acountId;
    private BigDecimal applyMoney;
    private BigDecimal judgeMoney;
    private String indentStatus;
    private Date updateTime;
    private String indentNumber;
    //任务签收人
    private String assigee;
    //任务ID
    private String taskId;
    private Date createdTime;
    private String taskName;

    public String getTaskName() {
        return taskName;
    }

    public void setTaskName(String taskName) {
        this.taskName = taskName;
    }

    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    public String getAssigee() {
        return assigee;
    }

    public void setAssigee(String assigee) {
        this.assigee = assigee;
    }

    public String getTaskId() {
        return taskId;
    }

    public void setTaskId(String taskId) {
        this.taskId = taskId;
    }

	public String getIndentNumber() {
        return indentNumber;
    }

    public void setIndentNumber(String indentNumber) {
        this.indentNumber = indentNumber;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getMerchantName() {
        return merchantName;
    }

    public void setMerchantName(String merchantName) {
        this.merchantName = merchantName;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public BigDecimal getApplyMoney() {
        return applyMoney;
    }

    public void setApplyMoney(BigDecimal applyMoney) {
        this.applyMoney = applyMoney;
    }

    public BigDecimal getJudgeMoney() {
        return judgeMoney;
    }

    public void setJudgeMoney(BigDecimal judgeMoney) {
        this.judgeMoney = judgeMoney;
    }

    public String getIndentStatus() {
        return indentStatus;
    }

    public void setIndentStatus(String indentStatus) {
        this.indentStatus = indentStatus;
    }

    public String getAcountId() {
        return acountId;
    }

    public void setAcountId(String acountId) {
        this.acountId = acountId;
    }
}
