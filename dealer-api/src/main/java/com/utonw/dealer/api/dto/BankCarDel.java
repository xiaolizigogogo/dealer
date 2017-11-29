package com.utonw.dealer.api.dto;

import java.io.Serializable;

/**
 * Created by SEELE on 2017/5/9.
 */
public class BankCarDel implements Serializable{
    private static final long serialVersionUID = -3896822985296549169L;
    private String acountId;
    private String cardState;

    public String getAcountId() {
        return acountId;
    }

    public void setAcountId(String acountId) {
        this.acountId = acountId;
    }

    public String getCardState() {
        return cardState;
    }

    public void setCardState(String cardState) {
        this.cardState = cardState;
    }
}
