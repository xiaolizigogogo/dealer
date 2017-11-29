package com.utonw.dealer.api.entity.erp;


import java.io.Serializable;

public class AfterStatusCount implements Serializable {

	private static final long serialVersionUID = 1430916613224009133L;
	private Integer allCount;

	private Integer todayCount;

	private Integer weekCount;

	private Integer overdueCount;

	public Integer getAllCount() {
		return allCount;
	}

	public void setAllCount(Integer allCount) {
		this.allCount = allCount;
	}

	public Integer getTodayCount() {
		return todayCount;
	}

	public void setTodayCount(Integer todayCount) {
		this.todayCount = todayCount;
	}

	public Integer getWeekCount() {
		return weekCount;
	}

	public void setWeekCount(Integer weekCount) {
		this.weekCount = weekCount;
	}

	public Integer getOverdueCount() {
		return overdueCount;
	}

	public void setOverdueCount(Integer overdueCount) {
		this.overdueCount = overdueCount;
	}
}
