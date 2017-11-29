package com.utonw.dealer.api.dto;

import java.io.Serializable;

public class RfidCarsProductInfoDTO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 车牌
	 */
	private String plateNumber;
	
	/**
	 * 品牌
	 */
	private String cBrand;
	
	/**
	 * 颜色
	 */
	private String carColour;

	public String getPlateNumber() {
		return plateNumber;
	}

	public void setPlateNumber(String plateNumber) {
		this.plateNumber = plateNumber;
	}

	public String getcBrand() {
		return cBrand;
	}

	public void setcBrand(String cBrand) {
		this.cBrand = cBrand;
	}

	public String getCarColour() {
		return carColour;
	}

	public void setCarColour(String carColour) {
		this.carColour = carColour;
	}
	
	
}
