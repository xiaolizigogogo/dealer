package com.utonw.utonerp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.utonw.dealer.api.entity.erp.User;
import com.utonw.dealer.api.util.erp.Constants;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import com.alibaba.dubbo.config.annotation.Reference;
import com.utonw.dealer.api.dto.request.erp.LocationRequset;
import com.utonw.dealer.api.dto.request.erp.MerchantInfoTotal;
import com.utonw.dealer.api.entity.erp.DistributionUser;
import com.utonw.dealer.api.service.erp.IDistributionUserService;

@RestController
@RequestMapping("distributionUser")
public class DistributionUserController {
	@Reference(version="1.0.0")
	IDistributionUserService iDistributionUserService;
	
    /**  
    * @Title: getUserInfo  
    * @date 2017年10月9日 下午3:52:43
    * @author zhangzheng
    * @Description: 获取所有线下人员信息
    * @param @return   
    * @return List<DistributionUser> 
    */
	@RequestMapping(value = "getUserInfo", method = RequestMethod.POST)
	public List<DistributionUser> getUserInfo(@RequestBody LocationRequset locationRequset) {
		return iDistributionUserService.DistributionUser(locationRequset.getLocation());
	}

	/**  
	* @Title: setUserInfo  
	* @date 2017年10月12日 上午10:09:42
	* @author zhangzheng
	* @Description: 分配线下工作人员
	* @param @param merchantInfoRequest
	* @param @return   
	* @return String 
	*/
	@RequestMapping(value = "setUserInfo", method = RequestMethod.POST)
	public String setUserInfo(@RequestBody MerchantInfoTotal merchantInfoRequest,HttpServletRequest request) {
		 User user =(User)  request.getSession().getAttribute(Constants.AUTH_USER);
		 merchantInfoRequest.setCreateId(user.getAccountName());
		 iDistributionUserService.setUserInfo(merchantInfoRequest);
		 return "success";
	}
	
}
