package com.utonw.dealer.api.entity.erp;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 逾期列表
 */
public class OverdueList implements Serializable {

	private static final long serialVersionUID = 3507100193380708343L;
	/**
	 * 姓名
	 */

	private String customerName;

	/**
	 * 金额
	 */
	private BigDecimal repayTotal;

	/**
	 * 天数
	 */
	private String overdueDay;

	/**
	 * 处理人员
	 */
	private String realName;

	/**
	 * 状态
	 */
	private String loanStatus;

	/**
	 * UUID
	 */
	private String uuid;

	/**
	 * CustomerID
	 */
	private String customerId;

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public BigDecimal getRepayTotal() {
		return repayTotal;
	}

	public void setRepayTotal(BigDecimal repayTotal) {
		this.repayTotal = repayTotal;
	}

	public String getOverdueDay() {
		return overdueDay;
	}

	public void setOverdueDay(String overdueDay) {
		this.overdueDay = overdueDay;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getLoanStatus() {
		return loanStatus;
	}

	public void setLoanStatus(String loanStatus) {
		this.loanStatus = loanStatus;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
}
