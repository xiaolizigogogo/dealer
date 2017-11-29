package com.utonw.dealer.api.dto.response;

import java.io.Serializable;

public class RoleForCustomerInfoResponse implements Serializable{

	private String personName;
	private String phoneNumber;
	private String roleName;

	public String getPersonName() {
		return personName;
	}

	public void setPersonName(String personName) {
		this.personName = personName;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

}
