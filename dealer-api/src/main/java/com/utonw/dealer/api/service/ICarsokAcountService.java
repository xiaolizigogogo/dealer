package com.utonw.dealer.api.service;


import com.github.pagehelper.PageInfo;
import com.utonw.dealer.api.dto.request.CarsokAcountRequest;
import com.utonw.dealer.api.dto.request.MerchantInfoRequest;
import com.utonw.dealer.api.entity.CarsokAcount;
import com.utonw.dealer.api.entity.CarsokAcountDTO;
import com.utonw.dealer.api.entity.MerchantDataDTO;

public interface ICarsokAcountService {
	
	public PageInfo<CarsokAcountDTO> selectAcountInfoByWhere(CarsokAcountRequest carsokAcountRequest) throws Exception;
	
	CarsokAcount  selectCarsokInfo(Integer carDealerId);
	
	public PageInfo<MerchantDataDTO> selectMerchantData(MerchantInfoRequest merchantInfoRequest) throws Exception;

}
