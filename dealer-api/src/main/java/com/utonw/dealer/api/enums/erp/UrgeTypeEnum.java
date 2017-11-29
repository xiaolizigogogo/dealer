package com.utonw.dealer.api.enums.erp;


/**
 * 催收方式枚举
 * @author jml
 *
 *
 */
public enum UrgeTypeEnum implements EnumBase{
	telurge("电话催收"),
	
	smsurge("短信催收"),
	;
	String message;
	UrgeTypeEnum(String message){
		this.message=message;
	}
	@Override
	public String message() {
		// TODO Auto-generated method stub
		return message;
	}
	@Override
	public Number value() {
		// TODO Auto-generated method stub
		return null;
	}
	
}
