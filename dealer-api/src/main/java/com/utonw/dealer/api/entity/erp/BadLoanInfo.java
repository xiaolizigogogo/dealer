package com.utonw.dealer.api.entity.erp;

import com.utonw.dealer.api.enums.erp.PledgeTypeEnum;
import com.utonw.dealer.api.enums.erp.RepayWayEnum;
import com.utonw.dealer.api.util.erp.DateUtils;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;


/**
 * 坏账明细
 * 
 * @author jml 2016年9月17日 BadLoanInfo.java
 */
public class BadLoanInfo implements Serializable {
	private static final long serialVersionUID = -5220105947370447825L;
	private String customerName;
	private String deptName;
	private String companyName;
	private String realName;
	private String loanType;
	private String loanProduct;
	private String pledgeType;
	private String orderId;
	private String contractNum;
	public String getContractNum() {
		return contractNum;
	}

	public void setContractNum(String contractNum) {
		this.contractNum = contractNum;
	}

	private BigDecimal loanMoney;
	private String loanWay;
	private int restIssue;
	private BigDecimal restMoney;
	// 已还本金
	private BigDecimal repayMoney;
	private int loanLimitTime;
	private int customerCount;
	private String repayWay;
	private Date createdAt;
	// 任务节点人员
	private List<LoanReviewInfo> loanReviewInfos;

	private BigDecimal restInterestMoney;
	// 已还利息
	private BigDecimal repayInterestMoney;
	private String badLoanReson;
	private String badLoanBy;
	private String buyCarMethod;
	private String isImportant;// 是否重要客户
	private String customerId;
	private String uuid;
	private Double badLoanSum;
	private Double loanMoneySum;
	private Integer orderCount;
	private Double repaySum;

	public Double getBadLoanSum() {
		return badLoanSum;
	}

	public void setBadLoanSum(Double badLoanSum) {
		this.badLoanSum = badLoanSum;
	}

	public Double getLoanMoneySum() {
		return loanMoneySum;
	}

	public void setLoanMoneySum(Double loanMoneySum) {
		this.loanMoneySum = loanMoneySum;
	}

	public Integer getOrderCount() {
		return orderCount;
	}

	public void setOrderCount(Integer orderCount) {
		this.orderCount = orderCount;
	}

	public Double getRepaySum() {
		return repaySum;
	}

	public void setRepaySum(Double repaySum) {
		this.repaySum = repaySum;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getIsImportant() {
		return isImportant;
	}

	public void setIsImportant(String isImportant) {
		this.isImportant = isImportant;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public String getCreatedAt() {
		return DateUtils.getWebDateString((createdAt == null ? new Date() : createdAt));
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public String getRepayWay() {
		return Enum.valueOf(RepayWayEnum.class, repayWay).message();
	}

	public void setRepayWay(String repayWay) {
		this.repayWay = repayWay;
	}

	public String getLoanWay() {
		return loanWay;
	}

	public void setLoanWay(String loanWay) {
		this.loanWay = loanWay;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getLoanType() {
		return loanType;
	}

	public void setLoanType(String loanType) {
		this.loanType = loanType;
	}

	public String getLoanProduct() {

		return loanProduct;
	}

	public void setLoanProduct(String loanProduct) {
		if ("0".equals(loanProduct)) {
			this.loanProduct = "车抵贷";
			return;
		}
		this.loanProduct = loanProduct;
	}

	public String getPledgeType() {
		return Enum.valueOf(PledgeTypeEnum.class, pledgeType).message();
	}

	public void setPledgeType(String pledgeType) {
		this.pledgeType = pledgeType;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public BigDecimal getLoanMoney() {
		return loanMoney;
	}

	public void setLoanMoney(BigDecimal loanMoney) {
		this.loanMoney = loanMoney;
	}

	public int getRestIssue() {
		return restIssue;
	}

	public void setRestIssue(int restIssue) {
		this.restIssue = restIssue;
	}

	public BigDecimal getRestMoney() {
		return restMoney;
	}

	public void setRestMoney(BigDecimal restMoney) {
		this.restMoney = restMoney;
	}

	public BigDecimal getRepayMoney() {
		return repayMoney;
	}

	public void setRepayMoney(BigDecimal repayMoney) {
		this.repayMoney = repayMoney;
	}

	public int getLoanLimitTime() {
		return loanLimitTime;
	}

	public void setLoanLimitTime(int loanLimitTime) {
		this.loanLimitTime = loanLimitTime;
	}

	public int getCustomerCount() {
		return customerCount;
	}

	public void setCustomerCount(int customerCount) {
		this.customerCount = customerCount;
	}

	public List<LoanReviewInfo> getLoanReviewInfos() {
		return loanReviewInfos;
	}

	public void setLoanReviewInfos(List<LoanReviewInfo> loanReviewInfos) {
		this.loanReviewInfos = loanReviewInfos;
	}

	public BigDecimal getRestInterestMoney() {
		return restInterestMoney;
	}

	public void setRestInterestMoney(BigDecimal restInterestMoney) {
		this.restInterestMoney = restInterestMoney;
	}

	public BigDecimal getRepayInterestMoney() {
		return repayInterestMoney;
	}

	public void setRepayInterestMoney(BigDecimal repayInterestMoney) {
		this.repayInterestMoney = repayInterestMoney;
	}

	public String getBadLoanReson() {
		return badLoanReson;
	}

	public void setBadLoanReson(String badLoanReson) {
		this.badLoanReson = badLoanReson;
	}

	public String getBadLoanBy() {
		return badLoanBy;
	}

	public void setBadLoanBy(String badLoanBy) {
		this.badLoanBy = badLoanBy;
	}

	public String getBuyCarMethod() {
		return buyCarMethod;
	}

	public void setBuyCarMethod(String buyCarMethod) {
		if ("0".equals(buyCarMethod)) {
			this.buyCarMethod = "全款";
			return;
		}
		if ("1".equals(buyCarMethod)) {
			this.buyCarMethod = "按揭";
			return;
		}
		this.buyCarMethod = buyCarMethod;
	}
}
