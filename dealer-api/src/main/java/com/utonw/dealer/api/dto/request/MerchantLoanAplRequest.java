package com.utonw.dealer.api.dto.request;

import java.io.Serializable;

/**
 * Created by WANGYJ on 2017/5/9.
 */
public class MerchantLoanAplRequest implements Serializable {
    private static final long serialVersionUID = 7262111638811203683L;
    //登录token
    private String token;
    //订单Id
    private String indentId;

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public String getIndentId() {
        return indentId;
    }

    public void setIndentId(String indentId) {
        this.indentId = indentId;
    }
}
