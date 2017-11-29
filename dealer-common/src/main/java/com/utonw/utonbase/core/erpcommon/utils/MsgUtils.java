package com.utonw.utonbase.core.erpcommon.utils;

import com.utonw.dealer.api.util.erp.Constants;

import java.util.HashMap;
import java.util.Map;



public class MsgUtils {
	
	private Map<String, Object> rtMsg = new HashMap<String, Object>();


	public Map<String, Object> getRtMsg() {
		return rtMsg;
	}

	public void setRtMsg(Map<String, Object> rtMsg) {
		this.rtMsg = rtMsg;
	}


	public static Map<String, Object> getErrorMsgMap(String msg){
		Map<String, Object> cRtMsg = new HashMap<String, Object>();
		cRtMsg.put(Constants.msg, msg);
		cRtMsg.put(Constants.res, false);
		return cRtMsg;
	}
	
	public static Map<String, Object> getSuccessMsgMap(String msg){
		Map<String, Object> cRtMsg = new HashMap<String, Object>();
		cRtMsg.put(Constants.msg, msg);
		cRtMsg.put(Constants.res, true);
		return cRtMsg;
	}
	
	public static Map<String, Object> getSuccessMsgMap(String s, Object o){
		Map<String, Object> cRtMsg = new HashMap<String, Object>();
		cRtMsg.put(s, o);
		cRtMsg.put("res", true);
		return cRtMsg;
	}


	public static Map<String, Object> getSucMsgMap(String s, Object o){
		Map<String, Object> cRtMsg = new HashMap<String, Object>();
		cRtMsg.put(s, o);
		cRtMsg.put("retCode", 1);
		cRtMsg.put("message","成功");
		return cRtMsg;
	}


	public static Map<String, Object> getErrMsgMap(String msg){
		Map<String, Object> cRtMsg = new HashMap<String, Object>();
		cRtMsg.put("message", msg);
		cRtMsg.put("retCode", 0);
		return cRtMsg;
	}

}
 
