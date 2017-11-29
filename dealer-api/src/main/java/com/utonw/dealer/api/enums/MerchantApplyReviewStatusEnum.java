package com.utonw.dealer.api.enums;

public enum MerchantApplyReviewStatusEnum {
	
	Wait_Risk_Management(5,"待风控审核") 
	;
	String message;

	Integer code;

	MerchantApplyReviewStatusEnum(Integer code, String message) {
		this.message = message;
		this.code = code;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}
	
	
}
