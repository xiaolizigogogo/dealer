package com.utonw.utonerp.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.github.pagehelper.PageInfo;
import com.utonw.dealer.api.dto.request.OrderPageRequest;
import com.utonw.dealer.api.entity.*;
import com.utonw.dealer.api.entity.erp.User;
import com.utonw.dealer.api.enums.CarDealerLoanEnum;
import com.utonw.dealer.api.enums.CarDealerRepaymentEnum;
import com.utonw.dealer.api.enums.WorkFlowType;
import com.utonw.dealer.api.service.*;
import com.utonw.dealer.api.util.erp.Constants;
import com.utonw.utonbase.core.erpcommon.utils.CacheUtil;
import com.utonw.utonbase.core.erpcommon.utils.DateUtils;
import com.utonw.utonbase.core.erpcommon.utils.SpringUtils;
import com.utonw.utonerp.common.controller.BaseController;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.*;
import java.util.Map.Entry;
/**
 * Created by WANGYJ on 2017/5/10.
 */
@Component
@Controller
@RequestMapping("/order")
public class OrderController extends BaseController {
	/**
	 * 取得贷前审批阶段订单
	 *
	 * @param request
	 *            列表筛选条件
	 * @return ModelAndView
	 */
	@Reference(version = "1.0.0")
	private IOrderService orderService;
	@Reference(version = "1.0.0")
	private IOrderServiceCSD orderServiceCSD;

	@Reference(version = "1.0.0")
	private IWorkFlowServiceCSD workFlowServiceCSD;

	@Reference(version = "1.0.0")
	private ILoanDetails loanDetails;

	@Reference(version = "1.0.0")
	private ILoanServiceCSD loanServiceCSD;

	@Reference(version = "1.0.0")
	private IERPCustomerList ERPCustomerList;

