package com.utonw.dealer.api.enums;

public enum CarDealerRepaymentEnum {
	lended("待还款"),
	repayment("还款中"),
	repayment_end("还款成功"),
	dismantling("拆除设备"),
	withholding_commission("委托代扣"),
	distrution_user_dismantling("待分配"),
	;
	String message;
	CarDealerRepaymentEnum(String message){
		this.message=message;
		
	}
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
}
