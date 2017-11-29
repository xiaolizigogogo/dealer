package com.utonw.dealer.api.entity.erp;

import java.io.Serializable;

public class LoanB2BInfo implements Serializable {

	private static final long serialVersionUID = 8122258387898231083L;
	/**
	 * UUID
	 */
	private String uuid;

	/**
	 * 订单号
	 */
	private String orderId;

	/**
	 * 客户姓名
	 */
	private String customerName;

	/**
	 * 贷款金额
	 */
	private String loanMoney;

	/**
	 * 分公司名
	 */
	private String companyName;

	/**
	 * 订单状态
	 */
	private String loanStatus;

	/**
	 * 是否催收
	 */
	private String urgeRepayment;

	/**
	 * 节点
	 */
	private String period;

	/**
	 * 当前页
	 */
	private Integer currentPage;

	/**
	 * 条数
	 */
	private Integer pageCount;
	
	/**
	 * 期数
	 */
	private Integer repayPeriod;

	/**
	 * 用户ID
	 */
	private String customerId;

	public Integer getRepayPeriod() {
		return repayPeriod;
	}

	public void setRepayPeriod(Integer repayPeriod) {
		this.repayPeriod = repayPeriod;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getLoanMoney() {
		return loanMoney;
	}

	public void setLoanMoney(String loanMoney) {
		this.loanMoney = loanMoney;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getLoanStatus() {
		return loanStatus;
	}

	public void setLoanStatus(String loanStatus) {
		this.loanStatus = loanStatus;
	}

	public String getUrgeRepayment() {
		return urgeRepayment;
	}

	public void setUrgeRepayment(String urgeRepayment) {
		this.urgeRepayment = urgeRepayment;
	}

	public String getPeriod() {
		return period;
	}

	public void setPeriod(String period) {
		this.period = period;
	}

	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	public Integer getPageCount() {
		return pageCount;
	}

	public void setPageCount(Integer pageCount) {
		this.pageCount = pageCount;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
}