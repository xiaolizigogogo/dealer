package com.utonw.dealer.api.dto;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by SEELE on 2017/4/29.
 */
public class BankCardAndMerchantDTO implements Serializable {

    private static final long serialVersionUID = 1L;

    private String id;

    /**
     * 经销商 ID
     */
    private Long acountId;

    /**
     *
     */
    private String cardholder;

    /**
     * 银行名
     */
    private String bankname;

    /**
     *  银行卡类型
     */
    private String cardtype;

    /**
     * 银行卡号
     */
    private String banknumber;

    /**
     * 添加时间
     */
    private Date createddata;

    /**
     * 更新时间
     */
    private Date updatetime;

    /**
     * 1：绑定放款银行卡，2：绑定还款银行卡
     */
    private Integer cardstate;
    /**
     * 更新人
     */
    private  Long  updateby;

    private Long meracountid;

    private String merchantName;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Long getAcountId() {
        return acountId;
    }

    public void setAcountId(Long acountId) {
        this.acountId = acountId;
    }

    public String getCardholder() {
        return cardholder;
    }

    public void setCardholder(String cardholder) {
        this.cardholder = cardholder;
    }

    public String getBankname() {
        return bankname;
    }

    public void setBankname(String bankname) {
        this.bankname = bankname;
    }

    public String getCardtype() {
        return cardtype;
    }

    public void setCardtype(String cardtype) {
        this.cardtype = cardtype;
    }

    public String getBanknumber() {
        return banknumber;
    }

    public void setBanknumber(String banknumber) {
        this.banknumber = banknumber;
    }

    public Date getCreateddata() {
        return createddata;
    }

    public void setCreateddata(Date createddata) {
        this.createddata = createddata;
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }

    public Integer getCardstate() {
        return cardstate;
    }

    public void setCardstate(Integer cardstate) {
        this.cardstate = cardstate;
    }

    public Long getUpdateby() {
        return updateby;
    }

    public void setUpdateby(Long updateby) {
        this.updateby = updateby;
    }

    public Long getMeracountid() {
        return meracountid;
    }

    public void setMeracountid(Long meracountid) {
        this.meracountid = meracountid;
    }

    public String getMerchantName() {
        return merchantName;
    }

    public void setMerchantName(String merchantName) {
        this.merchantName = merchantName;
    }
}
