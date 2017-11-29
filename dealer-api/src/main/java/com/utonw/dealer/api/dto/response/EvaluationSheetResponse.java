package com.utonw.dealer.api.dto.response;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class EvaluationSheetResponse implements Serializable{

 private String indentId;
 
 private int pruductId;
 
 private long acountId;
 
 private double systemAssess;
 
 private double buyprice;
 
 private double appraisersPrice;
 
 private double hostlingCost;
 
 private String  loanLimit;
 
 private String condition;
 
 private String remark;
 
 private Date evaluationTime;

 private int travelLicense;
 
 private int commercial;
 
 private int leaveProvince;
 
 private Date updateTime;
 
 private double updateBy;

public String getIndentId() {
	return indentId;
}

public void setIndentId(String indentId) {
	this.indentId = indentId;
}

public int getPruductId() {
	return pruductId;
}

public void setPruductId(int pruductId) {
	this.pruductId = pruductId;
}

public long getAcountId() {
	return acountId;
}

public void setAcountId(long acountId) {
	this.acountId = acountId;
}

public double getSystemAssess() {
	return systemAssess;
}

public void setSystemAssess(double systemAssess) {
	this.systemAssess = systemAssess;
}

public double getBuyprice() {
	return buyprice;
}

public void setBuyprice(double buyprice) {
	this.buyprice = buyprice;
}

public double getAppraisersPrice() {
	return appraisersPrice;
}

public void setAppraisersPrice(double appraisersPrice) {
	this.appraisersPrice = appraisersPrice;
}

public double getHostlingCost() {
	return hostlingCost;
}

public void setHostlingCost(double hostlingCost) {
	this.hostlingCost = hostlingCost;
}

public String getLoanLimit() {
	return loanLimit;
}

public void setLoanLimit(String loanLimit) {
	this.loanLimit = loanLimit;
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

public Date getEvaluationTime() {
	return evaluationTime;
}

public void setEvaluationTime(Date evaluationTime) {
	this.evaluationTime = evaluationTime;
}

public int getTravelLicense() {
	return travelLicense;
}

public void setTravelLicense(int travelLicense) {
	this.travelLicense = travelLicense;
}

public int getCommercial() {
	return commercial;
}

public void setCommercial(int commercial) {
	this.commercial = commercial;
}

public int getLeaveProvince() {
	return leaveProvince;
}

public void setLeaveProvince(int leaveProvince) {
	this.leaveProvince = leaveProvince;
}

public Date getUpdateTime() {
	return updateTime;
}

public void setUpdateTime(Date updateTime) {
	this.updateTime = updateTime;
}

public double getUpdateBy() {
	return updateBy;
}

public void setUpdateBy(double updateBy) {
	this.updateBy = updateBy;
}
 
	
	
}
