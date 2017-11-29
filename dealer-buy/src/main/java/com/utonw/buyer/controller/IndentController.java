package com.utonw.buyer.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.utonw.buyer.interceptor.LoginInterceptor;

import com.utonw.dealer.api.dto.request.MerchantApplyTaskRequst;
import com.utonw.dealer.api.entity.ApplyIndentRequest;

import com.utonw.dealer.api.model.BaseResult;
import com.utonw.dealer.api.service.IIndentService;
import com.utonw.dealer.api.service.IOrderServiceCSD;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;


import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * Created by SEELE on 2017/7/19.
 */
@RestController
@RequestMapping("indent")
@Api(value = "indent",description = "订单相关接口")
public class IndentController {
	
    private Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
    @Reference(version="1.0.0",timeout = 1500000)
    IOrderServiceCSD iOrderServiceCSD;
    @Reference(version="1.0.0",timeout = 1500000)
    IIndentService iIndentService;

    @RequestMapping(value = "queryIndentInfo",method = RequestMethod.POST)
    @ApiOperation(value = "添加配资相关信息")
    public BaseResult queryIndentInfo(@RequestBody MerchantApplyTaskRequst merchantApplyTaskRequst,HttpServletRequest request) {
        logger.info("进入添加配资相关信息+queryIndentInfo方法");
        int pageNum = merchantApplyTaskRequst.getPageNum();
        int pageSize = merchantApplyTaskRequst.getPageSize();
        String merchantName = merchantApplyTaskRequst.getMerchantName();
        List<ApplyIndentRequest> list = iOrderServiceCSD.createOrderList(String.valueOf(request.getAttribute("account")));
        Map<String,Object> result =  iIndentService.getCarDealerTaskByUserId(list,pageNum,pageSize,merchantName);
        return  new BaseResult(result.get("list"),(String)result.get("retCode"),(String)result.get("retMsg"));
    }
    /*@RequestMapping(value = "queryIndentTask",method = RequestMethod.POST)
    @ApiOperation(value = "查询已办任务")
    public  BaseResult queryIndentTask(@RequestBody MerchantApplyTaskRequst merchantApplyTaskRequst, HttpServletRequest request){
        int pageNum = merchantApplyTaskRequst.getPageNum();
        int pageSize = merchantApplyTaskRequst.getPageSize();
        String merchantName = merchantApplyTaskRequst.getMerchantName();
        List<CompleteTask> list = iOrderServiceCSD.queryAlreadyTask(String.valueOf(request.getAttribute("account")));
        Map<String,Object> result =  iIndentService.getIndentTask(list,pageNum,pageSize,merchantName);
        return  new BaseResult(result.get("list"),(String)result.get("retCode"),(String)result.get("retMsg"));
    }*/
    
    @RequestMapping(value = "queryRepaymentPlanInfo",method = RequestMethod.POST)
    @ApiOperation(value = "获取还款计划")
    public BaseResult queryRepaymentPlanInfo(@RequestBody String merchantIndentId) {
    	
        logger.info("获取还款计划+queryRepaymentPlanInfo方法");
        
        Map<String,Object> result = iIndentService.getRepaymentPlanInfo(merchantIndentId);
        
        return  new BaseResult(result.get("repaymentPlan"),(String)result.get("retCode"),(String)result.get("retMsg"));
    }
}
