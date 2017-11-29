package com.utonw.utonerp.service;

import java.util.ArrayList;
import java.util.List;

import com.alibaba.dubbo.config.annotation.Reference;
import com.utonw.dealer.api.entity.erp.UserDistributionInfo;
import com.utonw.utonerp.mapper.TDistributionRfidListMapper;
import org.springframework.beans.factory.annotation.Autowired;
import com.alibaba.dubbo.config.annotation.Service;
import com.utonw.dealer.api.dto.request.erp.CarDistributionRequest;
import com.utonw.dealer.api.entity.MerchantApply;
import com.utonw.dealer.api.service.CarsokAcountGetIdService;
import com.utonw.dealer.api.service.ICarDistributionService;
import com.utonw.dealer.api.service.erp.IUserDistributionService;
@Service(version="1.0.0")
public class IUserDistributionServiceImpl implements IUserDistributionService {
	@Reference(version = "1.0.0",check = false)
	ICarDistributionService iCarDistributionService;

	@Autowired
	TDistributionRfidListMapper tDistributionRfidListMapper;

	@Reference(version = "1.0.0",check = false)
	CarsokAcountGetIdService carsokAcountGetIdService;

	@Override
	public List<UserDistributionInfo> userDistributionInfo(CarDistributionRequest carDistributionRequest) {
		// TODO Auto-generated method stub
		List<UserDistributionInfo> UserDistributionInfoList = new ArrayList<UserDistributionInfo>();
		int index=0;
		String[] location=carDistributionRequest.getSelCity().split("/");
		for(String value:location) {
			if(index==0) {
				if(!value.equals("")) {
					carDistributionRequest.setProvince(value);
				}
			}
			if(index==1) {
				if(!value.equals("")) {
					if(value.equals("北京市市辖区")) {
						value="北京市";
					}
					carDistributionRequest.setCity(value);
				}
			}
			if(index==2) {
				if(!value.equals("")) {
					carDistributionRequest.setDistrict(value);
				}
			}
			index++;
			
		}
		

		List<MerchantApply> merchantApplyList = iCarDistributionService.getCarDistributionInfo(
				carDistributionRequest.getMerchantName(), carDistributionRequest.getProvince(),
				carDistributionRequest.getCity(), carDistributionRequest.getDistrict());
		for(MerchantApply merchantApply:merchantApplyList) {
			/*将long类型的值转成int类型*/
			UserDistributionInfo userDistributionInfo =new UserDistributionInfo();
			if(tDistributionRfidListMapper.selectNullInfo(Integer.parseInt(carsokAcountGetIdService.getIdByAccount(merchantApply.getAcountid().toString()))).size()==0)
			{
				
				userDistributionInfo.setLocation(merchantApply.getProvince()+merchantApply.getCity()+merchantApply.getDistrict());
				userDistributionInfo.setLocationNotSplit(merchantApply.getProvince()+"/"+merchantApply.getCity()+"/"+merchantApply.getDistrict());
				userDistributionInfo.setMerchantName(merchantApply.getMerchantname());
				userDistributionInfo.setMerchantPhone(merchantApply.getAcountid().toString());
				userDistributionInfo.setRepertoryNumber(merchantApply.getRepertorynumber());
				userDistributionInfo.setAcountid(merchantApply.getAcountid().toString());
				UserDistributionInfoList.add(userDistributionInfo);
			}
		}/*获取总条数,集合分页*/
		if(UserDistributionInfoList.size()>0) {
		UserDistributionInfoList.get(0).setTotal(UserDistributionInfoList.size());
		if((carDistributionRequest.getPageNum()-1) * carDistributionRequest.getPageSize()
				+ carDistributionRequest.getPageSize()>UserDistributionInfoList.size()) 
		{
			List<UserDistributionInfo> UserbackInfo=UserDistributionInfoList.subList(
				(carDistributionRequest.getPageNum()-1) * carDistributionRequest.getPageSize(),
				UserDistributionInfoList.size()
				);
			if(UserbackInfo.size()>0) {
				UserbackInfo.get(0).setTotal(UserDistributionInfoList.size());
			}
			return UserbackInfo;
//			return UserDistributionInfoList.subList(
//					(carDistributionRequest.getPageNum()-1) * carDistributionRequest.getPageSize(),
//					UserDistributionInfoList.size()
//					);
		}
		else {
			List<UserDistributionInfo> Userback=UserDistributionInfoList.subList(
					(carDistributionRequest.getPageNum()-1) * carDistributionRequest.getPageSize(),
					(carDistributionRequest.getPageNum()-1) * carDistributionRequest.getPageSize()
							+ carDistributionRequest.getPageSize()
							);
			if(Userback.size()>0) {
				Userback.get(0).setTotal(UserDistributionInfoList.size());
			}
		return Userback;
		}
		}
		else {
			UserDistributionInfo userDistributionInfo =new UserDistributionInfo();
			userDistributionInfo.setTotal(0);
			UserDistributionInfoList.add(userDistributionInfo);
			return UserDistributionInfoList;
		}
		
	}

}
