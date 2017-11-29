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
 * @since 2017-05-12
 */
@TableName("merchant_indent")
public class MerchantIndent extends Model<MerchantIndent> {

	private static final long serialVersionUID = 1L;

	/**
	 *
	 */
	@TableId(type = IdType.UUID)
	private String id;

	/**
	 * 车商 ID
	 */
	@TableField(value="acount_id")
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
   @TableField(value="interest_rate")
   private BigDecimal interestRate;
   
   /**
    * @Fields isLegalPerson : 是否为法人0、否  1、是
    */
	private int islegalperson;
	
	/**
	 * @Fields video_url : 视频地址
	 */
	@TableField(value="video_url")
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
	/**
	 * obd 绑定状态
	 */
     private String obdstate;
	/**
	 * repaymentime 还款时间
	 */
	private Date repaymentime;
	/**
	 * superviseType 监管类型
	 */
	private String supervisetype;
	@TableField(value="afterPlatenumber")
	private String afterPlatenumber;
	
	public String getAfterPlatenumber() {
		return afterPlatenumber;
	}

	public void setAfterPlatenumber(String afterPlatenumber) {
		this.afterPlatenumber = afterPlatenumber;
	}

	public Date getRepaymentime() {
		return repaymentime;
	}

	public void setRepaymentime(Date repaymentime) {
		this.repaymentime = repaymentime;
	}

	public String getSupervisetype() {
		return supervisetype;
	}

	public void setSupervisetype(String supervisetype) {
		this.supervisetype = supervisetype;
	}

	public String getObdstate() {
		return obdstate;
	}

	public void setObdstate(String obdstate) {
		this.obdstate = obdstate;
	}

	public Date getOutAccountTime() {
        return outAccountTime;
    }

    public void setOutAccountTime(Date outAccountTime) {
        this.outAccountTime = outAccountTime;
    }

    public String getPlatenumber() {
		return platenumber;
	}

	public void setPlatenumber(String platenumber) {
		this.platenumber = platenumber;
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

	public Integer getDeadlinetime() {
		return deadlinetime;
	}

	public void setDeadlinetime(Integer deadlinetime) {
		this.deadlinetime = deadlinetime;
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

	public Date getCreatedtime() {
		return createdtime;
	}

	public void setCreatedtime(Date createdtime) {
		this.createdtime = createdtime;
	}

	public Date getUpdatetime() {
		return updatetime;
	}

	public String getIndentstate() {
		return indentstate;
	}

	public void setIndentstate(String indentstate) {
		this.indentstate = indentstate;
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
	
	public BigDecimal getInterestRate() {
		return interestRate;
	}

	public void setInterestRate(BigDecimal interestRate) {
		this.interestRate = interestRate;
	}

	public static long getSerialVersionUID() {
		return serialVersionUID;
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

	@Override
	protected Serializable pkVal() {
		// TODO Auto-generated method stub
		return id;
	}

	@Override
	public String toString() {
		return "MerchantIndent [id=" + id + ", acountId=" + acountId + ", productid=" + productid + ", indentnumber="
				+ indentnumber + ", indentstate=" + indentstate + ", createdtime=" + createdtime + ", updatetime="
				+ updatetime + ", applymoney=" + applymoney + ", judgemoney=" + judgemoney + ", deadlinetime="
				+ deadlinetime + ", interestRate=" + interestRate + ", islegalperson=" + islegalperson + ", videoUrl="
				+ videoUrl + "]";
	}

}
