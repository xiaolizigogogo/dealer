package com.utonw.utonerp.service;

import com.alibaba.druid.util.StringUtils;
import com.alibaba.dubbo.config.annotation.Service;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.utonw.dealer.api.dto.request.MerchantRequest;
import com.utonw.dealer.api.entity.CompleteRequest;
import com.utonw.dealer.api.entity.erp.LoanReviewInfo;
import com.utonw.dealer.api.entity.workflowtask;
import com.utonw.dealer.api.enums.CarDealerApplyEnum;
import com.utonw.dealer.api.enums.CarDealerRepaymentEnum;
import com.utonw.dealer.api.enums.CarDealerReviewEnum;
import com.utonw.dealer.api.enums.WorkFlowType;
import com.utonw.dealer.api.service.IWorkFlowServiceCSD;
import com.utonw.dealer.api.service.erp.WorkFlowService;
import com.utonw.utonerp.mapper.ActHiTaskinstMapper;
import com.utonw.utonerp.mapper.LoanReviewInfoMapper;
import com.utonw.utonerp.mapper.WorkflowviewMapper;
import org.activiti.engine.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.*;

/**
 * Created by WANGYJ on 2017/5/11.
 */
@Transactional
@Service(version = "1.0.0")
public class WorkFlowServiceCSD implements IWorkFlowServiceCSD {
	public Logger logger = LoggerFactory.getLogger(WorkFlowServiceCSD.class);

	@Autowired
	private RuntimeService runtimeService;

	@Autowired
	private IdentityService identityService;

	@Autowired
	private TaskService taskService;

	@Autowired
	private RepositoryService repositoryService;

	@Autowired
	private HistoryService historyService;
	@Autowired
	private ActHiTaskinstMapper actHiTaskinstMapper;

	@Autowired
	private WorkflowviewMapper workflowviewMapper;
	@Autowired
	private LoanReviewInfoMapper loanReviewInfoMapper;
	@Qualifier("workFlowService")
	@Autowired
	private WorkFlowService workFlowService;
	@Override
	public int startTaskBy(int processkind, String uuid) {
		int result = -1;
		// 参数检查
		if (processkind < 1 || processkind > 3) {
			return result;
		}
		try {
			identityService.setAuthenticatedUserId(null);
			runtimeService.startProcessInstanceByKey(WorkFlowType.getStringByCode(processkind), uuid, null);
			return result = 1;
		}  finally {
			identityService.setAuthenticatedUserId(null);
			return result;
		}

	}

	@Override
	public List<workflowtask> queryTaskByUserId(String userId, String procKey) {
		Map<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("prockey", procKey);
		List<workflowtask> list = workflowviewMapper.queryTaskByUserId(map);
		return list;
	}

