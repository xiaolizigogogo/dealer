package com.utonw.dealer.api.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by SEELE on 2017/7/18.
 */
public class CompleteTask  implements Serializable{
    private static final long serialVersionUID = -7756262724401042397L;
    private String applyId;//订单ID
    private Date updateTime;//完成时间

    public String getApplyId() {
        return applyId;
    }

    public void setApplyId(String applyId) {
        this.applyId = applyId;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}
