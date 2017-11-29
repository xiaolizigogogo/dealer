package com.utonw.dealer.api.entity.erp;

import java.math.BigDecimal;
import java.util.Date;

import com.utonw.dealer.api.enums.erp.ConstantsEnum;
import com.utonw.dealer.api.enums.erp.PledgeTypeEnum;
import com.utonw.dealer.api.enums.erp.RepayWayEnum;
import com.utonw.dealer.api.util.erp.DateUtils;
import org.apache.commons.lang3.StringUtils;


/**
 * 还款信息
 * 
 * @author jml 2016年9月19日 RepaymentInfo.java
 */
public class RepaymentInfo extends LoanInfoHandleBaseRequest {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String customerName;// 客户姓名
	private String deptName; // 业务部
	private String companyName;// 分公司
	private String managerName;// 客户经理
	private String orderId; // 订单号
	private BigDecimal loanMoney;// 贷款金额
	private String loanTime;// 贷款期限
	private BigDecimal restLoanMoney;// 贷款余额
	private BigDecimal repayCapital;// 应还金额
	private BigDecimal repayInterest;// 应还利息
	private BigDecimal overdueFee;// 逾期滞纳金
	private BigDecimal sumMoney;// 合计
	private BigDecimal actualRepaymentSum;// 实还金额
	private Date gmtActualRepay;// 还款日
	private String buyCarMethod;// 购车方式
	private String repayWay;// 还款方式
	private String loanProduct;// 贷款产品
	private String pledgeType;// 质押方式
	private String repayPeriod;// 期数
	private String uuid;
	private String isImportant;// 是否重要客户
	private String customerId;
	private BigDecimal manageFeeSum;// 综合管理费
	private Double repaySum;
	private Double actualRepaymentSumSum;
	private Integer OrderCount;
	private Date gmtRepaymentEnded;
	private Date gmtFirstRepayment;
	private String repaymentId;
	private Integer repaymentStatus;
	private String repayStatus;
	private String repaymentType;
	private String loanStatus;
	private String contractNum;
	private BigDecimal checkCost;
	private BigDecimal parkCost;
	private BigDecimal cashdepositFee;
	private BigDecimal penaltyFee;
	private BigDecimal towCost;
	private BigDecimal gpsCost;
	private String repayPlanId;
	private String isRepay;
	private BigDecimal drunkDrive;
	private Date repayDate;
	private String workName;
	private String userId;
	public String getWorkName() {
		return workName;
	}

	public void setWorkName(String workName) {
		this.workName = workName;
	}

	private Date  lastRepayDate;
	

	public Date getLastRepayDate() {
		return lastRepayDate;
	}

	public void setLastRepayDate(Date lastRepayDate) {
		this.lastRepayDate = lastRepayDate;
	}

	public Date getRepayDate() {
		return repayDate;
	}

	public void setRepayDate(Date repayDate) {
		this.repayDate = repayDate;
	}

	public String getIsRepay() {
		return isRepay;
	}

	public void setIsRepay(String isRepay) {
		this.isRepay = isRepay;
	}

	public String getRepayPlanId() {
		return repayPlanId;
	}

	public void setRepayPlanId(String repayPlanId) {
		this.repayPlanId = repayPlanId;
	}

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

	public BigDecimal getCashdepositFee() {
		return cashdepositFee;
	}

	public void setCashdepositFee(BigDecimal cashdepositFee) {
		this.cashdepositFee = cashdepositFee;
	}

	public BigDecimal getPenaltyFee() {
		return penaltyFee;
	}

	public void setPenaltyFee(BigDecimal penaltyFee) {
		this.penaltyFee = penaltyFee;
	}
	
	public BigDecimal getTowCost() {
		return towCost;
	}

	public void setTowCost(BigDecimal towCost) {
		this.towCost = towCost;
	}

	public BigDecimal getGpsCost() {
		return gpsCost;
	}

	public void setGpsCost(BigDecimal gpsCost) {
		this.gpsCost = gpsCost;
	}

	public String getContractNum() {
		return contractNum;
	}

	public void setContractNum(String contractNum) {
		this.contractNum = contractNum;
	}

	public String getLoanStatus() {
		return loanStatus;
	}

	public void setLoanStatus(String loanStatus) {
		this.loanStatus = loanStatus;
	}

	public String getRepaymentType() {
		return repaymentType;
	}

	public void setRepaymentType(String repaymentType) {
		this.repaymentType = repaymentType;
	}

	public String getRepayStatus() {
		return repayStatus;
	}

	public void setRepayStatus(String repayStatus) {
		this.repayStatus = repayStatus;
	}

	public Integer getRepaymentStatus() {
		return repaymentStatus;
	}

	public void setRepaymentStatus(Integer repaymentStatus) {
		this.repaymentStatus = repaymentStatus;
	}

	public String getRepaymentId() {
		return repaymentId;
	}

	public void setRepaymentId(String repaymentId) {
		this.repaymentId = repaymentId;
	}

	public String getGmtRepaymentEnded() {
		return DateUtils.getDateString((gmtRepaymentEnded == null ? new Date() : gmtRepaymentEnded));
	}

