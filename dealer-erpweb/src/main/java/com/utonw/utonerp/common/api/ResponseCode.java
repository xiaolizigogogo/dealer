package com.utonw.utonerp.common.api;

/**
 * 统一的返回code
 * Created by Vic on 2015/12/13.
 */
public class ResponseCode {

    public static final String SUCCESS = "000000";
    public static final String SYS_ERROR = "000001";
    public static final String LOGIN_ERROR = "100001";
    public static final String NO_LOGIN = "100002";
    //参数体不能为空
    public static final String PARAM_EMPEY = "100003";
    //发送消息失败
    public static final String SMS_ERROR = "100002";
    //还款失败
    public static final String REPAY_ERROR = "100004";
    //还款催收失败
    public static final String URGE_REPAY_ERROR = "100005";
    //还款审核失败
    public static final String REPAY_REVIEW_ERROR = "100006";
    //借款展期续借审核失败
    public static final String CON_LOAN_REVIEW_ERROR = "100007";
}
