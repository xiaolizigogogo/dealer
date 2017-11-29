package com.utonw.utonbase.core.erpcommon.api;

/**
 * 公共返回数据结构
 * Created by Vic on 2015/12/13.
 */
public class BaseResponseEntity<T> {

    /**
     * 返回消息码
     */
    private String retCode;

    /**
     * 返回消息描述
     */
    private String message;

    /**
     * json数据对象
     */
    private T result;

    public BaseResponseEntity() {
    }

    public BaseResponseEntity(String message, T result, String retCode) {
        this.message = message;
        this.result = result;
        this.retCode = retCode;
    }

    public String getRetCode() {
        return retCode;
    }

    public void setRetCode(String retCode) {
        this.retCode = retCode;
    }

    public T getResult() {
        return result;
    }

    public void setResult(T result) {
        this.result = result;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
