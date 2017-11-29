package com.utonw.dealer.api.vo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.history.HistoricTaskInstance;
import org.activiti.engine.repository.ProcessDefinition;

import java.io.Serializable;
import java.util.Date;

public class HisTodoVO implements Serializable {

	private static final long serialVersionUID = -749121861469222262L;
	private String column1;
	private String column2;
	private String businessvalue;
	private String taskName;
	private String businesskey;
	private Date taskCreateTime;
	private String deleteReason;
	private Date taskClaimTime;
	
	private Date taskEndTime;

	/*
	 * 签收或者处理 true 表示需要签收 false 表示需要处理
	 */
	private boolean assigneeStatus;

	private String taskId;

	@JsonIgnore
	private HistoricTaskInstance task;
	private String processinsId;

	private String processDefineId;

	@JsonIgnore
	private ProcessDefinition processdefine;
	@JsonIgnore
	private HistoricProcessInstance processins;

	public String getTaskName() {
		return taskName;
	}

	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}

	public Date getTaskCreateTime() {
		return taskCreateTime;
	}

	public void setTaskCreateTime(Date taskCreateTime) {
		this.taskCreateTime = taskCreateTime;
	}

//	public boolean isSuspendedStatus() {
//		return suspendedStatus;
//	}
//
//	public void setSuspendedStatus(boolean suspendedStatus) {
//		this.suspendedStatus = suspendedStatus;
//	}

	public boolean isAssigneeStatus() {
		return assigneeStatus;
	}

	public void setAssigneeStatus(boolean assigneeStatus) {
		this.assigneeStatus = assigneeStatus;
	}

	public String getColumn1() {
		return column1;
	}

	public void setColumn1(String column1) {
		this.column1 = column1;
	}

	public String getColumn2() {
		return column2;
	}

	public void setColumn2(String column2) {
		this.column2 = column2;
	}

	public String getBusinessvalue() {
		return businessvalue;
	}

	public void setBusinessvalue(String businessvalue) {
		this.businessvalue = businessvalue;
	}

	public HistoricTaskInstance getTask() {
		return task;
	}

	public void setTask(HistoricTaskInstance task) {
		this.task = task;
	}

	public String getProcessinsId() {
		return processinsId;
	}

	public void setProcessinsId(String processinsId) {
		this.processinsId = processinsId;
	}

	public ProcessDefinition getProcessdefine() {
		return processdefine;
	}

	public void setProcessdefine(ProcessDefinition processdefine) {
		this.processdefine = processdefine;
	}

	public HistoricProcessInstance getProcessins() {
		return processins;
	}

	public void setProcessins(HistoricProcessInstance processins) {
		this.processins = processins;
	}

	public String getTaskId() {
		return taskId;
	}

	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}

	public String getProcessDefineId() {
		return processDefineId;
	}

	public void setProcessDefineId(String processDefineId) {
		this.processDefineId = processDefineId;
	}

	public String getBusinesskey() {
		return businesskey;
	}

	public void setBusinesskey(String businesskey) {
		this.businesskey = businesskey;
	}

	public Date getTaskClaimTime() {
		return taskClaimTime;
	}

	public void setTaskClaimTime(Date taskClaimTime) {
		this.taskClaimTime = taskClaimTime;
	}

	public Date getTaskEndTime() {
		return taskEndTime;
	}

	public void setTaskEndTime(Date taskEndTime) {
		this.taskEndTime = taskEndTime;
	}

	public String getDeleteReason() {
		return deleteReason;
	}

	public void setDeleteReason(String deleteReason) {
		this.deleteReason = deleteReason;
	}

}
