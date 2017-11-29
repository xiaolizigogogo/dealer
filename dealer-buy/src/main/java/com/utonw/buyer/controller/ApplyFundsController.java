package com.utonw.buyer.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.dubbo.common.utils.StringUtils;
import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.utonw.buyer.interceptor.LoginInterceptor;
import com.utonw.dealer.api.dto.ApplyDTO;
import com.utonw.dealer.api.dto.CarOrderStateDTO;
import com.utonw.dealer.api.dto.OrderListDTO;
import com.utonw.dealer.api.dto.SaveFinancingPicture;
import com.utonw.dealer.api.dto.request.ApplicationStatus;
import com.utonw.dealer.api.dto.request.MerchantApplyTaskRequst;
import com.utonw.dealer.api.dto.request.SignTask;
import com.utonw.dealer.api.dto.request.TaskManageStatus;
import com.utonw.dealer.api.entity.ApplyIndentRequest;
import com.utonw.dealer.api.entity.CompleteRequest;
import com.utonw.dealer.api.entity.CsdApprovalInfo;
import com.utonw.dealer.api.entity.MerchantApply;
import com.utonw.dealer.api.entity.MerchantIndent;
import com.utonw.dealer.api.entity.OrderStatus;
import com.utonw.dealer.api.entity.OrderStatusUpdate;
import com.utonw.dealer.api.entity.RateConfig;
import com.utonw.dealer.api.enums.CarDealerApplyEnum;
import com.utonw.dealer.api.enums.IndentStatusEnum;
import com.utonw.dealer.api.enums.LoanStatusEnum;
import com.utonw.dealer.api.enums.WorkFlowType;
import com.utonw.dealer.api.model.BaseResult;
import com.utonw.dealer.api.service.ILoanServiceCSD;
import com.utonw.dealer.api.service.IMerchantApplyService;
import com.utonw.dealer.api.service.IOrderServiceCSD;
import com.utonw.dealer.api.service.IWorkFlowServiceCSD;
import com.utonw.util.Constants;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;

/**
 * Created by SEELE on 2017/5/2.
 */
@RestController
@RequestMapping("merchant")
@Api(value = "merchant", description = "车商相关信息的接口定义")
public class ApplyFundsController {
	private Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	@Reference(version = "1.0.0", timeout = 1500000)
	IMerchantApplyService merchantApplyService;
	@Reference(version = "1.0.0", timeout = 1500000)
	ILoanServiceCSD loanserviceCSD;
	@Reference(version = "1.0.0", timeout = 1500000)
	IOrderServiceCSD iOrderServiceCSD;
	@Reference(version = "1.0.0", timeout = 1500000)
	IWorkFlowServiceCSD workFlowServiceCSD;

	@RequestMapping(value = "saveFinancing", method = RequestMethod.POST)
	@ApiOperation(value = "添加配资相关信息")
	public BaseResult saveFinancing(@RequestBody() ApplyDTO authDTO, HttpServletRequest request) {
		logger.info("进入添加配资相关信息+saveFinancing方法");
		authDTO.getApplyMoneyDTO().setAcountId(String.valueOf(request.getAttribute("account")));
		Map<String, Object> result = merchantApplyService.createApply(authDTO);
		if (StringUtils.isEquals(authDTO.getApplyState(), "nopass")
				&& StringUtils.isEquals(result.get("retCode").toString(), "0000")) {
			CompleteRequest completeRequest = new CompleteRequest();
			completeRequest.setApplyId(result.get("applyId").toString());
			completeRequest.setTaskKey(CarDealerApplyEnum.apply_restart.name());
			workFlowServiceCSD.completeEnd(completeRequest);
		} else if (StringUtils.isEquals(result.get("retCode").toString(), "0000")) {
			String applyId = result.get("applyId").toString();
			workFlowServiceCSD.startTaskBy(WorkFlowType.CarDealerApply.getCode(), applyId);
		}

		return new BaseResult(null, (String) result.get("retCode"), (String) result.get("retMsg"));
	}

