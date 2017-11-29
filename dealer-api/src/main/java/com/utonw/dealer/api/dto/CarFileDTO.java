package com.utonw.dealer.api.dto;

import java.io.Serializable;
import java.util.List;

/**
 * Created by SEELE on 2017/5/9.
 */
public class CarFileDTO implements Serializable{
    private static final long serialVersionUID = 4737482153237515414L;
    private List<String> picture; //大照
    private List<String> drivingLicense;//行驶证
    private List<String> identityCard;//原车主身份证
    private List<String> insurance;//保险单
    private List<String> primaryPicUrl;//现车照片
    private List<String> maintenance;//4s维保记录
    private List<String> collectContract;//收车合同
    private List<String> vehicleTradingContract;//车辆交易合同
    private List<String> obd;//OBD
    private List<String> obdBinding;//OBD绑定
    private List<String> steeringWheel;//方向盘
    private List<String> rfid;//rfid照片
    private List<String> licensePlate;//车牌照片
    private List<String> rfidvin;//rfidVin码照片
    private List<String> afterPicture;//过户后大照
    private List<String> afterDrivingLicense;//过户后行驶证
    private List<String> afterLicensePlate;//过户后车牌号

    public List<String> getAfterPicture() {
		return afterPicture;
	}

	public void setAfterPicture(List<String> afterPicture) {
		this.afterPicture = afterPicture;
	}

	public List<String> getAfterDrivingLicense() {
		return afterDrivingLicense;
	}

	public void setAfterDrivingLicense(List<String> afterDrivingLicense) {
		this.afterDrivingLicense = afterDrivingLicense;
	}

	public List<String> getAfterLicensePlate() {
		return afterLicensePlate;
	}

	public void setAfterLicensePlate(List<String> afterLicensePlate) {
		this.afterLicensePlate = afterLicensePlate;
	}

	public List<String> getObd() {
        return obd;
    }

    public void setObd(List<String> obd) {
        this.obd = obd;
    }

    public List<String> getObdBinding() {
        return obdBinding;
    }

    public void setObdBinding(List<String> obdBinding) {
        this.obdBinding = obdBinding;
    }

    public List<String> getSteeringWheel() {
        return steeringWheel;
    }

    public void setSteeringWheel(List<String> steeringWheel) {
        this.steeringWheel = steeringWheel;
    }

    public List<String> getPicture() {
        return picture;
    }

    public void setPicture(List<String> picture) {
        this.picture = picture;
    }

    public List<String> getDrivingLicense() {
        return drivingLicense;
    }

    public void setDrivingLicense(List<String> drivingLicense) {
        this.drivingLicense = drivingLicense;
    }

    public List<String> getIdentityCard() {
        return identityCard;
    }

    public void setIdentityCard(List<String> identityCard) {
        this.identityCard = identityCard;
    }

    public List<String> getInsurance() {
        return insurance;
    }

    public void setInsurance(List<String> insurance) {
        this.insurance = insurance;
    }

    public List<String> getPrimaryPicUrl() {
        return primaryPicUrl;
    }

    public void setPrimaryPicUrl(List<String> primaryPicUrl) {
        this.primaryPicUrl = primaryPicUrl;
    }

    public List<String> getMaintenance() {
        return maintenance;
    }

    public void setMaintenance(List<String> maintenance) {
        this.maintenance = maintenance;
    }

    public List<String> getCollectContract() {
        return collectContract;
    }

    public void setCollectContract(List<String> collectContract) {
        this.collectContract = collectContract;
    }

	public List<String> getVehicleTradingContract() {
		return vehicleTradingContract;
	}

    public List<String> getRfid() {
        return rfid;
    }

    public void setRfid(List<String> rfid) {
        this.rfid = rfid;
    }

    public List<String> getLicensePlate() {
        return licensePlate;
    }

    public void setLicensePlate(List<String> licensePlate) {
        this.licensePlate = licensePlate;
    }

    public List<String> getRfidvin() {
        return rfidvin;
    }

    public void setRfidvin(List<String> rfidvin) {
        this.rfidvin = rfidvin;
    }

    public void setVehicleTradingContract(List<String> vehicleTradingContract) {
		this.vehicleTradingContract = vehicleTradingContract;
	}
    
}
