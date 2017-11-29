package com.utonw.dealer.api.entity.erp;

import java.io.Serializable;

public class CompanyWithParentSubName implements Serializable {

    private static final long serialVersionUID = 2050839084393488776L;
    // 公司负责人姓名
    private String principal;

    // 公司负责人电话
    private String telephone;

    public String getPrincipal() { return principal; }

    public void setPrincipal(String principal) {
        this.principal = principal;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }
}