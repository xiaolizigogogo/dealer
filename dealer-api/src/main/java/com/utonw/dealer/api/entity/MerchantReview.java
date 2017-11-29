package com.utonw.dealer.api.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * <p>
 *
 * </p>
 *
 * @author wangyj
 * @since 2017-05-16
 */
@TableName("merchant_review")
public class MerchantReview extends Model<MerchantReview> {

	private static final long serialVersionUID = 1L;

	/**
	 * 商户名
	 */
	@TableField(value="merchant_name")
	private String merchantName;

	/**
	 * 评审金额
	 */
	@TableField(value="approve_money")
	private BigDecimal approveMoney;

	/**
	 *
	 */
	@TableId(type = IdType.UUID)
	private String id;

	/**
	 * 申请金额
	 */
	@TableField(value="apply_money")
	private BigDecimal applyMoney;

	/**
	 * 评审时间
	 */
	@TableField(value="apply_time")
	private Date applyTime;

	/**
	 * 订单状态
	 */
	@TableField(value="loan_status")
	private String loanStatus;

	/**
	 * 订单号
	 */
	@TableField(value="indent_id")
	private String indentId;

	/**
	 * 评审结论
	 */
	@TableField(value="review_conclusion")
	private String reviewConclusion;

	/**
	 *
	 */
	@TableField(value="review_by_id")
	private String reviewById;



	public String getMerchantName() {
		return merchantName;
	}

	public void setMerchantName(String merchantName) {
		this.merchantName = merchantName;
	}

	public BigDecimal getApproveMoney() {
		return approveMoney;
	}

	public void setApproveMoney(BigDecimal approveMoney) {
		this.approveMoney = approveMoney;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public BigDecimal getApplyMoney() {
		return applyMoney;
	}

	public void setApplyMoney(BigDecimal applyMoney) {
		this.applyMoney = applyMoney;
	}

	public Date getApplyTime() {
		return applyTime;
	}

	public void setApplyTime(Date applyTime) {
		this.applyTime = applyTime;
	}

	public String getLoanStatus() {
		return loanStatus;
	}

	public void setLoanStatus(String loanStatus) {
		this.loanStatus = loanStatus;
	}

	public String getIndentId() {
		return indentId;
	}

	public void setIndentId(String indentId) {
		this.indentId = indentId;
	}

	public String getReviewConclusion() {
		return reviewConclusion;
	}

	public void setReviewConclusion(String reviewConclusion) {
		this.reviewConclusion = reviewConclusion;
	}

	public String getReviewById() {
		return reviewById;
	}

	public void setReviewById(String reviewById) {
		this.reviewById = reviewById;
	}
	@Override
	protected Serializable pkVal() {
		// TODO Auto-generated method stub
		return id;
	}
}