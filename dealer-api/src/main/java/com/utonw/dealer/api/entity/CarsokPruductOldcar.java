package com.utonw.dealer.api.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * <p>
 * 商品辅表（二手车）
 * </p>
 *
 * @author wangyj
 * @since 2017-05-05
 */
@TableName("carsok_pruduct_oldcar")
public class CarsokPruductOldcar extends Model<CarsokPruductOldcar> {

    private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId(type = IdType.UUID)
	private Integer id;

	/**
	 * 商品ID
	 */
	@TableField(value="pruduct_id")
	private Integer pruductId;

	/**
	 * 品牌
	 */
	@TableField(value="c_brand")
	private String cBrand;

	/**
	 * 车系
	 */
	@TableField(value="c_type")
	private String cType;

	/**
	 * 车型
	 */
	@TableField(value="c_model")
	private String cModel;

	/**
	 * 所在省份
	 */
	private String province;

	/**
	 * 所在市
	 */
	private String city;

	/**
	 * 车辆里程（单位：公里）
	 */
	private Integer miles;

	/**
	 * 首次上牌日期
	 */
	@TableField(value="first_up_time")
	private Date firstUpTime;

	/**
	 * 联系人
	 */
	private String linkman;

	/**
	 * 联系电话
	 */
	private String linkphone;

	/**
	 * 浏览次数
	 */
	@TableField(value="browse_num_times")
	private Integer browseNumTimes;

	/**
	 * 电话联系次数
	 */
	@TableField(value="tel_num_times")
	private Integer telNumTimes;

	/**
	 * 
	 */
	@TableField(value="create_time")
	private Date createTime;

	/**
	 * 
	 */
	@TableField(value="update_time")
	private Date updateTime;

	/**
	 * 
	 */
	@TableField(value="browse_num_times_fake")
	private Integer browseNumTimesFake;

	/**
	 * 保底价
	 */
	private BigDecimal miniprice;

	/**
	 * 定价
	 */
	private BigDecimal price;

	/**
	 * 在售天数
	 */
	@TableField(value="sale_days")
	private Integer saleDays;

	/**
	 * 车牌照号
	 */
	@TableField(value="car_plate")
	private String carPlate;

	/**
	 * 付款方式
	 */
	@TableField(value="payment_method")
	private String paymentMethod;

	/**
	 * 系统评估
	 */
	@TableField(value="system_assess")
	private BigDecimal systemAssess;

	/**
	 * 收车价格
	 */
	private BigDecimal buyprice;

	/**
	 * 整备价格
	 */
	@TableField(value="hostling_cost")
	private BigDecimal hostlingCost;

	/**
	 * 车况评估
	 */
	private String condition;

	/**
	 * 评估师点评
	 */
	private String remark;

	/**
	 * 变数箱
	 */
	@TableField(value="ariable_box")
	private String ariableBox;

	/**
	 * 颜色
	 */
	@TableField(value="car_colour")
	private String carColour;

	/**
	 * 排量
	 */
	private String displacement;

	/**
	 * 室内装置
	 */
	@TableField(value="indoor_type")
	private String indoorType;

	/**
	 * 车身结构
	 */
	@TableField(value="body_structure")
	private String bodyStructure;

	/**
	 * 发动机
	 */
	private String engine;

	/**
	 * 驱动轮
	 */
	@TableField(value="driving_wheel")
	private String drivingWheel;

	/**
	 * 发票价
	 */
	private BigDecimal invoice;




	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getPruductId() {
		return pruductId;
	}

	public void setPruductId(Integer pruductId) {
		this.pruductId = pruductId;
	}

	public String getCBrand() {
		return cBrand;
	}

	public void setCBrand(String cBrand) {
		this.cBrand = cBrand;
	}

	public String getCType() {
		return cType;
	}

	public void setCType(String cType) {
		this.cType = cType;
	}

	public String getCModel() {
		return cModel;
	}

	public void setCModel(String cModel) {
		this.cModel = cModel;
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

	public Integer getMiles() {
		return miles;
	}

	public void setMiles(Integer miles) {
		this.miles = miles;
	}

	public Date getFirstUpTime() {
		return firstUpTime;
	}

	public void setFirstUpTime(Date firstUpTime) {
		this.firstUpTime = firstUpTime;
	}

	public String getLinkman() {
		return linkman;
	}

	public void setLinkman(String linkman) {
		this.linkman = linkman;
	}

	public String getLinkphone() {
		return linkphone;
	}

	public void setLinkphone(String linkphone) {
		this.linkphone = linkphone;
	}

	public Integer getBrowseNumTimes() {
		return browseNumTimes;
	}

	public void setBrowseNumTimes(Integer browseNumTimes) {
		this.browseNumTimes = browseNumTimes;
	}

	public Integer getTelNumTimes() {
		return telNumTimes;
	}

	public void setTelNumTimes(Integer telNumTimes) {
		this.telNumTimes = telNumTimes;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public Integer getBrowseNumTimesFake() {
		return browseNumTimesFake;
	}

	public void setBrowseNumTimesFake(Integer browseNumTimesFake) {
		this.browseNumTimesFake = browseNumTimesFake;
	}

	public BigDecimal getMiniprice() {
		return miniprice;
	}

	public void setMiniprice(BigDecimal miniprice) {
		this.miniprice = miniprice;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public Integer getSaleDays() {
		return saleDays;
	}

	public void setSaleDays(Integer saleDays) {
		this.saleDays = saleDays;
	}

	public String getCarPlate() {
		return carPlate;
	}

	public void setCarPlate(String carPlate) {
		this.carPlate = carPlate;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
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

	public String getAriableBox() {
		return ariableBox;
	}

	public void setAriableBox(String ariableBox) {
		this.ariableBox = ariableBox;
	}

	public String getCarColour() {
		return carColour;
	}

	public void setCarColour(String carColour) {
		this.carColour = carColour;
	}

	public String getDisplacement() {
		return displacement;
	}

	public void setDisplacement(String displacement) {
		this.displacement = displacement;
	}

	public String getIndoorType() {
		return indoorType;
	}

	public void setIndoorType(String indoorType) {
		this.indoorType = indoorType;
	}

	public String getBodyStructure() {
		return bodyStructure;
	}

	public void setBodyStructure(String bodyStructure) {
		this.bodyStructure = bodyStructure;
	}

	public String getEngine() {
		return engine;
	}

	public void setEngine(String engine) {
		this.engine = engine;
	}

	public String getDrivingWheel() {
		return drivingWheel;
	}

	public void setDrivingWheel(String drivingWheel) {
		this.drivingWheel = drivingWheel;
	}

	public BigDecimal getInvoice() {
		return invoice;
	}

	public void setInvoice(BigDecimal invoice) {
		this.invoice = invoice;
	}


	@Override
	protected Serializable pkVal() {
		// TODO Auto-generated method stub
		return id;
	}

}
