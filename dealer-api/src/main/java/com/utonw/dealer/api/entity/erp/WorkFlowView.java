package com.utonw.dealer.api.entity.erp;


/**
 * Created by WANGYJ on 2016/12/21.
 */
public class WorkFlowView {
	private String assignee;
	private String name;
	private String activityId;
	private Integer groupId;
	private String bussinessKey;
	private String taskId;

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

	public Integer getGroupId() {
		return groupId;
	}

	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}

	public String getBussinessKey() {
		return bussinessKey;
	}

	public void setBussinessKey(String bussinessKey) {
		this.bussinessKey = bussinessKey;
	}

	public String getTaskId() {
		return taskId;
	}

	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}
}
