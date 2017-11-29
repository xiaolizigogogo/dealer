package com.utonw.dealer.api.dto.request;

import java.io.Serializable;

public class RepayPageRequest implements Serializable {
    private static final long serialVersionUID = 1L;
    //页码
    private int pageNum;
    //每页最大Size
    private int pageSize;
    //请求
    private String loanStatus;
    private String orderNumber;

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

    public String getLoanStatus() {
        return loanStatus;
    }

    public void setLoanStatus(String loanStatus) {
        this.loanStatus = loanStatus;
    }

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
    }

}
