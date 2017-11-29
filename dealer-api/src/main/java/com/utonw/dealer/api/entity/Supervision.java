package com.utonw.dealer.api.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by SEELE on 2017/8/8.
 */
public class Supervision implements Serializable{
    private static final long serialVersionUID = -6469833482187419857L;
    private String indentNumber;//订单编号
    private String realName;//车商姓名
    private String merchantName;//车商名
    private String mobile;//手机号
    private BigDecimal totalAmount;//总借款金额
    private Integer totalIndent;//在押车辆数
    private Integer overdueCount;//最大贷款天数
    private String productNo;//商品编号
    private String cBrand;//品牌
    private String cType;//车系
    private String id;//订单ID
    private Date outAccountTime;//出账时间
    private BigDecimal judgeMoney;//贷款金额
    private Integer deadlineTime;//周期
    private BigDecimal interestRate;//利率
    private BigDecimal acountId;//车商ID
    private Integer productId;
    private String plateNumber;
    private BigDecimal repayment;
    private String sum;
    private Date repaymenTime;//还款时间
    private BigDecimal stockNumber;//总贷款金额
    private String afterPlateNumber;
    
    public String getAfterPlateNumber() {
		return afterPlateNumber;
	}

	public void setAfterPlateNumber(String afterPlateNumber) {
		this.afterPlateNumber = afterPlateNumber;
	}

	public BigDecimal getStockNumber() {
        return stockNumber;
    }

    public void setStockNumber(BigDecimal stockNumber) {
        this.stockNumber = stockNumber;
    }

    public Date getRepaymenTime() {
        return repaymenTime;
    }

    public void setRepaymenTime(Date repaymenTime) {
        this.repaymenTime = repaymenTime;
    }

    public BigDecimal getRepayment() {
        return repayment;
    }

    public void setRepayment(BigDecimal repayment) {
        this.repayment = repayment;
    }

    public String getSum() {
        return sum;
    }

    public void setSum(String sum) {
        this.sum = sum;
    }

    public String getPlateNumber() {
        return plateNumber;
    }

    public void setPlateNumber(String plateNumber) {
        this.plateNumber = plateNumber;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public BigDecimal getAcountId() {
        return acountId;
    }

    public void setAcountId(BigDecimal acountId) {
        this.acountId = acountId;
    }

    public Date getOutAccountTime() {
        return outAccountTime;
    }

    public void setOutAccountTime(Date outAccountTime) {
        this.outAccountTime = outAccountTime;
    }

    public BigDecimal getJudgeMoney() {
        return judgeMoney;
    }

    public void setJudgeMoney(BigDecimal judgeMoney) {
        this.judgeMoney = judgeMoney;
    }

    public Integer getDeadlineTime() {
        return deadlineTime;
    }

    public void setDeadlineTime(Integer deadlineTime) {
        this.deadlineTime = deadlineTime;
    }

    public BigDecimal getInterestRate() {
        return interestRate;
    }

    public void setInterestRate(BigDecimal interestRate) {
        this.interestRate = interestRate;
    }

    public String getIndentNumber() {
        return indentNumber;
    }

    public void setIndentNumber(String indentNumber) {
        this.indentNumber = indentNumber;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getMerchantName() {
        return merchantName;
    }

    public void setMerchantName(String merchantName) {
        this.merchantName = merchantName;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public BigDecimal getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(BigDecimal totalAmount) {
        this.totalAmount = totalAmount;
    }

    public Integer getTotalIndent() {
        return totalIndent;
    }

    public void setTotalIndent(Integer totalIndent) {
        this.totalIndent = totalIndent;
    }

    public Integer getOverdueCount() {
        return overdueCount;
    }

    public void setOverdueCount(Integer overdueCount) {
        this.overdueCount = overdueCount;
    }

    public String getProductNo() {
        return productNo;
    }

    public void setProductNo(String productNo) {
        this.productNo = productNo;
    }

    public String getcBrand() {
        return cBrand;
    }

    public void setcBrand(String cBrand) {
        this.cBrand = cBrand;
    }

    public String getcType() {
        return cType;
    }

    public void setcType(String cType) {
        this.cType = cType;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}
