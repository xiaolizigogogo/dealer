package com.utonw.dealer.api.entity.erp;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 逾期列表
 */
public class OverdueCountAndMoney implements Serializable {

	private static final long serialVersionUID = 6166231618114821402L;
	/**
	 * 逾期单数
	 */
	private Integer count;

	/**
	 * 逾期金额
	 */
	private BigDecimal repayCapital;

	/**
	 * 类型(比较符)
	 */
	private String type;


	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public BigDecimal getRepayCapital() {
		return repayCapital;
	}

	public void setRepayCapital(BigDecimal repayCapital) {
		this.repayCapital = repayCapital;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
}