	@Reference(version = "1.0.0")
	private IPushService pushService;
	Logger logger = Logger.getLogger(OrderController.class);

	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value = "/reviewphase", method = RequestMethod.POST)
	public Object getOrdersOfReviewPhase(HttpServletRequest request, @RequestBody OrderPageRequest param) {
		// 从session中取得用户id
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute(Constants.AUTH_USER);

		// 取得用户ID
		String uuid = user.getUuid();
		// 根据UUID从工作流里面取出所有的列表数据
		List<workflowtask> list = workFlowServiceCSD.queryTaskByUserId(uuid, "CarDealerLoan");
		// 定义各阶段作为类别的数据
		Map<String, Object> countMap = new HashMap<>();
		// 对各种状态进行初始化处理
		// 对总数进行赋值

		// 对各种状态进行统计
		// 查询每种状态组合下
		List<workflowtask> list2 = new ArrayList<>();
		String kind = param.getListKind();
		if (StringUtils.isEmpty(kind)||org.apache.commons.lang3.StringUtils.equals(kind,"all")) {
			list2 = list;
		} else {
			for (workflowtask w : list) {
				// 查询该种状态的列表的总数
				if (!StringUtils.isEmpty(kind)
						&& org.apache.commons.lang3.StringUtils.equals(w.getTask_def_key(), kind)) {
					list2.add(w);
				}
			}
		}
		countMap.put("total_all", list2.size());
		// 查询结果
		Map<String, Object> resultmap = orderService.queryOrderByParams(param, list2);
		// 追加各个阶段统计
		resultmap.put("countMap", countMap);
		if (resultmap.get("list") != null) {
			for (TaskInfoErpEntity taskInfoErpEntity : (List<TaskInfoErpEntity>) resultmap.get("list")) {
				setRelateTaskInfo(taskInfoErpEntity, list2);
			}
		}
		return resultmap;

	}

	private void setRelateTaskInfo(TaskInfoErpEntity taskInfoErpEntity, List<workflowtask> list) {
		for (int i = 0; i < list.size(); i++) {
			if (((workflowtask) (list.get(i))).getBusinesskey().equals(taskInfoErpEntity.getId())) {
				// 设置任务名称
				taskInfoErpEntity.setIndentStatus(((workflowtask) (list.get(i))).getName());

				taskInfoErpEntity.setTaskName(((workflowtask) (list.get(i))).getTask_def_key());
				// 设置任务Id
				taskInfoErpEntity.setTaskId(((workflowtask) (list.get(i))).getTaskid());
				// 设置签收人
				taskInfoErpEntity.setAssigee(((workflowtask) (list.get(i))).getAssignee());
			}
		}
	}

	/**
	 * 查询订单所有信息
	 * 
	 * @param response
	 * @param request
	 */
	@RequestMapping("/orderInfo")
	public void orderInfo(HttpServletResponse response, HttpServletRequest request) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("success", true);
		try {
			String id = request.getParameter("indent_uuid");
			resultMap = loanDetails.selectIndentInfo(id);
			List<CsdApprovalInfo> list = loanServiceCSD.selectAllApprovalList(id);
			List<Map<String, String>> newList = new ArrayList<Map<String, String>>();
			String merchantName = net.sf.json.JSONObject.fromObject(resultMap.get("loanInfo"))
					.containsKey("merchantName")
							? net.sf.json.JSONObject.fromObject(resultMap.get("loanInfo")).get("merchantName")
									.toString()
							: "";
			BigDecimal big = new BigDecimal(
					net.sf.json.JSONObject.fromObject(resultMap.get("percentInterest")).get("applyMoney").toString());
			if (big.intValue() == 0) {
				big = (BigDecimal) net.sf.json.JSONObject.fromObject(resultMap.get("percentInterest"))
						.get("maximumLoan");
			}
			for (CsdApprovalInfo c : list) {

				Map csd = new HashMap();
				csd.put("merchantName", merchantName);
				csd.put("approveMoney", c.getApprovalamount());
				csd.put("applyMoney", big);
				csd.put("applyTime", c.getApprovaltime());
				csd.put("loanStatus", CarDealerLoanEnum.valueOf(c.getApprovallevel()).getMessage());
				newList.add(csd);
			}
			String contractAndName = orderServiceCSD.querySignName(id);
			if (StringUtils.isEmpty(contractAndName)) {
				contractAndName = "";
			}
			resultMap.put("contractAndName", contractAndName);
			resultMap.put("reviewInfo", newList);
		} catch (Exception e) {
			logger.error("错误", e);
			resultMap.put("success", false);
		}
		SpringUtils.renderJson(response, resultMap);

	}

	/**
	 * 查询订单所有信息
	 * 
	 * @param response
	 * @param request
	 */
	@RequestMapping("/orderForm")
	public void orderForm(HttpServletResponse response, HttpServletRequest request) {
		Date date = CacheUtil.get(Constants.CURRENT_TIME, "currenTtime");
		String result = loanDetails.selectorderForm(String.valueOf(date == null ? new Date() : date));
		Date newDate = new Date();
		CacheUtil.put(Constants.CURRENT_TIME, "currenTtime", newDate);
		SpringUtils.renderJson(response, result);
	}

	@RequestMapping("/review")
	public void review(HttpServletRequest request, HttpServletResponse response,
			LoanHandlerRequest loanHandlerRequest) {
		Map<String, Object> resultMap = new HashMap<>();
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute(Constants.AUTH_USER);
		// 取得用户ID
		String uuid = user.getUuid();
		if (loanHandlerRequest.getJudgeMoney() != null) {
			loanHandlerRequest.setApprovalAmount(loanHandlerRequest.getJudgeMoney());
		}
		resultMap = loanServiceCSD.reviewApprovalStatus(loanHandlerRequest);
		workflowtask wf = workFlowServiceCSD.queryLastTask(loanHandlerRequest.getOrderId());
		try {
			if (wf != null) {
				pushService.sendPush(wf.getTask_def_key(), wf.getBusinesskey(), wf.getProckey(), wf.getAssignee());
			}

		} catch (Exception e) {
			logger.error("推送消息失败");
		}
		// 修改终审金额
		if (loanHandlerRequest.getJudgeMoney() != null) {
			MerchantModify merchantModify = new MerchantModify();
			merchantModify.setId(loanHandlerRequest.getOrderId());
			merchantModify.setRejectRemarks(loanHandlerRequest.getApprovalConclusion());
			merchantModify.setWhetherPass(loanHandlerRequest.getApprovalStatus());
			merchantModify.setJudgeMoney(loanHandlerRequest.getJudgeMoney());
			orderService.updateMerchantIndent(merchantModify);
		}
		// 修改状态
		else {
			MerchantModify merchantModify = new MerchantModify();
			merchantModify.setId(loanHandlerRequest.getOrderId());
			merchantModify.setRejectRemarks(loanHandlerRequest.getApprovalConclusion());
			merchantModify.setWhetherPass(loanHandlerRequest.getApprovalStatus());
			orderService.updateMerchantIndent(merchantModify);
		}
		Boolean modifyIndent = ERPCustomerList.modifyIndentState(loanHandlerRequest, uuid);
		if (!modifyIndent) {
			resultMap.put("success", false);
			resultMap.put("retMsg", "订单状态修改失败");
		}
		SpringUtils.renderJson(response, resultMap);
	}

	@RequestMapping("/carEvaluateInfo")
	public void carEvaluateInfo(HttpServletResponse response, HttpServletRequest request) {
		String id = request.getParameter("indent_uuid");
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = ERPCustomerList.queryCarEvaluate(id);
		SpringUtils.renderJson(response, orderServiceCSD.queryCarEvaluateInfo(resultMap));
	}

	/**
	 * JML 查询贷后列表
	 * 
	 * @param request
	 * @param response
	 * @param
	 */
	@RequestMapping("/queryRepayList")
	public void queryRepayList(HttpServletRequest request, HttpServletResponse response,
			@RequestBody OrderPageRequest orderRequest) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute(Constants.AUTH_USER);
		// 默认先查询逾期订单
		String uuid = user.getUuid();
		orderRequest.setUuid(uuid);
		Map resultMap = new HashMap();
		SpringUtils.renderJson(response, loanServiceCSD.queryRepaymentList(orderRequest));
	}

	/* zhangheng st */
	/**
	 * 借款中订单，添加出账信息 （可包括添加还款计划）
	 * 
	 * @param response
	 * @param request
	 */
	@RequestMapping("/inertOutBillAndRefandPlan")
	@ResponseBody
	public Object inertOutBillAndRefandPlan(HttpServletResponse response, HttpServletRequest request,
			LoanHandlerRequest loanHandlerRequest) {
		Map<String, Object> resultMap = new HashMap<>();
		try {
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute(Constants.AUTH_USER);
			// 取得用户ID
			String uuid = user.getUuid();
			// 不是通过只提交工作流
			if (!com.alibaba.druid.util.StringUtils.equals(loanHandlerRequest.getApprovalStatus(), "pass")) {
				resultMap = loanServiceCSD.reviewApprovalStatus(loanHandlerRequest);
				if (com.alibaba.druid.util.StringUtils.equals(loanHandlerRequest.getApprovalStatus(), "nopass")) {
					MerchantModify merchantModify = new MerchantModify();
					merchantModify.setRejectRemarks(loanHandlerRequest.getApprovalConclusion());
					merchantModify.setWhetherPass(loanHandlerRequest.getApprovalStatus());
					merchantModify.setId(loanHandlerRequest.getOrderId());
					orderService.updateMerchantIndent(merchantModify);
					return resultMap;
				}
				resultMap.put("success", true);
				resultMap.put("retMsg", "提交成功");
				return resultMap;
			}
			resultMap = loanServiceCSD.reviewApprovalStatus(loanHandlerRequest);
			logger.info(" 借款中订单，添加出账信息 （可包括添加还款计划）***");
			String taskId = request.getParameter("taskId") == null ? "" : request.getParameter("taskId").trim();
			String orderId = request.getParameter("orderId") == null ? "" : request.getParameter("orderId").trim(); // 订单编号
			String lendedTime = request.getParameter("lendedTime") == null ? ""
					: request.getParameter("lendedTime").trim(); // 出账时间
			String carName = request.getParameter("carName") == null ? "" : request.getParameter("carName").trim(); // 车行名字
			String fktime = request.getParameter("fktime") == null ? "" : request.getParameter("fktime").trim(); // 放款时间
			String jkpersion = request.getParameter("jkpersion") == null ? ""
					: request.getParameter("jkpersion").trim(); // 借款人
			String fkamt = request.getParameter("fkamt") == null ? "" : request.getParameter("fkamt").trim();// 放款金额
			String during = request.getParameter("during") == null ? "" : request.getParameter("during").trim();// 周期
			String rata = request.getParameter("rata") == null ? "" : request.getParameter("rata").trim(); // 利率
			String hktime = request.getParameter("hktime") == null ? "" : request.getParameter("hktime").trim();// 还款日期
			String hkamt = request.getParameter("hkamt") == null ? "" : request.getParameter("hkamt").trim(); // 还款金额
			String imgUrl = request.getParameter("imgUrl") == null ? "" : request.getParameter("imgUrl").trim();// 图片url
			String orderNum = request.getParameter("orderNum");
			RepaymentPlan vo = new RepaymentPlan();
			vo.setTaskId(taskId);
			vo.setCarName(carName);
			vo.setOrderId(orderId);
			vo.setOutAccountTime(lendedTime); // 出账时间
			vo.setLoanTime(fktime); // 放款时间
			vo.setBorrowerd(jkpersion); // 借款人
			vo.setOrderNum(orderNum);
			BigDecimal needRepaymentPlan = new BigDecimal(rata).multiply(new BigDecimal(during))
					.multiply(new BigDecimal(fkamt)).multiply(new BigDecimal(10000))
					.divide(new BigDecimal(30), 2, BigDecimal.ROUND_HALF_UP)
					.divide(new BigDecimal(1200), 2, BigDecimal.ROUND_HALF_UP)
					.add(new BigDecimal(fkamt).multiply(new BigDecimal(10000)));
			if (!StringUtils.isEmpty(fkamt)) {
				vo.setLoanAmt(Double.valueOf(fkamt)); // 放款金额
			}
			vo.setCyclicity(during); // 周期
			if (!StringUtils.isEmpty(rata)) {
				vo.setInterestRate(Double.valueOf(rata)); // 利率
			}
			vo.setRepaymenTime(hktime); // 还款日期
			if (!StringUtils.isEmpty(hkamt)) {
				vo.setRepaymenAmt(needRepaymentPlan.doubleValue()); // 还款金额
			}
			vo.setOutAccountVoucher(imgUrl); // 出账凭证 就是图片url
			String s = orderServiceCSD.insertRepaymentPlan(vo);
			try {
				workflowtask wf = workFlowServiceCSD.queryLastTask(loanHandlerRequest.getOrderId());
				if (wf != null) {
					pushService.sendPush(wf.getTask_def_key(), wf.getBusinesskey(), wf.getProckey(), wf.getAssignee());
				}
				MerchantModify merchantModify = new MerchantModify();
				merchantModify.setRejectRemarks(loanHandlerRequest.getApprovalConclusion());
				merchantModify.setWhetherPass(loanHandlerRequest.getApprovalStatus());
				merchantModify.setId(loanHandlerRequest.getOrderId());
				merchantModify.setIndentState("lended");
				merchantModify.setOutAccountTime(new Date());
				merchantModify.setRepaymentime(DateUtils.addDays(new Date(), Long.valueOf(during)));
				orderService.updateMerchantIndent(merchantModify);
			} catch (Exception e) {
				logger.error("推送消息失败");
			}

			if (s.equals("success")) {
				resultMap.put("success", true);
				resultMap.put("retMsg", "添加出账信息成功");
			} else {
				resultMap.put("success", true);
				resultMap.put("retMsg", "添加出账信息失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("添加出账信息失败", e);
			resultMap.put("success", true);
			resultMap.put("retMsg", "添加出账信息失败");
		}
		return resultMap;
	}
	/* zhangheng ed */

	/**
	 * 查询订单列表
	 */
	@RequestMapping("/getAllOrders")
	@ResponseBody
	public void getAllOrders(HttpServletRequest request, HttpServletResponse response,
			@RequestBody OrderPageRequest orderRequest) {
		// erp页面请求参数
		// 车商贷返回订单数据
		/*
		 * MerchantRequest merchantRequest=new MerchantRequest();
		 * merchantRequest.setApplyStatus(orderRequest.getLoanStatus());
		 * merchantRequest.setWorkFlowType(WorkFlowType.CarDealerLoan.name());
		 * merchantRequest.setPageNum(orderRequest.getPageNum());
		 * merchantRequest.setPageSize(orderRequest.getPageSize());
		 * PageInfo<workflowtask>
		 * taskPage=workFlowServiceCSD.queryTaskByTaskKey(merchantRequest);
		 */
		PageInfo<MerchantIndentInfo> page = null;
		if (orderRequest.getLoanStatus().indexOf("CarDealerLoan_") != -1) {
			String loanStatus = orderRequest.getLoanStatus().substring(14);
			List<workflowtask> list = workFlowServiceCSD.queryByTaskKeyAndProcKey(loanStatus,
					WorkFlowType.CarDealerLoan.name());
			List<String> idsx = new ArrayList<String>();
			for (workflowtask workflowtask : list) {
				idsx.add(workflowtask.getBusinesskey());
			}
			orderRequest.setIds(idsx);
			page = orderService.queryOrderByids(orderRequest);

			{
				List<String> ids = new ArrayList<>();

				for (MerchantIndentInfo merchantIndentInfo : page.getList()) {
					ids.add(merchantIndentInfo.getId());
				}

				List<workflowtask> tasks = workFlowServiceCSD.queryByIdsAndKey(ids, WorkFlowType.CarDealerLoan.name());
				Map<String, workflowtask> map = new HashMap<>();
				for (workflowtask workflowtask : tasks) {
					map.put(workflowtask.getBusinesskey(), workflowtask);
				}
				for (MerchantIndentInfo merchantIndentInfo : page.getList()) {
					workflowtask task = map.get(merchantIndentInfo.getId());
					if (task != null) {
						merchantIndentInfo.setIndentstate(task.getName());
					}
				}

			}

		} else {
			page = orderService.queryOrderByCondition(orderRequest);

			{
				List<String> ids = new ArrayList<>();

				for (MerchantIndentInfo merchantIndentInfo : page.getList()) {
					ids.add(merchantIndentInfo.getId());
				}

				List<workflowtask> tasks = workFlowServiceCSD.queryByIdsAndKey(ids, WorkFlowType.CarDealerLoan.name());
				Map<String, workflowtask> map = new HashMap<>();
				for (workflowtask workflowtask : tasks) {
					map.put(workflowtask.getBusinesskey(), workflowtask);
				}
				for (MerchantIndentInfo merchantIndentInfo : page.getList()) {
					workflowtask task = map.get(merchantIndentInfo.getId());
					if (task != null) {
						merchantIndentInfo.setIndentstate(task.getName());
					}
				}
			}
		}
		SpringUtils.renderJson(response, page);
	}

	/**
	 * 订单列表数量
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("/getAllOrderCount")
	@ResponseBody
	public void getAllOrderCount(HttpServletRequest request, HttpServletResponse response,
			@RequestBody Map<String, List<String>> mapparam) {
		// erp页面请求参数
		// 车商贷返回订单数据
		System.out.println(mapparam);
		Map map = orderService.queryOrderCount();
		Map taskMap = workFlowServiceCSD.queryAllCount(mapparam.get("list"));
		map.putAll(taskMap);
		// 查询还款计划表
		SpringUtils.renderJson(response, map);
	}

	@RequestMapping("/withholdingCommissionHandler")
	public void withholdingCommissionHandler(HttpServletRequest request, HttpServletResponse response,
			LoanHandlerRequest loanHandlerRequest) {
		Map resultMap = new HashMap();
		resultMap.put("success", true);
		try {
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute(Constants.AUTH_USER);
			String uuid = user.getUuid();
			loanHandlerRequest.setUser(uuid);
			resultMap = loanServiceCSD.reviewApprovalStatus(loanHandlerRequest);
			MerchantModify merchantModify = new MerchantModify();
			merchantModify.setId(loanHandlerRequest.getOrderId());
			merchantModify.setRepaymentime(new Date());
			merchantModify.setIndentState(CarDealerRepaymentEnum.distrution_user_dismantling.name());
			orderService.updateMerchantIndent(merchantModify);
			loanHandlerRequest.setEndType("委托代扣");
			loanServiceCSD.modifyRepayment(loanHandlerRequest);
		} catch (Exception e) {
			resultMap.put("success", false);
			logger.error("处理委托代扣失败:", e);
		}
		SpringUtils.renderJson(response, resultMap);
	}

	@RequestMapping("/distributionUserDismantlingHandler")
	public void distributionUserDismantlingHandler(HttpServletRequest request, HttpServletResponse response,
			LoanHandlerRequest loanHandlerRequest) {
		Map resultMap = new HashMap();
		resultMap.put("success", true);
		try {
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute(Constants.AUTH_USER);
			String uuid = user.getUuid();
			loanHandlerRequest.setUser(request.getParameter("userid"));
			resultMap = loanServiceCSD.reviewApprovalStatus(loanHandlerRequest);
			// 修改还款计划
			MerchantModify merchantModify = new MerchantModify();
			merchantModify.setRejectRemarks(loanHandlerRequest.getApprovalConclusion());
			merchantModify.setWhetherPass(loanHandlerRequest.getApprovalStatus());
			merchantModify.setId(loanHandlerRequest.getOrderId());
			merchantModify.setIndentState(CarDealerRepaymentEnum.dismantling.name());
			merchantModify.setOutAccountTime(new Date());
			orderService.updateMerchantIndent(merchantModify);
		} catch (Exception e) {
			resultMap.put("success", false);
			logger.error("处理委托代扣失败:", e);
		}
		SpringUtils.renderJson(response, resultMap);
	}

	@RequestMapping("/overdueHandler")
	public void overdueHandler(HttpServletRequest request, HttpServletResponse response,
			LoanHandlerRequest loanHandlerRequest) {
		Map resultMap = new HashMap();
		resultMap.put("success", true);
		try {
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute(Constants.AUTH_USER);
			String uuid = user.getUuid();
			loanHandlerRequest.setUser(uuid);
			MerchantModify merchantModify = new MerchantModify();
			merchantModify.setRejectRemarks(loanHandlerRequest.getApprovalConclusion());
			merchantModify.setWhetherPass(loanHandlerRequest.getApprovalStatus());
			merchantModify.setId(loanHandlerRequest.getOrderId());
			merchantModify.setIndentState(CarDealerRepaymentEnum.repayment_end.name());
			merchantModify.setRepaymentime(new Date());
			orderService.updateMerchantIndent(merchantModify);
			resultMap = loanServiceCSD.ovedueRepaymentHandler(loanHandlerRequest);
		} catch (Exception e) {
			resultMap.put("success", false);
			logger.error("处理委托代扣失败:", e);
		}
		SpringUtils.renderJson(response, resultMap);
	}

	@RequestMapping("/getRepayPlanInfo")
	public void getRepaymentPlanInfo(HttpServletRequest request, HttpServletResponse response,
			LoanHandlerRequest loanHandlerRequest) {
		String orderId = loanHandlerRequest.getOrderId();
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute(Constants.AUTH_USER);
		Map map = loanServiceCSD.queryRepaymentPlanInfo(orderId, user);
		SpringUtils.renderJson(response, map);
	}

	@RequestMapping("/getAfterListCount")
	public void getAfterListCount(HttpServletRequest request, HttpServletResponse response,
			LoanHandlerRequest loanHandlerRequest) {
		String orderId = loanHandlerRequest.getOrderId();
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute(Constants.AUTH_USER);
		String uuid = user.getUuid();
		Map<String, Integer> map = workFlowServiceCSD.queryRepaymentCount(uuid, WorkFlowType.CarDealerRepayment.name());
		int allCount = 0;
		for (Entry<String, Integer> entry : map.entrySet()) {
			allCount += entry.getValue();
		}
		map.put("allCount", allCount);
		SpringUtils.renderJson(response, map);
	}

	@RequestMapping("/getLoanOrderCount")
	public void getLoanOrderCount(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute(Constants.AUTH_USER);
		Map map = loanServiceCSD.getLoanOrderCount(user.getUuid());
		SpringUtils.renderJson(response, map);
	}
}
