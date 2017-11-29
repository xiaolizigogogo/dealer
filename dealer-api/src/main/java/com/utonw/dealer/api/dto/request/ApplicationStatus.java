package com.utonw.dealer.api.dto.request;

import java.io.Serializable;

/**
 * Created by SEELE on 2017/5/27.
 */
public class ApplicationStatus implements Serializable{
    private static final long serialVersionUID = 4228428760211579287L;
    private String acountId;
    private String  verifyStatus;

    public String getAcountId() {
        return acountId;
    }

    public void setAcountId(String acountId) {
        this.acountId = acountId;
    }

    public String getVerifyStatus() {
        return verifyStatus;
    }

    public void setVerifyStatus(String verifyStatus) {
        this.verifyStatus = verifyStatus;
    }
}
