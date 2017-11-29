package com.utonw.dealer.api.dto;

import java.io.Serializable;

/**
 * Created by SEELE on 2017/5/23.
 */
public class CarAssessDTO  implements Serializable{
    private static final long serialVersionUID = 3286416947102806634L;
    private String indentNumber;             // -- 订单编号
    private String product_name;             // -- 车名称
    private String merchant_name;           //-- 商户名称
    private String province;          // -- 商户所在省份
    private String city;                   // -- 商户所在市
    private String merchant_address;       // -- 商户详细地址
    private String mobile;                 // -- 商户电话
    private String car_plate;             // -- 车牌照号
    private String miles;         // -- 车辆里程（单位：公里）
    private String payment_method;       // -- 付款方式
    private String on_shelf_time;   //  -- 首次上牌日
    private String systemAssess;  //-- 系统评估价
    private String buyprice;   //手车价
    private String hostlingCost; // 整备价
    private String acountId;
    private String vin;
    private String condition; //车况评估
    private String  remark; //评估师点评
    private String ariable_box;// 变数箱
    private String car_colour;// 颜色
    private String displacement; // 排量
    private String  body_structure;// 车身结构
    private String indoor_type; // 室内装置
    private String engine; // 发动机
    private String driving_wheel; // 驱动轮
    private String  invoice; // 发票价
    private String  travelLicense;// 行驶证(0:否 1：是)
    private String  commercial; // 商业全险(0:否 1：是)
    private String  leaveProvince; // 离省(0:否 1：是)
    private String  appraisersPrice; // 评估师评估价

    public String getAppraisersPrice() {
        return appraisersPrice;
    }

    public void setAppraisersPrice(String appraisersPrice) {
        this.appraisersPrice = appraisersPrice;
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

    public String getBody_structure() {
        return body_structure;
    }

    public void setBody_structure(String body_structure) {
        this.body_structure = body_structure;
    }

    public String getIndoor_type() {
        return indoor_type;
    }

    public void setIndoor_type(String indoor_type) {
        this.indoor_type = indoor_type;
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

    public String getLeaveProvince() {
        return leaveProvince;
    }

    public void setLeaveProvince(String leaveProvince) {
        this.leaveProvince = leaveProvince;
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

    public String getIndentNumber() {
        return indentNumber;
    }

    public void setIndentNumber(String indentNumber) {
        this.indentNumber = indentNumber;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getMerchant_name() {
        return merchant_name;
    }

    public void setMerchant_name(String merchant_name) {
        this.merchant_name = merchant_name;
    }

    public String getProvince() {
        return province;
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

    public String getMerchant_address() {
        return merchant_address;
    }

    public void setMerchant_address(String merchant_address) {
        this.merchant_address = merchant_address;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
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

    public String getOn_shelf_time() {
        return on_shelf_time;
    }

    public void setOn_shelf_time(String on_shelf_time) {
        this.on_shelf_time = on_shelf_time;
    }

    public String getSystemAssess() {
        return systemAssess;
    }

    public void setSystemAssess(String systemAssess) {
        this.systemAssess = systemAssess;
    }

    public String getBuyprice() {
        return buyprice;
    }

    public void setBuyprice(String buyprice) {
        this.buyprice = buyprice;
    }

    public String getHostlingCost() {
        return hostlingCost;
    }

    public void setHostlingCost(String hostlingCost) {
        this.hostlingCost = hostlingCost;
    }
}
