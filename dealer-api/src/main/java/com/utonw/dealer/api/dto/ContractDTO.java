package com.utonw.dealer.api.dto;

import com.utonw.dealer.api.enums.AuditContracEnum;

import java.io.Serializable;

/**
 * Created by SEELE on 2017/4/27.
 */
public class ContractDTO implements Serializable{
    private static final long serialVersionUID = 3499738280008724217L;
    private AuditContracEnum contract_type;//合同名
    private String contract_path;//合同路径
    private String imageurl;    //缩略图地址，该值是后台配置的，暂时先放到数据库固定
    private String contractNum;

    public String getContractNum() {
        return contractNum;
    }

    public void setContractNum(String contractNum) {
        this.contractNum = contractNum;
    }

    public String getContractTypeName() {
        return contract_type.message();
    }


    public AuditContracEnum getContract_type() {
        return contract_type;
    }

    public void setContract_type(AuditContracEnum contract_type) {
        this.contract_type = contract_type;
    }

    public String getContract_path() {
        return contract_path;
    }

    public void setContract_path(String contract_path) {
        this.contract_path = contract_path;
    }

    public String getImageurl() {
        return imageurl;
    }

    public void setImageurl(String imageurl) {
        this.imageurl = imageurl;
    }
}
