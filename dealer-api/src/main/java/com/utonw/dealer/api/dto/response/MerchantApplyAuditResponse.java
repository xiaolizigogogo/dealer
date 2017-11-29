package com.utonw.dealer.api.dto.response;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class MerchantApplyAuditResponse implements Serializable{

	private String id;

	/**
	 *
	 */
	private String applyid;

	/**
	 * 是否通过 1:通过 2：未通过
	 */
	private Integer passed;

	/**
	 * 审批金额
	 */
	private BigDecimal approvalamount;

	/**
	 * 备注
	 */
	private String remarks;

	/**
	 * 创建时间
	 */
	private Date createdate;

	private long accountId;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getApplyid() {
		return applyid;
	}

	public void setApplyid(String applyid) {
		this.applyid = applyid;
	}

	public Integer getPassed() {
		return passed;
	}

	public void setPassed(Integer passed) {
		this.passed = passed;
	}

	public BigDecimal getApprovalamount() {
		return approvalamount;
	}

	public void setApprovalamount(BigDecimal approvalamount) {
		this.approvalamount = approvalamount;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public Date getCreatedate() {
		return createdate;
	}

	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}


	public long getAccountId() {
		return accountId;
	}

	public void setAccountId(long accountId) {
		this.accountId = accountId;
	}
	
	
	
}
