package com.utonw.dealer.api.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by SEELE on 2017/5/6.
 */
@TableName("Assess")
public class Assess implements Serializable {

    private static final long serialVersionUID = -726362002033770500L;
     private String city;
     private String merchant_address;
    private String indentNumber  ;//订单号
    private  String  product_name;
    private String merchant_name;
    private  String  province;     //商家地址
    private  String  car_plate; //车牌照号
    private  Integer  miles; //公里数
    private  String  payment_method; //付款方式
    private  Date on_shelf_time;          //购车时间
    private  BigDecimal systemAssess; //系统评估
    private  BigDecimal buyprice; //收车价格
    private  BigDecimal hostlingCost; //整备价格
    private String mobile;
    private Long  merchantId;
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
    private  BigDecimal  invoice; // 发票价
    private Integer  travelLicense;// 行驶证(0:否 1：是)
    private Integer  commercial; // 商业全险(0:否 1：是)
    private Integer  leaveProvince; // 离省(0:否 1：是)
    private Integer  appraisersPrice; // 评估师评估价

    public Integer getAppraisersPrice() {
        return appraisersPrice;
    }

    public void setAppraisersPrice(Integer appraisersPrice) {
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

    public BigDecimal getInvoice() {
        return invoice;
    }

    public void setInvoice(BigDecimal invoice) {
        this.invoice = invoice;
    }

    public Integer getTravelLicense() {
        return travelLicense;
    }

    public void setTravelLicense(Integer travelLicense) {
        this.travelLicense = travelLicense;
    }

    public Integer getCommercial() {
        return commercial;
    }

    public void setCommercial(Integer commercial) {
        this.commercial = commercial;
    }

    public Integer getLeaveProvince() {
        return leaveProvince;
    }

    public void setLeaveProvince(Integer leaveProvince) {
        this.leaveProvince = leaveProvince;
    }

    public String getVin() {
        return vin;
    }

    public void setVin(String vin) {
        this.vin = vin;
    }

    public Long getMerchantId() {
        return merchantId;
    }

    public void setMerchantId(Long merchantId) {
        this.merchantId = merchantId;
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

    public String getCar_plate() {
        return car_plate;
    }

    public void setCar_plate(String car_plate) {
        this.car_plate = car_plate;
    }

    public Integer getMiles() {
        return miles;
    }

    public void setMiles(Integer miles) {
        this.miles = miles;
    }

    public String getPayment_method() {
        return payment_method;
    }

    public void setPayment_method(String payment_method) {
        this.payment_method = payment_method;
    }

    public Date getOn_shelf_time() {
        return on_shelf_time;
    }

    public void setOn_shelf_time(Date on_shelf_time) {
        this.on_shelf_time = on_shelf_time;
    }

    public BigDecimal getSystemAssess() {
        return systemAssess;
    }

    public void setSystemAssess(BigDecimal systemAssess) {
        this.systemAssess = systemAssess;
    }

    public BigDecimal getBuyprice() {
        return buyprice;
    }

    public void setBuyprice(BigDecimal buyprice) {
        this.buyprice = buyprice;
    }

    public BigDecimal getHostlingCost() {
        return hostlingCost;
    }

    public void setHostlingCost(BigDecimal hostlingCost) {
        this.hostlingCost = hostlingCost;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

}
