package com.utonw.utonbase.core.erpcommon.utils;

/**
 * Created by DONG on 2015/8/12. 还款状态枚举
 */
public enum PaymentEnum {

    /**
     * 开始催收还款
     */
    STARTCOLLECTION(0,"STARTCOLLECTION"),

    /**
     * 逾期处理
     */
    OVERDUEHANDLE(1,"overdueHandle"),

    /**
     * 已催收还款(短信电话通知)
     */
    CONTINUEREPAYMENTING(2,"continueRepaymenting"),

    /**
     * 还款处理
     */
    REPAYMENT(3,"repayment"),

    /**
     * 申请续借
     */
    RENEW(4,"renew"),

    /**
     * 正常还款
     */
    COMMONREPAYMENT(5,"commonRepayment"),

    /**
     * 续借还款
     */
    CONTINUEREPAYMENT(6,"continueRepayment"),

    /**
     * 提前还款
     */
    ADVANCEDREPAYMENT(7,"advancedRepayment"),


    /**
     * 还款成功标识
     */
    PAYMENTEDSUCCESS(8,"paymentedSuccess"),


    /**
     * 同意续借
     */
    REPAYMENTEDHANDLE(11,"repaymentedHandle"),

    /**
     * 放弃还款
     */
    ABANDONREPAYMENT(12,"abandonRepayment"),

    /**
     * 拒绝续借
     */
    NOPASS(13,"noPass"),

    /**
     * 暂不处理
     */
    NODISPOSE(14,"noDispose"),

    /**
     * 申请罚息调整
     */
    INTERESTHANDLE(15,"interestHandle"),

    /**
     * 拖车处理
     */
    TRACKCARHANDLE(16,"trackCarHandle"),

    /**
     * 风控处理
     */
    LATEPROCESSED(17,"lateProcessed"),

    /**
     * 继续拖车
     */
    COUNTINUEADJUST(18,"countinueAdjust"),

    /**
     * 未拖车
     */
    NOTOWTRUCK(19,"noTowTruck"),


    /**
     * 待拖车
     */
    WAITTRUCK(20,"waitTruck"),

    /**
     * 已拖车处理
     */
    TRACKED(28,"tracked"),


    /**
     * 坏账申请
     */
    LOANAPPLYEND(21,"loanApplyEnd"),


    /**
     * 继续催收
     */
    COUNTINUEURGEREPAYMENT(22,"countinueUrgeRepayment"),


    /**
     * 完成罚息修改
     */
    COMPLETEUPDATEFINFEE(23,"completeUpdatefinFee"),


    /**
     * 卖车还款
     */
    SALEREPAYMENT(24,"saleRepayment"),


    /**
     * 提车还款
     */
    DETAINEDCARREPAYMENT(25,"detainedCarRepayment"),


    /**
     * 坏账归档
     */
    BADLOANAPPLICATION(26,"badLoanApplication"),


    /**
     * 还款不提车
     */
    VEHICLENOSALEREPAYMENT(27,"vehicleNoSaleRepayment"),
	
	 ALREADYTOWTRUCK(29,"alreadyTowTruck"),

    /**
     * 收款确认
     */
    RECEIVEMONEY(41, "receivemoney"),
;


    private final int code;
    private final String description;

    /**
     * 私有构造函数
     *
     * @param code
     * @param description
     */
    PaymentEnum(int code, String description) {
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
    public static PaymentEnum getByCode(int code) {
        for (PaymentEnum status : values()) {
            if (status.getCode() == code) {
                return status;
            }
        }
        return null;
    }

    public static void main(String[] args){

//        System.out.println(PaymentEnum.getByCode(1).toString().toLowerCase());

        System.out.println(PaymentEnum.STARTCOLLECTION.getCode());
    }


    public static boolean isPaymentEnum(String paymentEnumStr){
        for (PaymentEnum status : values()) {
            if (status.getDescription().equals(paymentEnumStr)) {
                return true;
            }
        }
        return false;
    }

    public static Integer getCodeByStr(String paymentEnumStr){
        for (PaymentEnum status : values()) {
            if (status.getDescription().equals(paymentEnumStr)) {
                return status.getCode();
            }
        }
        return null;
    }

    public static Integer getCodeByRepay(String paymentEnumStr) {
        /**
         * 正常还款审核-repaymented
         * 续借还款审核-continueRepayment
         * 提前还款审核-advancedRepaymented
         */
        if ("repaymented".equals(paymentEnumStr)) {
            return PaymentEnum.COMMONREPAYMENT.getCode();
        } else if ("continueRepayment".equals(paymentEnumStr)) {
            return PaymentEnum.CONTINUEREPAYMENT.getCode();
        } else if ("advancedRepaymented".equals(paymentEnumStr)) {
            return PaymentEnum.ADVANCEDREPAYMENT.getCode();
        } else if ("saleRepayment".equals(paymentEnumStr)) {
            return PaymentEnum.SALEREPAYMENT.getCode();
        } else if ("detainedCarRepayment".equals(paymentEnumStr)) {
            return PaymentEnum.DETAINEDCARREPAYMENT.getCode();
        }  else if ("vehicleNoSaleRepayment".equals(paymentEnumStr)) {
            return PaymentEnum.VEHICLENOSALEREPAYMENT.getCode();
        } else if ("receivemoney".equals(paymentEnumStr)){
            return PaymentEnum.RECEIVEMONEY.getCode();
        }
        return null;
    }


}
