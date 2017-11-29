package com.utonw.dealer.api.dto.request;

import java.io.Serializable;

public class CarsokAcountRequest implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 页码
	 */
	private Integer pageNum ;
	
	/**
	 * 每页个数
	 */
	private Integer pageSize;
	
	/**
	 * 车行名称
	 */
	private String acountName;
	
	/*
	 * 车商电话
	 */
	private String acountMobile;

	public Integer getPageNum() {
		return pageNum;
	}

	public void setPageNum(Integer pageNum) {
		this.pageNum = pageNum;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public String getAcountName() {
		return acountName;
	}

	public void setAcountName(String acountName) {
		this.acountName = acountName;
	}

	public String getAcountMobile() {
		return acountMobile;
	}

	public void setAcountMobile(String acountMobile) {
		this.acountMobile = acountMobile;
	}

	
}
