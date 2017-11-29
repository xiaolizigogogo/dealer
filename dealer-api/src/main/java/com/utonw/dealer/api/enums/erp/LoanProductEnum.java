package com.utonw.dealer.api.enums.erp;

/**
 * 贷款产品枚举
 * 
 * @author jml 2016年9月17日 LoanProductEnum.java
 */
public enum LoanProductEnum implements EnumBase {
	车抵贷("0"),
	押车贷("1"),
	车主贷("2"),
	车商贷("3"),
	首付贷("4"),
	二手车分期("5"),
	以租代购("6"),
	;
	String message;

	LoanProductEnum(String message) {
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
