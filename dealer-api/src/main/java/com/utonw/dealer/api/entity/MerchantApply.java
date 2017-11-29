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
 * 商户申请表
 * </p>
 *
 * @author wangyj
 * @since 2017-05-04
 */
@TableName("merchant_apply")
public class MerchantApply extends Model<MerchantApply> {

    private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId(type = IdType.UUID)
	private String id;

	/**
	 * 商家ID
	 */
	private Long acountid;

	/**
	 * 经销商名称
	 */
	private String merchantname;

	/**
	 * 营业执照号
	 */
	private String licensenumber;

	/**
	 * 组织机构代码
	 */
	private String organizationcode;

	/**
	 * 额度比例
	 */
	private BigDecimal limitpercentage;

	/**
	 * 月利率
	 */
	private BigDecimal monthlyinterest;

	/**
	 * 申请金额
	 */
	private BigDecimal loanlimit;

	/**
	 * 配资车辆数
	 */
	private Integer financingnumber;

	/**
	 * 车位个数
	 */
	private Integer carportnumber;

	/**
	 * 库存量
	 */
	private Integer repertorynumber;

	/**
	 * 车商规模
	 */
	private String scale;

	/**
	 * 申请时间
	 */
	private Date applydate;

	/**
	 * 更新时间
	 */
	private Date updatetime;

	/**
	 * 申请状态(1: 审核通过 2：审核未通过 )
	 */
	private Integer reviewstatus;


	/**
	 *  核实状态 （0：未核实 1：核实）
	 */
     private Integer verifystatus;
	/**
	 * 备注信息
	 */
	private String remark;

	/**
	 * 提交状态（-1：未全部提交 1：已全部提交）erp后台
	 */
	private Integer submitstate;
	
	private String province;
	
	private String city;
	
	private String district;
	
	private BigDecimal maximumloan;

	private String idcard;


	public BigDecimal getMaximumloan() {
		return maximumloan;
	}

	public void setMaximumloan(BigDecimal maximumloan) {
		this.maximumloan = maximumloan;
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

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public Integer getSubmitstate() {
        return submitstate;
    }

    public void setSubmitstate(Integer submitstate) {
        this.submitstate = submitstate;
    }

    public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Long getAcountid() {
		return acountid;
	}

	public void setAcountid(Long acountid) {
		this.acountid = acountid;
	}

	public String getMerchantname() {
		return merchantname;
	}

	public void setMerchantname(String merchantname) {
		this.merchantname = merchantname;
	}

	public String getLicensenumber() {
		return licensenumber;
	}

	public void setLicensenumber(String licensenumber) {
		this.licensenumber = licensenumber;
	}

	public String getOrganizationcode() {
		return organizationcode;
	}

	public void setOrganizationcode(String organizationcode) {
		this.organizationcode = organizationcode;
	}

	public BigDecimal getLimitpercentage() {
		return limitpercentage;
	}

	public void setLimitpercentage(BigDecimal limitpercentage) {
		this.limitpercentage = limitpercentage;
	}

	public BigDecimal getMonthlyinterest() {
		return monthlyinterest;
	}

	public void setMonthlyinterest(BigDecimal monthlyinterest) {
		this.monthlyinterest = monthlyinterest;
	}

	public BigDecimal getLoanlimit() {
		return loanlimit;
	}

	public void setLoanlimit(BigDecimal loanlimit) {
		this.loanlimit = loanlimit;
	}

	public Integer getFinancingnumber() {
		return financingnumber;
	}

	public void setFinancingnumber(Integer financingnumber) {
		this.financingnumber = financingnumber;
	}

	public Integer getCarportnumber() {
		return carportnumber;
	}

	public void setCarportnumber(Integer carportnumber) {
		this.carportnumber = carportnumber;
	}

	public Integer getRepertorynumber() {
		return repertorynumber;
	}

	public void setRepertorynumber(Integer repertorynumber) {
		this.repertorynumber = repertorynumber;
	}

	public String getScale() {
		return scale;
	}

	public void setScale(String scale) {
		this.scale = scale;
	}

	public Date getApplydate() {
		return applydate;
	}

	public void setApplydate(Date applydate) {
		this.applydate = applydate;
	}

	public Date getUpdatetime() {
		return updatetime;
	}

	public void setUpdatetime(Date updatetime) {
		this.updatetime = updatetime;
	}

	public Integer getReviewstatus() {
		return reviewstatus;
	}

	public void setReviewstatus(Integer reviewstatus) {
		this.reviewstatus = reviewstatus;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Integer getVerifystatus() {
		return verifystatus;
	}

	public void setVerifystatus(Integer verifystatus) {
		this.verifystatus = verifystatus;
	}

	public String getIdcard() {
		return idcard;
	}

	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}

	@Override
	protected Serializable pkVal() {
		// TODO Auto-generated method stub
		return id;
	}

	@Override
	public String toString() {
		return "MerchantApply{" +
				"id='" + id + '\'' +
				", acountid=" + acountid +
				", merchantname='" + merchantname + '\'' +
				", licensenumber='" + licensenumber + '\'' +
				", organizationcode='" + organizationcode + '\'' +
				", limitpercentage=" + limitpercentage +
				", monthlyinterest=" + monthlyinterest +
				", loanlimit=" + loanlimit +
				", financingnumber=" + financingnumber +
				", carportnumber=" + carportnumber +
				", repertorynumber=" + repertorynumber +
				", scale='" + scale + '\'' +
				", applydate=" + applydate +
				", updatetime=" + updatetime +
				", reviewstatus=" + reviewstatus +
				", verifystatus=" + verifystatus +
				", remark='" + remark + '\'' +
				", submitstate=" + submitstate +
				", province='" + province + '\'' +
				", city='" + city + '\'' +
				", district='" + district + '\'' +
				", maximumloan=" + maximumloan +
				", idcard='" + idcard + '\'' +
				'}';
	}
}
