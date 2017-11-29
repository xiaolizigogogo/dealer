package com.utonw.dealer.api.enums;

/**
 * Created by WANGYJ on 2017/5/17.
 * 定义车商贷的状态的枚举类
 */
public enum  LoanStatusEnum {
    assess("待线下审核","assess"),
    trial("待初审","trial"),
    datareview("待复核","datareview"),
    judgment("待终审","judgment"),
    lended("待放款","lended"),
    repayment("还款中","repayment"),
    ended("完结","ended"),
	first_trial("初审并分配评估师","first_trial"),
	evaluate_install_collateral("评估及安装押品","evaluate_install_collateral"),
	review_evaluate("风控审核车辆评估","review_evaluate"),
	review_install_collateral("风控审核押品","review_install_collateral"),
	sign_contract("签订借款合同","sign_contract"),
	dismantling("拆除设备","dismantling"),
	withholding_commission("委托代扣","withholding_commission"),
	apply_restart("","apply_restart"),
	loan_restart("","loan_restart")
    ;
    String message;
    String code;
    LoanStatusEnum(String message,String code){
        this.code=code;
        this.message=message;
    }
    public static String getName(String code) {
        for (LoanStatusEnum c : LoanStatusEnum.values()) {
            if (c.getCode().equals(code)) {
                return c.message;
            }
        }
        return null;
    }

    public String getMessage(){
        return message;
    }
    public String getCode(){
        return code;
    }
}
