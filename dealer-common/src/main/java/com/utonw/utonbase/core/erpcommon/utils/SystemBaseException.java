package com.utonw.utonbase.core.erpcommon.utils;

/**
 * 运行时异常
 *
 * @since 2015-1-20
 */
public class SystemBaseException extends RuntimeException {
    /**
     *
     */
    private static final long serialVersionUID = 1L;
    private String code;
    private String message;

    public SystemBaseException(String code) {
        super(code);
        this.code = code;
    }

    public SystemBaseException(String code, String message) {
        super(code + ":" + message);
        this.code = code;
        this.message = message;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public SystemBaseException(String code, Exception e) {
        super(code, e);
        this.code = code;
    }

    public SystemBaseException(String code, Throwable e) {
        super(code, e);
        this.code = code;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}
