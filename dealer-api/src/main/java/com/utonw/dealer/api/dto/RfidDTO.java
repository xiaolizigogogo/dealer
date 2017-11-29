package com.utonw.dealer.api.dto;

import java.io.Serializable;

/**
 * Created by SEELE on 2017/10/9.
 */
public class RfidDTO implements Serializable {
    private static final long serialVersionUID = 7327053031472090428L;
    private String orderId;
    private String plateNumber;
    private String rfidLabelId;
    private String rfidSerialNumber;
    private String dealerName;
    private String dealerPhone;
    private int dealerId;
    private int carId;
    private String taskKey;
    private String taskId;

    public String getTaskId() {
        return taskId;
    }

    public void setTaskId(String taskId) {
        this.taskId = taskId;
    }

    public String getTaskKey() {
        return taskKey;
    }

    public void setTaskKey(String taskKey) {
        this.taskKey = taskKey;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getPlateNumber() {
        return plateNumber;
    }

    public void setPlateNumber(String plateNumber) {
        this.plateNumber = plateNumber;
    }

    public String getRfidLabelId() {
        return rfidLabelId;
    }

    public void setRfidLabelId(String rfidLabelId) {
        this.rfidLabelId = rfidLabelId;
    }

    public String getRfidSerialNumber() {
        return rfidSerialNumber;
    }

    public void setRfidSerialNumber(String rfidSerialNumber) {
        this.rfidSerialNumber = rfidSerialNumber;
    }

    public String getDealerName() {
        return dealerName;
    }

    public void setDealerName(String dealerName) {
        this.dealerName = dealerName;
    }

    public String getDealerPhone() {
        return dealerPhone;
    }

    public void setDealerPhone(String dealerPhone) {
        this.dealerPhone = dealerPhone;
    }

    public int getDealerId() {
        return dealerId;
    }

    public void setDealerId(int dealerId) {
        this.dealerId = dealerId;
    }

    public int getCarId() {
        return carId;
    }

    public void setCarId(int carId) {
        this.carId = carId;
    }
}
