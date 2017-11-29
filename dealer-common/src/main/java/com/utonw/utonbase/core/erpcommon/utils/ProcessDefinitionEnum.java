package com.utonw.utonbase.core.erpcommon.utils;

import java.util.EnumSet;
import java.util.HashMap;
import java.util.Map;

/**
 * 流程定义枚举
 * Created by user on 2015/6/19.
 */
public enum ProcessDefinitionEnum {
    VEHICLEASSESS("vehicleAssess") {// 车辆评估
        @Override
        public ProcessDefinitionEnum nextProcess() {
            return DEPARTLEADADUIT;
        }
    },
    DEPARTLEADADUIT("departLeadAduit") {// 业务部门领导初审
        @Override
        public ProcessDefinitionEnum nextProcess() {
            return TRIALPHASE;
        }
    },
    TRIALPHASE("trialPhase") {//总部面审
        @Override
        public ProcessDefinitionEnum nextProcess() {
            return CALLBACK;
        }
    },
    CALLBACK("callBack") {//总部电话回访
        @Override
        public ProcessDefinitionEnum nextProcess () {
            return SIGNCONTRACT;
        }
    }
    , SIGNCONTRACT("signContract") {//线下签订相关合同
        @Override
        public ProcessDefinitionEnum nextProcess() {
            return JUDGMENT;
        }
    },

    VISITECHECK("visiteCheck") {//线下上门核实
        @Override
        public ProcessDefinitionEnum nextProcess() {
            return JUDGMENT;
        }
    },
    JUDGMENT("judgment") {//总部贷款终审
        @Override
        public ProcessDefinitionEnum nextProcess() {
            return DATAREVIEW;
        }
    },
    DATAREVIEW("dataReview") {//总部资料复核
        @Override
        public ProcessDefinitionEnum nextProcess() {
            return REUPLOADINFORMATIN;
        }
    },
    REUPLOADINFORMATIN("reuploadInformatin") {//资料或相关合同重新上传
        @Override
        public ProcessDefinitionEnum nextProcess() {
            return LENDED;
        }
    },
    LENDED("lended") {//借款出帐
        @Override
        public ProcessDefinitionEnum nextProcess() {
            return REPAYMENT;
        }
    },
    REPAYMENT("repayment") {//借款还款
        @Override
        public ProcessDefinitionEnum nextProcess() {
            return END;
        }
    }, END("end") {//还款完成
        @Override
        public ProcessDefinitionEnum nextProcess () {
            return null;
        }
    };

    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    private ProcessDefinitionEnum(String name) {
        this.name = name;
    }

    public abstract ProcessDefinitionEnum nextProcess();

    public static Map<String, ProcessDefinitionEnum> createLookupMap() {
        Map<String, ProcessDefinitionEnum> map = new HashMap<>();

        for (ProcessDefinitionEnum p : EnumSet.allOf(ProcessDefinitionEnum.class)) {
            map.put(p.getName(), p);
        }
        return map;
    }

    public static void main(String[] args) {
        String processDefinitionId = "departLeadAduit";
        System.out.println("next:" + ProcessDefinitionEnum.createLookupMap().get(processDefinitionId).nextProcess().getName());
    }
}
