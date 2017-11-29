package com.utonw.dealer.api.enums;

/**
 * Created by WANGYJ on 2017/5/10.
 */
public enum ContractTypeEnum {
    plugeContract("抵押合同",1),
    ;
    String typename;
    int code;
    ContractTypeEnum(String typename,int code){
        this.typename = typename;
        this.code = code;
    }
    public static int getCodeByTypeName(String typename) {
        for (ContractTypeEnum c : ContractTypeEnum.values()) {
            if (c.getTypeName().equals(typename)) {
                return c.code;
            }
        }
        return 0;
    }
    public static String getTypeNameByCode(int code) {
        for (ContractTypeEnum c : ContractTypeEnum.values()) {
            if (c.getCode() == code) {
                return c.typename;
            }
        }
        return null;
    }
    String getTypeName(){
        return typename;
    }
    int getCode(){
        return code;
    }
}
