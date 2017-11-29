package com.utonw.dealer.api.dto.request.erp;

import java.io.Serializable;
import java.util.List;

public class MerchantInfoTotal implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	List<String> editArr;

	String userName;

	String createId;

	public String getCreateId() {
		return createId;
	}

	public void setCreateId(String createId) {
		this.createId = createId;
	}

	public List<String> getEditArr() {
		return editArr;
	}

	public void setEditArr(List<String> editArr) {
		this.editArr = editArr;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

}
