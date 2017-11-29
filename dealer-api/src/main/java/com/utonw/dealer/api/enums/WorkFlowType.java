package com.utonw.dealer.api.enums;
public enum WorkFlowType{
    CarDealerLoan("CarDealerLoan",1),
    CarDealerRepayment("CarDealerRepayment",2),
    CarDealerApply("CarDealerApply",3),
    ;
    String name;
    int code;
    WorkFlowType(String name, int code) {
        this.name = name;
        this.code = code;
    }

    public int getCode() {
        return code;
    }

    public String getName() {
        // TODO Auto-generated method stub
        return name;
    }
    public static String getStringByCode(int code){
        for (WorkFlowType s : WorkFlowType.values()){
            if(s.getCode() == code){
                return s.getName();
            }
        }
        return null;
    }
}