package com.utonw.dealer.api.enums;

public enum CarDealerApplyEnum {
	distribution_user("分配线下人员 "),
	information_verification("信息核查"),
	headquarters_audit("总部终审" ),
	installCamera_signContract("签订合同"),
	audit_camera_contract("风控审核"),
	bind_bankCard("绑定银行卡"),
	apply_restart("重新申请"),
	all("全部"),
	;
	String message;
	CarDealerApplyEnum(String message){
		this.message=message;
		
	}
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
}
