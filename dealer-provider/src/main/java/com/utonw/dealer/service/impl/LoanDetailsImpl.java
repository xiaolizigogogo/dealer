package com.utonw.dealer.service.impl;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;
import com.utonw.dealer.api.entity.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import com.alibaba.dubbo.config.annotation.Service;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.utonw.dealer.api.dto.LoanInfoDTO;
import com.utonw.dealer.api.dto.MerchantApplyDTO;
import com.utonw.dealer.api.dto.response.LoanInfoResponse;
import com.utonw.dealer.api.enums.LoanStatusEnum;
import com.utonw.dealer.api.service.ILoanDetails;
import com.utonw.dealer.common.push.HttpClientUtil;
import com.utonw.dealer.mapper.BankCardMapper;
import com.utonw.dealer.mapper.CarContractMapper;
import com.utonw.dealer.mapper.CarFileMapper;
import com.utonw.dealer.mapper.CarsokPruductOldcarMapper;
import com.utonw.dealer.mapper.ContractImageurlMapper;
import com.utonw.dealer.mapper.EvaluationSheetMapper;
import com.utonw.dealer.mapper.MerchantApplyMapper;
import com.utonw.dealer.mapper.MerchantIndentMapper;
import com.utonw.dealer.mapper.MerchantReviewMapper;

@Service(version = "1.0.0",timeout = 1500000)
public class LoanDetailsImpl extends ServiceImpl<MerchantApplyMapper, MerchantApply> implements ILoanDetails{
	private static final Logger logger = LoggerFactory.getLogger("MerchantAplVerifyServiceImpl.class");

	@Autowired
	MerchantIndentMapper merchantIndentMapper;

	@Autowired
	MerchantApplyMapper merchantApplyMapper;

	@Autowired
	BankCardMapper bankCardMapper;

	@Autowired
	CarsokPruductOldcarMapper carsokPruductOldcarMapper;

	@Autowired
	EvaluationSheetMapper evaluationSheetMapper;

	@Autowired
	CarFileMapper carFileMapper;

	@Autowired
	MerchantReviewMapper merchantReviewMapper;

	@Autowired
	ContractImageurlMapper contractImageurlMapper;

	@Autowired
	CarContractMapper carContractMapper;

	@Value("${pengyuan.personal}")
	private String personalURL;

	@Value("${pengyuan.enterprise}")
	private String enterpriseURL;

	@Value("${pengyuan.fraud}")
	private String fraudURL;

	private static final String[] FLOW = {"datareview","judgment","lended","repayment","review_evaluate","review_install_collateral","sign_contract",	"first_trial"};

	@Override
	public Map<String, Object> selectIndentInfo(String id) {
		logger.info("进入selectIndentInfo方法");
		Map result = new HashMap();
		//result.put("indentCount",merchantIndentMapper.selectIndentCount(id));
		Map param = new HashMap();
		param.put("condition",Integer.valueOf(2));
		param.put("id",id);
		result.put("customerInfo",merchantApplyMapper.selectCustomerInfo(param));
		result.put("customerBankInfo",bankCardMapper.selectCustomerBankInfo(param));
		CarsokPruductOldcar carInfo = carsokPruductOldcarMapper.selectCarInfo(id);
		result.put("carInfo",carInfo);
		result.put("appraisalInfo",evaluationSheetMapper.selectAppraisalInfo(id));
		LoanInfoDTO loanInfoDTO =new LoanInfoDTO();
		LoanInfoResponse loanInfoResponse = new LoanInfoResponse();
		loanInfoResponse=merchantIndentMapper.selectLoanInfo(id);
		
		loanInfoDTO.setApplyMoney(loanInfoResponse.getApplyMoney());
		//loanInfoDTO.setApprovalAmount(loanInfoResponse.getApprovalAmount());
		loanInfoDTO.setCreatedTime(loanInfoResponse.getCreatedTime());
		loanInfoDTO.setIndentNumber(loanInfoResponse.getIndentNumber());
		loanInfoDTO.setLoanDays("无");
		loanInfoDTO.setMerchantName(loanInfoResponse.getMerchantName());
		loanInfoDTO.setOverdueDays("无");
		loanInfoDTO.setOverdueeRpayment("无");
		loanInfoDTO.setRepayment("无");
		loanInfoDTO.setRepaymentDate("无");
		loanInfoDTO.setRepaymentState("无");
		loanInfoDTO.setIsLegalPerson(loanInfoResponse.getIsLegalPerson());
		result.put("loanInfo",loanInfoDTO);
		MerchantIndent merchantIndent = new MerchantIndent();
		MerchantIndent indent = merchantIndent.selectOne(new EntityWrapper<MerchantIndent>().eq("id",id.toString()));
		MerchantApply merchantApply = new MerchantApply();
		merchantApply=merchantApply.selectOne(new EntityWrapper<MerchantApply>().eq("acountid",indent.getAcountId()));
		int count=merchantIndentMapper.selectIndentLendedCount(indent.getAcountId());
		//拼接车商信息
		MerchantApplyDTO merchantApplyDTO= new MerchantApplyDTO();
		merchantApplyDTO.setAcountid(merchantApply.getAcountid());
		merchantApplyDTO.setApplydate(merchantApply.getApplydate());
		merchantApplyDTO.setCarportnumber(count);
		merchantApplyDTO.setDeadlineTime(indent.getDeadlinetime());
		merchantApplyDTO.setFinancingnumber(merchantApply.getFinancingnumber());
		merchantApplyDTO.setId(merchantApply.getId());
		merchantApplyDTO.setLicensenumber(merchantApply.getLicensenumber());
		merchantApplyDTO.setLimitpercentage(merchantApply.getLimitpercentage());
		merchantApplyDTO.setLoanlimit(merchantApply.getLoanlimit());
		merchantApplyDTO.setMerchantname(merchantApply.getMerchantname());
		merchantApplyDTO.setMonthlyinterest(merchantApply.getMonthlyinterest());
		merchantApplyDTO.setOrganizationcode(merchantApply.getOrganizationcode());
		merchantApplyDTO.setRemark(merchantApply.getRemark());
		merchantApplyDTO.setRepertorynumber(merchantApply.getRepertorynumber());
		merchantApplyDTO.setReviewstatus(merchantApply.getReviewstatus());
		merchantApplyDTO.setScale(merchantApply.getScale());
		merchantApplyDTO.setUpdatetime(merchantApply.getUpdatetime());
		merchantApplyDTO.setOverdueInterest("无");
		merchantApplyDTO.setInterestDate("无");
		merchantApplyDTO.setApplyMoney((indent.getApplymoney()==null||indent.getApplymoney().intValue()==0)?merchantApply.getMaximumloan().toString():indent.getApplymoney().toString());
		merchantApplyDTO.setMaximumLoan(merchantApply.getMaximumloan());
		result.put("percentInterest",merchantApplyDTO);
		result.put("customerMerPic",merchantApplyMapper.selectCustomerMerPic(param));
		result.put("customerContract",contractImageurlMapper.selectCustomerContract(param));
		result.put("carPic",carFileMapper.selectCarFilePic(id));
		result.put("contractAndPic",carContractMapper.selectContractPicAndVideo(id));
		List<String> carPic = carFileMapper.selectCarPicByIndentId(id);
		result.put("vehicleTradingContractPic",carPic);
		result.put("purchaseContract",carContractMapper.selectPurchaseContract(carInfo.getId().toString()));
		return result;
	}

