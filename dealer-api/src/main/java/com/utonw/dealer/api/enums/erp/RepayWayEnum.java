package com.utonw.dealer.api.enums.erp;

import com.utonw.dealer.api.enums.erp.EnumBase;

/**
 * 还款方式枚举
 * 
 * @author jml 2016年9月17日 RepayWayEnum.java
 */
public enum RepayWayEnum implements EnumBase

{
	AverageCapitalPlusInterest("等额本息"),

	InterestRatesBefore("先息后本");

	String message;

	RepayWayEnum(String message) {
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
