package com.utonw.dealer.api.dto;

import java.io.Serializable;

/**
 * Created by SEELE on 2017/5/26.
 */
public class CapitalAuditDTO implements Serializable{
    private static final long serialVersionUID = 1306276854745184139L;
    private String reviewStatus;
    private String merchantName;
    private String verifyStatus;
    private String remark;

    public String getVerifyStatus() {
        return verifyStatus;
    }

    public void setVerifyStatus(String verifyStatus) {
        this.verifyStatus = verifyStatus;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getReviewStatus() {
        return reviewStatus;
    }

    public void setReviewStatus(String reviewStatus) {
        this.reviewStatus = reviewStatus;
    }

    public String getMerchantName() {
        return merchantName;
    }

    public void setMerchantName(String merchantName) {
        this.merchantName = merchantName;
    }

}
