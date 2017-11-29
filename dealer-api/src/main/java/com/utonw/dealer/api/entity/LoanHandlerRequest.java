package com.utonw.dealer.api.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class LoanHandlerRequest  implements Serializable{

	private static final long serialVersionUID = 5289233984897334030L;

	// 订单ID
	private String orderId;

	// 评审状态
	private String approvalStatus;

	// 评审级别
	private String approvalLevel;

	// 评审金额
	private BigDecimal approvalAmount;

	// 评审结论
	private String approvalConclusion;

	// 评审人
	private String approvalId;

	// 评审时间
	private Date approvalTime;

	// 出账时间
	private Date lendedTime;

	// 出账凭证
	private String lendedPic;

	private String taskId;

	private String user;

	private BigDecimal judgeMoney;

	private String endType;



	public String getEndType() {
		return endType;
	}

	public void setEndType(String endType) {
		this.endType = endType;
	}

	public BigDecimal getJudgeMoney() {
		return judgeMoney;
	}

	public void setJudgeMoney(BigDecimal judgeMoney) {
		this.judgeMoney = judgeMoney;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getApprovalStatus() {
		return approvalStatus;
	}

	public void setApprovalStatus(String approvalStatus) {
		this.approvalStatus = approvalStatus;
	}

	public String getApprovalLevel() {
		return approvalLevel;
	}

	public void setApprovalLevel(String approvalLevel) {
		this.approvalLevel = approvalLevel;
	}

	public BigDecimal getApprovalAmount() {
		return approvalAmount;
	}

	public void setApprovalAmount(BigDecimal approvalAmount) {
		this.approvalAmount = approvalAmount;
	}

	public String getApprovalConclusion() {
		return approvalConclusion;
	}

	public void setApprovalConclusion(String approvalConclusion) {
		this.approvalConclusion = approvalConclusion;
	}

	public String getApprovalId() {
		return approvalId;
	}

	public void setApprovalId(String approvalId) {
		this.approvalId = approvalId;
	}

	public Date getApprovalTime() {
		return approvalTime;
	}

	public void setApprovalTime(Date approvalTime) {
		this.approvalTime = approvalTime;
	}

	public Date getLendedTime() {
		return lendedTime;
	}

	public void setLendedTime(Date lendedTime) {
		this.lendedTime = lendedTime;
	}

	public String getLendedPic() {
		return lendedPic;
	}

	public void setLendedPic(String lendedPic) {
		this.lendedPic = lendedPic;
	}

	public String getTaskId() {
		return taskId;
	}

	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}
    
}
