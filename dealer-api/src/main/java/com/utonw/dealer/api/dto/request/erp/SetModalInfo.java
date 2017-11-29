package com.utonw.dealer.api.dto.request.erp;

import java.math.BigDecimal;

/**
 * Created by SEELE on 2017/9/14.
 */
public class SetModalInfo {
    private int dayRange;
    private BigDecimal rate;
    private int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getDayRange() {
        return dayRange;
    }

    public void setDayRange(int dayRange) {
        this.dayRange = dayRange;
    }

    public BigDecimal getRate() {
        return rate;
    }

    public void setRate(BigDecimal rate) {
        this.rate = rate;
    }
}
