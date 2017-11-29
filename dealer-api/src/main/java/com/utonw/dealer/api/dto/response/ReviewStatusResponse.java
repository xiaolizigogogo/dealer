package com.utonw.dealer.api.dto.response;

import java.io.Serializable;

public class ReviewStatusResponse implements Serializable{

	// 审核通过
	private Integer pass;

	// 审核通过
	private Integer noPass;

	// 未审核
	private Integer noReview;

	// 共计
	private Integer total;

	public Integer getPass() {
		return pass;
	}

	public void setPass(Integer pass) {
		this.pass = pass;
	}

	public Integer getNoPass() {
		return noPass;
	}

	public void setNoPass(Integer noPass) {
		this.noPass = noPass;
	}

	public Integer getNoReview() {
		return noReview;
	}

	public void setNoReview(Integer noReview) {
		this.noReview = noReview;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}
}
