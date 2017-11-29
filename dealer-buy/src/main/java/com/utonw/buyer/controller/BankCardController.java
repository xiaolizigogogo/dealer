package com.utonw.buyer.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.utonw.dealer.api.dto.BankCarDel;
import com.utonw.dealer.api.dto.BankCardDTO;
import com.utonw.dealer.api.entity.BankCard;
import com.utonw.dealer.api.model.BaseResult;
import com.utonw.dealer.api.service.IBankCarService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.omg.CORBA.INTERNAL;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 绑定银行卡
 * Created by SEELE on 2017/5/8.
 */
@RestController
@RequestMapping("bankCard")
@Api(value = "bankCard",description = "车商贷-绑定银行卡 API")
public class BankCardController {
    @Reference(version="1.0.0",timeout = 1500000)
    IBankCarService bankCardService;
    /**
     * 添加银行卡
     */
    @RequestMapping(value = "/addBankCard",method = RequestMethod.POST)
    @ApiOperation(value = "绑定银行卡")
    public BaseResult addBankCard(@RequestBody() BankCardDTO bankCardDTO,HttpServletRequest request){
       String account = String.valueOf(request.getAttribute("account"));
        bankCardDTO.setAcountId(String.valueOf(request.getAttribute("childAccountMobile")));
        Map<String,Object> result =   bankCardService.addBankcard(bankCardDTO,account);
        return new BaseResult(null,(String)result.get("retCode"),(String)result.get("retMsg"));
    }
    /**
     *查询银行卡信息
     */

    @RequestMapping(value = "getBankCard",method = RequestMethod.POST)
    @ApiOperation(value = "查询银行卡信息")
    public BaseResult getBankCard(@RequestBody String acountId,HttpServletRequest request){
        List<BankCard> bank =bankCardService.getBankCard(String.valueOf(request.getAttribute("account")));
        Map<String,Object> result = new HashMap<>();
        int stste = 0;
        for (int i=0;i<bank.size();i++) {
            int type = bank.get(i).getCardstate();
            if (type ==1) {
                stste=stste|type;
            }else if (type ==2){
                stste=stste|type;
            }
        }
        if (stste ==1){
            result.put("list",bank);
            result.put("retCode","0000");
            result.put("retMsg","绑定还款银行卡");
        }else if (stste==2){
            result.put("list",bank);
            result.put("retCode","0000");
            result.put("retMsg","绑定放款银行卡");
        }else {
            result.put("list",bank);
            result.put("retCode","0000");
            result.put("retMsg","成功");
        }
        return new BaseResult(result.get("list"),(String)result.get("retCode"),(String)result.get("retMsg"));
    }
        /**
         * 删除绑定银行卡
         */
        @RequestMapping(value = "/delBankCard",method = RequestMethod.POST)
        @ApiOperation(value = "删除绑定银行卡")
        public BaseResult delBankCard(@RequestBody() BankCarDel bankCarDelb,HttpServletRequest request){
            bankCarDelb.setAcountId(String.valueOf(request.getAttribute("account")));
            Map<String,Object> result =   bankCardService.delBankcard(bankCarDelb);
            return new BaseResult(result.get(""),(String)result.get("retCode"),(String)result.get("retMsg"));
        }

    /**
     * 通知erp订单完成
     */
   @RequestMapping(value = "getAccountTaskId",method = RequestMethod.POST)
   @ApiOperation(value = "获取订单ID")
   public BaseResult getAccountTaskId(HttpServletRequest request){
       Map<String,Object> result =   bankCardService.getAccountTaskId(String.valueOf(request.getAttribute("account")));
       return new BaseResult(result.get(""),(String)result.get("retCode"),(String)result.get("retMsg"));
   }
}
