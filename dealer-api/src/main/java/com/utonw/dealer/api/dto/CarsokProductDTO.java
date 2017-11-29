package com.utonw.dealer.api.dto;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 合同
 *
 * @author wangyj
 * @since 2017-07-26
 */
public class CarsokProductDTO implements Serializable{

    private static final long serialVersionUID = 1L;

	/**
	 * ${field.comment}
	 */
	private String invoice;

	/**
	 * ${field.comment}
	 */
	private String cBrand;

	/**
	 * ${field.comment}
	 */
	private String cModel;

	/**
	 * ${field.comment}
	 */
	private Integer miles;

	/**
	 * ${field.comment}
	 */
	private Date firstUpTime;

	/**
	 * ${field.comment}
	 */
	private String ariableBox;

	/**
	 * ${field.comment}
	 */
	private String carColour;

	/**
	 * ${field.comment}
	 */
	private String displacement;

	/**
	 * ${field.comment}
	 */
	private String indoorType;

	/**
	 * ${field.comment}
	 */
	private String bodyStructure;

	/**
	 * ${field.comment}
	 */
	private String engine;

	/**
	 * ${field.comment}
	 */
	private String drivingWheel;

	/**
	 * ${field.comment}
	 */
	private String tenureCarnum;

	/**
	 * ${field.comment}
	 */
	private String dealerAddress;

	/**
	 * ${field.comment}
	 */
	private String merchantName;

	/**
	 * ${field.comment}
	 */
	private String licenseNumber;

	/**
	 * ${field.comment}
	 */
	private String organizationCode;

	/**
	 * ${field.comment}
	 */
	private Integer carPortNumber;

	/**
	 * ${field.comment}
	 */
	private Integer repertoryNumber;

	/**
	 * ${field.comment}
	 */
	private String scale;

	/**
	 * ${field.comment}
	 */
	private String personName1;

	/**
	 * ${field.comment}
	 */
	private String personName2;

	/**
	 * ${field.comment}
	 */
	private String personName3;

	/**
	 * ${field.comment}
	 */
	private String personName4;

	/**
	 * ${field.comment}
	 */
	private String personName5;
	
	/**
	 * ${field.comment}
	 */
	private String contractPath;
	
	/**
	 * ${field.comment}
	 */
	private String id;
	
	/**
	 * ${field.comment}
	 */
	private String contractNum;
	
	/**
	 * ${field.comment}
	 */
	private String merchantDescr;

	private String plateNumber;
	
	private BigDecimal  judgeMoney;
	

	public BigDecimal getJudgeMoney() {
		return judgeMoney;
	}

	public void setJudgeMoney(BigDecimal judgeMoney) {
		this.judgeMoney = judgeMoney;
	}

	public String getPlateNumber() {
		return plateNumber;
	}

	public void setPlateNumber(String plateNumber) {
		this.plateNumber = plateNumber;
	}

	public String getInvoice() {
		return invoice;
	}

	public void setInvoice(String invoice) {
		this.invoice = invoice;
	}

	public String getcBrand() {
		return cBrand;
	}

	public void setcBrand(String cBrand) {
		this.cBrand = cBrand;
	}

	public String getcModel() {
		return cModel;
	}

	public void setcModel(String cModel) {
		this.cModel = cModel;
	}

	public Integer getMiles() {
		return miles;
	}

	public void setMiles(Integer miles) {
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

	public String getBodyStructure() {
		return bodyStructure;
	}

	public void setBodyStructure(String bodyStructure) {
		this.bodyStructure = bodyStructure;
	}

	public String getDisplacement() {
		return displacement;
	}

	public void setDisplacement(String displacement) {
		this.displacement = displacement;
	}

	public String getCarColour() {
		return carColour;
	}

	public void setCarColour(String carColour) {
		this.carColour = carColour;
	}

	public String getDealerAddress() {
		return dealerAddress;
	}

	public void setDealerAddress(String dealerAddress) {
		this.dealerAddress = dealerAddress;
	}

	public String getEngine() {
		return engine;
	}

	public void setEngine(String engine) {
		this.engine = engine;
	}

	public String getIndoorType() {
		return indoorType;
	}

	public void setIndoorType(String indoorType) {
		this.indoorType = indoorType;
	}

	public String getDrivingWheel() {
		return drivingWheel;
	}

	public void setDrivingWheel(String drivingWheel) {
		this.drivingWheel = drivingWheel;
	}

	public String getTenureCarnum() {
		return tenureCarnum;
	}

	public void setTenureCarnum(String tenureCarnum) {
		this.tenureCarnum = tenureCarnum;
	}

	public String getMerchantName() {
		return merchantName;
	}

	public void setMerchantName(String merchantName) {
		this.merchantName = merchantName;
	}

	public String getLicenseNumber() {
		return licenseNumber;
	}

	public void setLicenseNumber(String licenseNumber) {
		this.licenseNumber = licenseNumber;
	}

	public String getOrganizationCode() {
		return organizationCode;
	}

	public void setOrganizationCode(String organizationCode) {
		this.organizationCode = organizationCode;
	}

	public Integer getCarPortNumber() {
		return carPortNumber;
	}

	public void setCarPortNumber(Integer carPortNumber) {
		this.carPortNumber = carPortNumber;
	}

	public Integer getRepertoryNumber() {
		return repertoryNumber;
	}

	public void setRepertoryNumber(Integer repertoryNumber) {
		this.repertoryNumber = repertoryNumber;
	}

	public String getScale() {
		return scale;
	}

	public void setScale(String scale) {
		this.scale = scale;
	}

	public String getPersonName1() {
		return personName1;
	}

	public void setPersonName1(String personName1) {
		this.personName1 = personName1;
	}

	public String getPersonName2() {
		return personName2;
	}

	public void setPersonName2(String personName2) {
		this.personName2 = personName2;
	}

	public String getPersonName3() {
		return personName3;
	}

	public void setPersonName3(String personName3) {
		this.personName3 = personName3;
	}

	public String getPersonName4() {
		return personName4;
	}

	public void setPersonName4(String personName4) {
		this.personName4 = personName4;
	}

	public String getPersonName5() {
		return personName5;
	}

	public void setPersonName5(String personName5) {
		this.personName5 = personName5;
	}

	public String getContractPath() {
		return contractPath;
	}

	public void setContractPath(String contractPath) {
		this.contractPath = contractPath;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	public String getContractNum() {
		return contractNum;
	}

	public void setContractNum(String contractNum) {
		this.contractNum = contractNum;
	}

	public String getMerchantDescr() {
		return merchantDescr;
	}

	public void setMerchantDescr(String merchantDescr) {
		this.merchantDescr = merchantDescr;
	}

}
