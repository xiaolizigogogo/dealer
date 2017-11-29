package com.utonw.dealer.api.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class RateConfig implements Serializable{
	private int id;
	private int dayRange;
	private Date gmtCreate;
	private Date gmtUpdate;
	private boolean enable;
	private String companyId;
	private BigDecimal rate;
	
	public BigDecimal getRate() {
		return rate;
	}
	public void setRate(BigDecimal rate) {
		this.rate = rate;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getDayRange() {
		return dayRange;
	}
	public void setDayRange(int dayRange) {
		this.dayRange = dayRange;
	}
	public Date getGmtCreate() {
		return gmtCreate;
	}
	public void setGmtCreate(Date gmtCreate) {
		this.gmtCreate = gmtCreate;
	}
	public Date getGmtUpdate() {
		return gmtUpdate;
	}
	public void setGmtUpdate(Date gmtUpdate) {
		this.gmtUpdate = gmtUpdate;
	}
	public boolean isEnable() {
		return enable;
	}
	public void setEnable(boolean enable) {
		this.enable = enable;
	}
	public String getCompanyId() {
		return companyId;
	}
	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}
}