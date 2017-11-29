package com.utonw.dealer.api.entity.erp;

import java.math.BigDecimal;

public class RepaymentPlanResult {
    /**
     * @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么)
     */
    private static final long serialVersionUID = 1L;

    /**
     * @Fields merchantName : 商家名称
     */
    private String merchantName;

    /**
     * @Fields realName : 借款人
     */
    private String realName;

    /**
     * @Fields judgeMoney : 放款金额
     */
    private BigDecimal judgeMoney;

    /**
     * @Fields deadlineTime : 周期天数
     */
    private int deadlineTime;

    /**
     * @Fields interestRate : 利率
     */
    private BigDecimal interestRate;

    public String getMerchantName() {
        return merchantName;
    }

    public void setMerchantName(String merchantName) {
        this.merchantName = merchantName;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public BigDecimal getJudgeMoney() {
        return judgeMoney;
    }

    public void setJudgeMoney(BigDecimal judgeMoney) {
        this.judgeMoney = judgeMoney;
    }

    public int getDeadlineTime() {
        return deadlineTime;
    }

    public void setDeadlineTime(int deadlineTime) {
        this.deadlineTime = deadlineTime;
    }

    public BigDecimal getInterestRate() {
        return interestRate;
    }

    public void setInterestRate(BigDecimal interestRate) {
        this.interestRate = interestRate;
    }

}
