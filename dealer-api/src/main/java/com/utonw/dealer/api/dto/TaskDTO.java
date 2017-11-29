package com.utonw.dealer.api.dto;

import java.io.Serializable;
import java.util.Comparator;

import org.apache.http.client.utils.DateUtils;

/**
 * Created by WANGYJ on 2017/5/6.
 */
public class TaskDTO implements Serializable {
    private static final long serialVersionUID = 7227380655715861814L;
    private String accountId;//用户id
    private String merchantName;//公司名称
    private String merchant_address;//商户详细地址
    private String province;//商户所在省份
    private String city;//商户所在市
    private String mobile;//手机号
    private String apply_date;//申请时间
    private String apply_state;//申请状态(1: 审核通过 2：审核未通过 )
    private String task_name;//任务名称中文key
    private String task_number;//单点任务只有一个
    private String total;//任务条数
    private String currentDate;//创建时间
    private String endTime;//结束时间
    private String indentId;//订单ID
    private String task_key;//任务名称英文名key
    private String taskId;//任务ID
    private  String review_conclusion;
    private String review_status;
    private String roleId;

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

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

    public String getTask_name() {
        return task_name;
    }

    public void setTask_name(String task_name) {
        this.task_name = task_name;
    }

    public String getTask_key() {
        return task_key;
    }

    public void setTask_key(String task_key) {
        this.task_key = task_key;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getTaskId() {
        return taskId;
    }

    public void setTaskId(String taskId) {
        this.taskId = taskId;
    }

    public String getIndentId() {
        return indentId;
    }

    public void setIndentId(String indentId) {
        this.indentId = indentId;
    }


    public String getAccountId() {
        return accountId;
    }

    public void setAccountId(String accountId) {
        this.accountId = accountId;
    }

    public String getCurrentDate() {
        return currentDate;
    }

    public void setCurrentDate(String currentDate) {
        this.currentDate = currentDate;
    }


    public String getMerchantName() {
        return merchantName;
    }

    public void setMerchantName(String merchantName) {
        this.merchantName = merchantName;
    }

    public String getMerchant_address() {
        return merchant_address;
    }

    public void setMerchant_address(String merchant_address) {
        this.merchant_address = merchant_address;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getApply_date() {
        return apply_date;
    }

    public void setApply_date(String apply_date) {
        this.apply_date = apply_date;
    }

    public String getApply_state() {
        return apply_state;
    }

    public void setApply_state(String apply_state) {
        this.apply_state = apply_state;
    }

    public String getTask_number() {
        return task_number;
    }

    public void setTask_number(String task_number) {
        this.task_number = task_number;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    public static class ComparatorUser implements Comparator {

        public int compare(Object o1, Object o2) {
            try{
                TaskDTO user0 = (TaskDTO) o1;
                TaskDTO user1 = (TaskDTO) o2;
                String str[] =new String[]{"yyyy-MM-dd HH:mm:ss"};
                System.out.print(DateUtils.parseDate(user0.getApply_date(), str));
                boolean flag = DateUtils.parseDate(user0.getApply_date(), str).after(DateUtils.parseDate(user1.getApply_date(), str));

                if (flag) {
                    return -1;
                } else {
                    return 1;
                }
            }catch (Exception e){
                return 0;
            }
        }
    }

    }
