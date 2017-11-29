/**
 * @Description: 还款计划 
 * @author YX  
 * @date 2017年7月26日下午4:34:12
 */
package com.utonw.dealer.api.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * @author YX
 * @date 2017年7月26日 下午4:34:12 
 */
public class RepaymentPlan implements Serializable {

	private static final long serialVersionUID = -5588983533487004489L;
	/**
	 * This field was generated by MyBatis Generator.
	 * This field corresponds to the database column repayment_plan.record_id
	 *
	 * @mbggenerated
	 */
	private Integer recordId;

	/**
	 * This field was generated by MyBatis Generator.
	 * This field corresponds to the database column repayment_plan.task_id
	 *
	 * @mbggenerated
	 */
	private String taskId;

	/**
	 * This field was generated by MyBatis Generator.
	 * This field corresponds to the database column repayment_plan.car_name
	 *
	 * @mbggenerated
	 */
	private String carName;

	/**
	 * This field was generated by MyBatis Generator.
	 * This field corresponds to the database column repayment_plan.loan_time
	 *
	 * @mbggenerated
	 */
	private String loanTime;

	/**
	 * This field was generated by MyBatis Generator.
	 * This field corresponds to the database column repayment_plan.loan_amt
	 *
	 * @mbggenerated
	 */
	private Double loanAmt;

	/**
	 * This field was generated by MyBatis Generator.
	 * This field corresponds to the database column repayment_plan.cyclicity
	 *
	 * @mbggenerated
	 */
	private String cyclicity;

	/**
	 * This field was generated by MyBatis Generator.
	 * This field corresponds to the database column repayment_plan.interest_rate
	 *
	 * @mbggenerated
	 */
	private Double interestRate;

	/**
	 * This field was generated by MyBatis Generator.
	 * This field corresponds to the database column repayment_plan.repaymen_time
	 *
	 * @mbggenerated
	 */
	private String repaymenTime;

	/**
	 * This field was generated by MyBatis Generator.
	 * This field corresponds to the database column repayment_plan.repaymen_amt
	 *
	 * @mbggenerated
	 */
	private Double repaymenAmt;

	/**
	 * This field was generated by MyBatis Generator.
	 * This field corresponds to the database column repayment_plan.out_account_time
	 *
	 * @mbggenerated
	 */
	private String outAccountTime;

	/**
	 * This field was generated by MyBatis Generator.
	 * This field corresponds to the database column repayment_plan.out_account_voucher
	 *
	 * @mbggenerated
	 */
	private String outAccountVoucher;

	/**
	 * This field was generated by MyBatis Generator.
	 * This field corresponds to the database column repayment_plan.order_id
	 *
	 * @mbggenerated
	 */
	private String orderId;

	/**
	 * This field was generated by MyBatis Generator.
	 * This field corresponds to the database column repayment_plan.reg_date
	 *
	 * @mbggenerated
	 */
	private Date regDate;

	/**
	 * This field was generated by MyBatis Generator.
	 * This field corresponds to the database column repayment_plan.reg_time
	 *
	 * @mbggenerated
	 */
	private Date regTime;

	private String  borrowerd;
	private String orderNum;

