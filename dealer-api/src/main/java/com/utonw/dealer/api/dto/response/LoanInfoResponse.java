package com.utonw.dealer.api.dto.response;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class LoanInfoResponse implements Serializable{
/*
	// 审批金额
	private BigDecimal approvalAmount;*/

	// 申请金额
	private BigDecimal applyMoney;

	// 借款状态
	private String indentState;

	// 订单号
	private String indentNumber;

	// 经销商
	private String merchantName;

	// 申请时间
	private Date createdTime;

	// 期限天数
	private Integer deadlineTime;

	// 是否为法人
	private Integer isLegalPerson;


	/*public void setApprovalAmount(BigDecimal approvalAmount) {
		this.approvalAmount = approvalAmount;
	}*/

	public BigDecimal getApplyMoney() {
		return applyMoney;
	}

	public void setApplyMoney(BigDecimal applyMoney) {
		this.applyMoney = applyMoney;
	}

	public String getIndentState() {
		return indentState;
	}

	public void setIndentState(String indentState) {
		this.indentState = indentState;
	}

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

	public Integer getDeadlineTime() {
		return deadlineTime;
	}

	public void setDeadlineTime(Integer deadlineTime) {
		this.deadlineTime = deadlineTime;
	}

	public Integer getIsLegalPerson() {
		return isLegalPerson;
	}

	public void setIsLegalPerson(Integer isLegalPerson) {
		this.isLegalPerson = isLegalPerson;
	}
}
