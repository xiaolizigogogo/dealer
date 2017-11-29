package com.utonw.dealer.api.enums.erp;

/**
 * 枚举接口
 * 
 * @author jml 2016年9月17日 EnumBase.java
 */
public interface EnumBase {

	/**
	 * 获取枚举名
	 * 
	 * @return
	 */
	public String name();

	/**
	 * 获取枚举消息
	 * 
	 * @return
	 */
	public String message();

	/**
	 * 获取枚举值
	 * 
	 * @return
	 */
	public Number value();

}
