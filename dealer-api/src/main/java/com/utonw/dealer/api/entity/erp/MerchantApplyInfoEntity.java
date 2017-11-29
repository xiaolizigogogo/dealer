package com.utonw.dealer.api.entity.erp;

import java.io.Serializable;
import java.util.Date;

public class MerchantApplyInfoEntity implements Serializable{
	
	private static final long serialVersionUID = 1L;
	String dealerId;
	String userId;
	String createId;
	Date createTime;
	


	public String getDealerId() {
		return dealerId;
	}
	public void setDealerId(String dealerId) {
		this.dealerId = dealerId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getCreateId() {
		return createId;
	}
	public void setCreateId(String createId) {
		this.createId = createId;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

}
