package com.utonw.buyer.controller;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.utonw.dealer.api.entity.MerchantIndent;
import com.utonw.obd.api.model.CarObd;
import com.utonw.obd.api.model.TCarRfid;
import com.utonw.obd.util.result.Response;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.dubbo.common.utils.StringUtils;
import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSON;
import com.utonw.dealer.api.dto.CarDTO;
import com.utonw.dealer.api.dto.ZyContract;
import com.utonw.dealer.api.entity.LoanHandlerRequest;
import com.utonw.dealer.api.model.BaseResult;
import com.utonw.dealer.api.service.IAssessService;
import com.utonw.dealer.api.service.IIndentService;
import com.utonw.dealer.api.service.ILoanServiceCSD;
import com.utonw.dealer.api.service.IOrderServiceCSD;
import com.utonw.obd.api.server.OBDService;
import com.utonw.obd.api.server.RFIDService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

/**
 * 评估车辆API Created by 马文聪 on 2017/4/20.
 */
@RestController
@RequestMapping("assess")
@Api(value = "assess", description = "评估信息")
public class AssessController {
	private static final Logger logger = LoggerFactory.getLogger("AssessController.class");
	@Reference(version = "1.0.0", timeout = 1500000)
	IAssessService assessService;

	@Reference(version = "1.0.0", timeout = 1500000)
	ILoanServiceCSD loanServiceCSD;

	@Reference(version = "1.0.0", timeout = 1500000)
	IOrderServiceCSD iOrderServiceCSD;

	@Reference(version = "0.1.0", timeout = 15000, check = false)
	OBDService obdService;
	
	@Reference(version = "0.1.0", timeout = 15000, check = false)
	RFIDService rfidService;

	@Reference(version = "1.0.0", timeout = 1500000)
	IIndentService indentService;

	/**
	 * 修改车辆信息
	 * 
	 * @param carDTO
	 * @return
	 */
	@RequestMapping(value = "/resetParts", method = RequestMethod.POST)
	@ApiOperation(value = "通过商品ID修改车辆信息")
	public BaseResult resetParts(@RequestBody CarDTO carDTO, HttpServletRequest request) {
		Map<String, Object> result = new HashMap<>();
		Map<String, Object> map = new HashMap<>();

		MerchantIndent merchantIndent = indentService.selectMerchantIndent(carDTO.getIndentId());
	if (merchantIndent != null) {
			Response<CarObd> response = obdService.getCarObd(carDTO.getIndentId(), merchantIndent.getPlatenumber());
			Response<TCarRfid> responseRfid = rfidService.getCarRFIDInfo(carDTO.getIndentId(), merchantIndent.getPlatenumber());
			
			if ((response.isSuccess() && !response.isEmpty()) || (responseRfid.isSuccess() && !responseRfid.isEmpty() && ("1".equals(responseRfid.getData().getBindState()) || "2".equals(responseRfid.getData().getBindState())))) {
				
				try {
					map = assessService.resetParts(carDTO);
					if (StringUtils.isEquals((String) map.get("retCode"), "0000")) {
						LoanHandlerRequest loanHandlerRequest = new LoanHandlerRequest();
						loanHandlerRequest.setApprovalId(String.valueOf(request.getAttribute("account")));
						loanHandlerRequest.setApprovalStatus("pass");
						loanHandlerRequest.setApprovalConclusion("通过");
						loanHandlerRequest.setApprovalLevel(carDTO.getTaskKey());
						loanHandlerRequest.setTaskId(carDTO.getTaskId());
						loanHandlerRequest.setOrderId(carDTO.getIndentId());
						loanHandlerRequest.setApprovalAmount(new BigDecimal(carDTO.getAppraisers_price()));
						loanServiceCSD.reviewApprovalStatus(loanHandlerRequest);
					}
				} catch (Exception e) {
					e.printStackTrace();
					logger.error(e.toString());
					return new BaseResult("", "9999", "保存更新失败");

				}
			} else {
					return new BaseResult("", "9999", "绑定失败");
			}
		} else {
			return new BaseResult("", "9999", "订单不存在");
		}
		result.put("retCode", "0000");
		result.put("retMsg", "成功");
		result.put("data", "成功");
		return new BaseResult((String) result.get("data"), (String) result.get("retCode"),
				(String) result.get("retMsg"));
	}

	/**
	 * 评估信息
	 * 
	 * @param indentId
	 * @return
	 */
	@RequestMapping(value = "/getAssessmentDetails", method = RequestMethod.POST)
	@ApiOperation(value = "根据商品ID获取评估信息")
	public BaseResult getAssessmentDetails(@RequestBody String indentId) {
		Map<String, Object> map = assessService.getAssess(JSON.parseObject(indentId).getString("indentId"));
		return new BaseResult(map.get("assess"), (String) map.get("retCode"), (String) map.get("retMsg"));
	}

	/**
	 * 自押合同节点
	 * 
	 * @param
	 * @return
	 */
	@RequestMapping(value = "/zyContract", method = RequestMethod.POST)
	@ApiOperation(value = "自押合同节点")
	public BaseResult zyContract(@RequestBody ZyContract zyContract, HttpServletRequest request) {

		Map<String, Object> result = new HashMap<>();

		try {

			LoanHandlerRequest loanHandlerRequest = new LoanHandlerRequest();
			loanHandlerRequest.setOrderId(String.valueOf(request.getAttribute("account")));// 用户ID
			loanHandlerRequest.setApprovalStatus("pass");//
			loanHandlerRequest.setApprovalConclusion("通过");//
			loanHandlerRequest.setApprovalId(request.getAttribute("account").toString());
			loanHandlerRequest.setApprovalLevel(zyContract.getTaskKey());// 任务英文名
			loanHandlerRequest.setTaskId(zyContract.getTaskId());// 任务id
			loanHandlerRequest.setOrderId(zyContract.getIndentId());// 订单ID
			loanServiceCSD.reviewApprovalStatus(loanHandlerRequest);
			indentService.commitZYContract(zyContract);
			
		} catch (Exception e) {

			e.printStackTrace();
			result.put("retCode", "9999");
			result.put("retMsg", "失败");
			throw new RuntimeException(JSON.toJSONString(result));
		}

		result.put("retCode", "0000");
		result.put("retMsg", "成功");
		result.put("data", "成功");
		return new BaseResult((String) result.get("data"), (String) result.get("retCode"),
				(String) result.get("retMsg"));
	}

}
