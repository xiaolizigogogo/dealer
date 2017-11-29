package com.utonw.dealer.api.entity.erp;

import java.io.Serializable;

/**
 * @author zhangzheng
 * @date 2017年10月6日下午12:05:52
 */
public class UserDistributionInfo implements Serializable {
	
	 private static final long serialVersionUID = 1L;
	/**
	 * 车行ID
	 */
	private String acountid;
	/**
	 * 列表总数
	 */
	private int total;

	/**
	 * 车行名称
	 */
	private String merchantName;

	/**
	 * 车行位置
	 */
	private String location;

	/**
	 * 车行电话
	 */
	private String merchantPhone;

	/**
	 * 车行车数量
	 */
	private int repertoryNumber;
	
	private String locationNotSplit;

	public String getLocationNotSplit() {
		return locationNotSplit;
	}

	public void setLocationNotSplit(String locationNotSplit) {
		this.locationNotSplit = locationNotSplit;
	}

	public String getAcountid() {
		return acountid;
	}

	public void setAcountid(String acountid) {
		this.acountid = acountid;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public String getMerchantName() {
		return merchantName;
	}

	public void setMerchantName(String merchantName) {
		this.merchantName = merchantName;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getMerchantPhone() {
		return merchantPhone;
	}

	public void setMerchantPhone(String merchantPhone) {
		this.merchantPhone = merchantPhone;
	}

	public int getRepertoryNumber() {
		return repertoryNumber;
	}

	public void setRepertoryNumber(int repertoryNumber) {
		this.repertoryNumber = repertoryNumber;
	}
}
