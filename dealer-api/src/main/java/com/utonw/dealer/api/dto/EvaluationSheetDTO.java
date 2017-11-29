package com.utonw.dealer.api.dto;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * Created by SEELE on 2017/5/9.
 */
public class EvaluationSheetDTO implements Serializable{
    private static final long serialVersionUID = 3190281014439782745L;
    private String oldcar_id;
    private String acountId;
    private String system_assess;//系统评估价格
    private String buyprice;//收车价格
    private String hostling_cost;//整备价格
    private String custom_limit;//  贷款额度
    private String vin;
    private CarFileDTO carFileDTO;
    private String orderStr;
    private String  evaluationUrl;
    private String  plateNumber;
    private String  whetherPass;
    private String  indentId;

    public String getIndentId() {
        return indentId;
    }

    public void setIndentId(String indentId) {
        this.indentId = indentId;
    }

    public String getWhetherPass() {
        return whetherPass;
    }

    public void setWhetherPass(String whetherPass) {
        this.whetherPass = whetherPass;
    }

    public String getPlateNumber() {
        return plateNumber;
    }

    public void setPlateNumber(String plateNumber) {
        this.plateNumber = plateNumber;
    }

    public String getEvaluationUrl() {
        return evaluationUrl;
    }

    public void setEvaluationUrl(String evaluationUrl) {
        this.evaluationUrl = evaluationUrl;
    }

    /**
     * @Fields deadlineTime : 还款周期
     */
    private int deadlineTime;
    
    /**
     * @Fields interestRate : 利率
     */
    private BigDecimal interestRate;
    
    /**
     * @Fields isLegalPerson : 是否为法人
     */
    private int isLegalPerson;
    
    /**
     * @Fields videoUrl : 视频地址
     */
    private String videoUrl;

    public String getOrderStr() {
        return orderStr;
    }

    public void setOrderStr(String orderStr) {
        this.orderStr = orderStr;
    }

    public String getVin() {
        return vin;
    }

    public void setVin(String vin) {
        this.vin = vin;
    }

    public String getAcountId() {
        return acountId;
    }

    public void setAcountId(String acountId) {
        this.acountId = acountId;
    }

    public String getOldcar_id() {
        return oldcar_id;
    }

    public void setOldcar_id(String oldcar_id) {
        this.oldcar_id = oldcar_id;
    }

    public String getSystem_assess() {
        return system_assess;
    }

    public void setSystem_assess(String system_assess) {
        this.system_assess = system_assess;
    }

    public String getBuyprice() {
        return buyprice;
    }

    public void setBuyprice(String buyprice) {
        this.buyprice = buyprice;
    }

    public String getHostling_cost() {
        return hostling_cost;
    }

    public void setHostling_cost(String hostling_cost) {
        this.hostling_cost = hostling_cost;
    }

    public String getCustom_limit() {
        return custom_limit;
    }

    public void setCustom_limit(String custom_limit) {
        this.custom_limit = custom_limit;
    }

    public CarFileDTO getCarFileDTO() {
        return carFileDTO;
    }

    public void setCarFileDTO(CarFileDTO carFileDTO) {
        this.carFileDTO = carFileDTO;
    }

	public int getDeadlineTime() {
		return deadlineTime;
	}

	public void setDeadlineTime(int deadlineTime) {
		this.deadlineTime = deadlineTime;
	}

	public BigDecimal getInterestRate() {
		return interestRate;
	}

	public void setInterestRate(BigDecimal interestRate) {
		this.interestRate = interestRate;
	}

	public int getIsLegalPerson() {
		return isLegalPerson;
	}

	public void setIsLegalPerson(int isLegalPerson) {
		this.isLegalPerson = isLegalPerson;
	}

	public String getVideoUrl() {
		return videoUrl;
	}

	public void setVideoUrl(String videoUrl) {
		this.videoUrl = videoUrl;
	}
	
}
