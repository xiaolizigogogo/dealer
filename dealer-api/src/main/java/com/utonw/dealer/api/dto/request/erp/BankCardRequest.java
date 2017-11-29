package com.utonw.dealer.api.dto.request.erp;

import java.io.Serializable;

public class BankCardRequest implements Serializable {

	private static final long serialVersionUID = 1L;

    // 页数
    private Integer pageNum;
    // 条数
    private Integer pageSize;
    // 经销商名称
    private String merchantName;
    // 银行名
    private String bankName;
    // 银行卡号
    private String bankNumber;

    public Integer getPageNum() {
        return pageNum;
    }

    public void setPageNum(Integer pageNum) {
        this.pageNum = pageNum;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public String getMerchantName() {
        return merchantName;
    }

    public void setMerchantName(String merchantName) {
        this.merchantName = merchantName;
    }

    public String getBankName() {
        return bankName;
    }

    public void setBankName(String bankName) {
        this.bankName = bankName;
    }

    public String getBankNumber() {
        return bankNumber;
    }

    public void setBankNumber(String bankNumber) {
        this.bankNumber = bankNumber;
    }
}
