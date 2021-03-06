package com.utonw.dealer.api.entity.erp;

import java.beans.Transient;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class RepayPlanDetail implements Serializable {
    private static final long serialVersionUID = 1541167284568728696L;
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column repayplandetail.id
     *
     * @mbggenerated
     */
    private Long id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column repayplandetail.repayPlanId
     *
     * @mbggenerated
     */
    private Long repayPlanId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column repayplandetail.repayPeriod
     *
     * @mbggenerated
     */
    private Integer repayPeriod;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column repayplandetail.repayCapital
     *
     * @mbggenerated
     */
    private BigDecimal repayCapital;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column repayplandetail.repayInterest
     *
     * @mbggenerated
     */
    private BigDecimal repayInterest;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column repayplandetail.repayTotal
     *
     * @mbggenerated
     */
    private BigDecimal repayTotal;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column repayplandetail.remark
     *
     * @mbggenerated
     */
    private String remark;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column repayplandetail.repayDate
     *
     * @mbggenerated
     */
    private Date repayDate;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column repayplandetail.repayStatus
     *
     * @mbggenerated
     */
    private Integer repayStatus;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column repayplandetail.createDate
     *
     * @mbggenerated
     */
    private Date createDate;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column repayplandetail.predictInvestReturnDate
     *
     * @mbggenerated
     */
    private Date predictInvestReturnDate;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column repayplandetail.fee
     *
     * @mbggenerated
     */
    private String fee;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column repayplandetail.isRepay
     *
     * @mbggenerated
     */
    private Integer isRepay;

    /**
     * 剩余本金
     */
    private BigDecimal surplusCapital;

    /**
     * 管理费
     */
    private BigDecimal manageFee;

    /**
     * gps费用
     */
    private BigDecimal gpsCost;

    /**
     * 查档费用
     */
    private BigDecimal checkCost;

    /**
     * 停车费用
     */
    private BigDecimal parkCost;


    /**
     * 上门催收费
     */
    private BigDecimal visitCost;


    /**
     * 拖车费
     */
    private BigDecimal towCost;

    /**
     * 实际还款金额
     */
    private BigDecimal actualRepaymentSum;


    /**
     * 实际还款时间
     */
    private Date actualRepaymentDate;

    /**
     * 逾期天数
     */
    private Integer overdueDay;

    /**
     * 逾期费用
     */
    private BigDecimal overdueFee;


    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column repayplandetail.repaySum
     *
     * @mbggenerated
     */
    private BigDecimal repaySum;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column repayplandetail.irrValue
     *
     * @mbggenerated
     */
    private String irrValue;

    private BigDecimal surplusReimbursementAmount;

    /**
     * 最低还款金额
     */
    private BigDecimal minRepaymentMoney = BigDecimal.ZERO;

    /**
     * 折旧费
     */
    private BigDecimal depreciationFee;

    /**
     * 毒酒驾
     */
    private BigDecimal drunkDrive;

    /**
     * 保证金
     */
    private BigDecimal cashdepositFee;


     /**
     * 认证费
     */
    private BigDecimal certificatefee;

     /**
     * 提前还款
     */
    private BigDecimal advancerepay;    
    
    /**
     * 本期剩余应还金额
     */
    private BigDecimal surplusRepayTotal;
    /**
     * 提前还款违约金
     */
    private BigDecimal penaltyFee;

    /**
     *  拖车金额剩余
     */
    private BigDecimal surplusMoney;

    /**
     * repaymenttransaction uuid
     */
    private String uuid;

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    /**
     * 管理费,gps费用,逾期费等合计
     */
    private BigDecimal totalSum;

    /**
     * repaymentID
     */
    private Long rtid;

    /**
     * repayplanDetailID
     */
    private Long rpdid;

    /**
     * repayplanID
     */
    private Long rpid;

    /**
     * period
     * @return
     */
    private Integer period;

    /**
     * repayCapitalSum
     * @return
     */
    private BigDecimal repayCapitalSum;

    public BigDecimal getCheckCost() {
        return checkCost;
    }

    public void setCheckCost(BigDecimal checkCost) {
        this.checkCost = checkCost;
    }

    public BigDecimal getParkCost() {
        return parkCost;
    }

    public void setParkCost(BigDecimal parkCost) {
        this.parkCost = parkCost;
    }

    public BigDecimal getSurplusReimbursementAmount() {
        return surplusReimbursementAmount;
    }

    public void setSurplusReimbursementAmount(BigDecimal surplusReimbursementAmount) {
        this.surplusReimbursementAmount = surplusReimbursementAmount;
    }

    public BigDecimal getGpsCost() {
        return gpsCost;
    }

    public void setGpsCost(BigDecimal gpsCost) {
        this.gpsCost = gpsCost;
    }

    public BigDecimal getManageFee() {
        return manageFee;
    }

    public void setManageFee(BigDecimal manageFee) {
        this.manageFee = manageFee;
    }

    public BigDecimal getSurplusCapital() {
        return surplusCapital;
    }

    public void setSurplusCapital(BigDecimal surplusCapital) {
        this.surplusCapital = surplusCapital;
    }

    public BigDecimal getMinRepaymentMoney(Boolean flag) {

        if (flag) {
            minRepaymentMoney = minRepaymentMoney.add(visitCost).add(repayCapital).add(repayInterest).add(manageFee).add(gpsCost).add(checkCost)
                    .add(parkCost).add(towCost).add(overdueFee);
        } else {
            minRepaymentMoney = minRepaymentMoney.add(visitCost).add(repayCapital).add(repayInterest).add(manageFee).add(gpsCost).add(checkCost)
                    .add(parkCost).add(towCost);
        }
        return minRepaymentMoney;
    }

    public void setMinRepaymentMoney(BigDecimal minRepaymentMoney) {
        this.minRepaymentMoney = minRepaymentMoney;
    }

    @Transient
    public BigDecimal getActualRepaymentSum() {
        return actualRepaymentSum;
    }

    public void setActualRepaymentSum(BigDecimal actualRepaymentSum) {
        this.actualRepaymentSum = actualRepaymentSum;
    }

    @Transient
    public Date getActualRepaymentDate() {
        return actualRepaymentDate;
    }

    public void setActualRepaymentDate(Date actualRepaymentDate) {
        this.actualRepaymentDate = actualRepaymentDate;
    }

    public Integer getOverdueDay() {
        return overdueDay;
    }

    public void setOverdueDay(Integer overdueDay) {
        this.overdueDay = overdueDay;
    }

    public BigDecimal getOverdueFee() {
        return overdueFee;
    }

    public void setOverdueFee(BigDecimal overdueFee) {
        this.overdueFee = overdueFee;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column repayplandetail.id
     *
     * @return the value of repayplandetail.id
     * @mbggenerated
     */
    public Long getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column repayplandetail.id
     *
     * @param id the value for repayplandetail.id
     * @mbggenerated
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column repayplandetail.repayPlanId
     *
     * @return the value of repayplandetail.repayPlanId
     * @mbggenerated
     */
    public Long getRepayPlanId() {
        return repayPlanId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column repayplandetail.repayPlanId
     *
     * @param repayPlanId the value for repayplandetail.repayPlanId
     * @mbggenerated
     */
    public void setRepayPlanId(Long repayPlanId) {
        this.repayPlanId = repayPlanId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column repayplandetail.repayPeriod
     *
     * @return the value of repayplandetail.repayPeriod
     * @mbggenerated
     */
    public Integer getRepayPeriod() {
        return repayPeriod;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column repayplandetail.repayPeriod
     *
     * @param repayPeriod the value for repayplandetail.repayPeriod
     * @mbggenerated
     */
    public void setRepayPeriod(Integer repayPeriod) {
        this.repayPeriod = repayPeriod;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column repayplandetail.repayCapital
     *
     * @return the value of repayplandetail.repayCapital
     * @mbggenerated
     */
    public BigDecimal getRepayCapital() {
        return repayCapital;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column repayplandetail.repayCapital
     *
     * @param repayCapital the value for repayplandetail.repayCapital
     * @mbggenerated
     */
    public void setRepayCapital(BigDecimal repayCapital) {
        this.repayCapital = repayCapital;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column repayplandetail.repayInterest
     *
     * @return the value of repayplandetail.repayInterest
     * @mbggenerated
     */
    public BigDecimal getRepayInterest() {
        return repayInterest;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column repayplandetail.repayInterest
     *
     * @param repayInterest the value for repayplandetail.repayInterest
     * @mbggenerated
     */
    public void setRepayInterest(BigDecimal repayInterest) {
        this.repayInterest = repayInterest;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column repayplandetail.repayTotal
     *
     * @return the value of repayplandetail.repayTotal
     * @mbggenerated
     */
    public BigDecimal getRepayTotal() {
        return repayTotal;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column repayplandetail.repayTotal
     *
     * @param repayTotal the value for repayplandetail.repayTotal
     * @mbggenerated
     */
    public void setRepayTotal(BigDecimal repayTotal) {
        this.repayTotal = repayTotal;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column repayplandetail.remark
     *
     * @return the value of repayplandetail.remark
     * @mbggenerated
     */
    public String getRemark() {
        return remark;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column repayplandetail.remark
     *
     * @param remark the value for repayplandetail.remark
     * @mbggenerated
     */
    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column repayplandetail.repayDate
     *
     * @return the value of repayplandetail.repayDate
     * @mbggenerated
     */
    public Date getRepayDate() {
        return repayDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column repayplandetail.repayDate
     *
     * @param repayDate the value for repayplandetail.repayDate
     * @mbggenerated
     */
    public void setRepayDate(Date repayDate) {
        this.repayDate = repayDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column repayplandetail.repayStatus
     *
     * @return the value of repayplandetail.repayStatus
     * @mbggenerated
     */
    public Integer getRepayStatus() {
        return repayStatus;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column repayplandetail.repayStatus
     *
     * @param repayStatus the value for repayplandetail.repayStatus
     * @mbggenerated
     */
    public void setRepayStatus(Integer repayStatus) {
        this.repayStatus = repayStatus;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column repayplandetail.createDate
     *
     * @return the value of repayplandetail.createDate
     * @mbggenerated
     */
    public Date getCreateDate() {
        return createDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column repayplandetail.createDate
     *
     * @param createDate the value for repayplandetail.createDate
     * @mbggenerated
     */
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column repayplandetail.predictInvestReturnDate
     *
     * @return the value of repayplandetail.predictInvestReturnDate
     * @mbggenerated
     */
    public Date getPredictInvestReturnDate() {
        return predictInvestReturnDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column repayplandetail.predictInvestReturnDate
     *
     * @param predictInvestReturnDate the value for repayplandetail.predictInvestReturnDate
     * @mbggenerated
     */
    public void setPredictInvestReturnDate(Date predictInvestReturnDate) {
        this.predictInvestReturnDate = predictInvestReturnDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column repayplandetail.fee
     *
     * @return the value of repayplandetail.fee
     * @mbggenerated
     */
    public String getFee() {
        return fee;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column repayplandetail.fee
     *
     * @param fee the value for repayplandetail.fee
     * @mbggenerated
     */
    public void setFee(String fee) {
        this.fee = fee == null ? null : fee.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column repayplandetail.isRepay
     *
     * @return the value of repayplandetail.isRepay
     * @mbggenerated
     */
    public Integer getIsRepay() {
        return isRepay;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column repayplandetail.isRepay
     *
     * @param isRepay the value for repayplandetail.isRepay
     * @mbggenerated
     */
    public void setIsRepay(Integer isRepay) {
        this.isRepay = isRepay;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column repayplandetail.repaySum
     *
     * @return the value of repayplandetail.repaySum
     * @mbggenerated
     */
    public BigDecimal getRepaySum() {
        return repaySum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column repayplandetail.repaySum
     *
     * @param repaySum the value for repayplandetail.repaySum
     * @mbggenerated
     */
    public void setRepaySum(BigDecimal repaySum) {
        this.repaySum = repaySum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column repayplandetail.irrValue
     *
     * @return the value of repayplandetail.irrValue
     * @mbggenerated
     */
    public String getIrrValue() {
        return irrValue;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column repayplandetail.irrValue
     *
     * @param irrValue the value for repayplandetail.irrValue
     * @mbggenerated
     */
    public void setIrrValue(String irrValue) {
        this.irrValue = irrValue == null ? null : irrValue.trim();
    }


    public BigDecimal getVisitCost() {
        return visitCost;
    }

    public void setVisitCost(BigDecimal visitCost) {
        this.visitCost = visitCost;
    }

    public BigDecimal getTowCost() {
        return towCost;
    }

    public void setTowCost(BigDecimal towCost) {
        this.towCost = towCost;
    }

    //折旧费
    public BigDecimal getDepreciationFee() {
        return depreciationFee;
    }

    public void setDepreciationFee(BigDecimal depreciationFee) {
        this.depreciationFee = depreciationFee;
    }
    //毒酒费
    public BigDecimal getDrunkDrive() {
        return drunkDrive;
    }

    public void setDrunkDrive(BigDecimal drunkDrive) {
        this.drunkDrive = drunkDrive;
    }
    //保证金
    public BigDecimal getCashdepositFee() {
        return cashdepositFee;
    }

    public void setCashdepositFee(BigDecimal cashdepositFee) {
        this.cashdepositFee = cashdepositFee;
    }

    //提前还款
    public BigDecimal getAdvancerepay() {
        return advancerepay;
    }

    public void setAdvancerepay(BigDecimal advancerepay) {
        this.advancerepay = advancerepay;
    }

	public BigDecimal getSurplusRepayTotal() {
		return surplusRepayTotal;
	}

	public void setSurplusRepayTotal(BigDecimal surplusRepayTotal) {
		this.surplusRepayTotal = surplusRepayTotal;
	}


    /**
     * 提前还款违约金
     */
    public BigDecimal getPenaltyFee() {
        return penaltyFee;
    }

    public void setPenaltyFee(BigDecimal penaltyFee) {
        this.penaltyFee = penaltyFee;
    }

    /**
	* 认证费
	*/
    public BigDecimal getCertificatefee() {
        return certificatefee;
    }

    public void setCertificatefee(BigDecimal certificatefee) {
        this.certificatefee = certificatefee;
    }

    /**
     * 拖车处理剩余金额
     */
    public BigDecimal getSurplusMoney() { return surplusMoney; }

    public void setSurplusMoney(BigDecimal surplusMoney) { this.surplusMoney = surplusMoney; }

    /**
     * 各种费用合计金额
     */
    public BigDecimal getTotalSum() { return totalSum; }

    public void setTotalSum(BigDecimal totalSum) { this.totalSum = totalSum; }

    public Long getRtid() {
        return rtid;
    }

    public void setRtid(Long rtid) {
        this.rtid = rtid;
    }

    public Long getRpdid() {
        return rpdid;
    }

    public void setRpdid(Long rpdid) {
        this.rpdid = rpdid;
    }

    public Long getRpid() {
        return rpid;
    }

    public void setRpid(Long rpid) {
        this.rpid = rpid;
    }

    public Integer getPeriod() {
        return period;
    }

    public void setPeriod(Integer period) {
        this.period = period;
    }

    public BigDecimal getRepayCapitalSum() {
        return repayCapitalSum;
    }

    public void setRepayCapitalSum(BigDecimal repayCapitalSum) {
        this.repayCapitalSum = repayCapitalSum;
    }
}