package com.utonw.dealer.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.dubbo.config.annotation.Service;
import com.utonw.dealer.api.dto.DealerCarDetailDTO;
import com.utonw.dealer.api.service.CarsokProductService;
import com.utonw.dealer.mapper.CarsokProductMapper;
@Service(version = "1.0.0")
public class CarsokProductServiceImpl implements CarsokProductService{
	@Autowired
	private CarsokProductMapper carsokProductMapper;
	@Override
	public DealerCarDetailDTO selectDealerCarDetail(Integer carId) {
		return carsokProductMapper.selectDealerCarDetail(carId);
	}

}
