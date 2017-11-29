package com.utonw.dealer.api.dto;

import java.io.Serializable;

/**
 * Created by SEELE on 2017/4/27.
 */
public class AppraiserDTO implements Serializable {

    private static final long serialVersionUID = 8514549979861204234L;
    private String merchant_name;//评估师公司
    private String real_name;//评估师姓名
    private String mobile;//评估师 手机

    public String getMerchant_name() {
        return merchant_name;
    }

    public void setMerchant_name(String merchant_name) {
        this.merchant_name = merchant_name;
    }

    public String getReal_name() {
        return real_name;
    }

    public void setReal_name(String real_name) {
        this.real_name = real_name;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }
}
