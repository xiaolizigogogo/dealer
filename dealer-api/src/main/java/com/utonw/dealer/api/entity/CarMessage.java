package com.utonw.dealer.api.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by SEELE on 2017/5/10.
 */
public class CarMessage implements Serializable{
    private static final long serialVersionUID = 5471872656789211126L;
    private Integer product_id;
    private Date first_up_time;
    private Integer miles;
    private BigDecimal miniprice;
    private BigDecimal price;
    private String indentState;//审核状态
    private Integer browse_num_times;//浏览次数
    private Integer tel_num_times;//电话次数
    private Integer sale_days;//在售天数
    private String c_brand;//车辆品牌
    private String c_model;//车辆车型
    private String c_type;//车辆车系
    private String pic_path;//图片路径
    private Date off_shelf_time;
    private Date on_shelf_time;
    private BigDecimal judgeMoney;//终审金额
    private String vin;
    private String id;
    private BigDecimal closeingPrice;
    private BigDecimal zbMoney;
    private String whetherPass;
    private String rejectRemarks;

    public String getWhetherPass() {
        return whetherPass;
    }

    public void setWhetherPass(String whetherPass) {
        this.whetherPass = whetherPass;
    }

    public String getRejectRemarks() {
        return rejectRemarks;
    }

    public void setRejectRemarks(String rejectRemarks) {
        this.rejectRemarks = rejectRemarks;
    }

    public BigDecimal getCloseingPrice() {
        return closeingPrice;
    }

    public void setCloseingPrice(BigDecimal closeingPrice) {
        this.closeingPrice = closeingPrice;
    }

    public BigDecimal getZbMoney() {
        return zbMoney;
    }

    public void setZbMoney(BigDecimal zbMoney) {
        this.zbMoney = zbMoney;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getVin() {
        return vin;
    }

    public void setVin(String vin) {
        this.vin = vin;
    }

    public BigDecimal getJudgeMoney() {
        return judgeMoney;
    }

    public void setJudgeMoney(BigDecimal judgeMoney) {
        this.judgeMoney = judgeMoney;
    }

    public Date getOff_shelf_time() {
        return off_shelf_time;
    }

    public void setOff_shelf_time(Date off_shelf_time) {
        this.off_shelf_time = off_shelf_time;
    }

    public Date getOn_shelf_time() {
        return on_shelf_time;
    }

    public void setOn_shelf_time(Date on_shelf_time) {
        this.on_shelf_time = on_shelf_time;
    }

    public Integer getProduct_id() {
        return product_id;
    }

    public void setProduct_id(Integer product_id) {
        this.product_id = product_id;
    }

    public Date getFirst_up_time() {
        return first_up_time;
    }

    public void setFirst_up_time(Date first_up_time) {
        this.first_up_time = first_up_time;
    }

    public Integer getMiles() {
        return miles;
    }

    public void setMiles(Integer miles) {
        this.miles = miles;
    }

    public BigDecimal getMiniprice() {
        return miniprice;
    }

    public void setMiniprice(BigDecimal miniprice) {
        this.miniprice = miniprice;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String  getIndentState() {
        return indentState;
    }

    public void setIndentState(String indentState) {
        this.indentState = indentState;
    }

    public Integer getBrowse_num_times() {
        return browse_num_times;
    }

    public void setBrowse_num_times(Integer browse_num_times) {
        this.browse_num_times = browse_num_times;
    }

    public Integer getTel_num_times() {
        return tel_num_times;
    }

    public void setTel_num_times(Integer tel_num_times) {
        this.tel_num_times = tel_num_times;
    }

    public Integer getSale_days() {
        return sale_days;
    }

    public void setSale_days(Integer sale_days) {
        this.sale_days = sale_days;
    }

    public String getC_brand() {
        return c_brand;
    }

    public void setC_brand(String c_brand) {
        this.c_brand = c_brand;
    }

    public String getC_model() {
        return c_model;
    }

    public void setC_model(String c_model) {
        this.c_model = c_model;
    }

    public String getC_type() {
        return c_type;
    }

    public void setC_type(String c_type) {
        this.c_type = c_type;
    }

    public String getPic_path() {
        return pic_path;
    }

    public void setPic_path(String pic_path) {
        this.pic_path = pic_path;
    }
}
