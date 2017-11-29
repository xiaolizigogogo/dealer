package com.utonw.dealer.api.entity.erp;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class LoanReviewInfo implements Serializable {
	private static final long serialVersionUID = 6199205308422821669L;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to
	 * the database column loan_review_info.id
	 *
	 * @mbggenerated
	 */
	private Integer id;

	/**
	 * This field was generated by MyBatis Generator. This field corresponds to
	 * the database column loan_review_info.loan_id
	 *
	 * @mbggenerated
	 */
	private String loanId;

	/**
	 * This field was generated by MyBatis Generator. This field corresponds to
	 * the database column loan_review_info.review_status
	 *
	 * @mbggenerated
	 */
	private String reviewStatus;

	/**
	 * This field was generated by MyBatis Generator. This field corresponds to
	 * the database column loan_review_info.review_level
	 *
	 * @mbggenerated
	 */
	private String reviewLevel;

	/**
	 * This field was generated by MyBatis Generator. This field corresponds to
	 * the database column loan_review_info.review_amount
	 *
	 * @mbggenerated
	 */
	private BigDecimal reviewAmount;

	/**
	 * This field was generated by MyBatis Generator. This field corresponds to
	 * the database column loan_review_info.reviewed_by_id
	 *
	 * @mbggenerated
	 */
	private String reviewedById;

	/**
	 * This field was generated by MyBatis Generator. This field corresponds to
	 * the database column loan_review_info.created_at
	 *
	 * @mbggenerated
	 */
	private Date createdAt;

	/**
	 * This field was generated by MyBatis Generator. This field corresponds to
	 * the database column loan_review_info.review_conclusion
	 *
	 * @mbggenerated
	 */
	private String reviewConclusion;

	private String name;
	
	private User user;

	public String getName() {
		return name;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the
	 * value of the database column loan_review_info.id
	 *
	 * @return the value of loan_review_info.id
	 *
	 * @mbggenerated
	 */
	public Integer getId() {
		return id;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the
	 * value of the database column loan_review_info.id
	 *
	 * @param id
	 *            the value for loan_review_info.id
	 *
	 * @mbggenerated
	 */
	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the
	 * value of the database column loan_review_info.loan_id
	 *
	 * @return the value of loan_review_info.loan_id
	 *
	 * @mbggenerated
	 */
	public String getLoanId() {
		return loanId;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the
	 * value of the database column loan_review_info.loan_id
	 *
	 * @param loanId
	 *            the value for loan_review_info.loan_id
	 *
	 * @mbggenerated
	 */
	public void setLoanId(String loanId) {
		this.loanId = loanId == null ? null : loanId.trim();
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the
	 * value of the database column loan_review_info.review_status
	 *
	 * @return the value of loan_review_info.review_status
	 *
	 * @mbggenerated
	 */
	public String getReviewStatus() {
		return reviewStatus;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the
	 * value of the database column loan_review_info.review_status
	 *
	 * @param reviewStatus
	 *            the value for loan_review_info.review_status
	 *
	 * @mbggenerated
	 */
	public void setReviewStatus(String reviewStatus) {
		this.reviewStatus = reviewStatus == null ? null : reviewStatus.trim();
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the
	 * value of the database column loan_review_info.review_level
	 *
	 * @return the value of loan_review_info.review_level
	 *
	 * @mbggenerated
	 */
	public String getReviewLevel() {
		return reviewLevel;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the
	 * value of the database column loan_review_info.review_level
	 *
	 * @param reviewLevel
	 *            the value for loan_review_info.review_level
	 *
	 * @mbggenerated
	 */
	public void setReviewLevel(String reviewLevel) {
		this.reviewLevel = reviewLevel == null ? null : reviewLevel.trim();
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the
	 * value of the database column loan_review_info.review_amount
	 *
	 * @return the value of loan_review_info.review_amount
	 *
	 * @mbggenerated
	 */
	public BigDecimal getReviewAmount() {
		return reviewAmount;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the
	 * value of the database column loan_review_info.review_amount
	 *
	 * @param reviewAmount
	 *            the value for loan_review_info.review_amount
	 *
	 * @mbggenerated
	 */
	public void setReviewAmount(BigDecimal reviewAmount) {
		this.reviewAmount = reviewAmount;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the
	 * value of the database column loan_review_info.reviewed_by_id
	 *
	 * @return the value of loan_review_info.reviewed_by_id
	 *
	 * @mbggenerated
	 */
	public String getReviewedById() {
		return reviewedById;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the
	 * value of the database column loan_review_info.reviewed_by_id
	 *
	 * @param reviewedById
	 *            the value for loan_review_info.reviewed_by_id
	 *
	 * @mbggenerated
	 */
	public void setReviewedById(String reviewedById) {
		this.reviewedById = reviewedById == null ? null : reviewedById.trim();
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the
	 * value of the database column loan_review_info.created_at
	 *
	 * @return the value of loan_review_info.created_at
	 *
	 * @mbggenerated
	 */
	public Date getCreatedAt() {
		return createdAt;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the
	 * value of the database column loan_review_info.created_at
	 *
	 * @param createdAt
	 *            the value for loan_review_info.created_at
	 *
	 * @mbggenerated
	 */
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the
	 * value of the database column loan_review_info.review_conclusion
	 *
	 * @return the value of loan_review_info.review_conclusion
	 *
	 * @mbggenerated
	 */
	public String getReviewConclusion() {
		return reviewConclusion;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the
	 * value of the database column loan_review_info.review_conclusion
	 *
	 * @param reviewConclusion
	 *            the value for loan_review_info.review_conclusion
	 *
	 * @mbggenerated
	 */
	public void setReviewConclusion(String reviewConclusion) {
		this.reviewConclusion = reviewConclusion == null ? null : reviewConclusion.trim();
	}

	private String reviewname;

	public String getReviewname() {
		return reviewname;
	}

	public void setReviewname(String reviewname) {
		this.reviewname = reviewname;
	}

	private String reviewedByName;

	public String getReviewedByName() {
		return reviewedByName;
	}

	public void setReviewedByName(String reviewedByName) {
		this.reviewedByName = reviewedByName;
	}
}