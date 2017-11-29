package com.utonw.dealer.api.model;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
public class BaseResult {
	private Object data;
	private String retCode;
	private String retMsg;
	
	public BaseResult(Object data, String retCode,String retMsg) {
	 Logger logger = LoggerFactory.getLogger(BaseResult.class);
		this.data = data;
		this.retCode = retCode;
		this.retMsg = retMsg;
		logger.info("retCode："+retCode);
		logger.info("retMsg："+retMsg);
	}
	
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
	public String getRetCode() {
		return retCode;
	}
	public void setRetCode(String retCode) {
		this.retCode = retCode;
	}
	public String getRetMsg() {
		return retMsg;
	}
	public void setRetMsg(String retMsg) {
		this.retMsg = retMsg;
	}


}
