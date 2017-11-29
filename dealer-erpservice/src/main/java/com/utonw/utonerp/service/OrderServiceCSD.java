package com.utonw.utonerp.service;

import java.math.BigDecimal;
import java.util.*;

import com.utonw.dealer.api.dto.request.DeleteRequest;
import com.utonw.dealer.api.entity.*;
import com.utonw.dealer.api.entity.erp.SystemParameter;
import com.utonw.dealer.api.enums.DeleteTypeEnum;
import com.utonw.dealer.api.enums.erp.WeightingEnum;
import com.utonw.dealer.api.util.erp.Constants;
import com.utonw.utonbase.core.erpcommon.utils.OrderIDGenerator;
import com.utonw.utonerp.mapper.*;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.dubbo.common.utils.StringUtils;
import com.alibaba.dubbo.config.annotation.Service;
import com.utonw.dealer.api.service.IOrderServiceCSD;

@Service(version = "1.0.0")
@Transactional
public class OrderServiceCSD implements IOrderServiceCSD {
	@Autowired
	CsdApprovalInfoMapper csdApprovalInfoMapper;
    @Autowired
	UserMapper userMapper;
    @Autowired
    SystemParam systemParam;
    @Autowired
	SystemParameterMapper systemParameterMapper;
    @Autowired
	WorkflowviewMapper workflowviewMapper;
    @Autowired
	ActHiProcinstMapper actHiProcinstMapper;

	/*zhangheng add st*/
	org.slf4j.Logger logger = LoggerFactory.getLogger(OrderServiceCSD.class);
	@Autowired
	RepaymentPlanMapper repaymentPlanMapper;
	/*zhangheng add ed*/

	@Override
	public List<ApplyIndentRequest> createwithCapital(String uuid) {
		List<workflowtask> workflowtasks =  workflowviewMapper.querywithCapital(uuid);
		List<ApplyIndentRequest> list =new ArrayList<>();
		for(workflowtask task:workflowtasks){
			ApplyIndentRequest applyIndentRequest =new ApplyIndentRequest();
			applyIndentRequest.setApplyId(task.getBusinesskey());
			applyIndentRequest.setTaskId(task.getTaskid());
			applyIndentRequest.setTaskName(task.getTask_def_key());
			applyIndentRequest.setReview_status(task.getReview_status());
			applyIndentRequest.setReview_conclusion(task.getReview_conclusion());
			applyIndentRequest.setProckey(task.getProckey());
			list.add(applyIndentRequest);
		}
		return list;
	}



	@Override
	public String createOrderStr() {
		String count = getAutoIncrmentNum();
		String orderIdStr;

		String prefix = systemParam.getSystemParam(3, "LOAN_CONTRACT_PREFIX");
		if (prefix == null) {
			prefix = "";
		}
		orderIdStr = OrderIDGenerator.getInstance().getOrderIDCYB(prefix, count);

		return orderIdStr;
	}