	@RequestMapping(value = "queryMerchantInfo", method = RequestMethod.POST)
	@ApiOperation(value = "根据车商ID获取车商信息")
	@ApiImplicitParam(name = "merchantApplyTaskRequst", value = "针对车商申请任务查询", required = true, dataType = "MerchantApplyTaskRequst")
	public BaseResult queryMerchantInfo(@RequestBody MerchantApplyTaskRequst merchantApplyTaskRequst,
			HttpServletRequest request) {
		int pageNum = merchantApplyTaskRequst.getPageNum();
		int pageSize = merchantApplyTaskRequst.getPageSize();
		String merchantName = merchantApplyTaskRequst.getMerchantName();
		// 资质已办任务
		List<ApplyIndentRequest> list = iOrderServiceCSD
				.createOrderList(String.valueOf(request.getAttribute("account")));
		// 配资已办任务
		List<ApplyIndentRequest> withCapital = iOrderServiceCSD
				.createwithCapital(String.valueOf(request.getAttribute("account")));
		Map<String, Object> result = merchantApplyService.getTaskByUserId(list, pageNum, pageSize, merchantName,
				withCapital);
		return new BaseResult(result.get("list"), (String) result.get("retCode"), (String) result.get("retMsg"));
	}

	@RequestMapping(value = "queryAlreadyTask", method = RequestMethod.POST)
	@ApiOperation(value = "查询已办任务")
	public BaseResult queryAlreadyTask(@RequestBody MerchantApplyTaskRequst merchantApplyTaskRequst,
			HttpServletRequest request) {
		int pageNum = merchantApplyTaskRequst.getPageNum();
		int pageSize = merchantApplyTaskRequst.getPageSize();
		String merchantName = merchantApplyTaskRequst.getMerchantName();
		List<ApplyIndentRequest> list = iOrderServiceCSD
				.queryAlreadyTask(String.valueOf(request.getAttribute("account")));
		// 配资已办任务
		/*
		 * List<ApplyIndentRequest> withCapital=
		 * iOrderServiceCSD.createwithCapital(String.valueOf(request.
		 * getAttribute("account")));
		 */
		Map<String, Object> result = merchantApplyService.getTaskByList(list, pageNum, pageSize, merchantName);
		return new BaseResult(result.get("list"), (String) result.get("retCode"), (String) result.get("retMsg"));
	}

	@RequestMapping(value = "updateTaskManageStatus", method = RequestMethod.POST)
	@ApiOperation(value = "修改任务表状态")
	public BaseResult updateTaskManageStatus(@RequestBody TaskManageStatus taskManageStatus,
			HttpServletRequest request) {
		CompleteRequest completeRequest = new CompleteRequest();
		completeRequest.setApplyId(taskManageStatus.getApplyId());
		completeRequest.setTaskId(taskManageStatus.getTaskId());
		completeRequest.setUserUuid(String.valueOf(request.getAttribute("account")));
		completeRequest.setTaskKey(taskManageStatus.getTaskKey());
		boolean complete = workFlowServiceCSD.complete(completeRequest);
		if (complete == true) {
			return new BaseResult(null, "0000", "提交成功");
		} else {
			return new BaseResult(null, "9999", "提交失败");
		}
	}

	@RequestMapping(value = "getAllocationAudit", method = RequestMethod.POST)
	@ApiOperation(value = "根据车商ID查询配置申请状态")
	public BaseResult getAllocationAudit(@RequestBody String acountId, HttpServletRequest request) {
		if (request.getParameter("ver") == null) {
			return null;
		}
		Map<String, Object> result = merchantApplyService
				.getAllocationAudit(String.valueOf(request.getAttribute("account")));
		return new BaseResult(result.get("data"), (String) result.get("retCode"), (String) result.get("retMsg"));
	}

	@RequestMapping(value = "getDealerInformationVerification", method = RequestMethod.POST)
	@ApiOperation(value = "车商信息核实")
	public BaseResult getDealerInformationVerification(@RequestBody String acountId) {
		Map<String, Object> result = new HashMap<>();
		if (acountId == null) {
			return new BaseResult("", "9999", "用户名为空");
		} else {
			result = merchantApplyService
					.getDealerInformationVerification(JSON.parseObject(acountId).getString("acountId"));
			result.put("merchantPicture",
					merchantApplyService.getAttachment(JSON.parseObject(acountId).getString("acountId")));
			return new BaseResult(result, "0000", "成功");
		}
	}

