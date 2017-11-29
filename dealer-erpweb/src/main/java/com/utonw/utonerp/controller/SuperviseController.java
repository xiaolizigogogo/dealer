package com.utonw.utonerp.controller;


import com.alibaba.dubbo.config.annotation.Reference;
import com.utonw.dealer.api.dto.request.CustomerListRequest;
import com.utonw.dealer.api.service.IERPCustomerList;
import com.utonw.dealer.api.service.IOrderService;
import com.utonw.utonbase.core.erpcommon.utils.SpringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;


/**
 * Created by SEELE on 2017/8/8.
 */
@Controller
@RequestMapping("/supervise")
public class SuperviseController {
    @Reference(version = "1.0.0")
    private IOrderService iOrderService;
    @Reference(version = "1.0.0")
    private IERPCustomerList iERPCustomerList;
    @RequestMapping("/supervisionsList")
    @ResponseBody
    public Object selectSupervisions(HttpServletRequest request,@RequestBody CustomerListRequest param){
        Map<String, Object> resultMap = new HashMap<String, Object>();
        try {
            resultMap = iOrderService.selectSupervision(param);
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }
    @RequestMapping("/merchantInfo")
    public void merchantInfo(HttpServletRequest request, HttpServletResponse response,@RequestBody CustomerListRequest param) {
        String accountId = param.getAccountId();
        Map<String, Object> resultMap = new HashMap<String, Object>();
        Map<String, Object> result = new HashMap<String, Object>();
        resultMap = iERPCustomerList.selectCustomerInfo(accountId);
        result=iOrderService.selectIndentCar(param);
        resultMap.put("supervisions",result.get("supervision"));
        resultMap.put("sum",result.get("sum"));
        SpringUtils.renderJson(response, resultMap);
    }
    @RequestMapping("/getsuperviseInfo")
    public void getsuperviseInfo(HttpServletRequest request, HttpServletResponse response,@RequestBody CustomerListRequest param) {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap =iOrderService.getsuperviseInfo(param);
        SpringUtils.renderJson(response, resultMap);
    }

    @RequestMapping("/getFinalPosition")
    public void getFinalPosition(HttpServletRequest request, HttpServletResponse response,@RequestBody CustomerListRequest param) {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap =iOrderService.getFinalPosition(param);
        SpringUtils.renderJson(response, resultMap);
    }
}
