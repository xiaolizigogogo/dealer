package com.utonw.dealer.api.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by SEELE on 2017/7/17.
 */
public class ApplyIndentRequest implements Serializable{
    private static final long serialVersionUID = -4594330163542841343L;
    private String taskId;
    private String applyId;
    private String taskName;
    private String review_status;
    private  Date     updateTime;//完成时间
    private String review_conclusion;
    private String prockey;

    public String getProckey() {
        return prockey;
    }

    public void setProckey(String prockey) {
        this.prockey = prockey;
    }

    public String getReview_conclusion() {
        return review_conclusion;
    }

    public void setReview_conclusion(String review_conclusion) {
        this.review_conclusion = review_conclusion;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getReview_status() {
        return review_status;
    }

    public void setReview_status(String review_status) {
        this.review_status = review_status;
    }

    public String getTaskName() {
        return taskName;
    }

    public void setTaskName(String taskName) {
        this.taskName = taskName;
    }

    public String getTaskId() {
        return taskId;
    }

    public void setTaskId(String taskId) {
        this.taskId = taskId;
    }

    public String getApplyId() {
        return applyId;
    }

    public void setApplyId(String applyId) {
        this.applyId = applyId;
    }
}
