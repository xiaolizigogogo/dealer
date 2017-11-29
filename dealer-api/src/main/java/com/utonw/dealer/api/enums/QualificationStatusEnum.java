package com.utonw.dealer.api.enums;

/**
 * Created by WANGYJ on 2017/5/10.
 */
public enum QualificationStatusEnum {
    pass("审核通过",1),
    nopass("审核未通过",2),
    notreview("未审核",3)
    ;
    String status;
    int code;
    QualificationStatusEnum(String status,int code){
        this.status = status;
        this.code = code;
    }
    public static int getCodeByStatus(String status) {
        for (QualificationStatusEnum c : QualificationStatusEnum.values()) {
            if (c.getStatus().equals(status)) {
                return c.code;
            }
        }
        return 0;
    }
    public static String getStatusByCode(int code) {
        for (QualificationStatusEnum c : QualificationStatusEnum.values()) {
            if (c.getCode()==code) {
                return c.status;
            }
        }
        return null;
    }
    String getStatus(){
        return status;
    }
    int getCode(){
        return code;
    }
}
