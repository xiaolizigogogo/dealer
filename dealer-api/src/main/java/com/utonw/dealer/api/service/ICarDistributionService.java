package com.utonw.dealer.api.service;

import java.util.List;

import com.utonw.dealer.api.entity.MerchantApply;

public interface ICarDistributionService {
	/**  
	* @Title: getCarDistributionInfo  
	* @date 2017年10月6日 上午10:42:50
	* @author zhangzheng
	* @Description: TODO
	* @param @return   
	* @return List<MerchantApply> 
	*/
	public List<MerchantApply> getCarDistributionInfo(String merchantname,String province,String city,String district);
}
