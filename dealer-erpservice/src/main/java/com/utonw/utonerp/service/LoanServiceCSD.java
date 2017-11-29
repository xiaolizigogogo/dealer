package com.utonw.utonerp.service;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.utonw.dealer.api.entity.*;
import com.utonw.dealer.api.entity.erp.SystemParameter;
import com.utonw.dealer.api.entity.erp.User;
import com.utonw.dealer.api.service.erp.IUserService;
import com.utonw.dealer.api.service.erp.WorkFlowService;
import com.utonw.dealer.api.util.erp.Constants;
import com.utonw.utonbase.core.erpcommon.config.ParamterControl;
import com.utonw.utonbase.core.erpcommon.utils.DateUtils;
import com.utonw.utonbase.core.erpcommon.utils.MD5UtilWX;
import com.utonw.utonerp.mapper.*;
import org.apache.commons.collections.map.HashedMap;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.alibaba.dubbo.common.utils.StringUtils;
import com.alibaba.dubbo.config.annotation.Service;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.utonw.dealer.api.dto.request.OrderPageRequest;
import com.utonw.dealer.api.enums.CarDealerLoanEnum;
import com.utonw.dealer.api.enums.CarDealerReviewEnum;
import com.utonw.dealer.api.enums.WorkFlowType;
import com.utonw.dealer.api.service.ILoanServiceCSD;

@Service(version = "1.0.0")
public class LoanServiceCSD implements ILoanServiceCSD {
	Logger logger = Logger.getLogger(LoanServiceCSD.class);
	@Autowired
	CsdApprovalInfoMapper csdApprovalInfoMapper;

	@Qualifier("workFlowService")
	@Autowired
	private WorkFlowService workFlowService;
	@Autowired
	private IUserService userService;
	@Autowired
	private WorkflowviewMapper workflowviewMapper;
	@Autowired
	RepaymentPlanMapper repaymentPlanMapper;
	@Autowired
	private SystemParameterMapper systemParameterMapper;
	@Autowired
	private RateConfigMapper rateConfigMapper;

	private String[] flows = { "distribution_user", "information_verification", "headquarters_audit",
			"installCamera_signContract", "audit_camera_contract", "bind_bankCard" };

	// 节点处理
	@Override
	public Map<String, Object> reviewApprovalStatus(LoanHandlerRequest loanHandlerRequest) {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> param = new HashMap<String, Object>();
		for (CarDealerReviewEnum carDealerReviewEnum : CarDealerReviewEnum.values()) {
			param.put(carDealerReviewEnum.name(), false);
		}
		if (!StringUtils.isEmpty(loanHandlerRequest.getUser())) {
			param.put("user", loanHandlerRequest.getUser());
		}
		if (!StringUtils.isEmpty(loanHandlerRequest.getApprovalStatus())) {
			param.put(loanHandlerRequest.getApprovalStatus(), true);
		}
		result.put("ApprovalInsertCount",
				csdApprovalInfoMapper.insertSelective(convertApprovalInfo(loanHandlerRequest)));
		workFlowService.complete(loanHandlerRequest.getTaskId(), param);
		result.put("success", true);
		return result;
	}

	@Override
	public Map<String, Object> selectAllApprovalInfoList(List<String> id) {
		Map<String, Object> result = new HashedMap();
		result.put("success", false);
		if (id != null && id.size() > 0) {
			result.put("result", repaymentPlanMapper.selectByOrderIds(id));
			result.put("success", true);
			return result;
		}
		return result;
	}

	@Override
	public List<CsdApprovalInfo> selectAllApprovalList(String id) {
		return csdApprovalInfoMapper.selectAllByOrderId(id);
	}

	@Override
	public PageInfo<Map<String, Object>> queryRepaymentList(OrderPageRequest request) {
		PageHelper.startPage(request.getPageNum(), request.getPageSize(), true);
		return repaymentPlanMapper.selectAllByTaskList(request).toPageInfo();
	}

	public Map<String, Object> login(String loginName, String password) {
		return userService.verifyLogin(loginName, password);
	}