	private synchronized String getAutoIncrmentNum() {

		String autoIncrement = "";
		try {
			autoIncrement = systemParam.getSystemParamSync(3, Constants.AUTO_INCREMENT_ID);
			if (StringUtils.isNotEmpty(autoIncrement)) {
				SystemParameter systemParameter = new SystemParameter();
				systemParameter.setCompanyId(new Integer(3));
				systemParameter.setSysKey(Constants.AUTO_INCREMENT_ID);
				Integer orderId = Integer.valueOf(autoIncrement) + 1;
				systemParameter.setSysValue(orderId.toString());
				systemParameterMapper.updateBySysKey(systemParameter);
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("创建订单号失败",e);
		}
		return autoIncrement;
	}

	/**
	 * 查询任务相关ID
	 * 
	 * @param uuid
	 * @return
	 */
	@Override
	public List<ApplyIndentRequest> createOrderList(String uuid) {
		List<workflowtask> workflowtasks = workflowviewMapper.queryTaskByUuId(uuid);
		List<ApplyIndentRequest> list = new ArrayList<>();
		for (workflowtask task : workflowtasks) {
			ApplyIndentRequest applyIndentRequest = new ApplyIndentRequest();
			applyIndentRequest.setApplyId(task.getBusinesskey());
			applyIndentRequest.setTaskId(task.getTaskid());
			applyIndentRequest.setTaskName(task.getTask_def_key());
			applyIndentRequest.setReview_status(task.getReview_status());
			applyIndentRequest.setReview_conclusion(task.getReview_conclusion());
			list.add(applyIndentRequest);
		}
		return list;
	}

	@Override
	public String requesTtaskId(String taskId) {

		return null;
	}

	/**
	 * 查询已办任务
	 * 
	 * @param uuid
	 * @return
	 */
	@Override
	public List<ApplyIndentRequest> queryAlreadyTask(String uuid) {
		List<ApplyIndentRequest> list = actHiProcinstMapper.selectCompleteTask(uuid);
		return list;
	}

	@Override
	public String getTaskId(String appylId) {
		workflowtask workflowtask = workflowviewMapper.getTaskId(appylId);
		System.out.println(workflowtask.getTaskid() + "111111111assdasdas1111111111111111111111111");
		return null;
	}
	@Override
	public Map<String, Object> queryCarEvaluateInfo(Map<String, Object> map) {
		// ariable_box 变速箱
		// indoor_type 室内装置
		// fisrt_up_time 上牌时间
		// displacement 排量
		// engine
		// driving_wheel
		// car_colour
		// body_structure
		// 差市场指导价、评估师姓名
		// 计算系统评估价
		logger.info(map.toString());
		List<BigDecimal> bigs = new ArrayList<>();
		bigs.add(getMoneyYuan(map.get("buyprice")));
		bigs.add(getMoneyYuan(map.get("systemAssess")));
		bigs.add(getMoneyYuan(map.get("miniprice")));
		bigs.add(getMoneyYuan(map.get("price")));
		BigDecimal systemPrice = calculate(bigs);
		boolean flag = calculate(systemPrice, getMoney(map.get("appraisersPrice")),
				getMoneyYuan(map.get("price")));
		map.put("systemSuggestPrice", "-");
		map.put("braunAssessmentPrice", getMoneyYuan(map.get("systemAssess"), "万"));
		map.put("systemAssess", getMoney(systemPrice, "万"));
		map.put("systemSuggest", "不通过");
		BigDecimal appraisersPrice = getMoney(map.get("appraisersPrice"));
		map.put("appraisersPrice", getMoney(map.get("appraisersPrice"), "万"));
		map.put("buyprice", getMoneyYuan(map.get("buyprice"), "万"));
		map.put("miniprice", getMoneyYuan(map.get("miniprice"), "万"));
		map.put("hostlingCost", getMoneyYuan(map.get("hostlingCost"), "万"));
		map.put("price", getMoneyYuan(map.get("price"), "万"));
		if (flag) {
			bigs.clear();
			bigs.add(systemPrice);
			bigs.add(appraisersPrice);
			map.put("systemSuggestPrice", calculate(bigs) + "万");
			map.put("systemSuggest", "通过");
		}
		Map userMap=csdApprovalInfoMapper.selectByApplyId(map.get("indentId").toString());
		if(userMap != null){
			map.putAll(userMap);
		}
		return map;
	}



	private BigDecimal getMoney(Object obj) {
		if (obj == null) {
			return new BigDecimal("0");
		}
		BigDecimal big = null;
		try {
			big = new BigDecimal(obj.toString());
			return big;
		} catch (Exception e) {
			logger.error(e.getMessage());
			return new BigDecimal("0");
		}
	}

	private String getMoney(Object obj, String unit) {
		if (obj == null) {
			return new BigDecimal("0") + unit;
		}
		BigDecimal big = null;
		try {
			big = new BigDecimal(obj.toString());
			return big + unit;
		} catch (Exception e) {
			logger.error(e.getMessage());
			return new BigDecimal("0") + unit;
		}
	}

	private BigDecimal getMoneyYuan(Object obj) {
		if (obj == null) {
			return new BigDecimal("0");
		}
		BigDecimal big = null;
		try {
			big = new BigDecimal(obj.toString());
			return big.divide(new BigDecimal("10000"));
		} catch (Exception e) {
			logger.error(e.getMessage());
			return new BigDecimal("0");
		}
	}

	private String getMoneyYuan(Object obj, String unit) {
		if (obj == null) {
			return new BigDecimal("0") + unit;
		}
		BigDecimal big = null;
		try {
			big = new BigDecimal(obj.toString());
			return big.divide(new BigDecimal("10000")).toString() + unit;
		} catch (Exception e) {
			logger.error(e.getMessage());
			return new BigDecimal("0") + unit;
		}
	}

	// 计算系统评估价格
	private BigDecimal calculate(List<BigDecimal> bigs) {
		int size = bigs.size();
		BigDecimal sum = new BigDecimal("0");
		for (BigDecimal big : bigs) {
			if (big == null || big.compareTo(new BigDecimal(0)) == 0) {
				size--;
			} else {
				sum=sum.add(big);
			}
		}
		if(size<=0){
			return sum;
		}
		return sum.divide(new BigDecimal(size),2,BigDecimal.ROUND_HALF_UP);
	}

	// 计算加权平均价
	private boolean calculate(BigDecimal big1, BigDecimal big2, BigDecimal carPrice) {
		// 差值
		carPrice=big1;
		BigDecimal big = big2.subtract(big1);
		if (big.intValue() < 0) {
			carPrice=big2;
			big = big1.subtract(big2);
		}
		//
		BigDecimal weighting = getWeighting(carPrice);
		if (big.compareTo(weighting) > 0) {
			return false;
		}
		return true;
	}

	private BigDecimal getWeighting(BigDecimal carPrice) {
		List<WeightingEnum> weightingEnums = Arrays.asList(WeightingEnum.values());
		for (WeightingEnum weightingEnum : weightingEnums) {
			if (carPrice.doubleValue() - weightingEnum.getEnd() >= 0) {
				continue;
			} else {
				return new BigDecimal(weightingEnum.getWeighting()).divide(new BigDecimal(10000));
			}
		}
		return new BigDecimal(weightingEnums.get(weightingEnums.size() - 1).getWeighting())
				.divide(new BigDecimal(10000));
	}
	/* zhangheng st*/
     /*
        车商贷
    *   插入还款计划
    * */
	@Override
	@Transactional(isolation = Isolation.READ_COMMITTED,propagation = Propagation.REQUIRED,timeout = 3,rollbackFor = Exception.class)
	public String  insertRepaymentPlan(RepaymentPlan repaymentPlan) throws Exception {
		logger.info("车商贷,插入还款计划.入参:repaymentPlan={}",repaymentPlan);
		if(repaymentPlan!=null){
			try {
				RepaymentPlan model = new RepaymentPlan();
				BeanUtils.copyProperties(repaymentPlan,model);
				repaymentPlanMapper.insertSelective(model);
				return "success";
			} catch (Exception e) {
				e.printStackTrace();
				logger.error("车商贷,插入还款计划 失败",e.getMessage());
				return "error";
			}
		}
		return  "error";

	}
	/* zhangheng  ed*/


	@Override
	public String querySignName(String orderId) {
		return csdApprovalInfoMapper.selectNameByOrderIdOrderByApprovalTime(orderId);
	}

	@Override
	public int delete(DeleteRequest deleteRequest) {
		if(deleteRequest.getDeleteTypeEnum()== DeleteTypeEnum.Customer){
			int i=workflowviewMapper.deleteByBusinessKey(deleteRequest.getId());
			List<String > ids=  deleteRequest.getIds();
			for(String id :ids){
				workflowviewMapper.deleteByBusinessKey(id);
			}
			return i;
		}
		if(deleteRequest.getDeleteTypeEnum()== DeleteTypeEnum.Order){
			return deleteByBusinessKey(deleteRequest.getId());
		}
		return 0;
	}

	private int deleteByBusinessKey(String buisnessKey){
		return workflowviewMapper.deleteByBusinessKey(buisnessKey);
	}

}
