package com.utonw.dealer.api.vo;

import java.io.Serializable;

public class TDistributionRfidVo implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;
	
	private String userId;
	
	private Integer dealerId;
	
	private Integer status;
	
	private String accountName;
	
	private String realname;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Integer getDealerId() {
		return dealerId;
	}

	public void setDealerId(Integer dealerId) {
		this.dealerId = dealerId;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}
	
}
