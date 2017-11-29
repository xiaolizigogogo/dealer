package com.utonw.dealer.api.dto;

import java.io.Serializable;

/**
 * Created by SEELE on 2017/4/24.
 */
public class CompanyData implements Serializable{
    private static final long serialVersionUID = -6325130281497926141L;
    private String merchantName;//商家名字
    private String limit;//额度比例
    private String monthlyInterest;//月利率
    private String apply_state;//审核状态

    public String getMerchantName() {
        return merchantName;
    }

    public void setMerchantName(String merchantName) {
        this.merchantName = merchantName;
    }

    public String getLimit() {
        return limit;
    }

    public void setLimit(String limit) {
        this.limit = limit;
    }

    public String getMonthlyInterest() {
        return monthlyInterest;
    }

    public void setMonthlyInterest(String monthlyInterest) {
        this.monthlyInterest = monthlyInterest;
    }

    public String getApply_state() {
        return apply_state;
    }

    public void setApply_state(String apply_state) {
        this.apply_state = apply_state;
    }
}
