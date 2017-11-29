package com.utonw.buyer.controller;

import com.alibaba.dubbo.common.json.JSONObject;
import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSON;
import com.utonw.dealer.api.dto.CarMessageDTO;
import com.utonw.dealer.api.dto.request.CarMessageRequest;
import com.utonw.dealer.api.entity.MerchantIndent;
import com.utonw.dealer.api.entity.workflowtask;

import com.utonw.dealer.api.model.BaseResult;
import com.utonw.dealer.api.service.ICarService;
import com.utonw.dealer.api.service.ILoanServiceCSD;
import com.utonw.dealer.api.service.IWorkFlowServiceCSD;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by SEELE on 2017/5/10.
 */
@RestController
@RequestMapping("carMessage")
@Api(value = "carMessage", description = "车商贷-车辆列表 API")
public class CarsControllr {
    private static final Logger logger = LoggerFactory.getLogger("ApplyVerifyController.class");
    @Value("${carsokApi}")
    private String carsokApi;
    @Reference(version = "1.0.0", timeout = 1500000)
    ICarService carService;
    @Reference(version = "1.0.0", timeout = 1500000)
    ILoanServiceCSD loanserviceCSD;
    @Reference(version = "1.0.0", timeout = 1500000)
    IWorkFlowServiceCSD iWorkFlowServiceCSD;

    @RequestMapping(value = "getCarMessage", method = RequestMethod.POST)
    @ApiOperation(value = "车辆列表", notes = "车辆列表")
    public BaseResult getCarMessage(@ApiParam(value = "车辆列表DTO", required = true) @RequestBody() CarMessageRequest carMessageRequest
            , HttpServletRequest request) {
        Map<String, Object> result = new HashMap<>();
        String acountId = String.valueOf(request.getAttribute("account"));
        int pageNum = carMessageRequest.getPageNum();
        int pageSize = carMessageRequest.getPageSize();
        String indentState = carMessageRequest.getIndentState();
        String productName = carMessageRequest.getProductName();
        List<MerchantIndent> indent = carService.getIndentId(acountId);
        Map<String, Object> map = new HashMap<>();
        for (MerchantIndent merchantIndent : indent) {
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date currentDate = new Date();
         if (merchantIndent.getOutAccountTime()!= null){
                 String loanDays = convertCurrentTime(df.format(currentDate), df.format(merchantIndent.getOutAccountTime()));
                 map.put(merchantIndent.getId(), loanDays);

         }
        }
        List<String> indentID = new ArrayList<>();
        for (MerchantIndent merchantIndent : indent) {
            indentID.add(merchantIndent.getId());
        }
        List<workflowtask> list = null;
        if (indentID != null && indentID.size() > 0) {
            list = iWorkFlowServiceCSD.queryWorkflowtask(indentID);
        }
        result = carService.getCarMessage(acountId, pageNum, pageSize, indentState, productName, list);
        List<CarMessageDTO> carList = (List<CarMessageDTO>) result.get("list");
        for (CarMessageDTO carlist1 : carList) {
            if (map.get(carlist1.getId()) != null) {
                carlist1.setLoanDays(map.get(carlist1.getId()).toString());
            }
        }
        return new BaseResult(result.get("list"), (String) result.get("retCode"), (String) result.get("retMsg"));
    }

    @RequestMapping(value = "getCarCapital", method = RequestMethod.POST)
    @ApiOperation(value = "单车配资相关详情", notes = "单车配资相关详情")
    public BaseResult getCarCapital(@RequestBody String productId) {
        Map<String, Object> result = carService.getCarCapital(JSON.parseObject(productId).getString("productId"));
        return new BaseResult(result, "0000", "成功");
    }


    @RequestMapping(value = "getCarSum", method = RequestMethod.POST)
    @ApiOperation(value = "配资列表车辆总数", notes = "配资列表车辆总数")
    public BaseResult getCarSum(HttpServletRequest request) {
        Map<String, Object> result = carService.getCarSum(String.valueOf(request.getAttribute("account")));
        return new BaseResult(result.get("listing"), "0000", "成功");
    }

    public static String convertCurrentTime(String currentDate, String apply_date) {

        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date d1 = null;
        Date d2 = null;
        try {
            d1 = df.parse(currentDate);
            d2 = df.parse(apply_date);
            long diff = d1.getTime() - d2.getTime();//这样得到的差值是微秒级别
            long days = diff / (1000 * 60 * 60 * 24);
            long hours = (diff - days * (1000 * 60 * 60 * 24)) / (1000 * 60 * 60);
            long minutes = (diff - days * (1000 * 60 * 60 * 24) - hours * (1000 * 60 * 60)) / (1000 * 60);

            if (days > 0) {
                if (days >= 7) {
                    return "一周前";
                } else {
                    return days + "天前";
                }
            } else if (hours > 0) {
                return hours + "小时前";
            } else if (minutes > 0) {
                return minutes + "分钟前";
            } else {
                return "刚刚";
            }

        } catch (Exception e) {
            return "未知";
        }

    }

    @RequestMapping(value = "getCarDetails", method = RequestMethod.POST)
    public BaseResult getCarDetails(HttpServletRequest request,@RequestBody String productNo) {
        if(productNo.length() <= Integer.valueOf(0) || productNo == null){
           return new BaseResult("ProductId IS NULL","9999","车辆编号为空");
        }
        Map param = new HashMap();
        param.put("productId", JSON.parseObject(productNo).getString("productNo"));
        Map result = carService.carDetail(param);
        return new BaseResult(result ,result.get("success").toString(),result.get("msg").toString());
    }
}
