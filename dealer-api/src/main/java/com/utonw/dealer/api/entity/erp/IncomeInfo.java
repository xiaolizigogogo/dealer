package com.utonw.dealer.api.entity.erp;

import java.io.Serializable;

/**
 * Created by Administrator on 2016/6/29.
 */
public class IncomeInfo implements Serializable {
	private static final long serialVersionUID = -4721355189731813634L;
	private String orderid;
	private String account_name;
	private String loan_money;
	private String loan_limit_time;
	private String ended_at;
	private String applyed_at;
	private String cur_period;
	private String cur_repaycaptialsum;
	private String cur_repayinterestsum;
	private String state;
	private String is_important;
	private String uuid;
	private String manageFee;
	private String gpsCost;
	private String overdueFee;
	private String visitCost;
	private String parkCost;
	private String towCost;
	private String depreciationFee;
	private String drunkDrive;
	private String cashdepositFee;
	private String certificatefee;
	private String checkCost;

	public String getOrderid() {
		return orderid;
	}

	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}

	public String getAccount_name() {
		return account_name;
	}

	public void setAccount_name(String account_name) {
		this.account_name = account_name;
	}

	public String getLoan_money() {
		return loan_money;
	}

	public void setLoan_money(String loan_money) {
		this.loan_money = loan_money;
	}

	public String getLoan_limit_time() {
		return loan_limit_time;
	}

	public void setLoan_limit_time(String loan_limit_time) {
		this.loan_limit_time = loan_limit_time;
	}

	public String getEnded_at() {
		return ended_at;
	}

	public void setEnded_at(String ended_at) {
		this.ended_at = ended_at;
	}

	public String getApplyed_at() {
		return applyed_at;
	}

	public void setApplyed_at(String applyed_at) {
		this.applyed_at = applyed_at;
	}

	public String getCur_period() {
		return cur_period;
	}

	public void setCur_period(String cur_period) {
		this.cur_period = cur_period;
	}

	public String getCur_repaycaptialsum() {
		return cur_repaycaptialsum;
	}

	public void setCur_repaycaptialsum(String cur_repaycaptialsum) {
		this.cur_repaycaptialsum = cur_repaycaptialsum;
	}

	public String getCur_repayinterestsum() {
		return cur_repayinterestsum;
	}

	public void setCur_repayinterestsum(String cur_repayinterestsum) {
		this.cur_repayinterestsum = cur_repayinterestsum;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getIs_important() {
		return is_important;
	}

	public void setIs_important(String is_important) {
		this.is_important = is_important;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getManageFee() {
		return manageFee;
	}

	public void setManageFee(String manageFee) {
		this.manageFee = manageFee;
	}

	public String getGpsCost() {
		return gpsCost;
	}

	public void setGpsCost(String gpsCost) {
		this.gpsCost = gpsCost;
	}

	public String getOverdueFee() {
		return overdueFee;
	}

	public void setOverdueFee(String overdueFee) {
		this.overdueFee = overdueFee;
	}

	public String getVisitCost() {
		return visitCost;
	}

	public void setVisitCost(String visitCost) {
		this.visitCost = visitCost;
	}

	public String getParkCost() {
		return parkCost;
	}

	public void setParkCost(String parkCost) {
		this.parkCost = parkCost;
	}

	public String getTowCost() {
		return towCost;
	}

	public void setTowCost(String towCost) {
		this.towCost = towCost;
	}

	public String getDepreciationFee() {
		return depreciationFee;
	}

	public void setDepreciationFee(String depreciationFee) {
		this.depreciationFee = depreciationFee;
	}

	public String getDrunkDrive() {
		return drunkDrive;
	}

	public void setDrunkDrive(String drunkDrive) {
		this.drunkDrive = drunkDrive;
	}

	public String getCashdepositFee() {
		return cashdepositFee;
	}

	public void setCashdepositFee(String cashdepositFee) {
		this.cashdepositFee = cashdepositFee;
	}

	public String getCertificatefee() {
		return certificatefee;
	}

	public void setCertificatefee(String certificatefee) {
		this.certificatefee = certificatefee;
	}

	public String getCheckCost() {
		return checkCost;
	}

	public void setCheckCost(String checkCost) {
		this.checkCost = checkCost;
	}
}
