package com.utonw.dealer.api.entity.erp;

import java.io.Serializable;

public class DistributionUser implements Serializable {
	private static final long serialVersionUID = 1L;
	/**
	 * 分配人员姓名
	 */
	private String userName;

	/**
	 * 省区
	 */
	private String province;

	/**
	 * 城市
	 */
	private String city;
	
	/**
	 * 区
	 */
	private String district;

	public String getCity() {
		return city;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

}