	@RequestMapping(value = "getOrderList", method = RequestMethod.POST)
	@ApiOperation(value = "代办—订单列表")
	public BaseResult getOrderList(@RequestBody OrderListDTO orderListDTO, HttpServletRequest request) {
		List<ApplyIndentRequest> list = iOrderServiceCSD
				.createOrderList(String.valueOf(request.getAttribute("account")));
		String acountId = orderListDTO.getAcountId();
		int pageNum = orderListDTO.getPageNum();
		int pageSize = orderListDTO.getPageSize();
		String status = orderListDTO.getStatus();
		String productName = orderListDTO.getProductName();
		String task_key = orderListDTO.getTaskKey();
		if (list == null && list.size() <= 0) {
			return new BaseResult("", "9999", "暂无数据");
		} else {
			Map<String, Object> result = merchantApplyService.getOrderList(acountId, pageNum, pageSize, status,
					productName, list, task_key);

			return new BaseResult(result.get("orderList"), (String) result.get("retCode"),
					(String) result.get("retMsg"));
		}
	}

	@RequestMapping(value = "getalreadyOrderList", method = RequestMethod.POST)
	@ApiOperation(value = "已办代办—订单列表")
	public BaseResult getalreadyOrderList(@RequestBody OrderListDTO orderListDTO, HttpServletRequest request) {
		List<ApplyIndentRequest> list = iOrderServiceCSD
				.queryAlreadyTask(String.valueOf(request.getAttribute("account")));
		String acountId = orderListDTO.getAcountId();
		int pageNum = orderListDTO.getPageNum();
		int pageSize = orderListDTO.getPageSize();
		String status = orderListDTO.getStatus();
		String productName = orderListDTO.getProductName();
		String task_key = orderListDTO.getTaskKey();
		if (list == null && list.size() <= 0) {
			return new BaseResult("", "9999", "暂无数据");
		} else {
			Map<String, Object> result = merchantApplyService.getOrderList(acountId, pageNum, pageSize, status,
					productName, list, task_key);

			return new BaseResult(result.get("orderList"), (String) result.get("retCode"),
					(String) result.get("retMsg"));
		}
	}

