package com.utonw.dealer.service.impl;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.dubbo.config.annotation.Service;
import com.utonw.dealer.api.dto.RfidCarsProductInfoDTO;
import com.utonw.dealer.api.service.IRfidCarsProductInfoService;
import com.utonw.dealer.mapper.CarsokProductMapper;
import com.utonw.util.LoggerUtil;


@Service(version = "0.1.0")
public class RfidCarsProductInfoServiceImpl implements IRfidCarsProductInfoService {

	protected static final Logger LOG = LoggerUtil.getLogger(RfidCarsProductInfoServiceImpl.class);
	
	@Autowired
	CarsokProductMapper carsokProductMapper;
	
	@Override
	public RfidCarsProductInfoDTO showInfo(Integer carId) {
		
		return carsokProductMapper.showProductInfoByCarId(carId);
	}

}
