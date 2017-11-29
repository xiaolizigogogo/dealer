package com.utonw.dealer.api.vo;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by DONG on 2016/1/27.
 */
public class CommissionVo implements Serializable {
    private static final long serialVersionUID = 7846501947946415355L;
    private  String customerName;
    private  BigDecimal loanMoney;
    private  BigDecimal captialSum;
    private  BigDecimal interestSum;
    private Integer repayPeriod;
    private String openId;
    private String orderId;
    private String loanId;
    private String nickname;
    private String idCard;
    private BigDecimal userCommission;
    private BigDecimal openIdComission;
    private Double commissionRate;
    private Double openIdrate;
    private String userId;
    private String customerId;
    private Integer isEnded;
    private Date repayTime;
    private Date chargedoffAt;
    private Integer pageSize;
    private BigDecimal sumUserCommission;
    private BigDecimal sumOpenIdCommission;
    private String isImportant;
    private String realName;
    private String applyMoney;
    private String applyedAt;
    private String loanOrderId;
    private String loanStatus;
    private BigDecimal suminterestSum;
    private String state;
	private String contract_num;
	private String repId;


    public String getContract_num() {
		return contract_num;
	}

	public void setContract_num(String contract_num) {
		this.contract_num = contract_num;
	}

	public Date getChargedoffAt() {
        return chargedoffAt;
    }

    public void setChargedoffAt(Date chargedoffAt) {
        this.chargedoffAt = chargedoffAt;
    }

    public Integer getIsEnded() {
        return isEnded;
    }

    public void setIsEnded(Integer isEnded) {
        this.isEnded = isEnded;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public String getUserId() {
        return userId;
    }
    public void setUserId(String userId) {
        this.userId = userId;
    }
    public String getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }

    public BigDecimal getUserCommission() {
        return userCommission;
    }

    public void setUserCommission(BigDecimal userCommission) {
        this.userCommission = userCommission;
    }

    public BigDecimal getOpenIdComission() {
        return openIdComission;
    }

    public void setOpenIdComission(BigDecimal openIdComission) {
        this.openIdComission = openIdComission;
    }

    public Double getCommissionRate() {
        return commissionRate;
    }

    public void setCommissionRate(Double commissionRate) {
        this.commissionRate = commissionRate;
    }

    public Double getOpenIdrate() {
        return openIdrate;
    }

    public void setOpenIdrate(Double openIdrate) {
        this.openIdrate = openIdrate;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public BigDecimal getLoanMoney() {
        return loanMoney;
    }

    public void setLoanMoney(BigDecimal loanMoney) {
        this.loanMoney = loanMoney;
    }

    public BigDecimal getCaptialSum() {
        return captialSum;
    }

    public void setCaptialSum(BigDecimal captialSum) {
        this.captialSum = captialSum;
    }

    public BigDecimal getInterestSum() {
        return interestSum;
    }

    public void setInterestSum(BigDecimal interestSum) {
        this.interestSum = interestSum;
    }

    public Date getRepayTime() {
        return repayTime;
    }

    public void setRepayTime(Date repayTime) {
        this.repayTime = repayTime;
    }

    public Integer getRepayPeriod() {
        return repayPeriod;
    }

    public void setRepayPeriod(Integer repayPeriod) {
        this.repayPeriod = repayPeriod;
    }

    public String getOpenId() {
        return openId;
    }

    public void setOpenId(String openId) {
        this.openId = openId;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getLoanId() {
        return loanId;
    }

    public void setLoanId(String loanId) {
        this.loanId = loanId;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public Integer isEnded() {
        return isEnded;
    }

    public void setEnded(Integer isEnded) {
        this.isEnded = isEnded;
    }

    public BigDecimal getSumUserCommission() {
        return sumUserCommission;
    }

    public void setSumUserCommission(BigDecimal sumUserCommission) {
        this.sumUserCommission = sumUserCommission;
    }

    public BigDecimal getSumOpenIdCommission() {
        return sumOpenIdCommission;
    }

    public void setSumOpenIdCommission(BigDecimal sumOpenIdCommission) {
        this.sumOpenIdCommission = sumOpenIdCommission;
    }

	public String getIsImportant() {
		return isImportant;
	}

	public void setIsImportant(String isImportant) {
		this.isImportant = isImportant;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getApplyMoney() {
		return applyMoney;
	}

	public void setApplyMoney(String applyMoney) {
		this.applyMoney = applyMoney;
	}

	public String getApplyedAt() {
		return applyedAt;
	}

	public void setApplyedAt(String applyedAt) {
		this.applyedAt = applyedAt;
	}

	public String getLoanOrderId() {
		return loanOrderId;
	}

	public void setLoanOrderId(String loanOrderId) {
		this.loanOrderId = loanOrderId;
	}

	public String getLoanStatus() {
		return loanStatus;
	}

	public void setLoanStatus(String loanStatus) {
		this.loanStatus = loanStatus;
	}

	public BigDecimal getSuminterestSum() {
		return suminterestSum;
	}

	public void setSuminterestSum(BigDecimal suminterestSum) {
		this.suminterestSum = suminterestSum;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getRepId() {
		return repId;
	}

	public void setRepId(String repId) {
		this.repId = repId;
	}
}
