package com.utonw.dealer.api.dto.request;

import com.utonw.dealer.api.enums.CarDealerApplyEnum;
import com.utonw.dealer.api.enums.CarDealerLoanEnum;
import com.utonw.dealer.api.enums.WorkFlowType;

import java.io.Serializable;

/**
 * Created by SEELE on 2017/8/8.
 */
public class MerchantRequest implements Serializable {
    /**
     *
     */
    private static final long serialVersionUID = 1L;
    private String applyStatus;
    private String searchKey;
    private int pageNum;
    private int pageSize;
    private String workFlowType;


    public String getApplyStatus() {
        return applyStatus;
    }

    public void setApplyStatus(String applyStatus) {
        this.applyStatus = applyStatus;
    }

    public String getSearchKey() {
        return searchKey;
    }

    public void setSearchKey(String searchKey) {
        this.searchKey = searchKey;
    }

    public int getPageNum() {
        return pageNum;
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public String getWorkFlowType() {
        return workFlowType;
    }

    public void setWorkFlowType(String workFlowType) {
        this.workFlowType = workFlowType;
    }
}
