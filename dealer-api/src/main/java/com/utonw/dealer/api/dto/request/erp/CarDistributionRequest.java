package com.utonw.dealer.api.dto.request.erp;

import java.io.Serializable;

public class CarDistributionRequest implements Serializable {
	private static final long serialVersionUID = 1L;
	/**
	 * 地理位置总字符串
	 */
	private String selCity;
	/**
	 * 页码
	 */
	private Integer pageNum;

	/**
	 * 每页个数
	 */
	private Integer pageSize;
	/**
	 * 车商名称
	 */
	private String merchantName;
	/**
	 * 地理位置省
	 */
	private String province;
	/**
	 * 地理位置城市
	 */
	private String city;
	/**
	 * 地理位置区县
	 */
	private String district;

	public String getSelCity() {
		return selCity;
	}

	public void setSelCity(String selCity) {
		this.selCity = selCity;
	}

	public Integer getPageNum() {
		return pageNum;
	}

	public void setPageNum(Integer pageNum) {
		this.pageNum = pageNum;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}



	public String getMerchantName() {
		return merchantName;
	}

	public void setMerchantName(String merchantName) {
		this.merchantName = merchantName;
	}

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
