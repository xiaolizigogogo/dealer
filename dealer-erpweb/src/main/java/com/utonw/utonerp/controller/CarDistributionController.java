package com.utonw.utonerp.controller;

import java.util.List;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import com.alibaba.dubbo.config.annotation.Reference;
import com.utonw.dealer.api.dto.request.erp.CarDistributionRequest;
import com.utonw.dealer.api.entity.erp.UserDistributionInfo;
import com.utonw.dealer.api.service.erp.IUserDistributionService;

@RestController
@RequestMapping("carDistribution")
public class CarDistributionController {
	@Reference(version = "1.0.0")
	IUserDistributionService iUserDistributionService;


	/**  
	* @Title: getMerchantInfo  
	* @date 2017年10月12日 上午10:12:33
	* @author zhangzheng
	* @Description: 获得未分配线下人员的车行信息
	* @param @param carDistributionRequest
	* @param @return   
	* @return List<UserDistributionInfo> 
	*/
	@RequestMapping(value = "getMerchantInfo", method = RequestMethod.POST)
	public List<UserDistributionInfo> getMerchantInfo(@RequestBody CarDistributionRequest carDistributionRequest) {
		List<UserDistributionInfo> UserDistributionInfoList=iUserDistributionService.userDistributionInfo(carDistributionRequest);
		return UserDistributionInfoList;

	}

}
