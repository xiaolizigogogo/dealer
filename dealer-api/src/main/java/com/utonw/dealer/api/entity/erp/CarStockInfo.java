package com.utonw.dealer.api.entity.erp;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by Administrator on 2016/5/23.
 */
public class CarStockInfo implements Serializable {
    private static final long serialVersionUID = 6688733316596453995L;
    private String uuid;
    private String pledge_type;
    private String orderid;
    private String customer_name;
    private String stockobjectnumber;
    private String instockstuff;
    private String parklot;
    private Byte stockstatus;
    private Date instocktime;
    private String vehicle_no;
    private String vehicleModels;
    private String color;
    private String mileaged;
    private String steeringlocknumber;
    private String wheellocknumber;
    private String parkspace;
    private String instockparkerstuff;
    private Date outstocktime;
    private String outstockstuff;
    private String outstockparkerstuff;
    private String reviewconclusion_instock;
    private String remark_instoke;
    private String reviewconclusion_outstock;
    private String remark_outstoke;
    private String stockobjectkind;
    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public String getPledge_type() {
        return pledge_type;
    }

    public void setPledge_type(String pledge_type) {
        this.pledge_type = pledge_type;
    }

    public String getOrderid() {
        return orderid;
    }

    public void setOrderid(String orderid) {
        this.orderid = orderid;
    }

    public String getCustomer_name() {
        return customer_name;
    }

    public void setCustomer_name(String customer_name) {
        this.customer_name = customer_name;
    }

    public String getStockobjectnumber() {
        return stockobjectnumber;
    }

    public void setStockobjectnumber(String stockobjectnumber) {
        this.stockobjectnumber = stockobjectnumber;
    }

    public String getInstockstuff() {
        return instockstuff;
    }

    public void setInstockstuff(String instockstuff) {
        this.instockstuff = instockstuff;
    }

    public String getParklot() {
        return parklot;
    }

    public void setParklot(String parklot) {
        this.parklot = parklot;
    }

    public Byte getStockstatus() {
        return stockstatus;
    }

    public void setStockstatus(Byte stockstatus) {
        this.stockstatus = stockstatus;
    }

    public Date getInstocktime() {
        return instocktime;
    }

    public void setInstocktime(Date instocktime) {
        this.instocktime = instocktime;
    }

    public String getVehicle_no() {
        return vehicle_no;
    }

    public void setVehicle_no(String vehicle_no) {
        this.vehicle_no = vehicle_no;
    }

    public String getVehicleModels() {
        return vehicleModels;
    }

    public void setVehicleModels(String vehicleModels) {
        this.vehicleModels = vehicleModels;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getMileaged() {
        return mileaged;
    }

    public void setMileaged(String mileaged) {
        this.mileaged = mileaged;
    }

    public String getSteeringlocknumber() {
        return steeringlocknumber;
    }

    public void setSteeringlocknumber(String steeringlocknumber) {
        this.steeringlocknumber = steeringlocknumber;
    }

    public String getWheellocknumber() {
        return wheellocknumber;
    }

    public void setWheellocknumber(String wheellocknumber) {
        this.wheellocknumber = wheellocknumber;
    }

    public String getParkspace() {
        return parkspace;
    }

    public void setParkspace(String parkspace) {
        this.parkspace = parkspace;
    }

    public String getInstockparkerstuff() {
        return instockparkerstuff;
    }

    public void setInstockparkerstuff(String instockparkerstuff) {
        this.instockparkerstuff = instockparkerstuff;
    }

    public Date getOutstocktime() {
        return outstocktime;
    }

    public void setOutstocktime(Date outstocktime) {
        this.outstocktime = outstocktime;
    }

    public String getOutstockstuff() {
        return outstockstuff;
    }

    public void setOutstockstuff(String outstockstuff) {
        this.outstockstuff = outstockstuff;
    }

    public String getOutstockparkerstuff() {
        return outstockparkerstuff;
    }

    public void setOutstockparkerstuff(String outstockparkerstuff) {
        this.outstockparkerstuff = outstockparkerstuff;
    }

    public String getReviewconclusion_instock() {
        return reviewconclusion_instock;
    }

    public void setReviewconclusion_instock(String reviewconclusion_instock) {
        this.reviewconclusion_instock = reviewconclusion_instock;
    }

    public String getRemark_instoke() {
        return remark_instoke;
    }

    public void setRemark_instoke(String remark_instoke) {
        this.remark_instoke = remark_instoke;
    }

    public String getReviewconclusion_outstock() {
        return reviewconclusion_outstock;
    }

    public void setReviewconclusion_outstock(String reviewconclusion_outstock) {
        this.reviewconclusion_outstock = reviewconclusion_outstock;
    }

    public String getRemark_outstoke() {
        return remark_outstoke;
    }

    public void setRemark_outstoke(String remark_outstoke) {
        this.remark_outstoke = remark_outstoke;
    }

    public String getStockobjectkind() {
        return stockobjectkind;
    }

    public void setStockobjectkind(String stockobjectkind) {
        this.stockobjectkind = stockobjectkind;
    }
}
