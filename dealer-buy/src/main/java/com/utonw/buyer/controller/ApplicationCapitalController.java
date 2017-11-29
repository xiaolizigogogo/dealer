package com.utonw.buyer.controller;

import com.alibaba.dubbo.common.utils.StringUtils;
import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSON;
import com.utonw.dealer.api.dto.EvaluationSheetDTO;
import com.utonw.dealer.api.entity.CompleteRequest;
import com.utonw.dealer.api.entity.workflowtask;
import com.utonw.dealer.api.enums.CarDealerApplyEnum;
import com.utonw.dealer.api.enums.WorkFlowType;
import com.utonw.dealer.api.model.BaseResult;
import com.utonw.dealer.api.service.IApplicationCapital;
import com.utonw.dealer.api.service.ILoanServiceCSD;
import com.utonw.dealer.api.service.IOrderServiceCSD;
import com.utonw.dealer.api.service.IWorkFlowServiceCSD;
import com.utonw.dealer.api.util.UploadUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * 提交配资相关信息 Created by 马文聪 on 2017/5/9.
 */
@RestController
@RequestMapping("evaluationSheet")
@Api(value = "evaluationSheet", description = "车商贷-提交配资相关信息 API")
public class ApplicationCapitalController {
	private Logger logger = LoggerFactory.getLogger(AfterTheLoanController.class);
	@Reference(version = "1.0.0", timeout = 1500000)
	IApplicationCapital applicationCapital;
	@Reference(version = "1.0.0", timeout = 1500000)
	IOrderServiceCSD iOrderServiceCSD;
	@Reference(version="1.0.0")
	IWorkFlowServiceCSD iWorkFlowServiceCSD;
	@Reference(version="1.0.0")
	ILoanServiceCSD loanServiceCSD;
	/**
	 * 提交配资相关信息
	 * 
	 * @param evaluationSheetDTO
	 * @return
	 */
	@RequestMapping(value = "updateFinancing", method = RequestMethod.POST)
	@ApiOperation(value = "提交配资相关信息", notes = "提交配资相关信息")
	public BaseResult updateFinancing(@ApiParam(value = "提交配资相关信息", required = true) @RequestBody EvaluationSheetDTO evaluationSheetDTO,
			HttpServletRequest request) {
        logger.info("进入方法 updateFinancing："+evaluationSheetDTO.getWhetherPass());
		try {
			evaluationSheetDTO.setAcountId(String.valueOf(request.getAttribute("account")));
			if(evaluationSheetDTO.getInterestRate() == null || evaluationSheetDTO.getDeadlineTime() < 0){
				logger.error("请求异常,利率或周期为空");
				return new BaseResult("请求异常,利率或周期为空", "9999", "请求异常,利率或周期为空");
			}
			if (StringUtils.isEquals(evaluationSheetDTO.getWhetherPass(),"nopass")){
				logger.info("进入拒绝方法："+evaluationSheetDTO.getWhetherPass());
				Map<String, Object> map = applicationCapital.updateFinancing(evaluationSheetDTO);
				CompleteRequest completeRequest=new CompleteRequest();
				completeRequest.setApplyId(evaluationSheetDTO.getIndentId());
				completeRequest.setTaskKey(CarDealerApplyEnum.apply_restart.name());
				iWorkFlowServiceCSD.completeEnd(completeRequest);
				return new BaseResult(map.get("list"), (String) map.get("retCode"), (String) map.get("retMsg"));
			}
			String orderStr = iOrderServiceCSD.createOrderStr();
			evaluationSheetDTO.setOrderStr(orderStr);
				Map<String, Object> map = applicationCapital.updateFinancing(evaluationSheetDTO);
				iWorkFlowServiceCSD.startTaskBy(WorkFlowType.CarDealerLoan.getCode(), map.get("id").toString());
				return new BaseResult(map.get("list"), (String) map.get("retCode"), (String) map.get("retMsg"));
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("返回异常："+e);
			return new BaseResult(e.getMessage(), "9999", "获取失败");
		}
	}

	@RequestMapping(value = "getUpToken", method = RequestMethod.POST)
	@ApiOperation(value = "获取七牛Token", notes = "获取七牛Token")
	public BaseResult getUpToken(@ApiParam(value = "获取七牛Token", required = true) HttpServletRequest request) {
		Map<String, Object> result = new HashMap<>();
		String token = applicationCapital.getUploadToken();
		System.out.println(token + "+token");
		if (token == null) {
			result.put("retCode", "9999");
			result.put("retMsg", "获取失败");
		} else {
			result.put("upToken", token);
			result.put("retCode", "0000");
			result.put("retMsg", "获取成功");
		}
		return new BaseResult(result.get("upToken"), (String) result.get("retCode"), (String) result.get("retMsg"));
	}

	@RequestMapping(value = "getCarsokInfo",method = RequestMethod.POST)
	@ApiOperation(value = "获取车辆附件信息",notes = "获取车辆附件信息")
	public BaseResult getCarsokInfo(@RequestBody String productId ,HttpServletRequest request){
		Map<String, Object> result = new HashMap<>();
		try {
			String acount =String.valueOf(request.getAttribute("account"));
			Map<String, Object>	map =	applicationCapital.selsctCarsokInfo(JSON.parseObject(productId).getString("productId"),acount);
			result.put("data",map);
			result.put("retCode","0000");
			result.put("retMsg", "获取成功");
			return new BaseResult(result.get("data"), (String) result.get("retCode"), (String) result.get("retMsg"));
		}catch (Exception e){
            logger.error("返回异常："+e);
			result.put("retCode","9999");
			result.put("retMsg", "获取失败");
			e.printStackTrace();
			return new BaseResult("", (String) result.get("retCode"), (String) result.get("retMsg"));
		}
	}
	
}
