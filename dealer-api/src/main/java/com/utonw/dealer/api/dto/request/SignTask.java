package com.utonw.dealer.api.dto.request;

import java.io.Serializable;

/**
 * Created by SEELE on 2017/6/5.
 */
public class SignTask implements Serializable{
    private static final long serialVersionUID = 5698368568536729969L;
    private String merchantId; //当前登录人
    private String taskId; //当前任务id

    public String getTaskId() {
        return taskId;
    }

    public void setTaskId(String taskId) {
        this.taskId = taskId;
    }

    public String getMerchantId() {
        return merchantId;
    }

    public void setMerchantId(String merchantId) {
        this.merchantId = merchantId;
    }
}
