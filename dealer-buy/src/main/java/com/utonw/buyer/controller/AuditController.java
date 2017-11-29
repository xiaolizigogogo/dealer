package com.utonw.buyer.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSON;
import com.utonw.buyer.base.controller.BaseController;
import com.utonw.buyer.interceptor.LoginInterceptor;
import com.utonw.dealer.api.dto.AuditContractDTO;
import com.utonw.dealer.api.model.BaseResult;
import com.utonw.dealer.api.service.IAuditService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

import java.util.HashMap;
import java.util.Map;


/**
 *  车商代办理 API
 * Created by SEELE on 2017/4/21.
 */
@RestController
@RequestMapping("auditContract")
@Api(value = "auditContract",description = "车商代办理 API")
public class AuditController extends BaseController {
    private Logger logger= LoggerFactory.getLogger(LoginInterceptor.class);
    @Reference(version="1.0.0",timeout = 1500000)
    IAuditService auditService;

    /**
     *
     * @param acountId
     * @return
     */
    @RequestMapping(value = "/getAudit", method = RequestMethod.POST)
    @ApiOperation(value="车商代办理", notes="车商代办理")
    public Map<String,Object> getAudit(@ApiParam(value = "商户ID", required = true)@RequestBody String acountId,HttpServletRequest request){
        String id = "null";
        if (!JSON.parseObject(acountId).getString("acountId").equals(id)){
            return    auditService.getAudit(JSON.parseObject(acountId).getString("acountId"));
        }else {
            return auditService.getAudit(String.valueOf(request.getAttribute("account")));
        }
    }

    @RequestMapping(value = "delContract",method = RequestMethod.POST)
    @ApiOperation(value = "删除合同",notes = "删除合同")
    public BaseResult delContract(@RequestBody String id){
        Map<String,Object> result = new HashMap<>();
        try {
         auditService.delMerchantContract(JSON.parseObject(id).getString("id"));
            result.put("retCode","0000");
            result.put("retMsg","删除成功");
            return new BaseResult(null,(String)result.get("retCode"),(String)result.get("retMsg"));
        }catch (Exception e){
           e.printStackTrace();
            result.put("retCode","9999");
            result.put("retMsg","删除失败");
            return new BaseResult(null,(String)result.get("retCode"),(String)result.get("retMsg"));
        }
    }

    @RequestMapping(value = "/queryAudit", method = RequestMethod.POST)
    @ApiOperation(value="上传监控图片", notes="上传监控图片")
    public BaseResult queryAuditContract(@RequestBody AuditContractDTO auditContractDTO){
        Map<String,Object> result = auditService.queryAuditContract(auditContractDTO);
        return new BaseResult(null,(String)result.get("retCode"),(String)result.get("retMsg"));

    }
    
    @RequestMapping(value = "/getAgreement", method = RequestMethod.POST)
    @ApiOperation(value="获取签订合同", notes="获取签订合同")
    public BaseResult getAgreement(@RequestBody Map<String, String> map){
        Map<String,Object> result = auditService.getAgreement(map.get("pruductId"), map.get("acountId"));
        return new BaseResult(result.get("carsokProductDTO"),(String)result.get("retCode"),(String)result.get("retMsg"));
    }

    @RequestMapping(value = "/deleteAgreement", method = RequestMethod.POST)
    @ApiOperation(value="删除签订合同", notes="删除签订合同")
    public BaseResult deleteAgreement(@RequestBody String contractId){
        Map<String,Object> result = auditService.deleteAgreement(JSON.parseObject(contractId).getString("contractId"));
        return new BaseResult("",(String)result.get("retCode"),(String)result.get("retMsg"));
    }

}
