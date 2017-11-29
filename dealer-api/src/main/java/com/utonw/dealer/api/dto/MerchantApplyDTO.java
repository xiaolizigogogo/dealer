package com.utonw.dealer.api.dto;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by SEELE on 2017/6/26.
 */
public class MerchantApplyDTO implements Serializable{

    private static final long serialVersionUID = 2715075855079604347L;
    /**
     *
     */
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
     * 备注信息
     */
    private String remark;

    /**
     * 最大借款期限
     */
    private Integer deadlineTime;
    /**
     * 逾期利率
     */
    private String overdueInterest;
    /**
     * 计息日
     */
    private String InterestDate;
    /**
     * 申请金额
     */
    private String applyMoney;
    private BigDecimal maximumLoan;
    
    
    public BigDecimal getMaximumLoan() {
		return maximumLoan;
	}

	public void setMaximumLoan(BigDecimal maximumLoan) {
		this.maximumLoan = maximumLoan;
	}

	public String getApplyMoney() {
		return applyMoney;
	}

	public void setApplyMoney(String applyMoney) {
		this.applyMoney = applyMoney;
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

    public Integer getDeadlineTime() {
        return deadlineTime;
    }

    public void setDeadlineTime(Integer deadlineTime) {
        this.deadlineTime = deadlineTime;
    }

    public String getOverdueInterest() {
        return overdueInterest;
    }

    public void setOverdueInterest(String overdueInterest) {
        this.overdueInterest = overdueInterest;
    }

    public String getInterestDate() {
        return InterestDate;
    }

    public void setInterestDate(String interestDate) {
        InterestDate = interestDate;
    }
}
