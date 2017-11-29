package com.utonw.dealer.api.dto.response;

import java.io.Serializable;
import java.util.List;

public class CustomerInfoResponse implements Serializable{

	// 经销商名称
	private String merchantName;
	// 营业执照号
	private String licenseNumber;
	// 组织机构代码
	private String organizationCode;
	// 公司地址
	private String address;
	// 车行介绍
	private String introduce;
	// 车位个数
	private Integer carport;
	// 库存量
	private Integer repertory;
	// 车商规模
	private String scale;
	private String id;
	private String indentNumber;
	//车商位置信息
	private String merchantAddress;
	private List<RoleForCustomerInfoResponse> roleInfo;

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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public Integer getCarport() {
		return carport;
	}

	public void setCarport(Integer carport) {
		this.carport = carport;
	}

	public Integer getRepertory() {
		return repertory;
	}

	public void setRepertory(Integer repertory) {
		this.repertory = repertory;
	}

	public String getScale() {
		return scale;
	}

	public void setScale(String scale) {
		this.scale = scale;
	}

	public List<RoleForCustomerInfoResponse> getRoleInfo() {
		return roleInfo;
	}

	public void setRoleInfo(List<RoleForCustomerInfoResponse> roleInfo) {
		this.roleInfo = roleInfo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getIndentNumber() {
		return indentNumber;
	}

	public void setIndentNumber(String indentNumber) {
		this.indentNumber = indentNumber;
	}

	public String getMerchantAddress() {
		return merchantAddress;
	}

	public void setMerchantAddress(String merchantAddress) {
		this.merchantAddress = merchantAddress;
	}
}
