package com.utonw.buyer.controller;

import com.alibaba.fastjson.JSON;
import com.utonw.dealer.api.dto.ApplyVerifyDTO;
import com.utonw.dealer.api.dto.CompanyDetailsDTO;
import com.utonw.dealer.api.dto.TrialReivewDTO;
import com.utonw.dealer.api.dto.request.MerchantLoanAplRequest;
import com.utonw.dealer.api.entity.CompleteRequest;
import com.utonw.dealer.api.model.BaseResult;
import com.utonw.dealer.api.service.IMerchantAplVerifyService;
import com.utonw.dealer.api.service.IWorkFlowServiceCSD;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.alibaba.dubbo.config.annotation.Reference;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * Created by WANGYJ on 2017/5/8.
 */
@RestController
@RequestMapping("check")
@Api(value = "check",description = "车商贷资质/贷款审批状况")
public class ApplyVerifyController {
    private static final Logger logger = LoggerFactory.getLogger("ApplyVerifyController.class");
    @Reference(version="1.0.0",timeout = 1500000)
    IMerchantAplVerifyService merchantAplVerifyService;

 @Reference(version = "1.0.0",timeout = 1500000)
    IWorkFlowServiceCSD workFlowServiceCSD;

    @Reference(version = "1.0.0",timeout = 1500000)
    IWorkFlowServiceCSD iWorkFlowServiceCSD;
    @RequestMapping(value = "updatemerchant",method = RequestMethod.POST)
    @ApiOperation(value = "线下人员-更新车商配资资格申请信息")
    @ApiImplicitParam(name = "applyVerifyDTO", value = "车商申请及确认信息", required = true, dataType = "ApplyVerifyDTO")
    public BaseResult updatemerchant(@RequestBody ApplyVerifyDTO applyVerifyDTO, HttpServletRequest request) {
    CompleteRequest completeRequest = new CompleteRequest();
        completeRequest.setApplyId(applyVerifyDTO.getApplyMoneyDTO().getApplyId());
        completeRequest.setTaskId(applyVerifyDTO.getApplyMoneyDTO().getTaskId());
        completeRequest.setUserUuid(String.valueOf(request.getAttribute("account")));
        completeRequest.setTaskKey(applyVerifyDTO.getApplyMoneyDTO().getTaskKey());
        boolean   complete  =   iWorkFlowServiceCSD.complete(completeRequest);
        if (complete == true) {
        try{
            Map<String,Object>map = merchantAplVerifyService.updateMerchantAplVerify(applyVerifyDTO);
            return new BaseResult(null, (String) map.get("retCode"), (String) map.get("retMsg"));
       }catch (Exception e){
            logger.error(e.toString());
            return new BaseResult(null, "9999", "提交失败");
       }
    }else {
           return new BaseResult(null, "9999", "提交失败");
        }
    }

    @RequestMapping(value = "trialReview",method = RequestMethod.POST)
    @ApiOperation(value = "车商贷订单初审")
    @ApiImplicitParam(name = "trialReivewDTO", value = "车商贷申请初始结果", required = true, dataType = "TrialReivewDTO")
    public BaseResult submitMerchantInfoReview(@RequestBody TrialReivewDTO trialReivewDTO) {
        Map<String,Object>map = merchantAplVerifyService.submitOrderTrialReview(trialReivewDTO);
       //如果返回结果正确则进行工作流开启
     /*  if(((String)map.get("retCode")).equals("0000")){
            //其中applyid是订单的UUID
            int result = workFlowServiceCSD.startTaskBy(1,trialReivewDTO.getApplyid());
           if(result == -1){
                logger.debug("创建工作流失败，请确认。");
            }
        }*/
        return new BaseResult(null,(String)map.get("retCode"),(String)map.get("retMsg"));
    }

    @RequestMapping(value = "getMerchantAplInfo",method = RequestMethod.POST)
    @ApiOperation(value = "车商贷申请信息")
    @ApiImplicitParam(name = "merchantLoanAplRequest", value = "车商贷申请初始结果", required = true, dataType = "MerchantLoanAplRequest")
    public BaseResult queryMerchantAplInfo(@RequestBody MerchantLoanAplRequest merchantLoanAplRequest) {
        Map<String,Object>map = merchantAplVerifyService.getMerchantInfoByIndentId(merchantLoanAplRequest);
        return new BaseResult(map.get("data"),(String)map.get("retCode"),(String)map.get("retMsg"));
    }

    @RequestMapping(value = "queryCompanyDetails",method = RequestMethod.POST)
    @ApiOperation(value = "根据商户ID/订单ID获取公司详情")
    @ApiImplicitParam(name = "companyDetailsDTO", value = "公司详情", required = true, dataType = "CompanyDetailsDTO")
    public BaseResult queryCompanyDetails(@RequestBody CompanyDetailsDTO companyDetailsDTO) {
        Map<String,Object> result =  merchantAplVerifyService.queryCompanyDetails(companyDetailsDTO);
        return new BaseResult(result,"0000","成功");
    }
    @RequestMapping(value = "queryCarDetails",method = RequestMethod.POST)
    @ApiOperation(value = "根据车ID/获取车辆详情")
    public BaseResult queryCarDetails(@ApiParam(value = "车ID", required = true)@RequestBody String productId ) {
        Map<String,Object> result =  merchantAplVerifyService.queryCarDetails(JSON.parseObject(productId).getString("productId"));
        return  new BaseResult(result,"0000","成功");
    }

}
