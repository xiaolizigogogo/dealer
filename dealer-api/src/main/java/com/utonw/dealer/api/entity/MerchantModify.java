package com.utonw.dealer.api.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by SEELE on 2017/7/29.
 */
public class MerchantModify implements Serializable{
    private static final long serialVersionUID = 3216819722338442978L;
    private String id;
    private BigDecimal judgeMoney;
    private String whetherPass;
    private String indentState;
    private String rejectRemarks;
    private Date outAccountTime;
	/**
	 * repaymentime 还款时间
	 */
	private Date repaymentime;
	
    public Date getRepaymentime() {
		return repaymentime;
	}

	public void setRepaymentime(Date repaymentime) {
		this.repaymentime = repaymentime;
	}

	public Date getOutAccountTime() {
        return outAccountTime;
    }

    public void setOutAccountTime(Date outAccountTime) {
        this.outAccountTime = outAccountTime;
    }

    public String getIndentState() {
        return indentState;
    }

    public void setIndentState(String indentState) {
        this.indentState = indentState;
    }

    public String getWhetherPass() {
        return whetherPass;
    }

    public void setWhetherPass(String whetherPass) {
        this.whetherPass = whetherPass;
    }

    public String getRejectRemarks() {
        return rejectRemarks;
    }

    public void setRejectRemarks(String rejectRemarks) {
        this.rejectRemarks = rejectRemarks;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public BigDecimal getJudgeMoney() {
        return judgeMoney;
    }

    public void setJudgeMoney(BigDecimal judgeMoney) {
        this.judgeMoney = judgeMoney;
    }
}
