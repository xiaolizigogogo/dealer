package com.utonw.dealer.api.dto.response;

import java.io.Serializable;

/**
 * Created by SEELE on 2017/8/21.
 */
public class CarEnclosure implements Serializable {
    private static final long serialVersionUID = 8060289663620056380L;
    private String arcPath;
    private String dlPath;
    private String policyPath;
    private String idcardPath;

    public String getArcPath() {
        return arcPath;
    }

    public void setArcPath(String arcPath) {
        this.arcPath = arcPath;
    }

    public String getDlPath() {
        return dlPath;
    }

    public void setDlPath(String dlPath) {
        this.dlPath = dlPath;
    }

    public String getPolicyPath() {
        return policyPath;
    }

    public void setPolicyPath(String policyPath) {
        this.policyPath = policyPath;
    }

    public String getIdcardPath() {
        return idcardPath;
    }

    public void setIdcardPath(String idcardPath) {
        this.idcardPath = idcardPath;
    }
}
