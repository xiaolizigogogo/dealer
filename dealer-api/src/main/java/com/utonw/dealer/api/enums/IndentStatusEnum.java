package com.utonw.dealer.api.enums;

/**
 * Created by WANGYJ on 2017/5/9.
 * 订单状态定义
 */
public enum IndentStatusEnum {
    assess("待线下审核",1),
    trial("待初审",2),
    datareview("待复核",3),
    repayment("还款中",6),
    ended("还款完成",7),
    first_trial("初审并分配评估师",8),
    evaluate_install_collateral("评估及安装押品",9),
    review_evaluate("风控审核车辆评估" ,10),
    review_install_collateral("风控审核押品",11),
    judgment("平台总部终审",12),
    sign_contract("签订借款合同",13),
    lended("平台财务放款",14),
    ;
    String status;
    int code;
    IndentStatusEnum(String status,int code){
        this.status = status;
        this.code = code;
    }
    public static int getCodeByStatus(String status) {
        for (IndentStatusEnum c : IndentStatusEnum.values()) {
            if (c.getStatus().equals(status)) {
                return c.code;
            }
        }
        return 0;
    }
    public String getStatus(){
        return status;
    }
    public int getCode(){
        return code;
    }
}