	@Override
	public Map queryMerchantCount(String userId) {
		List<Map> resultList = workflowviewMapper.selectMerchantCount(userId, WorkFlowType.CarDealerApply.getName());
		Map result = new HashMap();
		for (int i = 0; i < resultList.size(); i++) {
			String taskDefKey = resultList.get(i).get("TASK_DEF_KEY_").toString();
			Integer count = Integer.valueOf(resultList.get(i).get("count").toString());
			if (result.get(taskDefKey) == null) {
				result.put(taskDefKey, count);
			} else {
				Integer temp = Integer.valueOf(result.get(taskDefKey).toString());
				result.put(taskDefKey, temp + count);
			}
		}
		return result;
	}

	@Override
	public Map queryBusinessKey(String userId, Integer flow) {
		Map param = new HashMap();
		Map result = new HashedMap();
		param.put("userId", userId);
		param.put("prockey", WorkFlowType.CarDealerApply.getName());
		List<workflowtask> workflowtasks = workflowviewMapper.queryTaskByUserId(param);
		Map<String, Object> workflowtaskMaps = new HashMap<>();
		List businessList = new ArrayList();
		for (int i = 0; i < workflowtasks.size(); i++) {
			if (flow == null) {
				businessList.add(i, workflowtasks.get(i).getBusinesskey());
				workflowtaskMaps.put(workflowtasks.get(i).getBusinesskey(), workflowtasks.get(i));
			} else {
				if (flows[flow].equals(workflowtasks.get(i).getTask_def_key())) {
					businessList.add(workflowtasks.get(i).getBusinesskey());
					workflowtaskMaps.put(workflowtasks.get(i).getBusinesskey(), workflowtasks.get(i));
				}
			}
		}
		result.put("businessList", businessList);
		result.put("workflowtaskMaps", workflowtaskMaps);
		result.put("sum", workflowtasks.size());
		return result;
	}

	@Override
	public String jumpToTpsDate(String accountId, String timestamp) {
		String tpsUrl = ParamterControl.LINK_TPS_URL;
		String privateKey = ParamterControl.LINK_TPS_PRIVATEKEY;
		String token = "";
		if (accountId.length() > 0 && timestamp.length() > 0) {
			token = MD5UtilWX.MD5Encode((accountId + timestamp + privateKey), "UTF-8");
		} else {
			logger.debug("jumpToTpsDate Service Err Param accountId : " + accountId + " , timeStamp : " + timestamp);
		}
		return tpsUrl + accountId + "&timestamp=" + timestamp + "&token=" + token;
	}

	@Override
	public RepaymentPlanVo selectRepaymentPlan(String orderId, String uuid) throws Exception {
		RepaymentPlan repaymentPlan = new RepaymentPlan();
		repaymentPlan = repaymentPlanMapper.selectrepaymentPlan(orderId);
		RepaymentPlanVo repaymentPlanDTO = new RepaymentPlanVo();
		repaymentPlanDTO.setMerchantName(repaymentPlan.getCarName() == null ? "" : repaymentPlan.getCarName());// 商家名称
		repaymentPlanDTO.setRealName(repaymentPlan.getBorrowerd());// 借款人
		repaymentPlanDTO.setJudgeMoney(repaymentPlan.getLoanAmt() == 0 ? null
				: new BigDecimal(repaymentPlan.getLoanAmt()).multiply(new BigDecimal(10000)).setScale(2,
						BigDecimal.ROUND_HALF_UP));// 放款金额
		repaymentPlanDTO.setDeadlineTime(repaymentPlan.getCyclicity());// 周期天数
		repaymentPlanDTO
				.setInterestRate(repaymentPlan.getInterestRate() == null ? null : repaymentPlan.getInterestRate());// 利率
		repaymentPlanDTO.setLoan_time(repaymentPlan.getLoanTime());// 放款时间
		repaymentPlanDTO.setRepaymen_time(repaymentPlan.getRepaymenTime());// 还款时间
		repaymentPlanDTO.setRepaymen_amt(repaymentPlan.getRepaymenAmt() == 0 ? null
				: new BigDecimal(repaymentPlan.getRepaymenAmt()).setScale(2, BigDecimal.ROUND_HALF_UP));// 还款金额
		Date date = new Date();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		long difference = df.parse(df.format(date)).getTime() - df.parse(repaymentPlan.getRepaymenTime()).getTime();
		long days = difference / (1000 * 60 * 60 * 24);
		BigDecimal fine = new BigDecimal(0);
		if (days > 0) {
			User user = userService.findById(uuid);
			if (user != null) {
				SystemParameter parameter = systemParameterMapper.selectParameterByKey(user.getCompanyId(),
						Constants.LOAN_OVERDUE_DAYLYRATE);
				BigDecimal penalty = new BigDecimal(parameter.getSysValue());
				BigDecimal loanAmt = new BigDecimal(repaymentPlan.getLoanAmt());
				fine = loanAmt.multiply(penalty).multiply(new BigDecimal(days));
				BigDecimal b = fine;
				repaymentPlanDTO.setFine(b.setScale(2, BigDecimal.ROUND_HALF_UP).multiply(new BigDecimal(10000)));// 罚金
				repaymentPlanDTO.setOverdue(days + "");// 逾期天数
			}
		}

		repaymentPlanDTO.setAmount(new BigDecimal(repaymentPlan.getRepaymenAmt())
				.add(fine.multiply(new BigDecimal(10000))).setScale(2, BigDecimal.ROUND_HALF_UP));// 合计金额
		return repaymentPlanDTO;
	}

