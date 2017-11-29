package com.utonw.utonbase.core.erpcommon.utils;

/**
 *
 * Created by DONG on 2014/12/28. Loan 状态
 */
public enum BaseStatusEnum {

    /** 10 借据 */
    NOMAL(10, "NOMAL"),
    /**  20 贷款附件 */
    EXCEPTION(20,"EXCEPTION"),
    /** 30 投资中 筹款中 未出款 */
    INVESTING(30,"INVESTING"),

    /**
     * 已还款
     */
    REPAYED(5,"REPAYED"),

    /**
     * 逾期未还款
     */
    NOREPAY(0,"NOREPAY"),


    /**
     * 待还款
     */
    WAITREPAY(2,"WAITREPAY"),
    
    
   /**
    * 已申请
    */
    ALREADYAPPLY(1,"ALREADYAPPLY");
//    alreadyapply
    
    
    

    private final int code;
    private final String description;

    /**
     * 私有构造函数
     *
     * @param code
     * @param description
     */
    BaseStatusEnum(int code, String description) {
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
    public static BaseStatusEnum getByCode(int code) {
        for (BaseStatusEnum status : values()) {
            if (status.getCode() == code) {
                return status;
            }
        }
        return null;
    }






}
