package com.utonw.utonerp.controller;

import com.alibaba.dubbo.common.json.JSON;
import com.alibaba.dubbo.common.json.JSONObject;
import com.alibaba.dubbo.config.annotation.Reference;
import com.github.pagehelper.PageInfo;
import com.qiniu.util.Json;
import com.utonw.dealer.api.dto.request.CustomerListRequest;
import com.utonw.dealer.api.dto.request.MerchantRequest;
import com.utonw.dealer.api.dto.response.CustomerListResponse;
import com.utonw.dealer.api.entity.CompleteRequest;
import com.utonw.dealer.api.entity.MerchantApply;
import com.utonw.dealer.api.entity.erp.RepaymentPlanResult;
import com.utonw.dealer.api.entity.erp.User;
import com.utonw.dealer.api.entity.workflowtask;
import com.utonw.dealer.api.enums.CarDealerApplyEnum;
import com.utonw.dealer.api.enums.WorkFlowType;
import com.utonw.dealer.api.service.*;
import com.utonw.dealer.api.service.erp.IUserService;
import com.utonw.dealer.api.util.erp.Constants;
import com.utonw.utonbase.core.erpcommon.utils.Base64;
import com.utonw.utonbase.core.erpcommon.utils.DateSimUtil;
import com.utonw.utonbase.core.erpcommon.utils.SpringUtils;
import com.utonw.utonerp.common.controller.BaseController;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/merchant")
public class MerchantController extends BaseController {
	@Reference(version = "1.0.0")
	private IERPCustomerList iERPCustomerList;

	@Reference(version = "1.0.0")
	private IUserService userService;

	@Reference(version = "1.0.0")
	private ILoanServiceCSD loanServiceCSD;

	@Reference(version = "1.0.0")
	private IWorkFlowServiceCSD workFlowServiceCSD;

	Logger logger = Logger.getLogger(MerchantController.class);

	@Reference(version = "1.0.0")
	private IIndentService iIndentService;
	@Reference(version = "1.0.0")
	private IPushService pushService;

	@Reference(version = "1.0.0")
	private ILoanDetails loanDetails;

