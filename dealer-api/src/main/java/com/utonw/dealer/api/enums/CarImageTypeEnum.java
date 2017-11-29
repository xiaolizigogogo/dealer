package com.utonw.dealer.api.enums;

/**
 * Created by SEELE on 2017/5/9.
 */
public enum CarImageTypeEnum {
    picture("大照",1),
    drivingLicense("行驶证",2),
    identityCard("原车主身份证",3),
    insurance("保险单",4),
    primaryPicUrl("现车照片",5),
    maintenance("4s维保记录",6),
    collectContract("收车合同",7),
    vehicleTradingContract("车辆交易合同",8),
    obd("OBD",9),
    obdBinding("OBD绑定",10),
    steeringWheel("VIN码照片",11),
    rfid("RFID",12),
    licensePlate("车牌照",13),
    rfidvin("rfidVin码照片",14),
    afterPicture("过户后车辆大照",15),
    afterDrivingLicense("过户后行驶证",16),
    afterLicensePlate("过户后车牌号",17),
    ;
    String message;
    int code;
    CarImageTypeEnum(String message,int code){
        this.code=code;
        this.message=message;
    }
    public String message(){
        return message;
    }
    public int code(){
        return code;
    }
}
