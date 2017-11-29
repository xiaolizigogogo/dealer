package com.utonw.dealer.api.dto;

import java.io.Serializable;

/**
 * Created by SEELE on 2017/4/24.
 */
public class IdentityCard implements Serializable{
    private static final long serialVersionUID = -8775649777656707125L;
    private String file_title;
    private String contract_url;

    public String getFile_title() {
        return file_title;
    }

    public void setFile_title(String file_title) {
        this.file_title = file_title;
    }

    public String getContract_url() {
        return contract_url;
    }

    public void setContract_url(String contract_url) {
        this.contract_url = contract_url;
    }
}
