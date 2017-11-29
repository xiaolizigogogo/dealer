package com.utonw.dealer.api.dto;

import java.io.Serializable;

/**
 * Created by WANGYJ on 2017/5/8.
 */
public class MerchantVerifyDTO implements Serializable {
    private static final long serialVersionUID = 4951857231985541561L;
    //车位数
    private String parkSpaceNumber;
    //库存车辆个数
    private String inStoreCarNumber;
    //车商规模
    private String merchantScale;
    //备考
    private String remark;

    public String getParkSpaceNumber() {
        return parkSpaceNumber;
    }

    public void setParkSpaceNumber(String parkSpaceNumber) {
        this.parkSpaceNumber = parkSpaceNumber;
    }

    public String getInStoreCarNumber() {
        return inStoreCarNumber;
    }

    public void setInStoreCarNumber(String inStoreCarNumber) {
        this.inStoreCarNumber = inStoreCarNumber;
    }

    public String getMerchantScale() {
        return merchantScale;
    }

    public void setMerchantScale(String merchantScale) {
        this.merchantScale = merchantScale;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