	@Override
	public int signTaskById(String userId, String taskId) {
		try {
			taskService.claim(taskId, userId);
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	@Override
	public boolean complete(CompleteRequest request) {
		
			Map map = new HashMap();
			for (CarDealerReviewEnum carDealerReviewEnum : CarDealerReviewEnum.values()) {
				map.put(carDealerReviewEnum.name(), false);
			}
			String status = "pass";
			if (request.getParam() == null || request.getParam().size() == 0) {
				map.put("pass", true);
			} else {
				for(Object key:request.getParam().keySet()){
					map.put(key, request.getParam().get(key));
				}
				if((boolean)map.get("nopass")==true){
					status="nopass";
				}
				logger.info("审批信息:"+request.getParam().keySet().iterator().next().toString());
			}
			LoanReviewInfo reviewInfo = new LoanReviewInfo();
			reviewInfo.setLoanId(request.getApplyId());
			reviewInfo.setReviewConclusion(request.getRemark());
			reviewInfo.setReviewLevel(request.getTaskKey());
			reviewInfo.setReviewStatus(status);
			reviewInfo.setReviewedByName(null);
			reviewInfo.setReviewedById(request.getUserUuid());
			reviewInfo.setCreatedAt(new Date());
			reviewInfo.setReviewAmount(
					new BigDecimal(StringUtils.isEmpty(request.getMoney()) ? "0" : request.getMoney()));
			loanReviewInfoMapper.insert(reviewInfo);
			workFlowService.complete(request.getTaskId(), map);       
			return true;
		 

	}
	@Override
	public List<workflowtask> queryByApplyIds(List<String> ids){
		if(ids==null||ids.size()==0){
			return new ArrayList<workflowtask>();
		}
		return workflowviewMapper.selectByBussinessKeys(ids);
	}

	@Override
	public List<workflowtask> queryApplyByApplyIds(List<String> ids) {
		if(ids!=null&&ids.size()>=0){
			return workflowviewMapper.selectApplyByApplyIds(ids);
		}
		return new ArrayList<>();
	}

	@Override
	public boolean completeEnd(CompleteRequest request){
		String applyId=request.getApplyId();
		workflowtask workflowtask=workflowviewMapper.selectByBussinessKey(applyId);
		Map map = new HashMap();
		for (CarDealerReviewEnum carDealerReviewEnum : CarDealerReviewEnum.values()) {
			map.put(carDealerReviewEnum.name(), false);
		}
		map.put("pass", true);
		if(workflowtask!=null){
			workFlowService.complete(workflowtask.getTaskid(), map);
		}
		LoanReviewInfo reviewInfo = new LoanReviewInfo();
		reviewInfo.setLoanId(request.getApplyId());
		reviewInfo.setReviewConclusion("通过");
		reviewInfo.setReviewLevel(request.getTaskKey());
		reviewInfo.setReviewStatus("pass");
		reviewInfo.setReviewedByName(null);
		reviewInfo.setReviewedById(request.getUserUuid());
		reviewInfo.setCreatedAt(new Date());
		reviewInfo.setReviewAmount(
				new BigDecimal(StringUtils.isEmpty(request.getMoney()) ? "0" : request.getMoney()));
		loanReviewInfoMapper.insert(reviewInfo);
		return true;
	}
	@Override
	public workflowtask queryLastTask(String id){
		return workflowviewMapper.selectByBussinessKey(id);
	}

	@Override
	public List<workflowtask> queryWorkflowtask(List<String> ids) {
		return workflowviewMapper.selectWorkflowtask(ids);
	}

	/**
	 * 根据taskKey和 工作流类型查询
	 * @param
	 * @param
	 * @return
	 */
	@Override
	public PageInfo<workflowtask> queryTaskByTaskKey(MerchantRequest request) {
		PageHelper.startPage(request.getPageNum(),request.getPageSize(),true);
		return workflowviewMapper.selectTaskByTaskKey( request.getApplyStatus(),  request.getWorkFlowType()).toPageInfo();
	}

	@Override
	public Map<String, Integer> queryApplyCount(String workFlowType) {
		Map<String,Integer> returnMap=new HashMap<>();
		CarDealerApplyEnum[] enums=CarDealerApplyEnum.values();
		for(CarDealerApplyEnum carDealerApplyEnum:enums){
			returnMap.put(carDealerApplyEnum.name(),0);
		}
		List<Map<String, String>>  maps=	workflowviewMapper.selectApplyCount(workFlowType);
		for(Map map:maps){
			String taskKey=map.get("taskKey").toString();
			returnMap.put(taskKey,Integer.valueOf(map.get("num").toString()));
		}
		return returnMap;
	}
	
	@Override
	public Map<String, Integer> queryRepaymentCount(String uuid,String workFlowType) {
		Map<String,Integer> returnMap=new HashMap<>();
		CarDealerRepaymentEnum[] enums=CarDealerRepaymentEnum.values();
		for(CarDealerRepaymentEnum carDealerRepaymentEnum:enums){
			returnMap.put(carDealerRepaymentEnum.name(),0);
		}
		List<Map<String, String>>  maps=	workflowviewMapper.selectRepaymentCount(uuid,workFlowType);
		List<Map<String, String>>  overdueMaps=workflowviewMapper.selectOverdueCount(uuid);
		maps.addAll(overdueMaps);
		for(Map map:maps){
			String taskKey=map.get("taskKey").toString();
			returnMap.put(taskKey,Integer.valueOf(map.get("num").toString()));
		}
		return returnMap;
	}

	@Override
	public List<workflowtask> queryByIdsAndKey(List<String> ids, String name) {
		if(ids!=null&&ids.size()>0){
			List<workflowtask> tasks=workflowviewMapper.selectByBussinessKeysAndKey(ids,name);
			return tasks;
		}
		return new ArrayList<workflowtask>();
	}

	@Override
	public Map<String, Integer> queryAllCount(List<String> nodeList) {
		return workflowviewMapper.selectCountBynode(nodeList);
	}

	@Override
	public List<workflowtask> queryByTaskKeyAndProcKey(String taskdefkey, String prockey) {
		return workflowviewMapper.selectTaskkeyByProcKey(taskdefkey, prockey);
	}

	@Override
	public Integer queryTaskByUuIdcount(String userId) {
		Integer counto = workflowviewMapper.queryTaskByUuIdcount(userId, true);
		Integer countt = actHiTaskinstMapper.queryTaskByUuIdcount(userId);
		Integer count = 0;
		if(counto !=null) {
			count = count+counto;
		}
		if(countt !=null) {
			count = count+countt;
		}
		return count;
	}

	@Override
	public Integer queryTaskByUuIddaicount(String userId) {
		Integer counto = workflowviewMapper.queryTaskByUuIdcount(userId, false);
		Integer count = 0;
		if(counto !=null) {
			count = count+counto;
		}
		return count;
	}

}
