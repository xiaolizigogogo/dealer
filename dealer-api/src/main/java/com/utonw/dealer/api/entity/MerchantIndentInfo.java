package com.utonw.dealer.api.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class MerchantIndentInfo implements  Serializable {

	private static final long serialVersionUID = 1L;

	/**
	 *
	 */
	private String id;

	/**
	 * 车商 ID
	 */
	private Long acountId;

	/**
	 * 车id
	 */
	private Integer productid;

	/**
	 * 订单号
	 */
	private String indentnumber;

	/**
	 * 1:已放款 2：审核通过 3：放款申请已提交 4：车辆信息已审核通过
	 */
	private String indentstate;

	/**
	 * 创建时间
	 */
	private Date createdtime;

	/**
	 *
	 */
	private Date updatetime;

	/**
	 * 借款金额
	 */
	private BigDecimal applymoney;

	/**
	 * 终审金额
	 */
	private BigDecimal judgemoney;

	/**
	 * 期限
	 * @return
	 */
   private Integer deadlinetime;
   
   /**
 	* @Fields interestRate : 利率
	*/
   private BigDecimal interestRate;
   
   /**
    * @Fields isLegalPerson : 是否为法人0、否  1、是
    */
	private int islegalperson;
	
	/**
	 * @Fields video_url : 视频地址
	 */
	private String videoUrl;

	/**
	 * @Fields whetherpass : pass:同过，noPass:拒绝
	 */
	private String whetherpass;

	/**
	 * @Fields rejectremarks : 拒绝原因
	 */
	private String rejectremarks;
	/**
	 * @Fields plateNumbe : 车牌号
	 */
	private String platenumber;
	/**
	 * @Fields outAccountTime : 出账时间
	 */
	private Date outAccountTime;
	
	private String merchantName;
	
	private String carBrand;
	private String carType;
	private String vin;
	
	public String getCarBrand() {
		return carBrand;
	}
	public void setCarBrand(String carBrand) {
		this.carBrand = carBrand;
	}
	public String getCarType() {
		return carType;
	}
	public void setCarType(String carType) {
		this.carType = carType;
	}
	public String getVin() {
		return vin;
	}
	public void setVin(String vin) {
		this.vin = vin;
	}
	public String getMerchantName() {
		return merchantName;
	}
	public void setMerchantName(String merchantName) {
		this.merchantName = merchantName;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Long getAcountId() {
		return acountId;
	}
	public void setAcountId(Long acountId) {
		this.acountId = acountId;
	}
	public Integer getProductid() {
		return productid;
	}
	public void setProductid(Integer productid) {
		this.productid = productid;
	}
	public String getIndentnumber() {
		return indentnumber;
	}
	public void setIndentnumber(String indentnumber) {
		this.indentnumber = indentnumber;
	}
	public String getIndentstate() {
		return indentstate;
	}
	public void setIndentstate(String indentstate) {
		this.indentstate = indentstate;
	}
	public Date getCreatedtime() {
		return createdtime;
	}
	public void setCreatedtime(Date createdtime) {
		this.createdtime = createdtime;
	}
	public Date getUpdatetime() {
		return updatetime;
	}
	public void setUpdatetime(Date updatetime) {
		this.updatetime = updatetime;
	}
	public BigDecimal getApplymoney() {
		return applymoney;
	}
	public void setApplymoney(BigDecimal applymoney) {
		this.applymoney = applymoney;
	}
	public BigDecimal getJudgemoney() {
		return judgemoney;
	}
	public void setJudgemoney(BigDecimal judgemoney) {
		this.judgemoney = judgemoney;
	}
	public Integer getDeadlinetime() {
		return deadlinetime;
	}
	public void setDeadlinetime(Integer deadlinetime) {
		this.deadlinetime = deadlinetime;
	}
	public BigDecimal getInterestRate() {
		return interestRate;
	}
	public void setInterestRate(BigDecimal interestRate) {
		this.interestRate = interestRate;
	}
	public int getIslegalperson() {
		return islegalperson;
	}
	public void setIslegalperson(int islegalperson) {
		this.islegalperson = islegalperson;
	}
	public String getVideoUrl() {
		return videoUrl;
	}
	public void setVideoUrl(String videoUrl) {
		this.videoUrl = videoUrl;
	}
	public String getWhetherpass() {
		return whetherpass;
	}
	public void setWhetherpass(String whetherpass) {
		this.whetherpass = whetherpass;
	}
	public String getRejectremarks() {
		return rejectremarks;
	}
	public void setRejectremarks(String rejectremarks) {
		this.rejectremarks = rejectremarks;
	}
	public String getPlatenumber() {
		return platenumber;
	}
	public void setPlatenumber(String platenumber) {
		this.platenumber = platenumber;
	}
	public Date getOutAccountTime() {
		return outAccountTime;
	}
	public void setOutAccountTime(Date outAccountTime) {
		this.outAccountTime = outAccountTime;
	}
	
	
}
