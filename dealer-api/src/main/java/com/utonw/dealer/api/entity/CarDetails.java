package com.utonw.dealer.api.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by SEELE on 2017/5/12.
 */
public class CarDetails implements Serializable{
    private static final long serialVersionUID = -554883497727118638L;
    private String c_brand;
    private String c_type;
    private String c_model;
    private String province;
    private Integer miles;
    private Date first_up_time;
    private BigDecimal miniprice;
    private BigDecimal price;
    private BigDecimal systemAssess;
    private BigDecimal buyprice;
    private BigDecimal hostlingCost;
    private String real_name;

    public String getC_brand() {
        return c_brand;
    }

    public void setC_brand(String c_brand) {
        this.c_brand = c_brand;
    }

    public String getC_type() {
        return c_type;
    }

    public void setC_type(String c_type) {
        this.c_type = c_type;
    }

    public String getC_model() {
        return c_model;
    }

    public void setC_model(String c_model) {
        this.c_model = c_model;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public Integer getMiles() {
        return miles;
    }

    public void setMiles(Integer miles) {
        this.miles = miles;
    }

    public Date getFirst_up_time() {
        return first_up_time;
    }

    public void setFirst_up_time(Date first_up_time) {
        this.first_up_time = first_up_time;
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

    public BigDecimal getSystemAssess() {
        return systemAssess;
    }

    public void setSystemAssess(BigDecimal systemAssess) {
        this.systemAssess = systemAssess;
    }

    public BigDecimal getBuyprice() {
        return buyprice;
    }

    public void setBuyprice(BigDecimal buyprice) {
        this.buyprice = buyprice;
    }

    public BigDecimal getHostlingCost() {
        return hostlingCost;
    }

    public void setHostlingCost(BigDecimal hostlingCost) {
        this.hostlingCost = hostlingCost;
    }

    public String getReal_name() {
        return real_name;
    }

    public void setReal_name(String real_name) {
        this.real_name = real_name;
    }
}
