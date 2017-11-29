package com.utonw.dealer.api.entity;

import com.utonw.dealer.api.entity.erp.MonitoringEquipmentInfo;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

public class CarsokAcountDTO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * 唯一标识
	 */
	private String id;
	
	/*
	 * 商户名称
	 */
	private String merchantName;
	
	/*
	 * 车商电话
	 */
	private String  mobile;
	
	/*
	 * 车位个数
	 */
	private Integer carPortNumber;
	
	/*
	 * 库存规模
	 */
	private Integer merchantSize;
	
	/*
	 * 最高贷款额
	 */
	private BigDecimal maximumLoan;

	private List<MonitoringEquipmentInfo> monInfoList;

	private Integer monInfoListSize;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public List<MonitoringEquipmentInfo> getMonInfoList() {
		return monInfoList;
	}

	public void setMonInfoList(List<MonitoringEquipmentInfo> monInfoList) {
		this.monInfoList = monInfoList;
	}

	public Integer getMonInfoListSize() {
		return monInfoListSize;
	}

	public void setMonInfoListSize(Integer monInfoListSize) {
		this.monInfoListSize = monInfoListSize;
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

	public Integer getCarPortNumber() {
		return carPortNumber;
	}

	public void setCarPortNumber(Integer carPortNumber) {
		this.carPortNumber = carPortNumber;
	}

	public Integer getMerchantSize() {
		return merchantSize;
	}

	public void setMerchantSize(Integer merchantSize) {
		this.merchantSize = merchantSize;
	}

	public BigDecimal getMaximumLoan() {
		return maximumLoan;
	}

	public void setMaximumLoan(BigDecimal maximumLoan) {
		this.maximumLoan = maximumLoan;
	}
	
	

}
