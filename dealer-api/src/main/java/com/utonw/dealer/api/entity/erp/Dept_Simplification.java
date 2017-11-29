package com.utonw.dealer.api.entity.erp;


import java.io.Serializable;

public class Dept_Simplification implements Serializable {

    private static final long serialVersionUID = 2401260332041971845L;
    /**
     * 所属公司ID
     */
    private Integer companyId;
    
    /**
     * 部门名称
     */
     private String name;

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Integer companyId) {
        this.companyId = companyId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

   

}