package com.utonw.dealer.api.enums;

/**
 * Created by Administrator on 2017/7/17.
 */
//视频的取值code从0到负无穷
public enum AudioTypeEnum {
    scene("现场视频","scene"),;
    String message;
    String code;
    AudioTypeEnum(String message,String code){
        this.code=code;
        this.message=message;
    }
    public static String getName(String message) {
        for (AudioTypeEnum c : AudioTypeEnum.values()) {
            if (c.name().equals(message)){
                return c.message;
            }
        }
        return null;
    }
    public String message(){
        return message;
    }
    public String code(){
        return code;
    }
}
