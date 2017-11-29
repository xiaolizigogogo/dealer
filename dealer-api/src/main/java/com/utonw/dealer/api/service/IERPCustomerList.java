package com.utonw.dealer.api.service;

import java.util.Map;

import com.github.pagehelper.PageInfo;
import com.utonw.dealer.api.dto.request.CustomerListRequest;
import com.utonw.dealer.api.dto.request.MerchantRequest;
import com.utonw.dealer.api.dto.response.CustomerListResponse;
import com.utonw.dealer.api.entity.LoanHandlerRequest;
import com.utonw.dealer.api.entity.MerchantApply;
public interface IERPCustomerList {

	Map<String,Object> selectCustomerList(CustomerListRequest customerListRequest);

	Map<String,Object> selectCustomerInfo(String id);

	Map<String,Object> submitMerApply(MerchantApply merchantApply);

    Boolean modifyIndentState(LoanHandlerRequest loanHandlerRequest, String userUuid);
    
    Map<String, Object> queryCarEvaluate(String id);
    /**
     * 查询申请表，用于客户列表
     * @param merchantRequest
     * @return
     */
    PageInfo<CustomerListResponse> queryAllApplyByCondition(MerchantRequest merchantRequest);

	Map<String, Object> queryCustomerApplyList(CustomerListRequest customerListRequest);
	
	int queryAllApplyCount();
	
	boolean modifyApplyInfo(MerchantApply merchantApply);
}