package com.utonw.dealer.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.dubbo.config.annotation.Service;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.utonw.dealer.api.dto.request.CustomerListRequest;
import com.utonw.dealer.api.dto.request.MerchantRequest;
import com.utonw.dealer.api.dto.response.CustomerListResponse;
import com.utonw.dealer.api.dto.response.CustomerMerPicResponse;
import com.utonw.dealer.api.entity.LoanHandlerRequest;
import com.utonw.dealer.api.entity.MerchantApply;
import com.utonw.dealer.api.entity.MerchantIndent;
import com.utonw.dealer.api.entity.MerchantReview;
import com.utonw.dealer.api.enums.AudioTypeEnum;
import com.utonw.dealer.api.service.IERPCustomerList;
import com.utonw.dealer.mapper.BankCardMapper;
import com.utonw.dealer.mapper.ContractImageurlMapper;
import com.utonw.dealer.mapper.EvaluationSheetMapper;
import com.utonw.dealer.mapper.MerchantApplyMapper;
@Service(version="1.0.0",timeout = 1500000)
public class ERPCustomerListImpl extends ServiceImpl<MerchantApplyMapper, MerchantApply> implements IERPCustomerList{

	private static final Logger logger = LoggerFactory.getLogger(ERPCustomerListImpl.class);

	@Autowired
	MerchantApplyMapper merchantApplyMapper;

	@Autowired
	ContractImageurlMapper contractImageurlMapper;

	@Autowired
	BankCardMapper bankCardMapper;

	@Autowired
	EvaluationSheetMapper evaluationSheetMapper;
	@Override
	public Map<String,Object> selectCustomerList(CustomerListRequest customerListRequest) {
		Map<String,Object> result = new HashMap();
		Map map = new HashMap();
		map.put("personName",customerListRequest.getPersonName());
		map.put("merchantName",customerListRequest.getMerchantName());
		map.put("phoneNumber",customerListRequest.getPhoneNumber());
		map.put("reviewStatus",customerListRequest.getReviewStatus());
		map.put("list",customerListRequest.getApplyId());
		map.put("submitState",1);
		Page<CustomerListResponse> page = null;
		result.put("count",merchantApplyMapper.selectReviewStatus());
		result.put("sum",merchantApplyMapper.selectCustomerList(map).size());
		page = PageHelper.startPage(customerListRequest.getPageNum(),customerListRequest.getPageSize());
		result.put("result",merchantApplyMapper.selectCustomerList(map));
		return result;
	}
	@Override
	public Map<String,Object> queryCustomerApplyList(CustomerListRequest customerListRequest) {
		Map<String,Object> result = new HashMap();
		Map map = new HashMap();
		map.put("personName",customerListRequest.getPersonName());
		map.put("merchantName",customerListRequest.getMerchantName());
		map.put("phoneNumber",customerListRequest.getPhoneNumber());
		map.put("reviewStatus",customerListRequest.getReviewStatus());
		map.put("list",customerListRequest.getApplyId());
		map.put("submitState",1);
		Page<CustomerListResponse> page = null;
		page = PageHelper.startPage(customerListRequest.getPageNum(),customerListRequest.getPageSize());
		result.put("result",merchantApplyMapper.selectCustomerApplyList(map));
		return result;
	}
	@Override
	public Map<String,Object> selectCustomerInfo(String accountId) {
		
		
		Map<String,Object> result = new HashMap();
		Map param = new HashMap();
		param.put("accountId",accountId);
		param.put("condition",Integer.valueOf(1));
		result.put("customerInfo",merchantApplyMapper.selectCustomerInfo(param));
		
		
		
		List<MerchantApply> mcc = merchantApplyMapper.merchantApplylist(accountId);
		
		if(mcc !=null && mcc.size()>0) {
			result.put("InterestRates",mcc.get(0));
		}
		
		
		
		List<CustomerMerPicResponse> customerMerPic = merchantApplyMapper.selectCustomerMerPic(param);
		List<CustomerMerPicResponse> customerCertificate = new ArrayList<>();
		List<CustomerMerPicResponse> customerMerPicNew = new ArrayList<>();
		for(int i=0;i<customerMerPic.size();i++){
			if(customerMerPic.get(i).getFileName().equals("展厅内照片")||customerMerPic.get(i).getFileName().equals("门头照片")||customerMerPic.get(i).getFileName().equals("背景墙照片")){
				CustomerMerPicResponse customerMerPicResponse = new CustomerMerPicResponse();
				customerMerPicResponse.setFileName(customerMerPic.get(i).getFileName());
				customerMerPicResponse.setFileUrl(customerMerPic.get(i).getFileUrl());
				customerCertificate.add(customerMerPicResponse);
				
			}
			else{
				customerMerPicNew.add(customerMerPic.get(i));
			}
		}
		List<CustomerMerPicResponse> customerAudioAndAddress = merchantApplyMapper.selectCustomerAudioAndAddress(param);
		for(int i=0;i<customerAudioAndAddress.size();i++){
			if(!customerAudioAndAddress.get(i).getFileName().equals("详细地址")){
				customerAudioAndAddress.get(i).setFileName(AudioTypeEnum.getName(customerAudioAndAddress.get(i).getFileName()));
			}
			customerCertificate.add(customerAudioAndAddress.get(i));
		}
		result.put("customerMerPic",customerMerPicNew);
		result.put("customerCertificate",customerCertificate);
		result.put("customerContract",contractImageurlMapper.selectCustomerContract(param));
		result.put("customerBankInfo",bankCardMapper.selectCustomerBankInfo(param));
		return result;
	}

