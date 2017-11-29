package com.utonw.dealer.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import com.utonw.dealer.api.service.CarsokAcountGetIdService;
import com.utonw.dealer.mapper.CarsokAcountMapper;

@Service(version = "1.0.0")
public class CarsokAcountGetIdServiceImpl implements CarsokAcountGetIdService {
	@Autowired
	CarsokAcountMapper carsokAcountMapper;

	@Override
	public String getIdByAccount(String accountId) {
		return carsokAcountMapper.getIdByAccount(accountId);
	}

}
