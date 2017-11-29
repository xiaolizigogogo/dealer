package com.utonw.dealer.api.entity.erp;

import java.io.Serializable;

/**
 * 首页显示属性javabean
 * Created by fuyung on 15-7-7.
 */
public class HomePageBean implements Serializable {

    private static final long serialVersionUID = 4389299192150757540L;
    private String yestdAddCustomer;
    private String yestdAddLoanCount;
    private String yestdAddLoanMoney;

    private String monthLoanCount;//本月出帐笔数

    private String monthLoanMoney;//本月放款金额

    public String getYestdAddCustomer() {
        return yestdAddCustomer;
    }

    public void setYestdAddCustomer(String yestdAddCustomer) {
        this.yestdAddCustomer = yestdAddCustomer;
    }

    public String getYestdAddLoanCount() {
        return yestdAddLoanCount;
    }

    public void setYestdAddLoanCount(String yestdAddLoanCount) {
        this.yestdAddLoanCount = yestdAddLoanCount;
    }

    public String getYestdAddLoanMoney() {
        return yestdAddLoanMoney;
    }

    public void setYestdAddLoanMoney(String yestdAddLoanMoney) {
        this.yestdAddLoanMoney = yestdAddLoanMoney;
    }

    public String getMonthLoanCount() {
        return monthLoanCount;
    }

    public void setMonthLoanCount(String monthLoanCount) {
        this.monthLoanCount = monthLoanCount;
    }

    public String getMonthLoanMoney() {
        return monthLoanMoney;
    }

    public void setMonthLoanMoney(String monthLoanMoney) {
        this.monthLoanMoney = monthLoanMoney;
    }


}