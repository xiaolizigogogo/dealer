package com.utonw.dealer.api.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by SEELE on 2017/5/26.
 */
public class OrderStatus  implements Serializable{
    private static final long serialVersionUID = -5169493885778654500L;
    private Date createdate;
    private     String indentState;
    private int passed;

    public int getPassed() {
        return passed;
    }

    public void setPassed(int passed) {
        this.passed = passed;
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    public String getIndentState() {
        return indentState;
    }

    public void setIndentState(String indentState) {
        this.indentState = indentState;
    }

}
