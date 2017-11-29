package com.utonw.utonerp.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.utonw.dealer.api.dto.request.erp.BankCardRequest;
import com.utonw.dealer.api.service.IBankCarService;
import com.utonw.utonbase.core.erpcommon.utils.SpringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/bank")
public class BankController {

	@Reference(version = "1.0.0")
	IBankCarService bankCarService;

	@RequestMapping("/queryMerchantBankCardList")
	public void queryMerchantBankCardList(HttpServletRequest request, HttpServletResponse response, @RequestBody BankCardRequest bankCard){
		Map map = new HashMap<>();
		map.put("merchantName",bankCard.getMerchantName());
		map.put("bankName",bankCard.getBankName());
		map.put("bankNumber",bankCard.getBankNumber());
		map.put("pageNum",bankCard.getPageNum());
		map.put("pageSize",bankCard.getPageSize());
		Map result = new HashMap();
		List list = bankCarService.getMerchantBankCard(map);
		result.put("result",list);
		result.put("sum",list.size());
		SpringUtils.renderJson(response,result);
	}

}
