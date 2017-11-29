package com.utonw.dealer.api.dto;

import java.io.Serializable;

/**
 * Created by WANGYJ on 2017/5/9.
 */
public class TrialReivewDTO implements Serializable {
    private static final long serialVersionUID = 6492530539734389036L;

    //初审结果:1:通过，2：拒绝，0：未审核
    private int passed;
    //审批金额
    private String approvalamount;
    //备考
    private String remarks;
    //订单ID
    private String applyid;

    public int getPassed() {
        return passed;
    }

    public void setPassed(int passed) {
        this.passed = passed;
    }

    public String getApprovalamount() {
        return approvalamount;
    }

    public void setApprovalamount(String approvalamount) {
        this.approvalamount = approvalamount;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getApplyid() {
        return applyid;
    }

    public void setApplyid(String applyid) {
        this.applyid = applyid;
    }
}
