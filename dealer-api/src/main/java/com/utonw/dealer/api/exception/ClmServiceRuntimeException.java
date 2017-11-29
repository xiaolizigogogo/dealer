package com.utonw.dealer.api.exception;

/**
 * Created by DONG on 2015/6/8.
 */
public class ClmServiceRuntimeException extends RuntimeException {

    private static final long serialVersionUID = 1L;

    /**
     * 编码
     */
    protected String code;
    protected String[] errFlds;

    public ClmServiceRuntimeException(String msg, Throwable cause) {
        super(msg, cause);

    }

    public ClmServiceRuntimeException(String argCode, String argMsg) {
        super(argMsg);
        code = argCode;
    }

    public ClmServiceRuntimeException(String msg) {
        super(msg);
    }

    public ClmServiceRuntimeException(String argCode, String[] argErrFld) {
        code = argCode;
        errFlds = argErrFld;
    }

    public ClmServiceRuntimeException(String argCode, String[] argErrFld,
                                      Throwable argThr) {
        super(argThr);
        code = argCode;
        errFlds = argErrFld;
    }



    public String getCode() {
        return code;
    }

    public String[] getErrFlds() {
        return errFlds;
    }



}