	private CsdApprovalInfo convertApprovalInfo(LoanHandlerRequest loanHandlerRequest) {
		CsdApprovalInfo csdApprovalInfo = new CsdApprovalInfo();
		csdApprovalInfo.setOrderid(loanHandlerRequest.getOrderId());
		csdApprovalInfo.setApprovalstatus(loanHandlerRequest.getApprovalStatus());
		csdApprovalInfo.setApprovalamount(loanHandlerRequest.getApprovalAmount());
		csdApprovalInfo.setApprovalconclusion(loanHandlerRequest.getApprovalConclusion());
		csdApprovalInfo.setApprovalid(loanHandlerRequest.getApprovalId());
		csdApprovalInfo.setApprovaltime(
				loanHandlerRequest.getApprovalTime() == null ? new Date() : loanHandlerRequest.getApprovalTime());
		csdApprovalInfo.setLendedtime(
				loanHandlerRequest.getLendedTime() == null ? new Date() : loanHandlerRequest.getLendedTime());
		csdApprovalInfo.setLendedpic(loanHandlerRequest.getLendedPic());
		csdApprovalInfo.setApprovallevel(loanHandlerRequest.getApprovalLevel());
		return csdApprovalInfo;
	}

	@Override
	public Map queryRepaymentPlanInfo(String orderId, User user) {
		Map map = new HashMap();
		if (!StringUtils.isEmpty(orderId)) {
			RepaymentPlan repaymentPlan = repaymentPlanMapper.selectByOrderId(orderId);
			try {
				Date date = DateUtils.parseDate(repaymentPlan.getRepaymenTime(), DateUtils.webFormat);
				BigDecimal loanMoney = new BigDecimal(repaymentPlan.getLoanAmt()).multiply(new BigDecimal(10000));
				long overdueDay = DateUtils.getDiffDays(new Date(), date);
				String loanStatus = "逾期处理";
				// 计算逾期金额
				if (overdueDay <= 0) {
					overdueDay = 0;
					loanStatus = "还款申请中";
				}
				SystemParameter parameter = systemParameterMapper.selectParameterByKey(user.getCompanyId(),
						Constants.LOAN_OVERDUE_DAYLYRATE);
				BigDecimal needRepaymentPlan = new BigDecimal(repaymentPlan.getRepaymenAmt());
				BigDecimal overdueMoney = loanMoney.multiply(new BigDecimal(overdueDay))
						.multiply(new BigDecimal(parameter.getSysValue())).setScale(2, BigDecimal.ROUND_HALF_UP);
				BigDecimal totalMoeny = needRepaymentPlan.add(overdueMoney);
				map.put("loanMoney", loanMoney);
				map.put("needRepaymentPlan", needRepaymentPlan);
				map.put("overdueMoney", overdueMoney);
				map.put("overdueDay", overdueDay);
				map.put("totalMoeny", totalMoeny);
				map.put("orderNum", repaymentPlan.getOrderNum());
				map.put("merchantName", repaymentPlan.getCarName());
				map.put("loanTime", repaymentPlan.getCyclicity());
				map.put("interestRate", repaymentPlan.getInterestRate());
				map.put("outAccountTime", repaymentPlan.getOutAccountTime());
				map.put("repaymentTime", repaymentPlan.getRepaymenTime());
				map.put("loanStatus", loanStatus);
				map.put("outAccountVoucher",repaymentPlan.getOutAccountVoucher());

			} catch (ParseException e) {
				e.printStackTrace();
				logger.error("查询还款计划错误", e);
			}
			return map;
		} else {
			return new HashMap();
		}
	}

