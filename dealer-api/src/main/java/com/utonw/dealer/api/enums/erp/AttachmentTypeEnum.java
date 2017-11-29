package com.utonw.dealer.api.enums.erp;

/**
 * 附件类型枚举
 * @author jml
 * AttachmentTypeEnum.java
 * 2016年9月26日
 */
public enum AttachmentTypeEnum implements EnumBase {
	USER_INFO("个人信息"),

	CAR_INFO("车辆类信息"),

	CONTRACT_INFO("合同类信息"),

	OTHER_INFO("其他类信息"),

	VIEDO_INFO("录音信息"),
	
	AUDIO_INFO("委托视频"),
	
	AFTER_LOAN("贷后类信息"),

	INSTOCK_INFO("入库信息"),

	//CONTRACT_DOWNLOAD("合同下载")
	;
	String message;

	AttachmentTypeEnum(String message) {
		this.message = message;
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
