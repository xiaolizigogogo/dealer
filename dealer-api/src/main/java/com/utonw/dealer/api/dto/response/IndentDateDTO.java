package com.utonw.dealer.api.dto.response;

import java.io.Serializable;

/**
 * Created by SEELE on 2017/6/1.
 */
public class IndentDateDTO implements Serializable {
    private static final long serialVersionUID = 5535168292010584248L;
    private String orderId;
    private String date;

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
}
