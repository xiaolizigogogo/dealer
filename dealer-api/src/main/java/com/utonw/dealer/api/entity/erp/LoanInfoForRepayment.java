package com.utonw.dealer.api.entity.erp;

import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by WANGYJ on 2016/12/21.
 * 贷后还款列表查询结果的实体类
 */
public class LoanInfoForRepayment {
	private String repId;
	private String uuid;
	private String orderid;
	private String customer_name;
	private Date repayDate;
	private BigDecimal repaymentSum;
	private String loan_status;
	private Integer is_important;
	private Integer state;
	private String clientManager;
	private String principalName;
	private Integer repayPeriod;
	private Integer repaydiff;
	private String taskId;
	private String customerId;
	private String activityId;
	private String taskName;
	private String assignee;
	public String getRepId() {
		return repId;
	}

	public void setRepId(String repId) {
		this.repId = repId;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getOrderid() {
		return orderid;
	}

	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}

	public String getCustomer_name() {
		return customer_name;
	}

	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}

	public Date getRepayDate() {
		return repayDate;
	}

	public void setRepayDate(Date repayDate) {
		this.repayDate = repayDate;
	}

	public BigDecimal getRepaymentSum() {
		return repaymentSum;
	}

	public void setRepaymentSum(BigDecimal repaymentSum) {
		this.repaymentSum = repaymentSum;
	}

	public String getLoan_status() {
		return loan_status;
	}

	public void setLoan_status(String loan_status) {
		this.loan_status = loan_status;
	}

	public Integer getIs_important() {
		return is_important;
	}

	public void setIs_important(Integer is_important) {
		this.is_important = is_important;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}


	public String getPrincipalName() {
		return principalName;
	}

	public void setPrincipalName(String principalName) {
		this.principalName = principalName;
	}

	public Integer getRepayPeriod() {
		return repayPeriod;
	}

	public void setRepayPeriod(Integer repayPeriod) {
		this.repayPeriod = repayPeriod;
	}

	public Integer getRepaydiff() {
		return repaydiff;
	}

	public void setRepaydiff(Integer repaydiff) {
		this.repaydiff = repaydiff;
	}

	public String getTaskId() {
		return taskId;
	}

	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public String getClientManager() {
		return clientManager;
	}

	public void setClientManager(String clientManager) {
		this.clientManager = clientManager;
	}

	public String getActivityId() {
		return activityId;
	}

	public void setActivityId(String activityId) {
		this.activityId = activityId;
	}

	public String getTaskName() {
		return taskName;
	}

	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}

	public String getAssignee() {
		return assignee;
	}

	public void setAssignee(String assignee) {
		this.assignee = assignee;
	}
}
