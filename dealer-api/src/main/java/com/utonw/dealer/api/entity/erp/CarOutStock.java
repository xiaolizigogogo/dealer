package com.utonw.dealer.api.entity.erp;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by Administrator on 2016/5/18.
 */
public class CarOutStock implements Serializable {
    private static final long serialVersionUID = -3400062504200919115L;
    //UUID
    private String uuid;
    //订单ID
    private String orderid;
    //客户姓名
    private String customer_name;
    //押品编号
    private String stockobjectnumber;
    //出库处理人员
    private String outstockstuff;
    //停车场名称
    private String parklot;
    //出库状态
    private Byte stockstatus;
    //出库时间
    private Date outstocktime;
    //抵押类型
    private String pledge_type;
    //用户ID
    private String customerId;

    public String getOrderid() {
        return orderid;
    }

    public void setOrderid(String orderid) {
        this.orderid = orderid;
    }

    public String getStockobjectnumber() {
        return stockobjectnumber;
    }

    public void setStockobjectnumber(String stockobjectnumber) {
        this.stockobjectnumber = stockobjectnumber;
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

    public String getCustomer_name() {
        return customer_name;
    }

    public void setCustomer_name(String customer_name) {
        this.customer_name = customer_name;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public String getPledgeType() {
        return getPledge_type();
    }

    public void setPledgeType(String pledge_type) {
        this.setPledge_type(pledge_type);
    }

    public String getOutstockstuff() {
        return outstockstuff;
    }

    public void setOutstockstuff(String outstockstuff) {
        this.outstockstuff = outstockstuff;
    }

    public Date getOutstocktime() {
        return outstocktime;
    }

    public void setOutstocktime(Date outstocktime) {
        this.outstocktime = outstocktime;
    }

    public String getPledge_type() {
        return pledge_type;
    }

    public void setPledge_type(String pledge_type) {
        this.pledge_type = pledge_type;
    }

    public String getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }
}
