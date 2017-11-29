package com.utonw.dealer.api.entity.erp;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

/** 
* @author 作者 WT: 
* @version 创建时间：2017年2月15日 下午9:17:42 
* 查询爱车帮推送给平台的数据
*/
public class SendDateToPlatForm implements Serializable {

	private static final long serialVersionUID = -2523334692816816565L;
	//客户姓名
	private String real_name;
	//手机号
	private String phone;
	//身份证
	private String id_card;
	//借款期限(月)
	private Integer borrow_time;
	//借款利率%
	private Integer borrow_apr;
	//借款总额（元）（100.00）（保留两位小数）
	private BigDecimal borrow_money;
	//还款方式 0等额本息、3到期还本按月付息
	private Integer borrow_style;
	//收款真实身份证号
	private String receiptaccount_id_card;
	//收款真实姓名
	private String receiptaccount_real_name;
	//车辆品牌
	private String car_brand;
	//品牌型号
	private String car_version;
	//车辆颜色
	private String car_color;
	//车辆排量
	private String car_displacement;
	//行驶公里数
	private String car_km;
	//购置时间
	private String car_date;
	//评估价格
	private BigDecimal car_evaluate;
	//评估结论
	private String car_assess;
	//行驶本（0）无、（1）有
	private String car_xsb;
	//身份证（0）无、（1）有
	private String car_card;
	//抵押合同（0）无、（1）有
	private String car_dyht;
	//登记证（0）无、（1）有
	private String car_cciaa;
	//钥匙（0）无、（1）有
	private String car_key;
	//完税证（0）无、（1）有
	private String car_wszm;
	//交强险（0）无、（1）有
	private String car_sali;
	//商业险（0）无、（1）有
	private String car_syx;
	//购买发票（0）无、（1）有
	private String car_invoice;
	//图片
	private List<CarImage> car_image_list;

	public String getReal_name() {
		return real_name;
	}
	public void setReal_name(String real_name) {
		this.real_name = real_name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getId_card() {
		return id_card;
	}
	public void setId_card(String id_card) {
		this.id_card = id_card;
	}
	public Integer getBorrow_time() {
		return borrow_time;
	}
	public void setBorrow_time(Integer borrow_time) {
		this.borrow_time = borrow_time;
	}
	public Integer getBorrow_apr() {
		return borrow_apr;
	}
	public void setBorrow_apr(Integer borrow_apr) {
		this.borrow_apr = borrow_apr;
	}
	public BigDecimal getBorrow_money() {
		return borrow_money;
	}
	public void setBorrow_money(BigDecimal borrow_money) {
		this.borrow_money = borrow_money;
	}
	public Integer getBorrow_style() {
		return borrow_style;
	}
	public void setBorrow_style(Integer borrow_style) {
		this.borrow_style = borrow_style;
	}
	public String getReceiptaccount_id_card() {
		return receiptaccount_id_card;
	}
	public void setReceiptaccount_id_card(String receiptaccount_id_card) {
		this.receiptaccount_id_card = receiptaccount_id_card;
	}
	public String getReceiptaccount_real_name() {
		return receiptaccount_real_name;
	}
	public void setReceiptaccount_real_name(String receiptaccount_real_name) {
		this.receiptaccount_real_name = receiptaccount_real_name;
	}
	public String getCar_brand() {
		return car_brand;
	}
	public void setCar_brand(String car_brand) {
		this.car_brand = car_brand;
	}
	public String getCar_version() {
		return car_version;
	}
	public void setCar_version(String car_version) {
		this.car_version = car_version;
	}
	public String getCar_color() {
		return car_color;
	}
	public void setCar_color(String car_color) {
		this.car_color = car_color;
	}
	public String getCar_displacement() {
		return car_displacement;
	}
	public void setCar_displacement(String car_displacement) {
		this.car_displacement = car_displacement;
	}
	public String getCar_km() {
		return car_km;
	}
	public void setCar_km(String car_km) {
		this.car_km = car_km;
	}
	public String getCar_date() {
		return car_date;
	}
	public void setCar_date(String car_date) {
		this.car_date = car_date;
	}
	public BigDecimal getCar_evaluate() {
		return car_evaluate;
	}
	public void setCar_evaluate(BigDecimal car_evaluate) {
		this.car_evaluate = car_evaluate;
	}
	public String getCar_assess() {
		return car_assess;
	}
	public void setCar_assess(String car_assess) {
		this.car_assess = car_assess;
	}
	public String getCar_xsb() {
		return car_xsb;
	}
	public void setCar_xsb(String car_xsb) {
		this.car_xsb = car_xsb;
	}
	public String getCar_card() {
		return car_card;
	}
	public void setCar_card(String car_card) {
		this.car_card = car_card;
	}
	public String getCar_dyht() {
		return car_dyht;
	}
	public void setCar_dyht(String car_dyht) {
		this.car_dyht = car_dyht;
	}
	public String getCar_cciaa() {
		return car_cciaa;
	}
	public void setCar_cciaa(String car_cciaa) {
		this.car_cciaa = car_cciaa;
	}
	public String getCar_key() {
		return car_key;
	}
	public void setCar_key(String car_key) {
		this.car_key = car_key;
	}
	public String getCar_wszm() {
		return car_wszm;
	}
	public void setCar_wszm(String car_wszm) {
		this.car_wszm = car_wszm;
	}
	public String getCar_sali() {
		return car_sali;
	}
	public void setCar_sali(String car_sali) {
		this.car_sali = car_sali;
	}
	public String getCar_syx() {
		return car_syx;
	}
	public void setCar_syx(String car_syx) {
		this.car_syx = car_syx;
	}
	public String getCar_invoice() {
		return car_invoice;
	}
	public void setCar_invoice(String car_invoice) {
		this.car_invoice = car_invoice;
	}
	public List<CarImage> getCar_image_list() {
		return car_image_list;
	}
	public void setCar_image_list(List<CarImage> car_image_list) {
		this.car_image_list = car_image_list;
	}
}
