package com.utonw.dealer.api.dto.request;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * Created by WANGYJ on 2017/5/10.
 */
public class OrderPageRequest implements Serializable {
    private static final long serialVersionUID = 5422000556935137606L;
    //页码
    private int pageNum;
    //每页最大Size
    private int pageSize;
    //请求
    private String listKind;
    private String loanStatus;
    private String orderNumber;
    private String merchantName;
    private String representative;
    private String uuid;
    private List<String> ids;
    private String vin;
    private String plateNumber;
    private Date startTime;
    private Date endTime;

    public String getVin() {
        return vin;
    }

    public void setVin(String vin) {
        this.vin = vin;
    }

    public String getPlateNumber() {
        return plateNumber;
    }

    public void setPlateNumber(String plateNumber) {
        this.plateNumber = plateNumber;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
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

    public String getListKind() {
        return listKind;
    }

    public void setListKind(String listKind) {
        this.listKind = listKind;
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

    public String getMerchantName() {
        return merchantName;
    }

    public void setMerchantName(String merchantName) {
        this.merchantName = merchantName;
    }

    public String getRepresentative() {
        return representative;
    }

    public void setRepresentative(String representative) {
        this.representative = representative;
    }

    public List<String> getIds() {
        return ids;
    }

    public void setIds(List<String> ids) {
        this.ids = ids;
    }
    
}
