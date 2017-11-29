package com.utonw.utonbase.core.erpcommon.utils;

import java.math.BigDecimal;

/**
 * web常量
 */
public abstract class Constants {

    public static final String res = "res";
    public static final String msg = "msg";
    public static final String SUCCESS = "0000";//成功
    public static final String FAILURE = "9999";//失败
    public static final String OVERLIMITPERCENT = "4444";//超过授信额度
    public static final String InterestRatesBefore = "InterestRatesBefore";//先息后本
    public static final String AverageCapitalPlusInterest = "AverageCapitalPlusInterest";//等额本息
    
     /*****                    还款方式追加 wangyj 2016.02.23               ******/
    public static final String Flexiblerepaymentv2 = "flexiblerepaymentv2";                 //灵活还款
    public static final String AveragePrincipalreduceinterest = "averagePrincipalreduceinterest";       //等本减息
    public static final String AveragePrincipalzerointerestrent = "averagePrincipalzerointerestrent";    //等本零息（活车）
    public static final String IntrestbeforePrincipaltransfer = "intrestbeforePrincipaltransfer";        //先息后本（死车）
    public static final String IntrestbeforePrincipalrent = "intrestbeforePrincipalrent";       //先息后本 活车
       
    public static final Integer ADMIN = 1;
    public static final String SPT = "/"; //路径分隔符
    public static final String AUTH_USER = "auth_user";//登陆用户Session标识
    public static final String DOWNLOAD_FLAG = "0101";//下载标志
    public static final String USERUNDERLING_STASTISTIC = "0103";//统计标志

    /** 缓存 */
    public static final String SYS_MODULE_CACHE = "sys_module_cache";//菜单缓存名称
    public static final String USER_MODULE = "UserModule";//用户菜单
    public static final String LIC_CACHE = "sys_lic_cache";

    /** 客户注册表状态 */
    public static final String REGISTER_STATUS_NEW = "new";//新建
    public static final String REGISTER_STATUS_DONE = "done";//完成

    /** WEB_ROOT */
    public static String PROJECT_WEB_ROOT = "http://www.maiqianweng.com";
    public static final String LOAN_ATTACHMENT_SMALL_FILEUPLOAD_PATH="LOAN_ATTACHMENT_SMALL_FILEUPLOAD_PATH";
    /** 借款附件上传地址 */
    public static final String LOAN_ATTACHMENT_FILEUPLOAD_PATH = "LOAN_ATTACHMENT_FILEUPLOAD_PATH";
    /** 等额本溪还款方式管理费率 */
    public static final String AVERAGE_CAPITAL_PLUS_INTEREST_MANAGE_FEE = "AVERAGE_CAPITAL_PLUS_INTEREST_MANAGE_FEE";
    /** 先息后本还款方式管理费率 */
    public static final String INTEREST_RATES_BEFORE_MANAGE_FEE = "INTEREST_RATES_BEFORE_MANAGE_FEE";
    /** 自增借款ID */
    public static final String AUTO_INCREMENT_ID = "AUTO_INCREMENT_ID";
    /** 当前年月 */
    public static final String CURRENT_YEAR_MONTH = "CURRENT_YEAR_MONTH";
    /** GPS一次性收取费用 */
    public static final String GPS_ONCE_COST = "GPS_ONCE_COST";
    /** GPS按月一次性收取租金 */
    public static final String GPS_MONTH_RENT_COST = "GPS_MONTH_RENT_COST";
    /** 续借 */
    public static final String GPS_MONTH_RENT_COST_CONTINUE = "GPS_MONTH_RENT_COST_CONTINUE";
    /** 域名路径 */
    public static final String DOMAIN_SETTIGS = "DOMAIN_SETTIGS";
    /** 逾期的默认日罚息比率 */
    public static final String LOAN_OVERDUE_DAYLYRATE = "LOAN_OVERDUE_DAYLYRATE";
    /** 用户登录前缀 */
    public static final String USER_LOGIN_PREFIX = "USER_LOGIN_PREFIX";


    ///*********车易宝还款方式追加 start ↓↓↓↓
    /** GPS按年收取费用 */
    public static final String GPS_YEAR_COST = "GPS_YEAR_COST";
    /** GPS按月收取费用 */
    public static final String GPS_MONTH_COST = "GPS_MONTH_COST";
    //办理费(押证含GPS)
    public static final String TRANSACT_GPS_COST_HEADYEAR = "TRANSACT_GPS_COST_HEADYEAR";
    //办理费续费(押证含GPS)
    public static final String TRANSACT_GPS_YEAR_COST = "TRANSACT_GPS_YEAR_COST";
    //办理费(押车)
    public static final String TRANSACT_COST = "TRANSACT_COST";
    ///*********车易宝还款方式追加 end ↓↓↓↓

    /** 附件类型 */
    public static String IDCARD = "idCard";
    public static String VERIFICATION = "verification";
    public static String VEHICLELICENSE = "vehicleLicense";
    public static String REGISTRATIONCERTIFICATE = "registrationCertificate";
    public static String INSURANCEPOLICY = "insurancePolicy";
    public static String BUSINESSINSURANCEPOLICY = "businessInsurancePolicy";
    public static String FALSEKEY = "falseKey";
    public static String FAHRZEUGBESCHAFFUNG = "fahrzeugbeschaffung";

