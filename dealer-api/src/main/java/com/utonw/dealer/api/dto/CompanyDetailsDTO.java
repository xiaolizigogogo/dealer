package com.utonw.dealer.api.dto;

import java.io.Serializable;

/**
 * Created by SEELE on 2017/5/12.
 */
public class CompanyDetailsDTO implements Serializable{
    private static final long serialVersionUID = 1985204857774003865L;
    private String indentId;
    private String acountId;

    public String getIndentId() {
        return indentId;
    }

    public void setIndentId(String indentId) {
        this.indentId = indentId;
    }

    public String getAcountId() {
        return acountId;
    }

    public void setAcountId(String acountId) {
        this.acountId = acountId;
    }
}
