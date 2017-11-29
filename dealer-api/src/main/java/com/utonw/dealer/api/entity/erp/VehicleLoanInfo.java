package com.utonw.dealer.api.entity.erp;

import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by WANGYJ on 2016/12/22.
 */
public class VehicleLoanInfo {
	private String assignee;
	private String name;
	private String activityId;
	private String loan_status;
	private String taskId;
	private String uuid;
	private String orderid;
	private String pledge_type;
	private String state;
	private Integer is_important;
	private String create_by;
	private String principalName;
	private String customer_name;
	private String customerId;
	private Date created_at;
	private String customerIdCard;
	private String procKey;
	private String businessKey;
	private BigDecimal loanMoney;

	public String getAssignee() {
		return assignee;
	}

	public void setAssignee(String assignee) {
		this.assignee = assignee;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getActivityId() {
		return activityId;
	}

	public void setActivityId(String activityId) {
		this.activityId = activityId;
	}

	public String getLoan_status() {
		return loan_status;
	}

	public void setLoan_status(String loan_status) {
		this.loan_status = loan_status;
	}

	public String getTaskId() {
		return taskId;
	}

	public void setTaskId(String taskId) {
		this.taskId = taskId;
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

	public String getPledge_type() {
		return pledge_type;
	}

	public void setPledge_type(String pledge_type) {
		this.pledge_type = pledge_type;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Integer getIs_important() {
		return is_important;
	}

	public void setIs_important(Integer is_important) {
		this.is_important = is_important;
	}

	public String getCreate_by() {
		return create_by;
	}

	public void setCreate_by(String create_by) {
		this.create_by = create_by;
	}

	public String getPrincipalName() {
		return principalName;
	}

	public void setPrincipalName(String principalName) {
		this.principalName = principalName;
	}

	public String getCustomer_name() {
		return customer_name;
	}

	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}

	public String getCustomerIdCard() {
		return customerIdCard;
	}

	public void setCustomerIdCard(String customerIdCard) {
		this.customerIdCard = customerIdCard;
	}

	public String getProcKey() {
		return procKey;
	}

	public void setProcKey(String procKey) {
		this.procKey = procKey;
	}


	public String getBusinessKey() {
		return businessKey;
	}

	public void setBusinessKey(String businessKey) {
		this.businessKey = businessKey;
	}

	public BigDecimal getLoanMoney() {
		return loanMoney;
	}

	public void setLoanMoney(BigDecimal loanMoney) {
		this.loanMoney = loanMoney;
	}
}
