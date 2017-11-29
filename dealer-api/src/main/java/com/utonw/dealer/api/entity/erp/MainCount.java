package com.utonw.dealer.api.entity.erp;


import java.io.Serializable;

public class MainCount implements Serializable {

	private static final long serialVersionUID = 1753146599489143669L;
	/**
	 * 本月实际
	 */
	private int monthReality;
	
	/**
	 * 本日新增
	 */
	private int month_Increased;
	
	/**
	 * 当前累放
	 */
	private int current_OutCome;
	
	/**
	 * 当前逾期
	 */
	private int current_Yuqi_Total;
	
	/**
	 * 当前累收
	 */
	private int current_Income;

	public int getMonthReality() {
		return monthReality;
	}

	public void setMonthReality(int monthReality) {
		this.monthReality = monthReality;
	}

	public int getMonth_Increased() {
		return month_Increased;
	}

	public void setMonth_Increased(int month_Increased) {
		this.month_Increased = month_Increased;
	}

	public int getCurrent_OutCome() {
		return current_OutCome;
	}

	public void setCurrent_OutCome(int current_OutCome) {
		this.current_OutCome = current_OutCome;
	}

	public int getCurrent_Yuqi_Total() {
		return current_Yuqi_Total;
	}

	public void setCurrent_Yuqi_Total(int current_Yuqi_Total) {
		this.current_Yuqi_Total = current_Yuqi_Total;
	}

	public int getCurrent_Income() {
		return current_Income;
	}

	public void setCurrent_Income(int current_Income) {
		this.current_Income = current_Income;
	}

}