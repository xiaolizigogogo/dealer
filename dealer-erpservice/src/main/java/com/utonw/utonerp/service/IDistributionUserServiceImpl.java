package com.utonw.utonerp.service;

import java.util.Date;
import java.util.List;

import com.alibaba.dubbo.config.annotation.Reference;
import com.utonw.utonerp.mapper.DistributionUserMapper;
import com.utonw.utonerp.mapper.TDistributionRfidMapper;
import com.utonw.utonerp.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.dubbo.config.annotation.Service;
import com.utonw.dealer.api.service.CarsokAcountGetIdService;
import com.utonw.dealer.api.service.erp.IDistributionUserService;
import com.utonw.dealer.api.dto.request.erp.MerchantInfoTotal;
import com.utonw.dealer.api.entity.erp.DistributionUser;
import com.utonw.dealer.api.entity.erp.MerchantApplyInfoEntity;
@Service(version="1.0.0")
public class IDistributionUserServiceImpl implements IDistributionUserService {
	@Autowired
	DistributionUserMapper distributionUserMapper;
	@Autowired
	UserMapper userMapper;
	@Autowired
	TDistributionRfidMapper tDistributionRfidMapper;

	@Reference(version = "1.0.0",check = false)
	CarsokAcountGetIdService carsokAcountGetIdService;

	@Override
	public List<DistributionUser> DistributionUser(String locationNotSplit) {
		// TODO Auto-generated method stub
		String[] location=locationNotSplit.split("/");
		int index=0;
		String province = null;
		String city=null;
		String district=null;
		for(String value:location) {
			if(index==0) {
				if(!value.equals("")) {
					province=value;
				}
			}
			if(index==1) {
				if(!value.equals("")) {
					if(value.equals("北京市")) {
						value="北京市市辖区";
					}
					city=value;
				}
			}
			if(index==2) {
				if(!value.equals("")) {
					district=value;
				}
			}
			index++;
			
		}
		return distributionUserMapper.selectUserName(province,city,district);
	}

	@Override
	public void setUserInfo(MerchantInfoTotal merchantInfoRequest) {
		String userId=userMapper.selectUUID(merchantInfoRequest.getUserName());
		for(String dealerId:merchantInfoRequest.getEditArr()) {
			MerchantApplyInfoEntity merchantApplyInfoEntity=new MerchantApplyInfoEntity();
			merchantApplyInfoEntity.setCreateId(merchantInfoRequest.getCreateId());
			merchantApplyInfoEntity.setDealerId(carsokAcountGetIdService.getIdByAccount(dealerId));
			merchantApplyInfoEntity.setUserId(userId);
			merchantApplyInfoEntity.setCreateTime(new Date());
			tDistributionRfidMapper.insertByDealerId(merchantApplyInfoEntity);
		}
	}
}
