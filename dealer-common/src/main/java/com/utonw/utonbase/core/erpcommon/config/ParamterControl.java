package com.utonw.utonbase.core.erpcommon.config;

import java.io.InputStream;
import java.util.Properties;

/**
 * Created by Administrator on 2016/8/12.
 */
public class ParamterControl {
	public static Properties properties = null;
	private static InputStream inputStream = null;
	public static String FIXED_REPAY_DAY = null;
	public static String REPAYDAY_THRESHOLD = null;
	public static String ORDER_DEL = null;
	public static String FID = null;
	//LOGO文件保存的目录
	public static String FLOGODIR = null;
	public static String CUT_INTEREST = null;
	public static String FIRST_DIFFRENT = null;
	public static String RECEIVABLES_MESSAGES = null;
	public static String LOGIN_PROMPT = null;
	public static String RELOANANDHELPLOAN_DISPLAY = null;
	public static String SIMPLE_REPAYCOLLECTION = null;
	public static String COMPANY_CREDITLIMITANDPERCENTDIS = null;
	public static String REPEAT_LOGIN = null;
	public static String MESSAGE_WORKFLOWPROMPT = null;
	public static String TITLE_DISPLAY = null;
	public static String LOGO_DISPLAY = null;
	public static String COMPATIBLE_DISPLAY = null;
	public static String CONTRACT_DOWNLOAD_ENMU_CLASS = null;
	public static String PAGE_ATTACHMENT = null;
	public static String REVIEW_STAGES = null;
	public static String REPAYMENT_STAGES = null;
	public static String FINISH_STAGES = null;
	public static String TEMPORARY_DIR = null;
	public static String QINIU_TRACKER_SERVER_IP = null;
	public static String LINK_TPS_PRIVATEKEY = null;
	public static String REPAYMENT_OVERDUE_FIXED = null;
	public static String LINK_TPS_URL = null;
	static {
		// 初始化变量
		init();
	}
	public static void init(){
		try {
			properties = new Properties();
			// 加载配置文件
			inputStream = ParamterControl.class.getClassLoader().getResourceAsStream("config.properties");
			if (inputStream == null) {
				inputStream = Thread.currentThread().getContextClassLoader().getResourceAsStream("config.properties");
			}

			properties.load(inputStream);
			inputStream.close();

			//取得每月固定还款日期
			FIXED_REPAY_DAY = properties.getProperty("repay.fixedrepayday");
			REPAYDAY_THRESHOLD = properties.getProperty("repay.repaydaythreshold");
			//厂家信息
			FID = properties.getProperty("cust.fid");
			ORDER_DEL = properties.getProperty("order.del");
			//头息付款还是最后一期
			CUT_INTEREST = properties.getProperty("order.cutinterest");
			//第一期不同还是最后一期不同
			FIRST_DIFFRENT = properties.getProperty("repay.firstdifferent");
			//是否发送催收短信
			RECEIVABLES_MESSAGES = properties.getProperty("receivables.messages");
			//是否发送登陆提示短信
			LOGIN_PROMPT = properties.getProperty("login.prompt");
			//确定是否显示再助贷状态与贷前订单统计状态
			RELOANANDHELPLOAN_DISPLAY = properties.getProperty("reloanAndhelploan.display");
			//贷后是否是简单流程
			SIMPLE_REPAYCOLLECTION = properties.getProperty("repay.simple_repaycollection");
			//是否在分公司页面显示授信额度及提醒额度
			COMPANY_CREDITLIMITANDPERCENTDIS = properties.getProperty("company.creditLimitAndPercentDis");
			//是否允许重复登录
			REPEAT_LOGIN = properties.getProperty("repeat.login");
			//任务流转的时候，是否给相关人员发送短信
			MESSAGE_WORKFLOWPROMPT = properties.getProperty("message.workflowprompt");
			//标题显示爱车帮/车易宝
			TITLE_DISPLAY = new String(properties.getProperty("title.display").getBytes("ISO-8859-1"),"UTF-8");
			//logo显示爱车帮/车易宝
			LOGO_DISPLAY = new String(properties.getProperty("logo.display").getBytes("ISO-8859-1"),"UTF-8");
			//合同下载处理类名称
			CONTRACT_DOWNLOAD_ENMU_CLASS = properties.getProperty("class.contractdownlaodenmu");
			//附件文件的页面文件名称
			PAGE_ATTACHMENT = properties.getProperty("page.attachement");
			//取得贷前的阶段列表
			REVIEW_STAGES = properties.getProperty("stage.review");
			//取得的还款阶段列表
			REPAYMENT_STAGES = properties.getProperty("stage.repayment");
			//取得完结阶段列表
			FINISH_STAGES = properties.getProperty("stage.finish");
			LINK_TPS_PRIVATEKEY = properties.getProperty("link.tps.privatekey");
			REPAYMENT_OVERDUE_FIXED = properties.getProperty("repayment_overdue_fixed");
			LINK_TPS_URL = properties.getProperty("link.tps.url");
			if(LOGO_DISPLAY.equals("车易宝")){
				FLOGODIR = "cyb/";
			}else if(LOGO_DISPLAY.equals("爱车帮")){
				FLOGODIR = "aqb/";
			}else {
				FLOGODIR = "";
			}
			COMPATIBLE_DISPLAY = properties.getProperty("parentCompanyType.acb");
			TEMPORARY_DIR = properties.getProperty("temporary.dir");
			QINIU_TRACKER_SERVER_IP = properties.getProperty("qiniu.tracker.server.ip");
		} catch (Exception e) {
			e.printStackTrace();
			inputStream = null;
		}
	}
}
