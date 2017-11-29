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
 * 
 * </p>
 *
 * @author wangyj
 * @since 2017-07-25
 */
@TableName("carsok_customer_trnure_car")
public class CarsokCustomerTrnureCar extends Model<CarsokCustomerTrnureCar> {

    private static final long serialVersionUID = 1L;

	/**
	 * 自增id
	 */
	@TableId(type = IdType.UUID)
	private Integer id;

	/**
	 * 车辆名称
	 */
	@TableField(value="tenure_carname")
	private String tenureCarname;

	/**
	 * 车辆vin码
	 */
	@TableField(value="tenure_vin")
	private String tenureVin;

	/**
	 * 车牌号
	 */
	@TableField(value="tenure_carnum")
	private String tenureCarnum;

	/**
	 * 出售方式
	 */
	@TableField(value="tenure_cartype")
	private Integer tenureCartype;

	/**
	 * 交强险到期日
	 */
	@TableField(value="tenure_compulsory")
	private Date tenureCompulsory;

	/**
	 * 商业险到期日
	 */
	@TableField(value="tenure_business")
	private Date tenureBusiness;

	/**
	 * 保养到期日
	 */
	@TableField(value="tenure_maintain")
	private Date tenureMaintain;

	/**
	 * 质保到期日
	 */
	@TableField(value="tenure_Warranty")
	private Date tenureWarranty;

	/**
	 * 价格
	 */
	@TableField(value="tenure_carprice")
	private BigDecimal tenureCarprice;

	/**
	 * product  ID
	 */
	@TableField(value="product_id")
	private Integer productId;

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
	 * 标识 1可用 0不可用
	 */
	private Integer enable;

	/**
	 * 销售人
	 */
	@TableField(value="sale_people")
	private String salePeople;

	/**
	 * 公里数
	 */
	@TableField(value="car_males")
	private String carMales;

	/**
	 * 出售时间
	 */
	@TableField(value="sale_time")
	private Date saleTime;

	/**
	 * accountId
	 */
	@TableField(value="account_id")
	private Integer accountId;

	/**
	 * childId
	 */
	@TableField(value="child_id")
	private Integer childId;

	/**
	 * 
	 */
	private String brand;



	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTenureCarname() {
		return tenureCarname;
	}

	public void setTenureCarname(String tenureCarname) {
		this.tenureCarname = tenureCarname;
	}

	public String getTenureVin() {
		return tenureVin;
	}

	public void setTenureVin(String tenureVin) {
		this.tenureVin = tenureVin;
	}

	public String getTenureCarnum() {
		return tenureCarnum;
	}

	public void setTenureCarnum(String tenureCarnum) {
		this.tenureCarnum = tenureCarnum;
	}

	public Integer getTenureCartype() {
		return tenureCartype;
	}

	public void setTenureCartype(Integer tenureCartype) {
		this.tenureCartype = tenureCartype;
	}

	public Date getTenureCompulsory() {
		return tenureCompulsory;
	}

	public void setTenureCompulsory(Date tenureCompulsory) {
		this.tenureCompulsory = tenureCompulsory;
	}

	public Date getTenureBusiness() {
		return tenureBusiness;
	}

	public void setTenureBusiness(Date tenureBusiness) {
		this.tenureBusiness = tenureBusiness;
	}

	public Date getTenureMaintain() {
		return tenureMaintain;
	}

	public void setTenureMaintain(Date tenureMaintain) {
		this.tenureMaintain = tenureMaintain;
	}

	public Date getTenureWarranty() {
		return tenureWarranty;
	}

	public void setTenureWarranty(Date tenureWarranty) {
		this.tenureWarranty = tenureWarranty;
	}

	public BigDecimal getTenureCarprice() {
		return tenureCarprice;
	}

	public void setTenureCarprice(BigDecimal tenureCarprice) {
		this.tenureCarprice = tenureCarprice;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
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

	public Integer getEnable() {
		return enable;
	}

	public void setEnable(Integer enable) {
		this.enable = enable;
	}

	public String getSalePeople() {
		return salePeople;
	}

	public void setSalePeople(String salePeople) {
		this.salePeople = salePeople;
	}

	public String getCarMales() {
		return carMales;
	}

	public void setCarMales(String carMales) {
		this.carMales = carMales;
	}

	public Date getSaleTime() {
		return saleTime;
	}

	public void setSaleTime(Date saleTime) {
		this.saleTime = saleTime;
	}

	public Integer getAccountId() {
		return accountId;
	}

	public void setAccountId(Integer accountId) {
		this.accountId = accountId;
	}

	public Integer getChildId() {
		return childId;
	}

	public void setChildId(Integer childId) {
		this.childId = childId;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}
	@Override
	protected Serializable pkVal() {
		// TODO Auto-generated method stub
		return id;
	}

}