	@RequestMapping("/customer")
	public void customer(HttpServletResponse response, @RequestBody CustomerListRequest customerListRequest,
			HttpSession httpSession) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		User user = (User) httpSession.getAttribute(Constants.AUTH_USER);
		Map count = loanServiceCSD.queryMerchantCount(user.getUuid());
		Map task = loanServiceCSD.queryBusinessKey(user.getUuid(), customerListRequest.getReviewStatus());
		customerListRequest.setApplyId((List) task.get("businessList"));
		resultMap = iERPCustomerList.selectCustomerList(customerListRequest);
		resultMap.put("workflowTasks", task.get("workflowtaskMaps"));
		resultMap.put("count", count);
		resultMap.put("sum", task.get("sum"));
		SpringUtils.renderJson(response, resultMap);
	}

	@RequestMapping("/merchantInfo")
	public void merchantInfo(HttpServletRequest request, HttpServletResponse response) {
		String accountId = request.getParameter("accountId");
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = iERPCustomerList.selectCustomerInfo(accountId);
		SpringUtils.renderJson(response, resultMap);
	}

	@RequestMapping("/distributionUser")
	public void evaluateInfo(HttpServletRequest request, HttpServletResponse response, MerchantApply merchantApply) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		// resultMap = iERPCustomerList.submitMerApply(merchantApply);
		Map map = new HashMap();
		map.put("user", StringUtils.isEmpty(request.getParameter("userid"))?false:request.getParameter("userid"));
		map.put(request.getParameter("status"), true);
		User user = (User) request.getSession().getAttribute(Constants.AUTH_USER);
		// map.put("userUuid", user.getUuid());
		CompleteRequest completeRequest = new CompleteRequest();
		completeRequest.setApplyId(request.getParameter("id"));
		completeRequest.setParam(map);
		completeRequest.setTaskId(request.getParameter("taskid"));
		completeRequest.setUserUuid(user.getUuid());
		completeRequest.setTaskKey(request.getParameter("taskname"));
		try {
			resultMap.put("msg", true);
			workFlowServiceCSD.complete(completeRequest);
			try {
				workflowtask wf = workFlowServiceCSD.queryLastTask(request.getParameter("id"));
				if (wf != null) {
					pushService.sendPush(wf.getTask_def_key(), wf.getBusinesskey(), wf.getProckey(), wf.getAssignee());
				}
			} catch (Exception e) {
				logger.error("推送消息失败");
			}
		} catch (Exception e) {
			resultMap.put("msg", false);
			e.printStackTrace();
		}
		SpringUtils.renderJson(response, resultMap);
	}

	@RequestMapping("/headquartersAudit")
	public void headquartersAudit(HttpServletRequest request, HttpServletResponse response,
			MerchantApply merchantApply) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		merchantApply.setReviewstatus(1);
		resultMap = iERPCustomerList.submitMerApply(merchantApply);
		Map map = new HashMap();
		map.put(request.getParameter("status"), true);
		User user = (User) request.getSession().getAttribute(Constants.AUTH_USER);
		CompleteRequest completeRequest = new CompleteRequest();
		completeRequest.setApplyId(request.getParameter("id"));
		completeRequest.setParam(map);
		completeRequest.setRemark(request.getParameter("remark"));
		completeRequest.setTaskId(request.getParameter("taskid"));
		completeRequest.setUserUuid(user.getUuid());
		completeRequest.setTaskKey(request.getParameter("taskname"));
		workFlowServiceCSD.complete(completeRequest);
		try {
			workflowtask wf = workFlowServiceCSD.queryLastTask(request.getParameter("id"));
			if (wf != null) {
				pushService.sendPush(wf.getTask_def_key(), wf.getBusinesskey(), wf.getProckey(), wf.getAssignee());
			}
		} catch (Exception e) {
			logger.error("推送消息失败");
		}
		SpringUtils.renderJson(response, resultMap);
	}

	@RequestMapping("/auditCameraContract")
	public void auditCameraContract(HttpServletRequest request, HttpServletResponse response,
			MerchantApply merchantApply) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		merchantApply.setSubmitstate(2);
		resultMap = iERPCustomerList.submitMerApply(merchantApply);
		Map map = new HashMap();
		map.put(request.getParameter("status"), true);
		User user = (User) request.getSession().getAttribute(Constants.AUTH_USER);
		CompleteRequest completeRequest = new CompleteRequest();
		completeRequest.setApplyId(request.getParameter("id"));
		completeRequest.setParam(map);
		completeRequest.setRemark(request.getParameter("remark"));
		completeRequest.setTaskId(request.getParameter("taskid"));
		completeRequest.setUserUuid(user.getUuid());
		completeRequest.setTaskKey(request.getParameter("taskname"));
		try {
			resultMap.put("msg", true);
			workFlowServiceCSD.complete(completeRequest);
			try {
				workflowtask wf = workFlowServiceCSD.queryLastTask(request.getParameter("id"));
				if (wf != null) {
					pushService.sendPush(wf.getTask_def_key(), wf.getBusinesskey(), wf.getProckey(), wf.getAssignee());
				}
			} catch (Exception e) {
				logger.error("推送消息失败");
			}
		} catch (Exception e) {
			resultMap.put("msg", false);
			e.printStackTrace();
		}
		SpringUtils.renderJson(response, resultMap);
	}

	@RequestMapping("/offlineStaff")
	public void offlineStaff(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String province = request.getParameter("province");
		String city = request.getParameter("city");
		String district = request.getParameter("district");
		String role = request.getParameter("role");
		resultMap.put("province", province);
		resultMap.put("city", city);
		resultMap.put("district", district);
		resultMap.put("role", role);
		List<User> staffList = userService.getOfflineStaff(resultMap);
		resultMap.clear();
		resultMap.put("staffList", staffList);
		SpringUtils.renderJson(response, resultMap);
	}

	/* zhangheng st */
	/*
	 * 功能: 获取还款计划
	 */
	@RequestMapping("/getRefundPlan")
	@ResponseBody
	public Object getRefundPlan(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("task_id") == null ? "" : request.getParameter("task_id").trim();
		String lended_time = request.getParameter("lended_time") == null ? ""
				: request.getParameter("lended_time").trim();
		logger.info("******获取还款计划,入参id={"+id+"},放款时间lended_time={"+lended_time+"}");
		// 调取查询方法，处理返回结果，最终返回js页面
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			if (!StringUtils.isEmpty(id)) {
				RepaymentPlanResult planResult = new RepaymentPlanResult();
				Map<String, Object> result = iIndentService.getRepaymentPlanInfo(id);
				logger.info("******调用接口返回数据，result={}"+ JSON.json(result).toString());
				if (result.get("retCode").equals("0000")) {
					Map<String, Object> repaymentPlanMap = (Map<String, Object>) result.get("repaymentPlan");
					map.put("code", "0000");
					map.put("carName",
							repaymentPlanMap.get("merchantName") == null ? "" : repaymentPlanMap.get("merchantName"));// 车行名称
					map.put("jkpersion",
							repaymentPlanMap.get("realName") == null ? "" : repaymentPlanMap.get("realName")); // 借款人
					map.put("fktime", lended_time); // 放款时间 为当前系统时间
					map.put("fkamt",
							repaymentPlanMap.get("judgeMoney") == null ? "" : repaymentPlanMap.get("judgeMoney")); // 放款金额
					map.put("during",
							repaymentPlanMap.get("deadlineTime") == null ? "" : repaymentPlanMap.get("deadlineTime")); // 周期
					map.put("rata",
							repaymentPlanMap.get("interestRate") == null ? "" : repaymentPlanMap.get("interestRate")); // 利率
					if (repaymentPlanMap.get("deadlineTime") != null) {
						String time = repaymentPlanMap.get("deadlineTime").toString();
						map.put("hktime", DateSimUtil.getAddDate(lended_time, time)); // 还款日期
						// 计算
					} else {
						map.put("hktime", ""); // 还款日期 计算
					}
					if (repaymentPlanMap.get("merchantName") != null) {
						BigDecimal benji = new BigDecimal(repaymentPlanMap.get("judgeMoney").toString());
						BigDecimal rate = new BigDecimal(repaymentPlanMap.get("interestRate").toString());
						Integer during = (Integer) repaymentPlanMap.get("deadlineTime");
						map.put("hkamt", getRerfundAmt(benji, rate, during, new BigDecimal(0))); // 还款金额
						// 计算
					} else {
						map.put("hkamt", ""); // 还款金额 计算
					}
				} else {
					map.put("code", "1111");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			map.put("code", "1111");
		}
		return map;
	}

	/*
	 * 利息： 本金*月利率/30*天数+逾期罚息 最终还款 ： 本金 + 利息 +逾期罚息
	 */
	public double getRerfundAmt(BigDecimal benJi, BigDecimal rate, int dayNum, BigDecimal faXi) {
		BigDecimal needRepaymentPlan = rate.multiply(new BigDecimal(dayNum)).multiply(benJi)
				.multiply(new BigDecimal(10000)).divide(new BigDecimal(30), 2, BigDecimal.ROUND_HALF_UP)
				.divide(new BigDecimal(1200), 2, BigDecimal.ROUND_HALF_UP).add(benJi.multiply(new BigDecimal(10000)));
		return needRepaymentPlan.doubleValue();
	}

	/*
	 * 计算 罚息计算公式：逾期天数*本金*罚息比率
	 */
	public BigDecimal getfaXiAmt(BigDecimal benJi, BigDecimal rate, int dayNum) {
		BigDecimal dayNumNum = new BigDecimal(dayNum); // 天数
		BigDecimal lixi_faxi = benJi.multiply(dayNumNum).multiply(rate);
		return lixi_faxi;
	}
	/* zhangheng ed */

	@RequestMapping("/jumpToTpsData")
	public void jumpToTpsData(HttpServletRequest request, HttpServletResponse response) {
		Map result = new HashMap();
		result.put("success", false);
		String accountId = request.getParameter("accountId");
		String timestamp = request.getParameter("timestamp");
		String url = loanServiceCSD.jumpToTpsDate(accountId, timestamp.toString());
		if (url == null || url.length() <= 0) {
			result.put("msg", "参数错误，请联系管理员");
			SpringUtils.renderJson(response, result);
		} else {
			result.put("success", true);
			result.put("url", url);
			SpringUtils.renderJson(response, result);
		}
	}

	@RequestMapping("downloadPdf")
	public void downloadPdf(HttpServletRequest request, HttpServletResponse response) {
		Map result = new HashMap();
		Map param = new HashMap();
		String type = request.getParameter("type");
		String customerId = request.getParameter("customerId");
		result.put("success", false);
		Map creditInfo = loanDetails.queryCreditInfo(customerId);
		if (type.equalsIgnoreCase("personal")) {
			String name = creditInfo.get("personName").toString();
			String documentNo = creditInfo.get("idcard").toString();
			param.put("name", name.trim());
			param.put("documentNo", documentNo.trim());
		} else if (type.equalsIgnoreCase("enterprise")) {
			String corpName = creditInfo.get("merchantName").toString();
			param.put("corpName", corpName.trim());
		} else if (type.equalsIgnoreCase("fraud")) {
			String phone = creditInfo.get("phoneNumber").toString();
			String name = creditInfo.get("personName").toString();
			String documentNo = creditInfo.get("idcard").toString();
			param.put("phone", phone.trim());
			param.put("documentNo", documentNo.trim());
			param.put("name", name.trim());
		}
		param.put("type", type.trim());
		param.put("accountId", creditInfo.get("acountId"));
		result = loanDetails.queryPengYuanCredit(param);
		result.put("success", true);
		result.put("type", type.trim());
		ServletOutputStream out;

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("personal", "个人信用报告");
		jsonObject.put("enterprise", "全国企业信用报告");
		jsonObject.put("fraud", "个人反欺诈分析");

		try {
			out = response.getOutputStream();
			Base64 base64 = new Base64();
			byte[] buffer = base64.decode(result.get("byte").toString());
			response.setContentType("multipart/form-data");
			response.setHeader("Content-disposition", "attachment; filename="
					+ new String(jsonObject.get(type).toString().concat(".pdf").getBytes("utf-8"), "ISO8859-1") + "");
			out.write(buffer, 0, buffer.length);
			response.getOutputStream().close();
			response.getOutputStream().flush();
		} catch (Exception e) {
			e.printStackTrace();
			e.getCause();
		}
	}

	/**
	 * 客户列表
	 * 
	 * @param request
	 * @param response
	 * @param merchantRequest
	 */
	@RequestMapping("getAllMerchant")
	public void getAllMerchant(HttpServletRequest request, HttpServletResponse response,
			MerchantRequest merchantRequest) {
		// 分页查询工作流
		Map resultMap = new HashMap();
		logger.info("传入参数:"+ Json.encode(merchantRequest));
		if (!com.alibaba.dubbo.common.utils.StringUtils.isEquals(merchantRequest.getApplyStatus(),
				CarDealerApplyEnum.all.name())) {
			merchantRequest.setWorkFlowType(WorkFlowType.CarDealerApply.name());
			PageInfo<workflowtask> tasks = workFlowServiceCSD.queryTaskByTaskKey(merchantRequest);
			if (tasks == null || tasks.getTotal() == 0) {
				SpringUtils.renderJson(response, tasks);
				return;
			}
			Map map = new HashMap();
			List<String> ids = new ArrayList<>();
			for (workflowtask workflowtask : tasks.getList()) {
				ids.add(workflowtask.getBusinesskey());
				map.put(workflowtask.getBusinesskey(), workflowtask);
			}
			CustomerListRequest customerListRequest = new CustomerListRequest();
			customerListRequest.setApplyId(ids);
			List<CustomerListResponse> customerListResponses = (List) iERPCustomerList
					.queryCustomerApplyList(customerListRequest).get("result");
			for (CustomerListResponse response1 : customerListResponses) {
				workflowtask task = (workflowtask) map.get(response1.getId());
				response1.setApplyStatus(task.getName());
				response1.setAssignUser(task.getAssignee());
			}
			resultMap.put("list", customerListResponses);
			resultMap.put("total", tasks.getTotal());
			SpringUtils.renderJson(response, resultMap);
		} else {
			if (merchantRequest == null) {
				merchantRequest = new MerchantRequest();
				merchantRequest.setPageNum(Integer.valueOf(request.getParameter("pageNum")));
				merchantRequest.setPageSize(Integer.valueOf(request.getParameter("pageSize")));
				merchantRequest.setApplyStatus(request.getParameter("applyStatus"));
			}

			PageInfo<CustomerListResponse> customerListResponses = iERPCustomerList
					.queryAllApplyByCondition(merchantRequest);
			List<String> ids = new ArrayList<>();
			for (CustomerListResponse response1 : customerListResponses.getList()) {
				if (response1.getReviewStatus() == 3) {
					response1.setApplyStatus("申请完成");
				} else {
					ids.add(response1.getId());
				}
			}
			if (ids.size() > Integer.valueOf(0)) {
				List<workflowtask> workflowtasks = workFlowServiceCSD.queryApplyByApplyIds(ids);
				Map map = new HashMap();
				for (workflowtask workflowtask : workflowtasks) {
					map.put(workflowtask.getBusinesskey(), workflowtask);
				}
				for (CustomerListResponse response1 : customerListResponses.getList()) {
					workflowtask task = (workflowtask) map.get(response1.getId());
					if (task != null) {
						response1.setApplyStatus(task.getName());
						response1.setAssignUser(task.getAssignee());
					} else {
						response1.setApplyStatus("申请完成");
					}
				}
			}
			resultMap.put("list", customerListResponses.getList());
			resultMap.put("total", customerListResponses.getTotal());
			SpringUtils.renderJson(response, resultMap);
		}
	}

	/**
	 * 客户数量
	 */
	@RequestMapping("getAllMerchantCount")
	public void getAllMerchantCount(HttpServletRequest request, HttpServletResponse response,
			MerchantRequest merchantRequest) {
		int i = iERPCustomerList.queryAllApplyCount();
		Map<String, Integer> map = workFlowServiceCSD.queryApplyCount(WorkFlowType.CarDealerApply.name());
		map.put("totalCount", i);
		SpringUtils.renderJson(response, map);
	}

	@RequestMapping("getMerchantBySearch")
	public void getMerchantBySearch(HttpServletRequest request, HttpServletResponse response,
			MerchantRequest merchantRequest) {

	}

	@RequestMapping("modifyMerchantInfo")
	public void modifyMerchantInfo(HttpServletResponse response,MerchantApply merchantApply) {
		boolean flag = iERPCustomerList.modifyApplyInfo(merchantApply);
		if (flag) {
			SpringUtils.renderJson(response, "0000");
		}
		SpringUtils.renderJson(response, "0001");
	}
}