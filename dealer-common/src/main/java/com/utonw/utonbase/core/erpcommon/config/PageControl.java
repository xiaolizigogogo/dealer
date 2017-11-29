package com.utonw.utonbase.core.erpcommon.config;

import java.io.InputStream;
import java.util.Properties;

/**
 * Created by Administrator on 2016/8/18.
 */
public class PageControl {
	public static Properties properties = null;
	private static InputStream inputStream = null;
	public static String ADD_LOAN_VIEW = null;
	public static String LOAN_LOANDETAIL2 = null;
	public static String LOAN_LOANDETAIL3 = null;
	public static String LOAN_VIEWORDERDETAIL = null;
	public static String LOAN_LOANCOUNTDETAIL = null;
	public static String LOAN_CONTRACTENCLOSURE=null;
	public static String LOAN_VEHICLEASSESS=null;
    public static String LOAN_LOANERINFO2 = null;
    public static String LOAN_INCOMELIST=null;
    public static String LOAN_LENDEDLOANINFOLIST= null;
    public static String LOAN_LOANINFOLIST=null;
	static {
		// 初始化变量
		init();
	}
	public static void init(){
		try {
			properties = new Properties();
			// 页面定制文件
			inputStream = PageControl.class.getClassLoader().getResourceAsStream("config.properties");
			if (inputStream == null) {
				inputStream = Thread.currentThread().getContextClassLoader().getResourceAsStream("config.properties");
			}

			properties.load(inputStream);
			inputStream.close();
			//查询公司ID
			String FID = properties.getProperty("cust.fid");
			//组成文件名称
			String filename = "page".concat(FID.trim()).concat(".properties");
			inputStream = PageControl.class.getClassLoader().getResourceAsStream(filename);
			if (inputStream == null) {
				inputStream = Thread.currentThread().getContextClassLoader().getResourceAsStream(filename);
			}
			properties.load(inputStream);
			inputStream.close();
			//新增贷款
			ADD_LOAN_VIEW = properties.getProperty("page.addloan");
			//贷前订单中使用的订单详情
			LOAN_LOANDETAIL2 = properties.getProperty("page.loandetail");
			//贷后订单中的订单详情
			LOAN_LOANDETAIL3 = properties.getProperty("page.loandetail3");
			//订单统计中的订单详情
			LOAN_VIEWORDERDETAIL = properties.getProperty("page.vieworderdetails");
			//历史订单中的订单详情
			LOAN_LOANCOUNTDETAIL = properties.getProperty("page.LoanCountDetails");
			//合同附件详情
			LOAN_CONTRACTENCLOSURE= properties.getProperty("page.contractEnclosure");
			//车辆评估
			LOAN_VEHICLEASSESS= properties.getProperty("page.vehicleAssess");
			//新增客户
			LOAN_LOANERINFO2 = properties.getProperty("page.loanerInfo2");
			//车贷收入详情
			LOAN_INCOMELIST=properties.getProperty("page.incomeList");
			//放款管理详情
			LOAN_LENDEDLOANINFOLIST=properties.getProperty("page.lendedLoanInfoList");
			//贷前订单详情
			LOAN_LOANINFOLIST=properties.getProperty("page.loanInfoList");
		} catch (Exception e) {
			e.printStackTrace();
			inputStream = null;
		}
	}
}
