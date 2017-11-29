package com.utonw.dealer.api.entity.erp;

import java.io.Serializable;

/**
 * 贷款处理请求
 * 
 * @author SEELE
 *
 */
public  class LoanInfoHandleBaseRequest implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -8880518210839158601L;
	private String businessKey;
	private String taskId;
	private String processDefinitionId;
	private String loanId;
	private String activityId;
	private String assignee;

	public String getActivityId() {
		return activityId;
	}

	public void setActivityId(String activityId) {
		this.activityId = activityId;
	}

	public String getAssignee() {
		return assignee;
	}

	public void setAssignee(String assignee) {
		this.assignee = assignee;
	}

	public String getBusinessKey() {
		return businessKey;
	}

	public void setBusinessKey(String businessKey) {
		this.businessKey = businessKey;
	}

	public String getTaskId() {
		return taskId;
	}

	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}

	public String getProcessDefinitionId() {
		return processDefinitionId;
	}

	public void setProcessDefinitionId(String processDefinitionId) {
		this.processDefinitionId = processDefinitionId;
	}

	public String getLoanId() {
		return loanId;
	}

	public void setLoanId(String loanId) {
		this.loanId = loanId;
	}

}
