package com.utonw.dealer.api.entity;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * Created by SEELE on 2017/5/12.
 */
public class CompanyDetails implements Serializable{
    private static final long serialVersionUID = -7935911264693614554L;
    private String merchant_name;
    private String province;
    private String city;
    private String merchant_address;
    private String merchantName;
    private String licenseNumber;
    private String organizationCode;
    private BigDecimal limitPercentage;
    private BigDecimal monthlyInterest;
    private Integer reviewStatus;
    private BigDecimal applyMoney;
    private Integer allocatedTotal;

    public Integer getAllocatedTotal() {
        return allocatedTotal;
    }

    public void setAllocatedTotal(Integer allocatedTotal) {
        this.allocatedTotal = allocatedTotal;
    }

    public String getMerchant_name() {
        return merchant_name;
    }

    public void setMerchant_name(String merchant_name) {
        this.merchant_name = merchant_name;
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

    public String getMerchant_address() {
        return merchant_address;
    }

    public void setMerchant_address(String merchant_address) {
        this.merchant_address = merchant_address;
    }

    public String getMerchantName() {
        return merchantName;
    }

    public void setMerchantName(String merchantName) {
        this.merchantName = merchantName;
    }

    public String getLicenseNumber() {
        return licenseNumber;
    }

    public void setLicenseNumber(String licenseNumber) {
        this.licenseNumber = licenseNumber;
    }

    public String getOrganizationCode() {
        return organizationCode;
    }

    public void setOrganizationCode(String organizationCode) {
        this.organizationCode = organizationCode;
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

    public Integer getReviewStatus() {
        return reviewStatus;
    }

    public void setReviewStatus(Integer reviewStatus) {
        this.reviewStatus = reviewStatus;
    }

    public BigDecimal getApplyMoney() {
        return applyMoney;
    }

    public void setApplyMoney(BigDecimal applyMoney) {
        this.applyMoney = applyMoney;
    }
}
