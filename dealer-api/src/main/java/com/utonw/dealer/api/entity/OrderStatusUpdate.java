package com.utonw.dealer.api.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by SEELE on 2017/5/26.
 */
public class OrderStatusUpdate implements Serializable{
    private static final long serialVersionUID = -8499371317978459859L;
    private     String indentState;
    private Date updatetime;

    public String getIndentState() {
        return indentState;
    }

    public void setIndentState(String indentState) {
        this.indentState = indentState;
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }
}
