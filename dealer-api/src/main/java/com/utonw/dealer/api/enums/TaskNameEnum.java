package com.utonw.dealer.api.enums;

/**
 * Created by WANGYJ on 2017/5/8.
 */
public enum TaskNameEnum {
    infocheck("待资质审核","infoCheck"),
    ;
    String message;
    String code;
    TaskNameEnum(String message,String code){
        this.code=code;
        this.message=message;
    }
    public static String getName(String code) {
        for (TaskNameEnum c : TaskNameEnum.values()) {
            if (c.getCode().equals(code)) {
                return c.message;
            }
        }
        return null;
    }

    public String getMessage(){
        return message;
    }
    public String getCode(){
        return code;
    }
}
