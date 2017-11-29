package com.utonw.dealer.api.entity.erp;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 多次还款记录
 * @author Administrator
 *
 */
public class PaymentHistory implements Serializable {

	private static final long serialVersionUID = 743515201612824194L;
	private int id;
	
	private String uuid;
	
	private Date createTime; //还款时间
	
	private BigDecimal repaymentAmount; //还款金额
	
	private BigDecimal surplusAmount; //剩余应还金额
	
	private String repaymentUuid;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public BigDecimal getRepaymentAmount() {
		return repaymentAmount;
	}

	public void setRepaymentAmount(BigDecimal repaymentAmount) {
		this.repaymentAmount = repaymentAmount;
	}

	public BigDecimal getSurplusAmount() {
		return surplusAmount;
	}

	public void setSurplusAmount(BigDecimal surplusAmount) {
		this.surplusAmount = surplusAmount;
	}

	public String getRepaymentUuid() {
		return repaymentUuid;
	}

	public void setRepaymentUuid(String repaymentUuid) {
		this.repaymentUuid = repaymentUuid;
	}
	
	
	
	
	
}
