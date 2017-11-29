package com.utonw.dealer.api.dto;

import java.io.Serializable;

/**
 * Created by SEELE on 2017/5/24.
 */
public class CarCapitalDTO implements Serializable{
    private static final long serialVersionUID = -6013032151074799682L;
    private String c_brand;
    private String c_type;
    private String c_model;
    private Integer miles;
    private String first_up_time;
    private String miniprice;
    private String price;
    private String buyprice;
    private String systemAssess;
    private String hostlingCost;
    private String loanLimit;
    private String evaluationTime;
    private String deadlineTime;
    private String limitPercentage;
    private String monthlyInterest;
    private  String judgeMoney;
    private  String applyMoney;
    private  String indentNumber;
    private  String pic_path;
    private String plateNumbe;

    public String getPlateNumbe() {
        return plateNumbe;
    }

    public void setPlateNumbe(String plateNumbe) {
        this.plateNumbe = plateNumbe;
    }

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

    public String getFirst_up_time() {
        return first_up_time;
    }

    public void setFirst_up_time(String first_up_time) {
        this.first_up_time = first_up_time;
    }

    public String getMiniprice() {
        return miniprice;
    }

    public void setMiniprice(String miniprice) {
        this.miniprice = miniprice;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getBuyprice() {
        return buyprice;
    }

    public void setBuyprice(String buyprice) {
        this.buyprice = buyprice;
    }

    public String getSystemAssess() {
        return systemAssess;
    }

    public void setSystemAssess(String systemAssess) {
        this.systemAssess = systemAssess;
    }

    public String getHostlingCost() {
        return hostlingCost;
    }

    public void setHostlingCost(String hostlingCost) {
        this.hostlingCost = hostlingCost;
    }

    public String getLoanLimit() {
        return loanLimit;
    }

    public void setLoanLimit(String loanLimit) {
        this.loanLimit = loanLimit;
    }

    public String getEvaluationTime() {
        return evaluationTime;
    }

    public void setEvaluationTime(String evaluationTime) {
        this.evaluationTime = evaluationTime;
    }

    public String getDeadlineTime() {
        return deadlineTime;
    }

    public void setDeadlineTime(String deadlineTime) {
        this.deadlineTime = deadlineTime;
    }

    public String getLimitPercentage() {
        return limitPercentage;
    }

    public void setLimitPercentage(String limitPercentage) {
        this.limitPercentage = limitPercentage;
    }

    public String getMonthlyInterest() {
        return monthlyInterest;
    }

    public void setMonthlyInterest(String monthlyInterest) {
        this.monthlyInterest = monthlyInterest;
    }

    public String getJudgeMoney() {
        return judgeMoney;
    }

    public void setJudgeMoney(String judgeMoney) {
        this.judgeMoney = judgeMoney;
    }

    public String getApplyMoney() {
        return applyMoney;
    }

    public void setApplyMoney(String applyMoney) {
        this.applyMoney = applyMoney;
    }
}
