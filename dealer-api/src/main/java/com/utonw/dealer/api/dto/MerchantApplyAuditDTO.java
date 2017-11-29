package com.utonw.dealer.api.dto;

import java.io.Serializable;

/**
 * Created by SEELE on 2017/6/28.
 */
public class MerchantApplyAuditDTO implements Serializable {

    private static final long serialVersionUID = 5153321263600104382L;
    private String passed;//是否通过 1:通过 2：未通过'
    private String approvalAmount;//审批金额
    private String remarks;//备注

    public String getPassed() {
        return passed;
    }

    public void setPassed(String passed) {
        this.passed = passed;
    }

    public String getApprovalAmount() {
        return approvalAmount;
    }

    public void setApprovalAmount(String approvalAmount) {
        this.approvalAmount = approvalAmount;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }
}
