package com.utonw.dealer.api.dto.request;

import java.io.Serializable;

/**
 * Created by SEELE on 2017/5/10.
 */
public class CarMessageRequest implements Serializable {
    private static final long serialVersionUID = -4814988352698354831L;
    private String acountId;
    private int pageNum;
    private int pageSize;
    private String indentState;
    private String productName;

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getIndentState() {
        return indentState;
    }

    public void setIndentState(String indentState) {
        this.indentState = indentState;
    }

    public String getAcountId() {
        return acountId;
    }

    public void setAcountId(String acountId) {
        this.acountId = acountId;
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
}
