package com.utonw.dealer.api.entity;

import java.io.Serializable;

public class TaskName implements Serializable{

	private static final long serialVersionUID = -8884139077387474775L;
	
	private Integer id;

    private String taskName;

    private String taskCode;

    private String gmtCreate;

    private String gmtModify;

    private String memo;

    private Boolean enable;

    private String taskType;

    private Integer taskOrder;
    
    private String taskDiv;
    
    

    public String getTaskDiv() {
		return taskDiv;
	}

	public void setTaskDiv(String taskDiv) {
		this.taskDiv = taskDiv;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTaskName() {
        return taskName;
    }

    public void setTaskName(String taskName) {
        this.taskName = taskName == null ? null : taskName.trim();
    }

    public String getTaskCode() {
        return taskCode;
    }

    public void setTaskCode(String taskCode) {
        this.taskCode = taskCode == null ? null : taskCode.trim();
    }

    public String getGmtCreate() {
        return gmtCreate;
    }

    public void setGmtCreate(String gmtCreate) {
        this.gmtCreate = gmtCreate == null ? null : gmtCreate.trim();
    }

    public String getGmtModify() {
        return gmtModify;
    }

    public void setGmtModify(String gmtModify) {
        this.gmtModify = gmtModify == null ? null : gmtModify.trim();
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo == null ? null : memo.trim();
    }

    public Boolean getEnable() {
        return enable;
    }

    public void setEnable(Boolean enable) {
        this.enable = enable;
    }

    public String getTaskType() {
        return taskType;
    }

    public void setTaskType(String taskType) {
        this.taskType = taskType == null ? null : taskType.trim();
    }

    public Integer getTaskOrder() {
        return taskOrder;
    }

    public void setTaskOrder(Integer taskOrder) {
        this.taskOrder = taskOrder;
    }

}
