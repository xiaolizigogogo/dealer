package com.utonw.dealer.api.enums;

/**
 * Created by SEELE on 2017/5/12.
 */
public enum  AuditContracEnum {

   financingContract("车商融资贷款合同",1),//车商融资贷款合同
    guaranteeContract("联保合同",2),//联保合同
    exhibitionContract("展厅转租与APP合同",3),//展厅转租与APP合同
    authorizationContract("金融专员授权证书",4),//金融专员授权证书
    CameraPicture("摄像头",5),//摄像头
    creditInvestigation("征信查询授权书",6),//摄像头
    singlesDeclaration("法人单身声明",7),//摄像头
    ;
    String message;
    int code;
    AuditContracEnum(String message,int code){
        this.code=code;
        this.message=message;
    }
    public String message(){
        return message;
    }
}
