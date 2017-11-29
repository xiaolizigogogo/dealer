package com.utonw.dealer.api.dto.response;

import java.io.Serializable;
import java.math.BigDecimal;

public class IndentCountResponse implements Serializable{

	private Integer totalIndent;

	private Integer loanCount;

	private BigDecimal loanMoney;

	private Integer unLoan;

	public Integer getTotalIndent() {
		return totalIndent;
	}

	public void setTotalIndent(Integer totalIndent) {
		this.totalIndent = totalIndent;
	}

	public Integer getLoanCount() {
		return loanCount;
	}

	public void setLoanCount(Integer loanCount) {
		this.loanCount = loanCount;
	}

	public BigDecimal getLoanMoney() {
		return loanMoney;
	}

	public void setLoanMoney(BigDecimal loanMoney) {
		this.loanMoney = loanMoney;
	}

	public Integer getUnLoan() {
		return unLoan;
	}

	public void setUnLoan(Integer unLoan) {
		this.unLoan = unLoan;
	}
}
