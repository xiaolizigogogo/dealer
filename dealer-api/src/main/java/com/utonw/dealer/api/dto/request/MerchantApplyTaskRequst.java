package com.utonw.dealer.api.dto.request;

import java.io.Serializable;

/**
 * Created by WANGYJ on 2017/5/8.
 */
public class MerchantApplyTaskRequst implements Serializable {

    private static final long serialVersionUID = 5204914934879462057L;

    private String merchantId;
    private int pageNum;
    private int pageSize;
    private String status;
    private String merchantName;


    public String getMerchantName() {
        return merchantName;
    }

    public void setMerchantName(String merchantName) {
        this.merchantName = merchantName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getMerchantId() {
        return merchantId;
    }

    public void setMerchantId(String merchantId) {
        this.merchantId = merchantId;
    }

    public int getPageNum() {
        return pageNum;
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
}
