package com.utonw.dealer.api.vo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;

import java.io.Serializable;
import java.util.Date;
import java.util.Map;

public class TodoVO implements Serializable {

	private static final long serialVersionUID = 3205218086410207396L;
	/**
	 * 属性1
	 */
	private String column1;
	/**
	 * 属性2
	 */
	private String column2;
	/**
	 * 业务值
	 */
	private String businessvalue;
	/**
	 * 任务名
	 */
	private String taskName;
	/**
	 * 业务key
	 */
	private String businesskey;
	/**
	 * 创建时间
	 */
	private Date taskCreateTime;
	/*
	 * 流程状态 true 为挂起状态 false 为 正常状态
	 */
	private boolean suspendedStatus;
	/*
	 * 签收或者处理 true 表示需要签收 false 表示需要处理
	 */
	private boolean assigneeStatus;

	/**
	 * 任务id
	 */
	private String taskId;

	@JsonIgnore
	private Task task;
	/**
	 * 流程实例id
	 */
	private String processinsId;

	/**
	 * 流程定义id
	 */
	private String processDefineId;

	@JsonIgnore
	private ProcessDefinition processdefine;
	@JsonIgnore
	private ProcessInstance processins;
	
	private Map<String,Object> loanInfoMap;

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

	public boolean isSuspendedStatus() {
		return suspendedStatus;
	}

	public void setSuspendedStatus(boolean suspendedStatus) {
		this.suspendedStatus = suspendedStatus;
	}

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

	public Task getTask() {
		return task;
	}

	public void setTask(Task task) {
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

	public ProcessInstance getProcessins() {
		return processins;
	}

	public void setProcessins(ProcessInstance processins) {
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

	public Map<String, Object> getLoanInfoMap() {
		return loanInfoMap;
	}

	public void setLoanInfoMap(Map<String, Object> loanInfoMap) {
		this.loanInfoMap = loanInfoMap;
	}

	
	
	
}
