package com.utonw.dealer.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import com.alibaba.dubbo.config.annotation.Service;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.utonw.dealer.api.entity.CarsokProduct;
import com.utonw.dealer.api.service.CarsokProductListService;
import com.utonw.dealer.mapper.CarsokProductCheckMapper;

@Service(version="1.0.0",timeout = 1500000)
public class CarsokProductListServiceImpl implements CarsokProductListService {
    @Autowired
    CarsokProductCheckMapper carsokProductCheckMapper;
	@Override
	public Integer selectcarProduct(List<Integer> CarRfid) {
		// TODO Auto-generated method stub
		//获取在售上架未删除车辆信息的数量
		int carTotalNum=0;
		if(CarRfid.size()!=0)
		{
		carTotalNum =carsokProductCheckMapper.selectCount(new EntityWrapper<CarsokProduct>().eq("sale_status", 0)
				.eq("is_del", 0)
				.eq("on_shelf_status", 1).in("id",CarRfid)
				);
		}
		return carTotalNum;
	}

}
