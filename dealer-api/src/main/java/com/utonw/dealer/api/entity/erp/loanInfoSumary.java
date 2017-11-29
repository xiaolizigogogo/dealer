package com.utonw.dealer.api.entity.erp;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by WANGYJ on 2016/12/6.
 */
public class loanInfoSumary implements Serializable {

	private static final long serialVersionUID = -9111127078033794453L;
	private String managerName;
	private String customerName;
	private String pledge_type;
	private String loanStatus;
	private String repayWay;
	private String state;
	private String uuid;
	private String orderId;
	private Date createdAt;
	private String teamLeader;
	private String assigner;
	private String workflowName;
	private Integer isImportant;
	private BigDecimal loanMoney;
	private String endLeader;
	private Boolean isEnded;
	private String customerId;
	private String contractNum;
	

	public String getContractNum() {
		return contractNum;
	}

	public void setContractNum(String contractNum) {
		this.contractNum = contractNum;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public Boolean getIsEnded() {
		return isEnded;
	}

	public void setIsEnded(Boolean isEnded) {
		this.isEnded = isEnded;
	}

	public String getEndLeader() {
		return endLeader;
	}

	public void setEndLeader(String endLeader) {
		this.endLeader = endLeader;
	}

	public String getManagerName() {
		return managerName;
	}

	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getPledge_type() {
		return pledge_type;
	}

	public void setPledge_type(String pledge_type) {
		this.pledge_type = pledge_type;
	}

	public String getLoanStatus() {
		return loanStatus;
	}

	public void setLoanStatus(String loanStatus) {
		this.loanStatus = loanStatus;
	}

	public String getRepayWay() {
		return repayWay;
	}

	public void setRepayWay(String repayWay) {
		this.repayWay = repayWay;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public String getTeamLeader() {
		return teamLeader;
	}

	public void setTeamLeader(String teamLeader) {
		this.teamLeader = teamLeader;
	}

	public String getAssigner() {
		return assigner;
	}

	public void setAssigner(String assigner) {
		this.assigner = assigner;
	}

	public String getWorkflowName() {
		return workflowName;
	}

	public void setWorkflowName(String workflowName) {
		this.workflowName = workflowName;
	}

	public Integer getIsImportant() {
		return isImportant;
	}

	public void setIsImportant(Integer isImportant) {
		this.isImportant = isImportant;
	}

	public BigDecimal getLoanMoney() {
		return loanMoney;
	}

	public void setLoanMoney(BigDecimal loanMoney) {
		this.loanMoney = loanMoney;
	}
}