	@Override
	public Boolean insertIndentStatus(String orderId,String approvalLevel,String approvalStatus) {
		logger.info("进入insertIndentStatus方法");
		MerchantIndent merchantIndent = new MerchantIndent();
		MerchantIndent update = merchantIndent.selectOne(new EntityWrapper<MerchantIndent>().eq("id",orderId));
		update.setUpdatetime(new Date());
		if(approvalStatus == null){
            approvalStatus = "pass";
		}
		 update.setIndentstate(approvalLevel);
/*		for(int i = 0; i < FLOW.length; i++){
			if("pass".equals(approvalStatus)){
				if("lended".equals(approvalLevel)) {
                    update.setIndentstate("repayment");
                    break;
				}else if (FLOW[i].equals(update.getIndentstate())) {
                    update.setIndentstate(FLOW[i + 1]);
                    break;
				}
			}else{
                update.setIndentstate("ended");
			}
		}*/
		return update.updateById();
	}

	@Override
	public String selectorderForm(String date) {
		List<MerchantIndent> merchantIndents = merchantIndentMapper.selectorderForm(date);
		String result = "";
		if (merchantIndents.size()!=0) {
			result += "1";
			return result;
		} else {
			result += "2";
			return result;
		}
	}

	@Override
	public Map queryCreditInfo(String customerId) {
		return merchantApplyMapper.queryCreditInfo(customerId);
	}

	@Override
	public Map queryPengYuanCredit(Map param) {
		Map result = new HashMap();
		String url = "";
		if(param.get("type").toString().equalsIgnoreCase("personal")){
			url = personalURL.concat("name=").concat(param.get("name").toString())
					.concat("&documentNo=").concat(param.get("documentNo").toString())
					.concat("&subreportIDs=14200");
		}else if(param.get("type").toString().equalsIgnoreCase("enterprise")){
			url = enterpriseURL.concat("corpName=").concat(param.get("corpName").toString())
					.concat("&subreportIDs=14200");
		}else if(param.get("type").toString().equalsIgnoreCase("fraud")){
			url = fraudURL.concat("name=").concat(param.get("name").toString())
					.concat("&documentNo=").concat(param.get("documentNo").toString())
					.concat("&phone=").concat(param.get("phone").toString())
					.concat("&subreportIDs=14200");
		}
		url = url.concat("&relationId=").concat(param.get("accountId").toString());
		JSONObject object = (JSONObject) JSONObject.parse(HttpClientUtil.sendPostRequestByJava(url,""));
		result.put("byte",object.get("byte"));
		result.put("state",object.get("state"));
		return result;
	}


}
