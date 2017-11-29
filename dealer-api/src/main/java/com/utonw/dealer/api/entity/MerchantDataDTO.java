package com.utonw.dealer.api.entity;

import java.io.Serializable;
import java.util.Date;

public class MerchantDataDTO implements Serializable{

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;

	private String merchantName;

	private String mobile;

	private Integer repertoryNumber;

	private Date applyDate;

	private String detailedAddress;

	private String realName;

	private String accountName;

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getMerchantName() {
		return merchantName;
	}

	public void setMerchantName(String merchantName) {
		this.merchantName = merchantName;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public Integer getRepertoryNumber() {
		return repertoryNumber;
	}

	public void setRepertoryNumber(Integer repertoryNumber) {
		this.repertoryNumber = repertoryNumber;
	}

	public Date getApplyDate() {
		return applyDate;
	}

	public void setApplyDate(Date applyDate) {
		this.applyDate = applyDate;
	}

	public String getDetailedAddress() {
		return detailedAddress;
	}

	public void setDetailedAddress(String detailedAddress) {
		this.detailedAddress = detailedAddress;
	}
	
}