	public void setGmtRepaymentEnded(Date gmtRepaymentEnded) {
		this.gmtRepaymentEnded = gmtRepaymentEnded;
	}

	public String getGmtFirstRepayment() {
		return DateUtils.getDateString((gmtFirstRepayment == null ? new Date() : gmtFirstRepayment));
	}

	public void setGmtFirstRepayment(Date gmtFirstRepayment) {
		this.gmtFirstRepayment = gmtFirstRepayment;
	}

	public Integer getOrderCount() {
		return OrderCount;
	}

	public void setOrderCount(Integer orderCount) {
		OrderCount = orderCount;
	}

	public Double getRepaySum() {
		return repaySum;
	}

	public void setRepaySum(Double repaySum) {
		this.repaySum = repaySum;
	}

	public Double getActualRepaymentSumSum() {
		return actualRepaymentSumSum;
	}

	public void setActualRepaymentSumSum(Double actualRepaymentSumSum) {
		this.actualRepaymentSumSum = actualRepaymentSumSum;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public String getIsImportant() {
		return isImportant;
	}

	public void setIsImportant(String isImportant) {
		this.isImportant = isImportant;
	}

	public String getRepayPeriod() {
		return repayPeriod;
	}

	public void setRepayPeriod(String repayPeriod) {
		this.repayPeriod = repayPeriod;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getBuyCarMethod() {
		if ("0".equals(buyCarMethod)) {
			return "全款";
		} else if ("1".equals(buyCarMethod)) {
			return "按揭";
		}
		return buyCarMethod;
	}

	public void setBuyCarMethod(String buyCarMethod) {
		this.buyCarMethod = buyCarMethod;
	}

	public String getRepayWay() {
		if (StringUtils.isBlank(repayWay)) {
			return "";
		}
		return Enum.valueOf(RepayWayEnum.class, repayWay).message();
	}

	public void setRepayWay(String repayWay) {
		this.repayWay = repayWay;
	}

	public String getLoanProduct() {
		return ConstantsEnum.loanProduct.get(loanProduct);
	}

	public void setLoanProduct(String loanProduct) {
		this.loanProduct = loanProduct;
	}

	public String getPledgeType() {
		if (StringUtils.isBlank(pledgeType)) {
			return "";
		}
		return Enum.valueOf(PledgeTypeEnum.class, pledgeType).message();
	}

	public void setPledgeType(String pledgeType) {
		this.pledgeType = pledgeType;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getManagerName() {
		return managerName;
	}

	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public BigDecimal getLoanMoney() {
		return loanMoney;
	}

	public void setLoanMoney(BigDecimal loanMoney) {
		this.loanMoney = loanMoney;
	}

	public String getLoanTime() {
		return loanTime;
	}

	public void setLoanTime(String loanTime) {
		this.loanTime = loanTime;
	}

	public BigDecimal getRestLoanMoney() {
		if (restLoanMoney == null) {
			return new BigDecimal(0);
		}
		return restLoanMoney;
	}

	public void setRestLoanMoney(BigDecimal restLoanMoney) {
		this.restLoanMoney = restLoanMoney;
	}

	public BigDecimal getRepayCapital() {
		if (repayCapital == null) {
			return new BigDecimal(0);
		}
		return repayCapital;
	}

	public void setRepayCapital(BigDecimal repayCapital) {
		this.repayCapital = repayCapital;
	}

	public BigDecimal getRepayInterest() {
		if (repayInterest == null) {
			return new BigDecimal(0);
		}
		return repayInterest;
	}

	public void setRepayInterest(BigDecimal repayInterest) {
		this.repayInterest = repayInterest;
	}

	public BigDecimal getOverdueFee() {
		if (overdueFee == null) {
			return new BigDecimal(0);
		}
		return overdueFee;
	}

	public void setOverdueFee(BigDecimal overdueFee) {
		this.overdueFee = overdueFee;
	}

	public BigDecimal getSumMoney() {
		if (sumMoney == null) {
			return new BigDecimal(0);
		}
		return sumMoney;
	}

	public void setSumMoney(BigDecimal sumMoney) {
		this.sumMoney = sumMoney;
	}

	public BigDecimal getActualRepaymentSum() {
		return actualRepaymentSum;
	}

	public void setActualRepaymentSum(BigDecimal actualRepaymentSum) {
		this.actualRepaymentSum = actualRepaymentSum;
	}

	public String getGmtActualRepay() {
		if (gmtActualRepay == null) {
			return "";
		} else {
			return DateUtils.getWebDateString(gmtActualRepay);
		}
	}

	public void setGmtActualRepay(Date gmtActualRepay) {
		this.gmtActualRepay = gmtActualRepay;
	}

	public BigDecimal getManageFeeSum() {
		return manageFeeSum;
	}

	public void setManageFeeSum(BigDecimal manageFeeSum) {
		this.manageFeeSum = manageFeeSum;
	}

	public BigDecimal getDrunkDrive() {
		return drunkDrive;
	}

	public void setDrunkDrive(BigDecimal drunkDrive) {
		this.drunkDrive = drunkDrive;
	}

// 综合管理费
	// 差额
	// 购车类型
	// 贷款产品
	// 抵押方式
	// 还款方式


	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
}
