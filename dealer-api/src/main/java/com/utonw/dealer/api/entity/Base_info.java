package com.utonw.dealer.api.entity;

public class Base_info {
	//acountId
	private int acountId;
	// 经销商名称
	private String merchantName;
	//营业执照号
	private String licenseNumber;
	//组织机构代码
	private String organizationCode;
	//车位个数
	private int carport;
	//库存量
	private int repertory;
	//车商规模
	private String scale;
	//(1.法人代表 2：实际控股人 3：业务联络人 4：金融保险经理 5：财务经理)
	private int positionFo;
	// 姓名
	private String positionNmane;
	//电话
	private String positionPhone;
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
	public int getCarport() {
		return carport;
	}
	public void setCarport(int carport) {
		this.carport = carport;
	}
	public int getRepertory() {
		return repertory;
	}
	public void setRepertory(int repertory) {
		this.repertory = repertory;
	}
	public String getScale() {
		return scale;
	}
	public void setScale(String scale) {
		this.scale = scale;
	}
	public int getPositionFo() {
		return positionFo;
	}
	public void setPositionFo(int positionFo) {
		this.positionFo = positionFo;
	}
	public String getPositionNmane() {
		return positionNmane;
	}
	public void setPositionNmane(String positionNmane) {
		this.positionNmane = positionNmane;
	}
	public String getPositionPhone() {
		return positionPhone;
	}
	public void setPositionPhone(String positionPhone) {
		this.positionPhone = positionPhone;
	}
	public int getAcountId() {
		return acountId;
	}
	public void setAcountId(int acountId) {
		this.acountId = acountId;
	}
	
	
	
	
}
