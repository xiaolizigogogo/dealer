package com.utonw.dealer.api.dto.response;

import java.io.Serializable;
import java.math.BigDecimal;

public class AppraisalInfoResponse implements Serializable{

	// 全款/按揭
	private String saledType;

	// 评估价格
	private BigDecimal appraisersPrice;

	// 评估师
	private String realName;

	// 评估结论
	private String remark;

	public String getSaledType() {
		return saledType;
	}

	public void setSaledType(String saledType) {
		this.saledType = saledType;
	}

	public BigDecimal getAppraisersPrice() {
		return appraisersPrice;
	}

	public void setAppraisersPrice(BigDecimal appraisersPrice) {
		this.appraisersPrice = appraisersPrice;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
}
