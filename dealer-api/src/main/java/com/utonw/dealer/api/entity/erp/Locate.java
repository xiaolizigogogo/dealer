package com.utonw.dealer.api.entity.erp;

import java.io.Serializable;

public class Locate implements Serializable {
	private static final long serialVersionUID = 1L;

	private String province;

	private String city;

	private String district;

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return city;
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
}
