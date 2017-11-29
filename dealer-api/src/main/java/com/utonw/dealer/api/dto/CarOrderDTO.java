package com.utonw.dealer.api.dto;

import java.io.Serializable;

/**
 * Created by SEELE on 2017/5/23.
 */
public class CarOrderDTO implements Serializable{
    private static final long serialVersionUID = 8610337426355696281L;
    private String productId;
    private String  indentNumber;
    private String  indentState;
    private String  applyMoney;
    private String  product_name;
    private String on_shelf_time;
    private String  price;
    private String miniprice;
    private String  miles;
    private String pic_path;
    private String indentId;
    private String taskId;
    private String applyId;
    private String taskKey;
    private String evaluationTime;//评估时间
    private String auditTime;//初审时间
    private String currentTime;//当前时间
    private String vin;
    private String plateNumber;

    public String getPlateNumber() {
		return plateNumber;
	}

	public void setPlateNumber(String plateNumber) {
		this.plateNumber = plateNumber;
	}

	public String getVin() {
        return vin;
    }

    public void setVin(String vin) {
        this.vin = vin;
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

    public String getTaskKey() {
        return taskKey;
    }

    public void setTaskKey(String taskKey) {
        this.taskKey = taskKey;
    }

    public String getCurrentTime() {
        return currentTime;
    }

    public void setCurrentTime(String currentTime) {
        this.currentTime = currentTime;
    }

    public String getEvaluationTime() {
        return evaluationTime;
    }

    public void setEvaluationTime(String evaluationTime) {
        this.evaluationTime = evaluationTime;
    }

    public String getAuditTime() {
        return auditTime;
    }

    public void setAuditTime(String auditTime) {
        this.auditTime = auditTime;
    }

    /*public Long getTaskAssigee() {
        return taskAssigee;
    }

    public void setTaskAssigee(Long taskAssigee) {
        this.taskAssigee = taskAssigee;
    }

    public String getTaskId() {
        return taskId;
    }

    public void setTaskId(String taskId) {
        this.taskId = taskId;
    }*/

    public String getIndentId() {
        return indentId;
    }

    public void setIndentId(String indentId) {
        this.indentId = indentId;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getIndentNumber() {
        return indentNumber;
    }

    public void setIndentNumber(String indentNumber) {
        this.indentNumber = indentNumber;
    }

    public String getIndentState() {
        return indentState;
    }

    public void setIndentState(String indentState) {
        this.indentState = indentState;
    }

    public String getApplyMoney() {
        return applyMoney;
    }

    public void setApplyMoney(String applyMoney) {
        this.applyMoney = applyMoney;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getOn_shelf_time() {
        return on_shelf_time;
    }

    public void setOn_shelf_time(String on_shelf_time) {
        this.on_shelf_time = on_shelf_time;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getMiniprice() {
        return miniprice;
    }

    public void setMiniprice(String miniprice) {
        this.miniprice = miniprice;
    }

    public String getMiles() {
        return miles;
    }

    public void setMiles(String miles) {
        this.miles = miles;
    }

    public String getPic_path() {
        return pic_path;
    }

    public void setPic_path(String pic_path) {
        this.pic_path = pic_path;
    }
}
