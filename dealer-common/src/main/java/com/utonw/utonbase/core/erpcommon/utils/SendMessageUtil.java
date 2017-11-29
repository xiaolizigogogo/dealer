package com.utonw.utonbase.core.erpcommon.utils;

import com.utonw.dealer.api.util.erp.Constants;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;


/**
 * 发送短信
 * @author Administrator
 *
 */
public class SendMessageUtil {
	static Logger logger = LoggerFactory.getLogger(SendMessageUtil.class);
	/**
	 * 
	 * @param sendType 内容类型  1审批 2通知客户类 3通知业务经理
	 * @param telephone 电话号码
	 * @param title 短信签名
	 * @param contentParam 短信内容所需要参数, touser:发送给的客户/用户姓名，orderid:订单编号，contractnum:合同编号
	 * @return
	 */
	public static String sendMessage(String sendType,String telephone,String title,Map<String,Object> contentParam,Map<String,String> corpinfo){
		try{
			String content = "【"+title+"】";
			switch (sendType) {
				case Constants.REVIEW_SMS:
					content += "您有订单" + contentParam.get("orderId") +"需要审批,任务节点:" + contentParam.get("taskName")  + "。";
					break;
				case Constants.URGE_REPAYMENT_CUSTOMER:
					content += "您本月有还款未还截止日" + contentParam.get("repayDate") + ",为免逾期罚息,请及时还款,如已还款请忽略"  + "。";
					break;
				case Constants.URGE_REPAYMENT_STUFF:
					content += "【还款提醒】您名下客户" + contentParam.get("customerName") + ",电话" + contentParam.get("telephone");
					content += ",有笔款项需催收,截止日" + contentParam.get("repayDate") + ",账单金额" + contentParam.get("repayMoney") + "。";
					break;
				case Constants.USER_DEFINED:
					content = contentParam.get("content").toString();
					break;
				case Constants.OVERDUE_REMIND_CUSTOMER:
					content += "您本月有还款未还,截止日" + contentParam.get("repayDate") + ",目前已经处于逾期状态,请及时还款,如已还款请忽略"  + "。";
					break;
				case Constants.OVERDUE_REMIND_STUFF:
					content += "【逾期提醒】您名下客户" + contentParam.get("customerName") + ",电话" + contentParam.get("telephone");
					content += ",有笔款项已经处于逾期状态,截止日" + contentParam.get("repayDate") + ",逾期金额" + contentParam.get("repayMoney") + "。";
					break;
				case Constants.JUDEGMENT_NOTIFY_SRVMANAGER:
					content += "您的客户".concat(contentParam.get("customername").toString())
							.concat("已经审批通过，金额")
							.concat(Float.toString(Float.parseFloat((contentParam.get("loanmoney").toString()))/10000))
							.concat("万元，请您知悉。");
					break;
				case Constants.JUDEGMENT_NOTIFY_CUSTOMER:
					content += "您的申请已经通过，审批金额".concat(Float.toString(Float.parseFloat((contentParam.get("loanmoney").toString()))/10000))
							.concat("万元，请您知悉。");
					break;
				case Constants.LEND_NOTIFY_SRVMANAGER:
					content += "您的客户".concat(contentParam.get("customername").toString())
							.concat("已经成功放款，金额")
							.concat(Float.toString(Float.parseFloat((contentParam.get("loanmoney").toString()))/10000))
							.concat("万元，还款日为每月15日，首期应还").concat(contentParam.get("capitalInterest").toString()).concat("，请您知悉。");
					break;
				case Constants.LEND_NOTIFY_CUSTOMER:
					content += "您已经收到金额".concat(Float.toString(Float.parseFloat((contentParam.get("loanmoney").toString()))/10000))
							.concat("万元，请您知悉。");
					break;
				case Constants.LIMITCREDITPERCENT:
					content += "目前公司的授信额度即将达到上限，请与总公司协商调整授信额度";
				default:

			}
			String corpId = corpinfo.get("CorpID");
			String password = corpinfo.get("Pwd");

			String parm = "CorpID="+corpId+"&Pwd="+password+"&Mobile="+telephone+"&Content=" + URLEncoder.encode(content, "UTF-8");

			URL url = new URL("http://101.200.29.88:8082/SendMT/SendMessage");
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setDoOutput(true);
			connection.setDoInput(true);
			connection.setRequestMethod("POST");
			connection.setUseCaches(false);
			connection.setInstanceFollowRedirects(true);
			connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			
			connection.connect();

			// POST请求
			DataOutputStream out = new DataOutputStream(connection.getOutputStream());
			
			out.writeBytes(parm.toString());
			out.flush();
			out.close();
			//追加发送SMS信息的log
			String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
			logger.debug("Send Sms Message to ["+ telephone + "] at time ["+time+"]");

			// 读取响应
			BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			String lines;
			StringBuffer sb = new StringBuffer("");
			while ((lines = reader.readLine()) != null) {
				lines = new String(lines.getBytes(), "utf-8");
				sb.append(lines);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "";
	} 
	
	public static void main(String[] args){
		Map<String,Object> map = new HashMap<>();
		map.put("orderId", "123123123123");
		map.put("taskName", "逾期处理");
		//System.out.println(sendMessage(1,"15140324874","e车圈",map));
	}	
}
