package com.utonw.dealer.api.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by WANGYJ on 2017/5/11.
 */
public class workflowtask implements Serializable {
    private static final long serialVersionUID = 7664838047043079857L;
    private String assignee;
    private String name;
    private String task_def_key;
    private String groupid;
    private String businesskey;
    private String taskid;
    private String prockey;
    private Date createtime;
    private String review_conclusion;
    private String review_status;

    public String getReview_status() {
        return review_status;
    }

    public void setReview_status(String review_status) {
        this.review_status = review_status;
    }

    public String getReview_conclusion() {
        return review_conclusion;
    }

    public void setReview_conclusion(String review_conclusion) {
        this.review_conclusion = review_conclusion;
    }

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

    public String getTask_def_key() {
        return task_def_key;
    }

    public void setTask_def_key(String task_def_key) {
        this.task_def_key = task_def_key;
    }

    public String getGroupid() {
        return groupid;
    }

    public void setGroupid(String groupid) {
        this.groupid = groupid;
    }

    public String getBusinesskey() {
        return businesskey;
    }

    public void setBusinesskey(String businesskey) {
        this.businesskey = businesskey;
    }

    public String getTaskid() {
        return taskid;
    }

    public void setTaskid(String taskid) {
        this.taskid = taskid;
    }

    public String getProckey() {
        return prockey;
    }

    public void setProckey(String prockey) {
        this.prockey = prockey;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }
}
