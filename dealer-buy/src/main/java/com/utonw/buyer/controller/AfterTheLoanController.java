package com.utonw.buyer.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.utonw.dealer.api.entity.RepaymentPlanVo;
import com.utonw.dealer.api.enums.WorkFlowType;
import com.utonw.dealer.api.model.BaseResult;
import com.utonw.dealer.api.service.IIndentService;
import com.utonw.dealer.api.service.ILoanServiceCSD;
import com.utonw.dealer.api.service.IWorkFlowServiceCSD;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by SEELE on 2017/8/1.
 */
@RestController
@RequestMapping("afterLoan")
@Api(value = "afterLoan", description = "贷后 API")
public class AfterTheLoanController {
    private Logger logger = LoggerFactory.getLogger(AfterTheLoanController.class);
    @Reference(version = "1.0.0", timeout = 1500000)
    ILoanServiceCSD iLoanServiceCSD;
    @Reference(version="1.0.0",timeout = 1500000)
    IWorkFlowServiceCSD workFlowServiceCSD;
    @Reference(version = "1.0.0",timeout = 150000)
    IIndentService  iIndentService;
    /**
     * 获取还款信息
     *
     * @param
     * @return
     */
    @RequestMapping(value = "queryRepaymentPlan", method = RequestMethod.GET)
    @ApiOperation(value = "获取还款信息", notes = "获取还款信息")
    public BaseResult queryRepaymentPlan(@ApiParam(value = "获取还款信息", required = true)String orderId,HttpServletRequest request){
        Map<String,Object> map = new HashMap<>();
        try {
        RepaymentPlanVo repaymentPlanDTO = new RepaymentPlanVo();
        repaymentPlanDTO =  iLoanServiceCSD.selectRepaymentPlan(orderId,String.valueOf(request.getAttribute("accout")));
        map.put("repaymentPlan",repaymentPlanDTO);
        map.put("retCode","0000");
        map.put("retMsg","成功");
        return new BaseResult(map.get("repaymentPlan"),(String)map.get("retCode"),(String)map.get("retMsg"));
        }catch (Exception e) {
            logger.error("通知中发现异常StationErrorCodeException", e);
            map.put("repaymentPlan","");
            map.put("retCode","9999");
            map.put("retMsg","失败");
            return new BaseResult(map.get("repaymentPlan"),(String)map.get("retCode"),(String)map.get("retMsg"));
        }

    }

    /**
     * 开启还款工作流
     */
    @RequestMapping(value = "oppenWorkflow", method = RequestMethod.GET)
    @ApiOperation(value = "开启还款工作流", notes = "开启还款工作流")
    public BaseResult oppenWorkflow(@ApiParam(value = "开启还款工作流", required = true)String orderId) {
        Map<String,Object> map = new HashMap<>();
        try {
            map =    iIndentService.updateMerchantIndent(orderId);
            workFlowServiceCSD.startTaskBy(WorkFlowType.CarDealerRepayment.getCode(), orderId);
            return new BaseResult("",(String)map.get("retCode"),(String)map.get("retMsg"));
        }catch (Exception e){
            logger.error("通知中发现异常StationErrorCodeException", e);
            map.put("retCode","9999");
            map.put("retMsg","失败");
            return new BaseResult("",(String)map.get("retCode"),(String)map.get("retMsg"));
        }
    }
    
}
