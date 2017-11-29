package com.utonw.dealer.api.dto;

import java.io.Serializable;

/**
 * Created by WANGYJ on 2017/5/9.
 * 商户相关的信息及评估结果相关的信息都放到这里面
 */
public class MerchantInfoDTO implements Serializable {
    private static final long serialVersionUID = 5519935488128181038L;
    private String merchant_name;//商户名称
    private String auditstatus;//资格审核通过
    private String merchant_address;//地址
    private String province;   //省
    private String city;    //市
    private String mobile;//电话
    private String applymoney;//申请金额
    private String loanLimit;//额度
    private String limitPercentage;//月利率
    private String monthlyInterest;//月利率
    private String financing_number;//已配资车辆数
    private String merchant_price;//商家评估价
    private String appraisers_price;//评估师评估价
   private String acountId;
   private String productId;
   private String applyId;

    public String getLimitPercentage() {
        return limitPercentage;
    }

    public void setLimitPercentage(String limitPercentage) {
        this.limitPercentage = limitPercentage;
    }

    public String getApplyId() {
        return applyId;
    }

    public void setApplyId(String applyId) {
        this.applyId = applyId;
    }

    public String getAcountId() {
        return acountId;
    }

    public void setAcountId(String acountId) {
        this.acountId = acountId;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getMerchant_name() {
        return merchant_name;
    }

    public void setMerchant_name(String merchant_name) {
        this.merchant_name = merchant_name;
    }

    public String getAuditstatus() {
        return auditstatus;
    }

    public void setAuditstatus(String auditstatus) {
        this.auditstatus = auditstatus;
    }

    public String getMerchant_address() {
        return merchant_address;
    }

    public void setMerchant_address(String merchant_address) {
        this.merchant_address = merchant_address;
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

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getApplymoney() {
        return applymoney;
    }

    public void setApplymoney(String applymoney) {
        this.applymoney = applymoney;
    }

    public String getLoanLimit() {
        return loanLimit;
    }

    public void setLoanLimit(String loanLimit) {
        this.loanLimit = loanLimit;
    }

    public String getMonthlyInterest() {
        return monthlyInterest;
    }

    public void setMonthlyInterest(String monthlyInterest) {
        this.monthlyInterest = monthlyInterest;
    }

    public String getFinancing_number() {
        return financing_number;
    }

    public void setFinancing_number(String financing_number) {
        this.financing_number = financing_number;
    }

    public String getMerchant_price() {
        return merchant_price;
    }

    public void setMerchant_price(String merchant_price) {
        this.merchant_price = merchant_price;
    }

    public String getAppraisers_price() {
        return appraisers_price;
    }

    public void setAppraisers_price(String appraisers_price) {
        this.appraisers_price = appraisers_price;
    }


}
