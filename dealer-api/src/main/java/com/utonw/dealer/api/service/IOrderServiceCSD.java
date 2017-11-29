package com.utonw.dealer.api.service;


import com.utonw.dealer.api.dto.request.DeleteRequest;
import com.utonw.dealer.api.entity.ApplyIndentRequest;
import com.utonw.dealer.api.entity.RepaymentPlan;

import java.util.List;
import java.util.Map;

public interface IOrderServiceCSD {
    List<ApplyIndentRequest>  createwithCapital(String uuid);
    /**
     * 创建订单号
     * @return
     */
    String createOrderStr();
    List<ApplyIndentRequest> createOrderList(String uuid);
    String requesTtaskId(String taskId);
    List<ApplyIndentRequest> queryAlreadyTask(String uuid);
    String getTaskId(String appylId);
    /* zhangheng st*/
    /*
    *   插入还款计划
    *
    * */
    String    insertRepaymentPlan(RepaymentPlan repaymentPlan) throws Exception;
    Map<String, Object> queryCarEvaluateInfo(Map<String, Object> map);

    String querySignName(String orderId);
	int delete(DeleteRequest deleteRequest);
   
}
