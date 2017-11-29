package com.utonw.dealer.api.service;


import com.github.pagehelper.PageInfo;
import com.utonw.dealer.api.dto.request.OrderPageRequest;
import com.utonw.dealer.api.entity.*;
import com.utonw.dealer.api.entity.erp.User;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

public interface ILoanServiceCSD {

    Map<String,Object> reviewApprovalStatus(LoanHandlerRequest loanHandlerRequest);

    Map<String,Object> selectAllApprovalInfoList(List<String> id);

    Map<String,Object> login(String loginName,String password);

    Map queryMerchantCount(String userId);

    Map queryBusinessKey(String userId,Integer flow);

    String jumpToTpsDate(String accountId, String timestamp);

    RepaymentPlanVo selectRepaymentPlan(String orderId,String uuid)  throws Exception;

    public List<CsdApprovalInfo> selectAllApprovalList(String id);

    PageInfo<Map<String,Object>> queryRepaymentList(OrderPageRequest request);

    Map queryRepaymentPlanInfo(String orderId,User user);

    Map getLoanOrderCount(String uuid);

    List<RateConfig> selectParameterSetting();

    int addFinancingRate(Integer dayRange, BigDecimal rate);

    int updateFinancingRate(Integer dayRange,BigDecimal rate,Integer id,Boolean enable);

    List<RateConfig> getFinancingRate(BigDecimal monthlyinterest);

    void modifyRepayment(LoanHandlerRequest loanHandlerRequest);

    Map ovedueRepaymentHandler(LoanHandlerRequest loanHandlerRequest);

}
