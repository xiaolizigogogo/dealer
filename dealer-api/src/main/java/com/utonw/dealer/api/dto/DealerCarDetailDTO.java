package com.utonw.dealer.api.dto;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class DealerCarDetailDTO implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	//车辆id
    private String carId;
    private String carName;
    private String plateNumber;
    private String cBrand;
    private String cType;
    private String cModel; 
    private String miles;
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    private Date firstUpTime;
    private String ariableBox;
    private String carColour;
    private String displacement;
    private String engine;
	public String getCarId() {
		return carId;
	}
	public void setCarId(String carId) {
		this.carId = carId;
	}
	public String getCarName() {
		return carName;
	}
	public void setCarName(String carName) {
		this.carName = carName;
	}
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
	public String getcType() {
		return cType;
	}
	public void setcType(String cType) {
		this.cType = cType;
	}
	public String getcModel() {
		return cModel;
	}
	public void setcModel(String cModel) {
		this.cModel = cModel;
	}
	public String getMiles() {
		return miles;
	}
	public void setMiles(String miles) {
		this.miles = miles;
	}
	
	public Date getFirstUpTime() {
		return firstUpTime;
	}
	public void setFirstUpTime(Date firstUpTime) {
		this.firstUpTime = firstUpTime;
	}
	public String getAriableBox() {
		return ariableBox;
	}
	public void setAriableBox(String ariableBox) {
		this.ariableBox = ariableBox;
	}
	public String getCarColour() {
		return carColour;
	}
	public void setCarColour(String carColour) {
		this.carColour = carColour;
	}
	public String getDisplacement() {
		return displacement;
	}
	public void setDisplacement(String displacement) {
		this.displacement = displacement;
	}
	public String getEngine() {
		return engine;
	}
	public void setEngine(String engine) {
		this.engine = engine;
	}
}
