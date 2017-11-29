package com.utonw.dealer.api.dto;

import java.io.Serializable;

/**
 * Created by SEELE on 2017/6/27.
 */
public class CarSumDTO implements Serializable {
    private static final long serialVersionUID = 4235880923281185966L;
    private Integer listing1;
    private Integer listing2;
    private Integer listing3;

    public Integer getListing1() {
        return listing1;
    }

    public void setListing1(Integer listing1) {
        this.listing1 = listing1;
    }

    public Integer getListing2() {
        return listing2;
    }

    public void setListing2(Integer listing2) {
        this.listing2 = listing2;
    }

    public Integer getListing3() {
        return listing3;
    }

    public void setListing3(Integer listing3) {
        this.listing3 = listing3;
    }
}
