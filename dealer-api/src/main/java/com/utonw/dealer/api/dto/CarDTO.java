package com.utonw.dealer.api.dto;


import java.io.Serializable;

/**
 * Created by SEELE on 2017/4/20.
 */
public class CarDTO implements Serializable{

    private static final long serialVersionUID = 2490979471151549460L;
    private  String pruductId;//商品id
    private  String ariable_box;//变数箱
    private  String car_colour;//颜色
    private  String displacement;//排量
    private  String indoor_type;//室内装置
    private  String body_structure;//车身结构
    private  String engine;//发动机
    private  String driving_wheel;//驱动轮
    private  String invoice;//发票价
    private  String acountId;
    private String updateBy;//更新人
    private String appraisers_price; //评估师评估价
    private String remark;      //评估师点评
    private String condition; //车况评估
    private String travelLicense;//车身是否在有效期内(0:否 1：是)',
    private String commercial; //商业全险(0:否 1：是)
    private String leaveProvince;//节假日是否驾驶车辆离省(0:否 1：是)
    private String indentId; //订单ID
    private String vin;
    private String taskId;
    private String taskKey;//
    private String braunAssessmentPrice;//博朗评估价格
    private String evaluationurl;
    private String maintainurl;
    private String sn;
    private CarFileDTO carFileDTO;
    private String whetherPass;

    public String getWhetherPass() {
        return whetherPass;
    }

    public void setWhetherPass(String whetherPass) {
        this.whetherPass = whetherPass;
    }

    public CarFileDTO getCarFileDTO() {
        return carFileDTO;
    }

    public void setCarFileDTO(CarFileDTO carFileDTO) {
        this.carFileDTO = carFileDTO;
    }

    public String getSn() {
        return sn;
    }

    public void setSn(String sn) {
        this.sn = sn;
    }

    public String getEvaluationurl() {
        return evaluationurl;
    }

    public void setEvaluationurl(String evaluationurl) {
        this.evaluationurl = evaluationurl;
    }

    public String getMaintainurl() {
        return maintainurl;
    }

    public void setMaintainurl(String maintainurl) {
        this.maintainurl = maintainurl;
    }

    public String getTaskId() {
        return taskId;
    }

    public void setTaskId(String taskId) {
        this.taskId = taskId;
    }

    public String getTaskKey() {
        return taskKey;
    }

    public void setTaskKey(String taskKey) {
        this.taskKey = taskKey;
    }

    public String getVin() {
        return vin;
    }

    public void setVin(String vin) {
        this.vin = vin;
    }

    public String getIndentId() {
        return indentId;
    }

    public void setIndentId(String indentId) {
        this.indentId = indentId;
    }

    public String getLeaveProvince() {
        return leaveProvince;
    }

    public void setLeaveProvince(String leaveProvince) {
        this.leaveProvince = leaveProvince;
    }

    public String getTravelLicense() {
        return travelLicense;
    }

    public void setTravelLicense(String travelLicense) {
        this.travelLicense = travelLicense;
    }

    public String getCommercial() {
        return commercial;
    }

    public void setCommercial(String commercial) {
        this.commercial = commercial;
    }

    public String getAppraisers_price() {
        return appraisers_price;
    }

    public void setAppraisers_price(String appraisers_price) {
        this.appraisers_price = appraisers_price;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getCondition() {
        return condition;
    }

    public void setCondition(String condition) {
        this.condition = condition;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    public String getAcountId() {
        return acountId;
    }

    public void setAcountId(String acountId) {
        this.acountId = acountId;
    }

    public String getPruductId() {
        return pruductId;
    }

    public void setPruductId(String pruductId) {
        this.pruductId = pruductId;
    }

    public String getAriable_box() {
        return ariable_box;
    }

    public void setAriable_box(String ariable_box) {
        this.ariable_box = ariable_box;
    }

    public String getCar_colour() {
        return car_colour;
    }

    public void setCar_colour(String car_colour) {
        this.car_colour = car_colour;
    }

    public String getDisplacement() {
        return displacement;
    }

    public void setDisplacement(String displacement) {
        this.displacement = displacement;
    }

    public String getIndoor_type() {
        return indoor_type;
    }

    public void setIndoor_type(String indoor_type) {
        this.indoor_type = indoor_type;
    }

    public String getBody_structure() {
        return body_structure;
    }

    public void setBody_structure(String body_structure) {
        this.body_structure = body_structure;
    }

    public String getEngine() {
        return engine;
    }

    public void setEngine(String engine) {
        this.engine = engine;
    }

    public String getDriving_wheel() {
        return driving_wheel;
    }

    public void setDriving_wheel(String driving_wheel) {
        this.driving_wheel = driving_wheel;
    }

    public String getInvoice() {
        return invoice;
    }

    public void setInvoice(String invoice) {
        this.invoice = invoice;
    }

	public String getBraunAssessmentPrice() {
		return braunAssessmentPrice;
	}

	public void setBraunAssessmentPrice(String braunAssessmentPrice) {
		this.braunAssessmentPrice = braunAssessmentPrice;
	}
    
}