	private Date endTime;
	private String endType;

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}


	public String getEndType() {
		return endType;
	}

	public void setEndType(String endType) {
		this.endType = endType;
	}

	public String getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}

	public String getBorrowerd() {
		return borrowerd;
	}

	public void setBorrowerd(String borrowerd) {
		this.borrowerd = borrowerd;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method returns the value of the database column repayment_plan.record_id
	 *
	 * @return the value of repayment_plan.record_id
	 *
	 * @mbggenerated
	 */
	public Integer getRecordId() {
		return recordId;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method sets the value of the database column repayment_plan.record_id
	 *
	 * @param recordId the value for repayment_plan.record_id
	 *
	 * @mbggenerated
	 */
	public void setRecordId(Integer recordId) {
		this.recordId = recordId;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method returns the value of the database column repayment_plan.task_id
	 *
	 * @return the value of repayment_plan.task_id
	 *
	 * @mbggenerated
	 */
	public String getTaskId() {
		return taskId;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method sets the value of the database column repayment_plan.task_id
	 *
	 * @param taskId the value for repayment_plan.task_id
	 *
	 * @mbggenerated
	 */
	public void setTaskId(String taskId) {
		this.taskId = taskId == null ? null : taskId.trim();
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method returns the value of the database column repayment_plan.car_name
	 *
	 * @return the value of repayment_plan.car_name
	 *
	 * @mbggenerated
	 */
	public String getCarName() {
		return carName;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method sets the value of the database column repayment_plan.car_name
	 *
	 * @param carName the value for repayment_plan.car_name
	 *
	 * @mbggenerated
	 */
	public void setCarName(String carName) {
		this.carName = carName == null ? null : carName.trim();
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method returns the value of the database column repayment_plan.loan_time
	 *
	 * @return the value of repayment_plan.loan_time
	 *
	 * @mbggenerated
	 */
	public String getLoanTime() {
		return loanTime;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method sets the value of the database column repayment_plan.loan_time
	 *
	 * @param loanTime the value for repayment_plan.loan_time
	 *
	 * @mbggenerated
	 */
	public void setLoanTime(String loanTime) {
		this.loanTime = loanTime == null ? null : loanTime.trim();
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method returns the value of the database column repayment_plan.loan_amt
	 *
	 * @return the value of repayment_plan.loan_amt
	 *
	 * @mbggenerated
	 */
	public Double getLoanAmt() {
		return loanAmt;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method sets the value of the database column repayment_plan.loan_amt
	 *
	 * @param loanAmt the value for repayment_plan.loan_amt
	 *
	 * @mbggenerated
	 */
	public void setLoanAmt(Double loanAmt) {
		this.loanAmt = loanAmt;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method returns the value of the database column repayment_plan.cyclicity
	 *
	 * @return the value of repayment_plan.cyclicity
	 *
	 * @mbggenerated
	 */
	public String getCyclicity() {
		return cyclicity;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method sets the value of the database column repayment_plan.cyclicity
	 *
	 * @param cyclicity the value for repayment_plan.cyclicity
	 *
	 * @mbggenerated
	 */
	public void setCyclicity(String cyclicity) {
		this.cyclicity = cyclicity == null ? null : cyclicity.trim();
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method returns the value of the database column repayment_plan.interest_rate
	 *
	 * @return the value of repayment_plan.interest_rate
	 *
	 * @mbggenerated
	 */
	public Double getInterestRate() {
		return interestRate;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method sets the value of the database column repayment_plan.interest_rate
	 *
	 * @param interestRate the value for repayment_plan.interest_rate
	 *
	 * @mbggenerated
	 */
	public void setInterestRate(Double interestRate) {
		this.interestRate = interestRate;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method returns the value of the database column repayment_plan.repaymen_time
	 *
	 * @return the value of repayment_plan.repaymen_time
	 *
	 * @mbggenerated
	 */
	public String getRepaymenTime() {
		return repaymenTime;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method sets the value of the database column repayment_plan.repaymen_time
	 *
	 * @param repaymenTime the value for repayment_plan.repaymen_time
	 *
	 * @mbggenerated
	 */
	public void setRepaymenTime(String repaymenTime) {
		this.repaymenTime = repaymenTime == null ? null : repaymenTime.trim();
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method returns the value of the database column repayment_plan.repaymen_amt
	 *
	 * @return the value of repayment_plan.repaymen_amt
	 *
	 * @mbggenerated
	 */
	public Double getRepaymenAmt() {
		return repaymenAmt;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method sets the value of the database column repayment_plan.repaymen_amt
	 *
	 * @param repaymenAmt the value for repayment_plan.repaymen_amt
	 *
	 * @mbggenerated
	 */
	public void setRepaymenAmt(Double repaymenAmt) {
		this.repaymenAmt = repaymenAmt;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method returns the value of the database column repayment_plan.out_account_time
	 *
	 * @return the value of repayment_plan.out_account_time
	 *
	 * @mbggenerated
	 */
	public String getOutAccountTime() {
		return outAccountTime;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method sets the value of the database column repayment_plan.out_account_time
	 *
	 * @param outAccountTime the value for repayment_plan.out_account_time
	 *
	 * @mbggenerated
	 */
	public void setOutAccountTime(String outAccountTime) {
		this.outAccountTime = outAccountTime == null ? null : outAccountTime.trim();
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method returns the value of the database column repayment_plan.out_account_voucher
	 *
	 * @return the value of repayment_plan.out_account_voucher
	 *
	 * @mbggenerated
	 */
	public String getOutAccountVoucher() {
		return outAccountVoucher;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method sets the value of the database column repayment_plan.out_account_voucher
	 *
	 * @param outAccountVoucher the value for repayment_plan.out_account_voucher
	 *
	 * @mbggenerated
	 */
	public void setOutAccountVoucher(String outAccountVoucher) {
		this.outAccountVoucher = outAccountVoucher == null ? null : outAccountVoucher.trim();
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method returns the value of the database column repayment_plan.order_id
	 *
	 * @return the value of repayment_plan.order_id
	 *
	 * @mbggenerated
	 */
	public String getOrderId() {
		return orderId;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method sets the value of the database column repayment_plan.order_id
	 *
	 * @param orderId the value for repayment_plan.order_id
	 *
	 * @mbggenerated
	 */
	public void setOrderId(String orderId) {
		this.orderId = orderId == null ? null : orderId.trim();
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method returns the value of the database column repayment_plan.reg_date
	 *
	 * @return the value of repayment_plan.reg_date
	 *
	 * @mbggenerated
	 */
	public Date getRegDate() {
		return regDate;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method sets the value of the database column repayment_plan.reg_date
	 *
	 * @param regDate the value for repayment_plan.reg_date
	 *
	 * @mbggenerated
	 */
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method returns the value of the database column repayment_plan.reg_time
	 *
	 * @return the value of repayment_plan.reg_time
	 *
	 * @mbggenerated
	 */
	public Date getRegTime() {
		return regTime;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method sets the value of the database column repayment_plan.reg_time
	 *
	 * @param regTime the value for repayment_plan.reg_time
	 *
	 * @mbggenerated
	 */
	public void setRegTime(Date regTime) {
		this.regTime = regTime;
	}

}
