package com.utonw.dealer.api.dto;

import java.io.Serializable;

/**
 * Created by SEELE on 2017/4/20.
 */
public class AssessDTO implements Serializable{
    private static final long serialVersionUID = 8659454546666220851L;
    /**
     * 商家+车辆信息
     */
    private String acount_id;        //商家ID
    private String indent_number  ;//订单号
    private  String  merchantName;    //商家名
    private  String  province;     //商家地址
    private  String  cModel;  //车型
    private  String  car_plate; //车牌照号
    private  String  miles; //公里数
    private  String  payment_method; //付款方式
    private  String first_up_time;          //购车时间
    private  String system_assess; //系统评估
    private  String buyprice; //收车价格
    private  String hostling_cost; //整备价格
    private  String condition; //车况评估
    private  String remark; //评估师点评
    private  String ariable_box;//变数箱
    private  String car_colour;//颜色
    private  String displacement;//排量
    private  String indoor_type;//室内装置
    private  String body_structure;//车身结构
    private  String engine;//发动机
    private  String driving_wheel;//驱动轮
    private  String invoice;//发票价
    private  String travel_license;//车证审核有效期
    private  String commercial;//是否有商业全险
    private String leave_province;//是否离省

    public String getAcount_id() {
        return acount_id;
    }

    public void setAcount_id(String acount_id) {
        this.acount_id = acount_id;
    }

    public String getIndent_number() {
        return indent_number;
    }

    public void setIndent_number(String indent_number) {
        this.indent_number = indent_number;
    }

    public String getMerchantName() {
        return merchantName;
    }

    public void setMerchantName(String merchantName) {
        this.merchantName = merchantName;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getcModel() {
        return cModel;
    }

    public void setcModel(String cModel) {
        this.cModel = cModel;
    }

    public String getCar_plate() {
        return car_plate;
    }

    public void setCar_plate(String car_plate) {
        this.car_plate = car_plate;
    }

    public String getMiles() {
        return miles;
    }

    public void setMiles(String miles) {
        this.miles = miles;
    }

    public String getPayment_method() {
        return payment_method;
    }

    public void setPayment_method(String payment_method) {
        this.payment_method = payment_method;
    }

    public String getFirst_up_time() {
        return first_up_time;
    }

    public void setFirst_up_time(String first_up_time) {
        this.first_up_time = first_up_time;
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

    public String getCondition() {
        return condition;
    }

    public void setCondition(String condition) {
        this.condition = condition;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
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

    public String getTravel_license() {
        return travel_license;
    }

    public void setTravel_license(String travel_license) {
        this.travel_license = travel_license;
    }

    public String getCommercial() {
        return commercial;
    }

    public void setCommercial(String commercial) {
        this.commercial = commercial;
    }

    public String getLeave_province() {
        return leave_province;
    }

    public void setLeave_province(String leave_province) {
        this.leave_province = leave_province;
    }
}
