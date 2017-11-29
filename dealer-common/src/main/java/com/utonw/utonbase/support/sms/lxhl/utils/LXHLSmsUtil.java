/**
 * @Description: 领先互联短信共通方法 
 * @author YX  
 * @date 2017年8月15日下午2:33:19
 */
package com.utonw.utonbase.support.sms.lxhl.utils;


import com.utonw.utonbase.support.sms.DetailMessage.SmsMessage;
import com.utonw.utonbase.support.sms.lxhl.config.LXHLSmsConfigure;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

/**
 * @author YX
 * @date 2017年8月15日 下午2:33:19 
 */
public class LXHLSmsUtil {

	public static boolean sendSms(SmsMessage smsMessage, LXHLSmsConfigure lxhlSmsConfigure){
		
		boolean result = false;
		
		try {
			
			String corpId = lxhlSmsConfigure.getCorpID();
			String password = lxhlSmsConfigure.getPwd();
			
			String parm = "CorpID="+corpId+"&Pwd="+password+"&Mobile="+smsMessage.getMobile()+"&Content=" + URLEncoder.encode(smsMessage.getContent(), "UTF-8");

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
			
			// 读取响应
			BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			String lines;
			StringBuffer sb = new StringBuffer("");
			while ((lines = reader.readLine()) != null) {
				lines = new String(lines.getBytes(), "utf-8");
				sb.append(lines);
			}
			
			System.out.println("sb:" + sb.toString());
			result = true;
		} catch (Exception e) {
			
			e.printStackTrace();
			result = false;
		}
		
		return result;
	}
	
	public static void main(String[] args) {

	}
}
