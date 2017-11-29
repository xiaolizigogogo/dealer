package com.utonw.dealer.api.entity.erp;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by Administrator on 2016/5/18.
 */
public class CarStock implements Serializable {
    private static final long serialVersionUID = 3589737343579390315L;
    //UUID
    private String uuid;
    //订单ID
    private String orderid;
    //客户姓名
    private String customer_name;
    //押品编号
    private String stockobjectnumber;
    //入库处理人员
    private String instockstuff;
    //停车场名称
    private String parklot;
    //入库状态
    private Byte stockstatus;
    //入库时间
    private Date instocktime;
    //抵押类型
    private String pledge_type;
    //taskId
    private String taskId;
    //节点
    private String taskDefKey;

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

    public Date getInstocktime() {
        return instocktime;
    }

    public void setInstocktime(Date instocktime) {
        this.instocktime = instocktime;
    }

    public String getPledgeType() {
        return pledge_type;
    }

    public void setPledgeType(String pledge_type) {
        this.pledge_type = pledge_type;
    }

    public String getPledge_type() { return pledge_type; }

    public void setPledge_type(String pledge_type) { this.pledge_type = pledge_type; }

    public String getTaskId() { return taskId; }

    public void setTaskId(String taskId) { this.taskId = taskId; }

    public String getTaskDefKey() { return taskDefKey; }

    public void setTaskDefKey(String taskDefKey) { this.taskDefKey = taskDefKey; }
}
