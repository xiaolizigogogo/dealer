package com.utonw.dealer.api.dto.response;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.Date;

public class CustomerListResponse implements Serializable{


	private static final long serialVersionUID = 874992665203298003L;
	// accountID
	private BigInteger accountId;
	// 经销商名称
	private String merchantName;
	// 法人
	private String legalEntityName;
	// 法人电话
	private String legalEntityMob;
	// 业务联系人
	private String businessContManager;
	// 业务联系人电话
	private String businessContMob;
	// 订单数量
	private Integer indentCount;
	// 是否复核
	private Integer reviewStatus;
	// 申请时间
	private Date uploadTime;
	private String id;
	private String applyStatus;
	private String assignUser;

	public String getApplyStatus() {
		return applyStatus;
	}

	public void setApplyStatus(String applyStatus) {
		this.applyStatus = applyStatus;
	}

	public String getAssignUser() {
		return assignUser;
	}

	public void setAssignUser(String assignUser) {
		this.assignUser = assignUser;
	}

	public BigInteger getAccountId() {
		return accountId;
	}

	public void setAccountId(BigInteger accountId) {
		this.accountId = accountId;
	}

	public String getMerchantName() {
		return merchantName;
	}

	public void setMerchantName(String merchantName) {
		this.merchantName = merchantName;
	}

	public String getLegalEntityName() {
		return legalEntityName;
	}

	public void setLegalEntityName(String legalEntityName) {
		this.legalEntityName = legalEntityName;
	}

	public String getLegalEntityMob() {
		return legalEntityMob;
	}

	public void setLegalEntityMob(String legalEntityMob) {
		this.legalEntityMob = legalEntityMob;
	}

	public String getBusinessContManager() {
		return businessContManager;
	}

	public void setBusinessContManager(String businessContManager) {
		this.businessContManager = businessContManager;
	}

	public String getBusinessContMob() {
		return businessContMob;
	}

	public void setBusinessContMob(String businessContMob) {
		this.businessContMob = businessContMob;
	}

	public Integer getIndentCount() {
		return indentCount;
	}

	public void setIndentCount(Integer indentCount) {
		this.indentCount = indentCount;
	}

	public Integer getReviewStatus() {
		return reviewStatus;
	}

	public void setReviewStatus(Integer reviewStatus) {
		this.reviewStatus = reviewStatus;
	}

	public Date getUploadTime() {
		return uploadTime;
	}

	public void setUploadTime(Date uploadTime) {
		this.uploadTime = uploadTime;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
}
