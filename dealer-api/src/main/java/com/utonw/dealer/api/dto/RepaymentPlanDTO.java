/**
 * @Description: 还款计划 
 * @author YX  
 * @date 2017年7月26日下午4:34:12
 */
package com.utonw.dealer.api.dto;

import javax.xml.crypto.Data;
import java.io.Serializable;
import java.math.BigDecimal;

/**
 * @author YX
 * @date 2017年7月26日 下午4:34:12 
 */
public class RepaymentPlanDTO implements Serializable {

	/**
	 * @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么)
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * @Fields merchantName : 商家名称
	 */
	private String merchantName;

	/**
	 * @Fields realName : 借款人
	 */
	private String realName;
	
	/**
	 * @Fields judgeMoney : 放款金额
	 */
	private BigDecimal judgeMoney;
	
	/**
	 * @Fields deadlineTime : 周期天数
	 */
	private int deadlineTime;
	
	/**
	 * @Fields interestRate : 利率
	 */
	private BigDecimal interestRate;

	/**
	 * @Fields loan_time : 放款时间
	 */
	private Data loan_time;

	/**
	 * @Fields repaymen_time : 还款时间
	 */
	private Data repaymen_time;
	/**
	 * @Fields repaymen_amt : 还款金额
	 */
	private BigDecimal repaymen_amt;
	/**
	 * @Fields overdue : 逾期天数
	 */
	private String  overdue;
	/**
	 * @Fields fine : 罚金
	 */
	private BigDecimal fine;
	/**
	 *
	 * @Fields Amount : 合计金额
	 */
	private BigDecimal Amount;

	public Data getLoan_time() {
		return loan_time;
	}

	public void setLoan_time(Data loan_time) {
		this.loan_time = loan_time;
	}

	public Data getRepaymen_time() {
		return repaymen_time;
	}

	public void setRepaymen_time(Data repaymen_time) {
		this.repaymen_time = repaymen_time;
	}

	public BigDecimal getRepaymen_amt() {
		return repaymen_amt;
	}

	public void setRepaymen_amt(BigDecimal repaymen_amt) {
		this.repaymen_amt = repaymen_amt;
	}

	public String getOverdue() {
		return overdue;
	}

	public void setOverdue(String overdue) {
		this.overdue = overdue;
	}

	public BigDecimal getFine() {
		return fine;
	}

	public void setFine(BigDecimal fine) {
		this.fine = fine;
	}

	public BigDecimal getAmount() {
		return Amount;
	}

	public void setAmount(BigDecimal amount) {
		Amount = amount;
	}

	public String getMerchantName() {
		return merchantName;
	}

	public void setMerchantName(String merchantName) {
		this.merchantName = merchantName;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public BigDecimal getJudgeMoney() {
		return judgeMoney;
	}

	public void setJudgeMoney(BigDecimal judgeMoney) {
		this.judgeMoney = judgeMoney;
	}

	public int getDeadlineTime() {
		return deadlineTime;
	}

	public void setDeadlineTime(int deadlineTime) {
		this.deadlineTime = deadlineTime;
	}

	public BigDecimal getInterestRate() {
		return interestRate;
	}

	public void setInterestRate(BigDecimal interestRate) {
		this.interestRate = interestRate;
	}

	@Override
	public String toString() {
		return "RepaymentPlanDTO [merchantName=" + merchantName + ", realName=" + realName + ", judgeMoney="
				+ judgeMoney + ", deadlineTime=" + deadlineTime + ", interestRate=" + interestRate + "]";
	}
	
}
