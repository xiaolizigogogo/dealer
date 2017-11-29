package com.utonw.dealer.api.enums;

/**
 * Created by SEELE on 2017/5/4.
 */
public enum ImageTypeEnum {

    idCardUrls("夫妻双方身份证",1),
    widdingOrDiv("结婚证",2),
    bookletUrls("户口",3),
    stateUrls("房产证或购房合同",4),
    justetterUrls("征信",5),
    shopCardUrls("营业执照",6),
    legalCardUrls("法人身份证",7),
    houseUrls("购房合同",8),
    sitePicUrls("场地照片",9),
    waterUrls("6个月流水",10),
    staffUrls("员工身份证 和联系方式",11),
    doorPicUrls("门头照片",12),
    exhibitionPicUrls("展厅内照片",13),
    backgroundPicUrls("背景墙照片",14),
    capitalVerification("验资报告复印件（正反面)",15),
    frgdID("法人及股东身份证复印件（正反面）",16),
    zcxzHardCopy("公司章程及修正案复印件",17),
    gcSynopsis("各高层管理人员简介",18),
    yearReportForms("近三年财务年报表（附2016年底财务科目明细）",19),
    monthReportForms("2017年5/6/7月财务月报和7月份财报科目明细",20),
    monthAchievement("月业绩情况总汇表2016年至今",21),
    loanBankFlow("放款银行流水（2016年至2017年7月）",22),
    receivingBankFlow("收款银行流水（2016年至2017年7月）",23),
    receivedPayments("资产处置台账数据及处置的款项的回款账户及流水",24),
    enterpriseStream("企业主要对公流水（近一年，如与收款及放款银行账户重复，无需提供）",25),
    customerCase("客户案例",26),
    mainBusiness("主营业务操作流程",27),
    manageProcedure("风控管理及流程",28),
    vehicleEvaluationCriteria("车辆评估标准",29),
    partner("业务合作方准入要求（如有下游合作车商或加盟商）",30),
    productMix("产品大纲",31),
    managementSystem("车库管理制度",32),
    businessLedger("业务台账（2016年至今）",33),
    organizationCode("组织机构代码证复印件",34),
    companyProfile("公司简介",35),
    taxRegistration("税务登记证复印件",36),
    actualControllerCreditReport("实际控制人信用报告",37),
    enterpriseCreditReport("企业信用报告",38),
    corporateProfitModel("企业盈利模式",39),
    assetProof("法人及股东相关资产证明",40),
    ;
    String message;
    int code;
    ImageTypeEnum(String message,int code){
        this.code=code;
        this.message=message;
    }
    public static String getName(String message) {
        for (ImageTypeEnum c : ImageTypeEnum.values()) {
            if (c.name().equals(message)) {
                return c.message;
            }
        }
        return null;
    }
    public String message(){
        return message;
    }
    public int code(){
        return code;
    }
}
