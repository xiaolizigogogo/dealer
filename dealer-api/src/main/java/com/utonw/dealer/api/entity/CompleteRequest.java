package com.utonw.dealer.api.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.Map;

/**
 * Created by SEELE on 2017/7/18.
 */
public class CompleteRequest implements Serializable{
    private static final long serialVersionUID = -7756262724401042397L;
    private String  applyId;
    private String taskId;
    private Map param;
    private String remark;
    private String taskKey;
    private String userUuid;
    private String money;
    
	public String getMoney() {
		return money;
	}
	public void setMoney(String money) {
		this.money = money;
	}
	public String getUserUuid() {
		return userUuid;
	}
	public void setUserUuid(String userUuid) {
		this.userUuid = userUuid;
	}
	public String getTaskKey() {
		return taskKey;
	}
	public void setTaskKey(String taskKey) {
		this.taskKey = taskKey;
	}
	public String getApplyId() {
		return applyId;
	}
	public void setApplyId(String applyId) {
		this.applyId = applyId;
	}
	public String getTaskId() {
		return taskId;
	}
	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}
	public Map getParam() {
		return param;
	}
	public void setParam(Map param) {
		this.param = param;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
    
}
