package com.utonw.dealer.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.dubbo.config.annotation.Service;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.utonw.dealer.api.entity.MerchantApply;
import com.utonw.dealer.api.service.ICarDistributionService;
import com.utonw.dealer.mapper.MerchantApplyMapper;
@Service(version="1.0.0")
public class CarDistributionServiceImpl implements ICarDistributionService {
	@Autowired
	MerchantApplyMapper merchantApplyMapper;
	
	@Override
	public List<MerchantApply> getCarDistributionInfo(String merchantname, String province, String city,
			String district) {
		// TODO Auto-generated method stub
		EntityWrapper<MerchantApply> Ew = new EntityWrapper<MerchantApply>();
		/*获取reviewStatus审核通过的信息，1代表已通过*/
		Ew.eq("reviewStatus", 1);
		if(!merchantname.equals("")) {
			Ew.eq("merchantName", merchantname);
		}
		if(!(province==null)) {
			Ew.eq("province", province);
		}
		if(!(city==null)) {
			Ew.eq("city", city);
		}
		if(!(district==null)) {
			Ew.eq("district",district);
		}
		List<MerchantApply> merchantApplyInfo =
				merchantApplyMapper.selectList(Ew);
		return merchantApplyInfo;
	}

}