    /** ProcessDefinitionId && loan status */
    public static String VEHICLEASSESS = "vehicleAssess"; //车辆评估：
    public static String DEPARTLEADADUIT = "departLeadAduit"; //业务部门领导初审：
    public static String TRIALPHASE = "trialPhase"; //总部面审：
    public static String CALLBACK = "callBack"; //总部电话回访：
    public static String VISITECHECK = "visiteCheck"; //线下上门核实：
    public static String JUDGMENT = "judgment"; //总部贷款终审：
    public static String SIGNCONTRACT = "signContract"; //线下签订相关合同：
    public static String DATAREVIEW = "dataReview"; //总部资料复核：
    public static String REUPLOADINFORMATIN = "reuploadInformatin"; //资料或相关合同重新上传：
    public static String LENDED = "lended"; //借款出帐：
    public static String INSTOCK = "instock"; //车辆入库节点
    public static String MORTGAGE = "mortgage";  //抵押办理节点
    public static String RELOANREVIEW = "reloanReview"; //再贷Review
    public static String RELOANAPPROVE = "reloanApprove"; //再贷审核
    public static String HELPLOANREVIEW = "helploanReview"; //助贷Review
    public static String HELPLOANAPPROVE = "helploanApprove"; //助贷审核
    public static String LOAN_END = "end";//借款正常结清
    public static String LOAN_REJECTED = "rejected";// 借款评审不通过

    /** review result */
    public static final String PASSED = "passed";
    //未通过的情况下
    public static final String REJECTED = "rejected";
    public static final String CONCLUDEAGAIN = "concludeAgain";
    //押证情况下，从签订合同到抵押办理的trigger
    public static final String DRIVE_PLEDGE="drive_pledge";
    //押车的情况下，从鉴定合同到车辆抵押的办理
    public static final String VEHICLE_PLEDGE="vehicle_pledge";
    //按揭车的情况下
    public static final String BUY_LOAN = "buy_loan";
    //直贷的情况下
    public static final String LOANDIRECT = "loandirect";

    /****** data access control level ******/
    public static final Integer ALLDATA = 4;
    public static final Integer SINGLECOMPANYDATA =3;
    public static final Integer SELFDATA = 1;
    public static final Integer TEAMDTATA = 2;
    public static final Integer NODATA = 0;
    //最大的分公司ID，用于统计是对集团公司数据进行标识
    public static final Integer MAX_COMPANY_ID = 1000;
    //集团公司ID
    public static final Integer GROUP_COMPANY_ID = 3;
    //每页显示的最大的list行数
    public static final Integer MAX_LINES_PERPAGE = 15;
    //工作平台每页显示List的最大行数
    public static final Integer MAX_LINES_PERPAGE_WORKSPACE = 6;

    //定义短信种别
    //审批提醒短信
    public static final String REVIEW_SMS = "review_sms";
    //催收短信（发送给客户）
    public static final String URGE_REPAYMENT_CUSTOMER = "urge_repayment_customer";
    //催收短信（发送给用户)
    public static final String URGE_REPAYMENT_STUFF = "urge_repayment_stuff";
    //自定义编辑短信
    public static final String USER_DEFINED = "user_defined";
    //逾期短信(发送给客户)
    public static final String OVERDUE_REMIND_CUSTOMER = "overdue_remind_customer";
    //逾期短息(发送给用户)
    public static final String OVERDUE_REMIND_STUFF = "overdue_remind_stuff";
    //终审环节，给业务经理发送短信
    public static final String JUDEGMENT_NOTIFY_SRVMANAGER = "judegment_notify_srvmanager";
    //终审环节，给客户发短信
    public static final String JUDEGMENT_NOTIFY_CUSTOMER = "judegment_notify_customer";
    //放款环节给业务经理发送短信
    public static final String LEND_NOTIFY_SRVMANAGER = "lend_notify_srvmanager";
    //放款环节给客户发送短信
    public static final String LEND_NOTIFY_CUSTOMER = "lend_notify_customer";

    //贷款申请中，押证及押车的判断
    public static final String VEHICLEPLEDGE = "vehiclePledge";
    public static final String DRIVEPLEDGE = "drivePledge";
    //资金源提供的资金贷款类型
    public static final String RELOAN = "reloan";
    public static final String HELPLOAN = "helploan";
    //返回上一个节点
    public static final String RETURN = "return";
    //还款计划的packge定义
    public static final String REPAYPLAN_GENPACKAGE = "com.maiqianweng.common.product.impl";
    // 0
    public static final BigDecimal ZERO = new BigDecimal(0);
    // 超过授信额度发送短信
    public static final String LIMITCREDITPERCENT = "overLimitCreditPercent";
    // 金额0.00
    public static final BigDecimal MONEYZERO = new BigDecimal("0.00");
    // 车易宝 利息,综合管理费利率
    public static final BigDecimal RATE = new BigDecimal("0.01");
    // 车易宝 罚息利率
    public static final BigDecimal OVERDUERATE = new BigDecimal("0.005");
    // 车易宝 违约金利率(未超半期)
    public static final BigDecimal PENALTYRATE = new BigDecimal("0.06");
    // 车易宝 违约金利率(超半期)
    public static final BigDecimal PENALTYRATEHALF = new BigDecimal("0.08");
    // 车易宝 天数
    public static final BigDecimal MONTHDAYS = new BigDecimal("30");
    //当前时间
    public static final String CURRENT_TIME = "current_time";

}
