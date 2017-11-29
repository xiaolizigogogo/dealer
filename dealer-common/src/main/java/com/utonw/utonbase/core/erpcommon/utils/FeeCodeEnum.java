package com.utonw.utonbase.core.erpcommon.utils;

/**
 * Created by DONG on 2015/11/11.
 */
public enum FeeCodeEnum {


    /**
     *
     9:拖车费
     8:逾期费
     7:上门催收费
     6:查档费
     5:停车费
     4:gps费
     3:管理费
     2:还款利息
     1:还款本金
     */


    repayCapital(1,"repayCapital"),


    repayInterest(2,"repayInterest"),


    manageFee(3, "manageFee"),


    gpsCost(4,"gpsCost"),


    parkCost(5,"parkCost"),



    checkCost(6,"checkCost"),


    visitCost(7,"visitCost"),


    overdueFee(8,"overdueFee"),

    towCost(9,"towCost");



    private final int code;
    private final String description;

    /**
     * 私有构造函数
     *
     * @param code
     * @param description
     */
    FeeCodeEnum(int code, String description) {
        this.code = code;
        this.description = description;
    }

    /**
     * @return Returns the code.
     */
    public int getCode() {
        return code;
    }

    /**
     * @return Returns the description.
     */
    public String getDescription() {
        return description;
    }

    /**
     * 通过枚举<code>code</code>获得枚举
     *
     * @param code
     * @return
     */
    public static FeeCodeEnum getByCode(int code) {
        for (FeeCodeEnum status : values()) {
            if (status.getCode() == code) {
                return status;
            }
        }
        return null;
    }



}
