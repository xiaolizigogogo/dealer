package com.utonw.utonerp.service;

import java.util.List;

import com.utonw.utonerp.mapper.TDistributionRfidMapper;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.dubbo.config.annotation.Service;
import com.utonw.dealer.api.vo.TDistributionRfidVo;
import com.utonw.dealer.api.service.erp.IRfidMerchantIdsService;


@Service(version = "1.0.0")
public class RfidMerchantIdsServiceImpl implements IRfidMerchantIdsService {

	@Autowired
	TDistributionRfidMapper tDistributionRfidMapper;
	
	/**
	 * 查询所有数据状态有效的车商id
	 */
	@Override
	public List<TDistributionRfidVo> showAllDealId() {
		
		return tDistributionRfidMapper.showStatusIsOKAll();
	}

}
