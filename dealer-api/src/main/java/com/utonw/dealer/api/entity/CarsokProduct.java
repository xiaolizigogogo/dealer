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
 * 商品
 * </p>
 *
 * @author wangyj
 * @since 2017-05-17
 */
@TableName("carsok_product")
public class CarsokProduct extends Model<CarsokProduct> {

    private static final long serialVersionUID = 1L;

	/**
	 *
	 */
	@TableId(type = IdType.UUID)
	private Integer id;

	/**
	 * 商品编号
	 */
	@TableField(value="product_no")
	private String productNo;

	/**
	 * 名称
	 */
	@TableField(value="product_name")
	private String productName;

	/**
	 * 描述
	 */
	@TableField(value="product_descr")
	private String productDescr;

	/**
	 * 搜索关键词
	 */
	@TableField(value="search_key_words")
	private String searchKeyWords;

	/**
	 * 商品简称
	 */
	@TableField(value="product_short_name")
	private String productShortName;

	/**
	 * 销售价(单位:元，精确到分)
	 */
	private BigDecimal price;

	/**
	 * 保底价(单位:元，精确到分)
	 */
	private BigDecimal miniprice;

	/**
	 * 商品分类 0 商家 1 个人
	 */
	private Integer category;

	/**
	 * 关联个人用户
	 */
	private String openid;

	/**
	 * 账户ID
	 */
	@TableField(value="account_id")
	private Integer accountId;

	/**
	 * 主图ID (废弃)
	 */
	@TableField(value="primary_pic_id")
	private Integer primaryPicId;

	/**
	 * 上架状态 0 下架 1 上架 2 审核中 3审核未通过 4新建待提交审核
	 */
	@TableField(value="on_shelf_status")
	private Integer onShelfStatus;

	/**
	 * 销售状态 0 在售 1售出
	 */
	@TableField(value="sale_status")
	private Integer saleStatus;

	/**
	 * 是否删除 0 未删除 1 删除
	 */
	@TableField(value="is_del")
	private Integer isDel;

	/**
	 * 上架时间
	 */
	@TableField(value="on_shelf_time")
	private Date onShelfTime;

	/**
	 * 下架时间
	 */
	@TableField(value="off_shelf_time")
	private Date offShelfTime;

	/**
	 * 销售人
	 */
	@TableField(value="saled_people")
	private String saledPeople;

	/**
	 * 售出方式（1：全款  2：贷款）
	 */
	@TableField(value="saled_type")
	private Integer saledType;

	/**
	 * 售出价格
	 */
	@TableField(value="saled_price")
	private BigDecimal saledPrice;

	/**
	 * 收车价格
	 */
	private BigDecimal closeingprice;

	/**
	 *
	 */
	private String vin;

	/**
	 *
	 */
	@TableField(value="maintain_info")
	private String maintainInfo;

	/**
	 *
	 */
	@TableField(value="business_if")
	private Integer businessIf;

	/**
	 * 车辆是否已定0，1
	 */
	@TableField(value="reserve_if")
	private Integer reserveIf;

	/**
	 * sale_status更新时间
	 */
	@TableField(value="update_time")
	private Date updateTime;

	/**
	 *
	 */
	@TableField(value="create_time")
	private Date createTime;



	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getProductNo() {
		return productNo;
	}

	public void setProductNo(String productNo) {
		this.productNo = productNo;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductDescr() {
		return productDescr;
	}

	public void setProductDescr(String productDescr) {
		this.productDescr = productDescr;
	}

	public String getSearchKeyWords() {
		return searchKeyWords;
	}

	public void setSearchKeyWords(String searchKeyWords) {
		this.searchKeyWords = searchKeyWords;
	}

	public String getProductShortName() {
		return productShortName;
	}

	public void setProductShortName(String productShortName) {
		this.productShortName = productShortName;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public BigDecimal getMiniprice() {
		return miniprice;
	}

	public void setMiniprice(BigDecimal miniprice) {
		this.miniprice = miniprice;
	}

	public Integer getCategory() {
		return category;
	}

	public void setCategory(Integer category) {
		this.category = category;
	}

	public String getOpenid() {
		return openid;
	}

	public void setOpenid(String openid) {
		this.openid = openid;
	}

	public Integer getAccountId() {
		return accountId;
	}

	public void setAccountId(Integer accountId) {
		this.accountId = accountId;
	}

	public Integer getPrimaryPicId() {
		return primaryPicId;
	}

	public void setPrimaryPicId(Integer primaryPicId) {
		this.primaryPicId = primaryPicId;
	}

	public Integer getOnShelfStatus() {
		return onShelfStatus;
	}

	public void setOnShelfStatus(Integer onShelfStatus) {
		this.onShelfStatus = onShelfStatus;
	}

	public Integer getSaleStatus() {
		return saleStatus;
	}

	public void setSaleStatus(Integer saleStatus) {
		this.saleStatus = saleStatus;
	}

	public Integer getIsDel() {
		return isDel;
	}

	public void setIsDel(Integer isDel) {
		this.isDel = isDel;
	}

	public Date getOnShelfTime() {
		return onShelfTime;
	}

	public void setOnShelfTime(Date onShelfTime) {
		this.onShelfTime = onShelfTime;
	}

	public Date getOffShelfTime() {
		return offShelfTime;
	}

	public void setOffShelfTime(Date offShelfTime) {
		this.offShelfTime = offShelfTime;
	}

	public String getSaledPeople() {
		return saledPeople;
	}

	public void setSaledPeople(String saledPeople) {
		this.saledPeople = saledPeople;
	}

	public Integer getSaledType() {
		return saledType;
	}

	public void setSaledType(Integer saledType) {
		this.saledType = saledType;
	}

	public BigDecimal getSaledPrice() {
		return saledPrice;
	}

	public void setSaledPrice(BigDecimal saledPrice) {
		this.saledPrice = saledPrice;
	}

	public BigDecimal getCloseingprice() {
		return closeingprice;
	}

	public void setCloseingprice(BigDecimal closeingprice) {
		this.closeingprice = closeingprice;
	}

	public String getVin() {
		return vin;
	}

	public void setVin(String vin) {
		this.vin = vin;
	}

	public String getMaintainInfo() {
		return maintainInfo;
	}

	public void setMaintainInfo(String maintainInfo) {
		this.maintainInfo = maintainInfo;
	}

	public Integer getBusinessIf() {
		return businessIf;
	}

	public void setBusinessIf(Integer businessIf) {
		this.businessIf = businessIf;
	}

	public Integer getReserveIf() {
		return reserveIf;
	}

	public void setReserveIf(Integer reserveIf) {
		this.reserveIf = reserveIf;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	@Override
	protected Serializable pkVal() {
		// TODO Auto-generated method stub
		return id;
	}

}