	@Override
	public Map ovedueRepaymentHandler(LoanHandlerRequest loanHandlerRequest) {
		csdApprovalInfoMapper.insertSelective(convertApprovalInfo(loanHandlerRequest));
		RepaymentPlan repaymentPlan = new RepaymentPlan();
		repaymentPlan.setOrderId(loanHandlerRequest.getOrderId());
		repaymentPlan.setEndTime(new Date());
		repaymentPlan.setEndType(loanHandlerRequest.getEndType());
		repaymentPlanMapper.updateByOrderId(repaymentPlan);
		Map map = new HashMap();
		map.put("success", true);
		return map;
	}

	@Override
	public void modifyRepayment(LoanHandlerRequest loanHandlerRequest) {
		RepaymentPlan repaymentPlan = new RepaymentPlan();
		repaymentPlan.setOrderId(loanHandlerRequest.getOrderId());
		repaymentPlan.setEndTime(new Date());
		repaymentPlan.setEndType(loanHandlerRequest.getEndType());
		repaymentPlanMapper.updateByOrderId(repaymentPlan);
	}

	@Override
	public List<RateConfig> getFinancingRate(BigDecimal monthlyinterest) {
		List<RateConfig> rateConfigs = rateConfigMapper.selectRateConfigs(null);
		for (RateConfig rateConfig : rateConfigs) {
			rateConfig.setRate(rateConfig.getRate().multiply(monthlyinterest).setScale(2, BigDecimal.ROUND_HALF_UP));
		}
		return rateConfigs;
	}

	/**
	 * 修改，删除
	 * @param dayRange
	 * @param rate
	 * @param id
	 * @param enable
	 * @return
	 */
	@Override
	public int updateFinancingRate(Integer dayRange,BigDecimal rate,Integer id,Boolean enable){
		Map<String,Object> map = new HashMap<>();
		map.put("id",id);
		map.put("dayRange",dayRange);
		map.put("rate",rate);
		map.put("gmtUpdate",new Date());
		map.put("enable",enable);
	   int value=rateConfigMapper.updateFinancingRate(map);
	   return value;
	}

	/**
	 * 添加
	 * @param dayRange
	 * @param rate
	 * @return
	 */
	@Override
	public int addFinancingRate(Integer dayRange, BigDecimal rate) {
		Map<String,Object> map = new HashMap<>();
		map.put("dayRange",dayRange);
		map.put("rate",rate);
		map.put("gmtCreate",new Date());
		map.put("enable",true);
		int value=rateConfigMapper.insertFinancingRate(map);
		return value;
	}

	/**
	 * 查询
	 * @return
	 */
	@Override
	public List<RateConfig> selectParameterSetting() {
		List<RateConfig> rateConfigs = rateConfigMapper.selectRateConfigs(null);
		return rateConfigs;
	}

	@Override
	public Map getLoanOrderCount(String uuid) {
		Map<String,Integer> returnMap=new HashMap<>();
		CarDealerLoanEnum[] enums=CarDealerLoanEnum.values();
		for(CarDealerLoanEnum carDealerLoanEnum:enums){
			returnMap.put(carDealerLoanEnum.name(),0);
		}
		List<Map<String, String>>  maps=workflowviewMapper.selectRepaymentCount(uuid,WorkFlowType.CarDealerLoan.name());
		for(Map map:maps){
			String taskKey=map.get("taskKey").toString();
			returnMap.put(taskKey,Integer.valueOf(map.get("num").toString()));
		}
		return returnMap;
	}
}
