package com.utonw.dealer.api.dto;

import java.io.Serializable;

/**
 * Created by WANGYJ on 2017/5/12.
 */
public class OrderCountDTO implements Serializable {
    private static final long serialVersionUID = -8386121839557828132L;
    private int trialOrderCount;
    private int judgeOrderCount;
    private int lendedOrderCount;
    private int totalOrderCount;

    public int getTrialOrderCount() {
        return trialOrderCount;
    }

    public void setTrialOrderCount(int trialOrderCount) {
        this.trialOrderCount = trialOrderCount;
    }

    public int getJudgeOrderCount() {
        return judgeOrderCount;
    }

    public void setJudgeOrderCount(int judgeOrderCount) {
        this.judgeOrderCount = judgeOrderCount;
    }

    public int getLendedOrderCount() {
        return lendedOrderCount;
    }

    public void setLendedOrderCount(int lendedOrderCount) {
        this.lendedOrderCount = lendedOrderCount;
    }

    public int getTotalOrderCount() {
        return totalOrderCount;
    }

    public void setTotalOrderCount(int totalOrderCount) {
        this.totalOrderCount = totalOrderCount;
    }
}
