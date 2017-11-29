package com.utonw.dealer.api.dto;

import java.io.Serializable;
import java.util.List;

/**
 * Created by SEELE on 2017/4/20.
 */
public class ApplyMoneyDTO implements Serializable{
    private static final long serialVersionUID = -1681371325294661956L;
    private  String acountId;//车商ID
    private  String merchantName;//经销商名称
    private  String license_number;//营业执照号
    private  String organization_code;//组织机构代码
    private String carPortNumber;//车位个数
    private String repertoryNumber;//库存量
    private String scale;//车商规模
    private String remark;//备注信息
	private String province;
	private String city;
	private String district;
	private String detailed_address;//车商gps
    private String street;//街道
	private String taskId;//任务ID
    private String  applyId;//订单ID
    private String taskKey;//任务节点英文
    private String userUuid;//登陆ID
    private String videoUrl;
    private String offline_staff;//线下gps
    private String videoId;//视频ID
    private String regionId;//地区表ID
    private String xxregionId;//线下人员地区表ID
    private String dealer_address;//车商地址
    private String idcard;


    public String getXxregionId() {
        return xxregionId;
    }

    public void setXxregionId(String xxregionId) {
        this.xxregionId = xxregionId;
    }

    public String getDealer_address() {
        return dealer_address;
    }

    public void setDealer_address(String dealer_address) {
        this.dealer_address = dealer_address;
    }

    public String getVideoId() {
        return videoId;
    }

    public void setVideoId(String videoId) {
        this.videoId = videoId;
    }

    public String getRegionId() {
        return regionId;
    }

    public void setRegionId(String regionId) {
        this.regionId = regionId;
    }

    public String getOffline_staff() {
        return offline_staff;
    }

    public void setOffline_staff(String offline_staff) {
        this.offline_staff = offline_staff;
    }

    public String getDetailed_address() {
        return detailed_address;
    }

    public void setDetailed_address(String detailed_address) {
        this.detailed_address = detailed_address;
    }

    public String getVideoUrl() {
        return videoUrl;
    }

    public void setVideoUrl(String videoUrl) {
        this.videoUrl = videoUrl;
    }

    public String getApplyId() {
        return applyId;
    }

    public void setApplyId(String applyId) {
        this.applyId = applyId;
    }

    public String getTaskKey() {
        return taskKey;
    }

    public void setTaskKey(String taskKey) {
        this.taskKey = taskKey;
    }

    public String getUserUuid() {
        return userUuid;
    }

    public void setUserUuid(String userUuid) {
        this.userUuid = userUuid;
    }

    public String getTaskId() {
        return taskId;
    }

    public void setTaskId(String taskId) {
        this.taskId = taskId;
    }

    private List<ContactPersonDTO> Person;

    public String getProvince() {

		return province;
	}
    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
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

	public String getAcountId() {
        return acountId;
    }

    public void setAcountId(String acountId) {
        this.acountId = acountId;
    }

    public String getMerchantName() {
        return merchantName;
    }

    public void setMerchantName(String merchantName) {
        this.merchantName = merchantName;
    }

    public String getLicense_number() {
        return license_number;
    }

    public void setLicense_number(String license_number) {
        this.license_number = license_number;
    }

    public String getOrganization_code() {
        return organization_code;
    }

    public void setOrganization_code(String organization_code) {
        this.organization_code = organization_code;
    }

    public List<ContactPersonDTO> getPerson() {
        return Person;
    }

    public void setPerson(List<ContactPersonDTO> person) {
        Person = person;
    }

    public String getCarPortNumber() {
        return carPortNumber;
    }

    public void setCarPortNumber(String carPortNumber) {
        this.carPortNumber = carPortNumber;
    }

    public String getRepertoryNumber() {
        return repertoryNumber;
    }

    public void setRepertoryNumber(String repertoryNumber) {
        this.repertoryNumber = repertoryNumber;
    }

    public String getScale() {
        return scale;
    }

    public void setScale(String scale) {
        this.scale = scale;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getIdcard() {
        return idcard;
    }

    public void setIdcard(String idcard) {
        this.idcard = idcard;
    }
}
