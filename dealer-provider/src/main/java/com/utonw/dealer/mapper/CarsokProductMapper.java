package com.utonw.dealer.mapper;


import java.util.Map;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.utonw.dealer.api.dto.CarsokProductDTO;

import com.utonw.dealer.api.dto.DealerCarDetailDTO;

import com.utonw.dealer.api.dto.RfidCarsProductInfoDTO;

import com.utonw.dealer.api.entity.CarsokProduct;

/**
 * <p>
 * Mapper接口
 * </p>
 *
 * @author wangyj
 * @since 2017-05-17
 */
public interface CarsokProductMapper extends BaseMapper<CarsokProduct> {
	
	CarsokProductDTO getAgreement(Map<String, Object> map);
	DealerCarDetailDTO selectDealerCarDetail(Integer carId);
	RfidCarsProductInfoDTO showProductInfoByCarId(Integer carId);

}