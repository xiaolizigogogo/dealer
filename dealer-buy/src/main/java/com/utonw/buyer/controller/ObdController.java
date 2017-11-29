package com.utonw.buyer.controller;

import com.alibaba.dubbo.common.utils.StringUtils;
import com.alibaba.dubbo.config.annotation.Reference;


import com.utonw.dealer.api.dto.request.TaskManageStatus;

import com.utonw.dealer.api.entity.LoanHandlerRequest;
import com.utonw.dealer.api.entity.MerchantIndent;

import com.utonw.dealer.api.enums.CarDealerRepaymentEnum;
import com.utonw.dealer.api.model.BaseResult;

import com.utonw.dealer.api.service.*;
import com.utonw.obd.api.server.IAppOBDService;
import com.utonw.obd.api.server.OBDService;

import com.utonw.obd.util.result.Response;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.List;


/**
 * Created by SEELE on 2017/8/8.
 */
@RestController
@RequestMapping("HandleObd")
public class ObdController {
    private Logger logger = LoggerFactory.getLogger(ObdController.class);
    @Reference(version="0.1.0",timeout = 15000,check = false)
    IAppOBDService iAppOBDService;
    @Reference(version="1.0.0",timeout = 1500000)
    IIndentService indentService;
    @Reference(version = "1.0.0",timeout = 1500000)
    IWorkFlowServiceCSD iWorkFlowServiceCSD;
    @Reference(version="0.1.0",timeout = 15000,check = false)
    OBDService obdService;
    @Reference(version = "1.0.0",timeout = 1500000)
    ILoanDetails loanDetails;
    @Reference(version = "1.0.0",timeout = 1500000)
    ILoanServiceCSD loanServiceCSD;
    @Reference(version = "1.0.0",timeout = 1500000)
    IuserServiceCSD iuserServiceCSD;

    @RequestMapping(value = "/updateCarObd",method = RequestMethod.GET)
    @ApiOperation(value = "绑定OBD")
    public BaseResult updateCarObd(String orderId,String dealerName, String dealerPhone,String sn,String workerAdmin,String vin) {
        try {
            MerchantIndent merchantIndent = new MerchantIndent();
            merchantIndent = indentService.selectMerchantIndent(orderId);
            if (StringUtils.isNotEmpty(merchantIndent.getSupervisetype()) && merchantIndent.getObdstate().equals("1") && merchantIndent.getSupervisetype().equals("OBD")){
                iAppOBDService.unbundlingObd(orderId, merchantIndent.getPlatenumber(),vin);
            }
            List<String> workerList = iuserServiceCSD.getUserInfo();
            Response response = iAppOBDService.bundlingCarObd(orderId,dealerName,dealerPhone, merchantIndent.getPlatenumber(),sn,vin,workerAdmin,workerList);
            logger.error("返回值：" + response);
            if (response.getCode().equals("1000")) {
                String  obdState ="1";
                String  supervisetype = "OBD";
                indentService.updataIndent(orderId,obdState,supervisetype);
                return new BaseResult("", "0000", "绑定成功");
            }
            return new BaseResult("", "0001", response.getMessage());
        } catch (Exception e) {
            logger.error("绑定异常：" + e);
            e.printStackTrace();
            return new BaseResult("", "9999", "系统异常");
        }
    }
    @RequestMapping(value = "/unbundlingObd",method = RequestMethod.POST)
    @ApiOperation(value = "解绑OBD")
    public BaseResult unbundlingObd(@RequestBody TaskManageStatus taskManageStatus, HttpServletRequest request) {
        try {

            MerchantIndent merchantIndent = new MerchantIndent();
            merchantIndent = indentService.selectMerchantIndent(taskManageStatus.getApplyId());
            Response response = iAppOBDService.unbundlingObd(taskManageStatus.getApplyId(), merchantIndent.getPlatenumber(),taskManageStatus.getVin());
            logger.error("返回值：" + response);
            LoanHandlerRequest loanHandlerRequest=new LoanHandlerRequest();
            loanHandlerRequest.setApprovalAmount(new BigDecimal("0"));
            loanHandlerRequest.setApprovalId(taskManageStatus.getApplyId());
            loanHandlerRequest.setApprovalLevel(taskManageStatus.getTaskKey());
            loanHandlerRequest.setApprovalStatus("pass");
            loanHandlerRequest.setApprovalConclusion("拆除");
            loanHandlerRequest.setOrderId(taskManageStatus.getApplyId());
            loanHandlerRequest.setTaskId(taskManageStatus.getTaskId());
            loanServiceCSD.reviewApprovalStatus(loanHandlerRequest);
            loanDetails.insertIndentStatus(taskManageStatus.getApplyId(), CarDealerRepaymentEnum.repayment_end.name(), "pass");
            String  obdState ="2";
            String  supervisetype = "OBD";
            indentService.updataIndent(taskManageStatus.getApplyId(),obdState,supervisetype);
         return new BaseResult("", "0000", "解绑成功");
        } catch (Exception e) {
            logger.error("绑定异常：" + e);
            e.printStackTrace();
            return new BaseResult("", "9999", "系统异常");
        }
    }
    @RequestMapping(value = "/getProductInfo",method = RequestMethod.GET)
    @ApiOperation(value = "校验Sn码")
    public BaseResult getProductInfo(String orderId){
            MerchantIndent merchantIndent = new MerchantIndent();
            merchantIndent = indentService.selectMerchantIndent(orderId);
            Response response = obdService.getProductInfo(merchantIndent.getPlatenumber());
            if (response.getCode().equals("1000") && response.getData()!=null){
                return new BaseResult(response.getData(), "0000", "校验成功");
            }
            if (response.getData()==null){
                return new BaseResult("", "0001", "校验失败");
            }
           return new BaseResult(response.getData(), response.getCode(), response.getMessage());
    }
    }