	// 时间
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "getCarOrderState", method = RequestMethod.POST)
	@ApiOperation(value = "根据车商ID查询配资申请状态")
	public BaseResult getCarOrderState(@RequestBody String productId) {
		Map<String, Object> result = new HashMap<>();
		MerchantIndent indent = merchantApplyService.getIndentId(JSON.parseObject(productId).getString("productId"));
		List<Object> list = new ArrayList<Object>();
		if (indent == null) {
			return new BaseResult("", "9999", "订单不存在");
		} else {
			List<String> order = new ArrayList<>();
			String orderId = indent.getId();
			String productid = indent.getProductid().toString();
			Map<String, Object> time = loanserviceCSD.selectAllApprovalInfoList(order);
			OrderStatusUpdate update_time = merchantApplyService.selectUpdateTime(orderId, productid);
			OrderStatus createdate = merchantApplyService.selectCreatedate(orderId);
			List<CsdApprovalInfo> csdApprovalInfos = (List<CsdApprovalInfo>) time.get("result");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

			List<CarOrderStateDTO> carOrderStateDTOList = new ArrayList<>();

			for (CsdApprovalInfo csd : csdApprovalInfos) {
				CarOrderStateDTO carOrderStateDTO = new CarOrderStateDTO();
				String approvallevel = csd.getApprovallevel();
				String approvalStatus = csd.getApprovalconclusion();
				String keyString = "";
				if (!approvallevel.equals("lended")) {
					keyString += LoanStatusEnum.getName(approvallevel);
					if (approvalStatus == "pass") {
						keyString += "通过";
					} else if (approvalStatus == null) {
						keyString += "通过";
					} else {
						keyString += "不通过";
					}
					carOrderStateDTO.setDate(sdf.format(csd.getApprovaltime()));
				} else {
					keyString += "放款完成";
					carOrderStateDTO.setDate(sdf.format(csd.getApprovaltime()));
				}
				carOrderStateDTO.setIndentState(keyString);
				IndentStatusEnum ise = IndentStatusEnum.valueOf(csd.getApprovallevel());
				carOrderStateDTO.setIndex(String.valueOf(ise.getCode()));
				carOrderStateDTOList.add(carOrderStateDTO);
			}
			CarOrderStateDTO assess = new CarOrderStateDTO();
			CarOrderStateDTO trial = new CarOrderStateDTO();
			if (update_time.getUpdatetime() != null) {
				assess.setIndentState("评估完成");
				assess.setDate(update_time.getUpdatetime() == null ? null : sdf.format(update_time.getUpdatetime()));
				IndentStatusEnum ise_assess = IndentStatusEnum.valueOf("assess");
				assess.setIndex(String.valueOf(ise_assess.getCode()));
				carOrderStateDTOList.add(assess);
			}

			String passed = "";
			if (createdate.getCreatedate() != null) {
				if (createdate.getPassed() == 1) {
					passed += "初审通过";
					trial.setIndentState(passed);
					trial.setDate(sdf.format(createdate.getCreatedate()));

				} else {
					passed += "初审不通过";
					trial.setIndentState(passed);
				}
				IndentStatusEnum ise_trial = IndentStatusEnum.valueOf("trial");
				trial.setIndex(String.valueOf(ise_trial.getCode()));
				carOrderStateDTOList.add(trial);
			}
			return new BaseResult(carOrderStateDTOList, "0000", "成功");

		}
	}

	@RequestMapping(value = "updateApplicationStatus", method = RequestMethod.POST)
	@ApiOperation(value = "更改申请表状态接口")
	public BaseResult updateApplicationStatus(@RequestBody ApplicationStatus applicationStatus,
			HttpServletRequest request) {
		applicationStatus.setAcountId(String.valueOf(request.getAttribute("account")));
		Map<String, Object> result = new HashMap<>();
		result = merchantApplyService.updateApplicationStatus(applicationStatus);

		return new BaseResult("", (String) result.get("retCode"), (String) result.get("retMsg"));
	}

	@RequestMapping(value = "updateSignTask", method = RequestMethod.POST)
	@ApiOperation(value = "签收任务接口")
	public BaseResult updateSignTask(@RequestBody SignTask signTask) {
		Map<String, Object> result = new HashMap<>();
		result = merchantApplyService.updateSignTask(signTask);
		return new BaseResult("", (String) result.get("retCode"), (String) result.get("retMsg"));
	}

	/**
	 * 单独上传图片
	 * 
	 * @param SaveFinancingPicture
	 * @return
	 */
	@RequestMapping(value = "saveFinancingPicture", method = RequestMethod.POST)
	@ApiOperation(value = "单独上传图片接口")
	public BaseResult saveFinancingPicture(@RequestBody SaveFinancingPicture SaveFinancingPicture) {
		Map<String, Object> result = merchantApplyService.saveFinancingPicture(SaveFinancingPicture);
		return new BaseResult(result.get("returnValue"), (String) result.get("retCode"), (String) result.get("retMsg"));

	}

	/**
	 * 获取利率
	 * 
	 * @param request
	 * @return
	 */
	@GetMapping("getFinancingRate")
	public BaseResult getFinancingRate(HttpServletRequest request) {
		try {
			String account = request.getAttribute("account").toString();
			MerchantApply merchantApply = merchantApplyService
					.selectOne(new EntityWrapper<MerchantApply>().eq("acountId", account));
			if (merchantApply == null) {
				return new BaseResult(null, "0001", "车商不存在");
			}
			List<RateConfig> rateConfigs = loanserviceCSD.getFinancingRate(merchantApply.getMonthlyinterest());
			return new BaseResult(rateConfigs, "0000", "操作成功 ");
		} catch (Exception e) {
			logger.error("【获取利率失败】 error:{}", e.toString());
			return new BaseResult(null, "0001", "获取利率失败");
		}

	}

}
