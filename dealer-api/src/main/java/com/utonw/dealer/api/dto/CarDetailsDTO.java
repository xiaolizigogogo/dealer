package com.utonw.dealer.api.dto;

import java.io.Serializable;

/**
 * Created by SEELE on 2017/5/24.
 */
public class CarDetailsDTO implements Serializable{
    private String c_brand;
    private String c_type;
    private String c_model;
    private String province;
    private String miles;
    private String first_up_time;
    private String miniprice;
    private String price;
    private String systemAssess;
    private String buyprice;
    private String hostlingCost;
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

    public String getMiles() {
        return miles;
    }

    public void setMiles(String miles) {
        this.miles = miles;
    }

    public String getFirst_up_time() {
        return first_up_time;
    }

    public void setFirst_up_time(String first_up_time) {
        this.first_up_time = first_up_time;
    }

    public String getMiniprice() {
        return miniprice;
    }

    public void setMiniprice(String miniprice) {
        this.miniprice = miniprice;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getSystemAssess() {
        return systemAssess;
    }

    public void setSystemAssess(String systemAssess) {
        this.systemAssess = systemAssess;
    }

    public String getBuyprice() {
        return buyprice;
    }

    public void setBuyprice(String buyprice) {
        this.buyprice = buyprice;
    }

    public String getHostlingCost() {
        return hostlingCost;
    }

    public void setHostlingCost(String hostlingCost) {
        this.hostlingCost = hostlingCost;
    }

    public String getReal_name() {
        return real_name;
    }

    public void setReal_name(String real_name) {
        this.real_name = real_name;
    }
}
