package com.utonw.dealer.api.dto.request;

import java.io.Serializable;
import java.util.Map;

/**
 * Created by SEELE on 2017/6/5.
 */
public class TaskManageStatus implements Serializable{
    private static final long serialVersionUID = -5302842430728159647L;
    private String  applyId;
    private String taskId;
    private Map param;
    private String remark;
    private String taskKey;
    private String userUuid;
    private String money;
    private String vin;

    public String getApplyId() {
        return applyId;
    }

    public void setApplyId(String applyId) {
        this.applyId = applyId;
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

    public String getTaskKey() {
        return taskKey;
    }

    public void setTaskKey(String taskKey) {
        this.taskKey = taskKey;
    }

    public String getUserUuid() {
        return userUuid;
    }

    public void setUserUuid(String userUuid) {
        this.userUuid = userUuid;
    }

    public String getMoney() {
        return money;
    }

    public void setMoney(String money) {
        this.money = money;
    }

    public String getTaskId() {
        return taskId;
    }

    public void setTaskId(String taskId) {
        this.taskId = taskId;
    }

    public String getVin() {
        return vin;
    }

    public void setVin(String vin) {
        this.vin = vin;
    }
}
