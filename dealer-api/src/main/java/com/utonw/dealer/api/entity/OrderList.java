package com.utonw.dealer.api.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by SEELE on 2017/5/22.
 */
public class OrderList implements Serializable{
    private static final long serialVersionUID = -3431781210816485221L;
    private Integer productId;
    private String  indentNumber;
    private String  indentState;
    private BigDecimal  applyMoney;
    private String  product_name;
    private Date on_shelf_time;
    private BigDecimal  price;
    private BigDecimal miniprice;
    private Integer  miles;
    private String pic_path;
    private String indentId;
    private Long taskAssigee;//签收人
    private String taskId;//任务ID
    private Date evaluationTime;//评估时间
    private Date updateTime;//审核时间
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

    public Date getEvaluationTime() {
        return evaluationTime;
    }

    public void setEvaluationTime(Date evaluationTime) {
        this.evaluationTime = evaluationTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Long getTaskAssigee() {
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
    }

    public String getIndentId() {
        return indentId;
    }

    public void setIndentId(String indentId) {
        this.indentId = indentId;
    }

    public String getPic_path() {
        return pic_path;
    }

    public void setPic_path(String pic_path) {
        this.pic_path = pic_path;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
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

    public BigDecimal getApplyMoney() {
        return applyMoney;
    }

    public void setApplyMoney(BigDecimal applyMoney) {
        this.applyMoney = applyMoney;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public Date getOn_shelf_time() {
        return on_shelf_time;
    }

    public void setOn_shelf_time(Date on_shelf_time) {
        this.on_shelf_time = on_shelf_time;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public BigDecimal getMiniprice() {
        return miniprice;
    }

    public void setMiniprice(BigDecimal miniprice) {
        this.miniprice = miniprice;
    }

    public Integer getMiles() {
        return miles;
    }

    public void setMiles(Integer miles) {
        this.miles = miles;
    }
}
