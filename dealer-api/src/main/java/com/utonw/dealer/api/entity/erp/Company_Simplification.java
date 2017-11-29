package com.utonw.dealer.api.entity.erp;


import java.io.Serializable;

public class Company_Simplification implements Serializable {

    private static final long serialVersionUID = 823891566417065552L;
    /**
     * 分公司ID
     */
    private Integer id;
    
    /**
     * 分公司名称
     */
     private String name;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}