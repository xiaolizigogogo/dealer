package com.utonw.dealer.api.enums;

public enum CarDealerReviewEnum {
	pass("通过 "),
	nopass("不通过"),
	back_evaluate_install_collateral("回退"),
	back_review_evaluate("回退"),
	back_review_install_collateral("回退"),
	back_information_verification("回退"),
	back_installCamera_signContract("回退"),
	back_sign_contract("回退"),
	back_first_trial(""),
	;
	String message;
	CarDealerReviewEnum(String message){
		this.message=message;
		
	}
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
}
