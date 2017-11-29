package com.utonw.dealer.api.dto;

import java.io.Serializable;

/**
 * Created by SEELE on 2017/5/4.
 */
public class ContactPersonDTO implements Serializable {
    private static final long serialVersionUID = -4362398956275750378L;
    private  String positionNmane;//联络姓名
    private  String positionPhone;//电话
    private String positionFo;//下标

    public String getPositionNmane() {
        return positionNmane;
    }

    public void setPositionNmane(String positionNmane) {
        this.positionNmane = positionNmane;
    }

    public String getPositionPhone() {
        return positionPhone;
    }

    public void setPositionPhone(String positionPhone) {
        this.positionPhone = positionPhone;
    }

    public String getPositionFo() {
        return positionFo;
    }

    public void setPositionFo(String positionFo) {
        this.positionFo = positionFo;
    }
}