	@Override
	public Map<String,Object> submitMerApply(MerchantApply merchantApply) {
		merchantApply.setUpdatetime(new Date());
		Map result = new HashMap();
		result.put("msg","failed");
		result.put("count",Integer.valueOf(0));
		if (merchantApply.updateById()){
			result.put("msg","success");
			result.put("count",Integer.valueOf(1));
		}
		return result;
	}

	@Override
	public Boolean modifyIndentState(LoanHandlerRequest loanHandlerRequest,String userUuid) {
		Boolean result = false;
		MerchantReview merchantReview = convertMerchantReview(loanHandlerRequest,userUuid);
		if(merchantReview.insert()){
			result = true;
		}
		return result;
	}

	private MerchantReview convertMerchantReview(LoanHandlerRequest loanHandlerRequest, String userUuid){
		MerchantReview merchantReview = new MerchantReview();
		MerchantIndent merchantIndent = new MerchantIndent();
		merchantIndent = merchantIndent.selectOne(new EntityWrapper<MerchantIndent>().eq("id",loanHandlerRequest.getOrderId()));
		MerchantApply merchantApply = new MerchantApply();
		merchantApply=merchantApply.selectOne(new EntityWrapper<MerchantApply>().eq("acountId",merchantIndent.getAcountId()));
		merchantReview.setApplyMoney(merchantIndent.getApplymoney());
		merchantReview.setApproveMoney(loanHandlerRequest.getApprovalAmount());
		merchantReview.setMerchantName(merchantApply.getMerchantname());
		merchantReview.setApplyTime(loanHandlerRequest.getApprovalTime());
		merchantReview.setIndentId(loanHandlerRequest.getOrderId());
		merchantReview.setLoanStatus(loanHandlerRequest.getApprovalLevel());
		merchantReview.setReviewConclusion(loanHandlerRequest.getApprovalConclusion());
		merchantReview.setReviewById(userUuid);
		return merchantReview;
	}
	
	@Override
	public Map<String, Object> queryCarEvaluate(String id) {
		return evaluationSheetMapper.selectEvaluateInfoById(id);
	}

	@Override
	public PageInfo<CustomerListResponse> queryAllApplyByCondition(MerchantRequest merchantRequest) {
		PageHelper.startPage(merchantRequest.getPageNum(),merchantRequest.getPageSize(),true);
		Page<CustomerListResponse> page=merchantApplyMapper.selectApplyByCondition(merchantRequest);
		return page.toPageInfo();
	}
	@Override
	public int queryAllApplyCount() {	
		return merchantApplyMapper.selectCount(null);
	}
	@Override
	public boolean modifyApplyInfo(MerchantApply merchantApply) {
		logger.info("【修改车商利率】 merchantApply :{}",JSONObject.toJSONString(merchantApply));
		return merchantApply.updateById();
	}

}
