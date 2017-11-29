package com.utonw.dealer.api.entity;

import javax.xml.crypto.Data;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by SEELE on 2017/5/11.
 */
public class CarCapitalDetails implements Serializable{
    private static final long serialVersionUID = 2066353394147470405L;
    private String c_brand;
    private String c_type;
    private String c_model;
    private Integer miles;
    private Date first_up_time;
    private BigDecimal miniprice;
    private BigDecimal price;
    private BigDecimal buyprice;
    private BigDecimal systemAssess;
    private BigDecimal hostlingCost;
    private BigDecimal loanLimit;
    private Date evaluationTime;
    private Integer deadlineTime;
    private BigDecimal limitPercentage;
    private BigDecimal monthlyInterest;
    private  BigDecimal judgeMoney;
    private  BigDecimal applyMoney;
    private String   indentNumber;
    private String   pic_path;

    public String getPic_path() {
        return pic_path;
    }

    public void setPic_path(String pic_path) {
        this.pic_path = pic_path;
    }

    public String getIndentNumber() {
        return indentNumber;
    }

    public void setIndentNumber(String indentNumber) {
        this.indentNumber = indentNumber;
    }

    public BigDecimal getApplyMoney() {
        return applyMoney;
    }

    public void setApplyMoney(BigDecimal applyMoney) {
        this.applyMoney = applyMoney;
    }

    public Integer getDeadlineTime() {
        return deadlineTime;
    }

    public void setDeadlineTime(Integer deadlineTime) {
        this.deadlineTime = deadlineTime;
    }

    public Date getEvaluationTime() {
        return evaluationTime;
    }


    public BigDecimal getJudgeMoney() {
        return judgeMoney;
    }

    public void setJudgeMoney(BigDecimal judgeMoney) {
        this.judgeMoney = judgeMoney;
    }

    public String getC_brand() {
        return c_brand;
    }

    public void setC_brand(String c_brand) {
        this.c_brand = c_brand;
    }

    public String getC_type() {
        return c_type;
    }

    public void setC_type(String c_type) {
        this.c_type = c_type;
    }

    public String getC_model() {
        return c_model;
    }

    public void setC_model(String c_model) {
        this.c_model = c_model;
    }

    public Integer getMiles() {
        return miles;
    }

    public void setMiles(Integer miles) {
        this.miles = miles;
    }

    public Date getFirst_up_time() {
        return first_up_time;
    }

    public void setFirst_up_time(Date first_up_time) {
        this.first_up_time = first_up_time;
    }

    public void setEvaluationTime(Date evaluationTime) {
        this.evaluationTime = evaluationTime;
    }


    public BigDecimal getMiniprice() {
        return miniprice;
    }

    public void setMiniprice(BigDecimal miniprice) {
        this.miniprice = miniprice;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public BigDecimal getBuyprice() {
        return buyprice;
    }

    public void setBuyprice(BigDecimal buyprice) {
        this.buyprice = buyprice;
    }

    public BigDecimal getSystemAssess() {
        return systemAssess;
    }

    public void setSystemAssess(BigDecimal systemAssess) {
        this.systemAssess = systemAssess;
    }

    public BigDecimal getHostlingCost() {
        return hostlingCost;
    }

    public void setHostlingCost(BigDecimal hostlingCost) {
        this.hostlingCost = hostlingCost;
    }

    public BigDecimal getLoanLimit() {
        return loanLimit;
    }

    public void setLoanLimit(BigDecimal loanLimit) {
        this.loanLimit = loanLimit;
    }


    public BigDecimal getLimitPercentage() {
        return limitPercentage;
    }

    public void setLimitPercentage(BigDecimal limitPercentage) {
        this.limitPercentage = limitPercentage;
    }

    public BigDecimal getMonthlyInterest() {
        return monthlyInterest;
    }

    public void setMonthlyInterest(BigDecimal monthlyInterest) {
        this.monthlyInterest = monthlyInterest;
    }
}
