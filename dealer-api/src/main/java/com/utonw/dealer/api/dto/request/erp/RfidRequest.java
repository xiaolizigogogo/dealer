package com.utonw.dealer.api.dto.request.erp;

import java.io.Serializable;

/**
 * Created by SEELE on 2017/9/29.
 */
public class RfidRequest implements Serializable{
    private static final long serialVersionUID = 7327053031472090428L;
    private String acountId;//巡检记录
    private String plateNumber;//车牌号
    private String carPatrolState;//巡检状态
    private int pageNum;//页码数
    private int pageSize;//每页条数

    public String getCarPatrolState() {
        return carPatrolState;
    }

    public void setCarPatrolState(String carPatrolState) {
        this.carPatrolState = carPatrolState;
    }

    public String getAcountId() {
        return acountId;
    }

    public void setAcountId(String acountId) {
        this.acountId = acountId;
    }

    public String getPlateNumber() {
        return plateNumber;
    }

    public void setPlateNumber(String plateNumber) {
        this.plateNumber = plateNumber;
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
