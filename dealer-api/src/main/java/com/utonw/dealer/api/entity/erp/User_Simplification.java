package com.utonw.dealer.api.entity.erp;


import java.io.Serializable;

public class User_Simplification implements Serializable {

    private static final long serialVersionUID = -7542226727738602916L;
    /**
     * 所属公司ID
     */
    private String uuid;
    
    /**
     * 客户姓名
     */
     private String realName;

    
    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }
}