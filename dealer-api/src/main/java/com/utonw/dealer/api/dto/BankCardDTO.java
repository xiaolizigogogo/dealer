package com.utonw.dealer.api.dto;

import java.io.Serializable;

/**
 * Created by SEELE on 2017/4/29.
 */
public class BankCardDTO implements Serializable {
    private static final long serialVersionUID = 4266440778387358501L;
    private String  acountId;//经销商ID
    private String bank_name; //银行名
    private String cardholder;//持卡人
    private String bank_number;//银行卡号
    private String card_type;
    private String card_state;//绑定银行卡种类


    public String getCard_type() {
        return card_type;
    }

    public void setCard_type(String card_type) {
        this.card_type = card_type;
    }

    public String getCard_state() {
        return card_state;
    }

    public void setCard_state(String card_state) {
        this.card_state = card_state;
    }

    public String getAcountId() {
        return acountId;
    }

    public void setAcountId(String acountId) {
        this.acountId = acountId;
    }

    public String getBank_name() {
        return bank_name;
    }

    public void setBank_name(String bank_name) {
        this.bank_name = bank_name;
    }

    public String getCardholder() {
        return cardholder;
    }

    public void setCardholder(String cardholder) {
        this.cardholder = cardholder;
    }

    public String getBank_number() {
        return bank_number;
    }

    public void setBank_number(String bank_number) {
        this.bank_number = bank_number;
    }

}
