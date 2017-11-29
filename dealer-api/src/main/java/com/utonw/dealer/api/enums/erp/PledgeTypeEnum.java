package com.utonw.dealer.api.enums.erp;

import com.utonw.dealer.api.enums.erp.EnumBase;

/**
 * 抵押类型枚举
 * 
 * @author jml 2016年9月17日 PledgeTypeEnum.java
 */
public enum PledgeTypeEnum implements EnumBase {

	drivePledge("押证"),

	vehiclePledge("押车");

	String message;

	PledgeTypeEnum(String message) {
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
