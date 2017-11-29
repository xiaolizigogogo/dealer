package com.utonw.dealer.api.enums;

public enum CarDealerLoanEnum {
	first_trial("初审并分配评估师"),
	evaluate_install_collateral("评估及安装押品"),
	review_evaluate("风控审核车辆评估" ),
	review_install_collateral("风控审核押品"),
	judgment("平台总部终审"),
	sign_contract("签订借款合同"),
	usertask1("总部委托代扣"),
	lended("平台财务放款"),
	repayment("还款中"),
	repayment_end("还款成功"),
	information_verification("信息核查"),
	dismantling("拆除设备"),
	withholding_commission("委托代扣"),
	ended("完结"),
	apply_restart("重新申请"),
	loan_restart("重新申请"),
	
	;
	String message;
	CarDealerLoanEnum(String message){
		this.message=message;
		
	}
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
}
