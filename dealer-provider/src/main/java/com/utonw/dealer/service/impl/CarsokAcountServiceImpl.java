package com.utonw.dealer.service.impl;


import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.dubbo.config.annotation.Service;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.utonw.dealer.api.dto.request.CarsokAcountRequest;
import com.utonw.dealer.api.dto.request.MerchantInfoRequest;
import com.utonw.dealer.api.entity.CarsokAcount;
import com.utonw.dealer.api.entity.CarsokAcountDTO;
import com.utonw.dealer.api.entity.MerchantDataDTO;
import com.utonw.dealer.api.service.ICarsokAcountService;
import com.utonw.dealer.mapper.CarsokAcountMapper;


@Service(version = "1.0.0")
public class CarsokAcountServiceImpl implements ICarsokAcountService {
	
	@Autowired
	CarsokAcountMapper carsokAcountMapper;
	
	/**
	 * 检索分页查询车行信息
	 */
	@Override
	public PageInfo<CarsokAcountDTO> selectAcountInfoByWhere(CarsokAcountRequest carsokAcountRequest) throws Exception {
		
		if(carsokAcountRequest.getPageNum() == null || carsokAcountRequest.getPageSize() == null) {
			PageHelper.startPage(1 , 0);
		}else {
			PageHelper.startPage(carsokAcountRequest.getPageNum(), carsokAcountRequest.getPageSize());
		}
		Page<CarsokAcountDTO> datas = 
				carsokAcountMapper.selectAcountInfoByWhere(carsokAcountRequest.getAcountName() , carsokAcountRequest.getAcountMobile());
		if(datas != null) {
			return datas.toPageInfo();
		}
		return null;
	}

	@Override
	public CarsokAcount selectCarsokInfo(Integer carDealerId) {
		CarsokAcount carsokAcount=new CarsokAcount().
				selectOne(new EntityWrapper<CarsokAcount>().eq("id", carDealerId));
		
		return carsokAcount;
		 
	}

	/**
	 * 检索,并通过车商id以及检索条件获取车行相关信息
	 */
	@Override
	public PageInfo<MerchantDataDTO> selectMerchantData(MerchantInfoRequest merchantInfoRequest) throws Exception {
		
		Map<String , String> params = new HashMap<>();
		params.put("acountName", merchantInfoRequest.getAcountName());
		params.put("acountMobile", merchantInfoRequest.getAcountMobile());
		String province = null;
		String city = null;
		String district = null;

		if(merchantInfoRequest.getAddress() != null 
				&& merchantInfoRequest.getAddress().split("/").length > 0 
				&& !"".equals(merchantInfoRequest.getAddress().split("/")[0])) {
			for(int i = 0 ; i < merchantInfoRequest.getAddress().split("/").length ; i++) {
				if(i == 0) {
					province = merchantInfoRequest.getAddress().split("/")[i];
					params.put("province", province);
				}
				if(i == 1) {
					city = merchantInfoRequest.getAddress().split("/")[i];
					if(city != null && city.equals("北京市市辖区")) {
						city = "北京市";
					}
					params.put("city", city);
				}
				if(i == 2) {
					district = merchantInfoRequest.getAddress().split("/")[i];
					params.put("district", district);
				}
			}
		}
		if(merchantInfoRequest.getPageNum() == null || merchantInfoRequest.getPageSize() == null) {
			PageHelper.startPage(1 , 0);
		}else {
			PageHelper.startPage(merchantInfoRequest.getPageNum(), merchantInfoRequest.getPageSize());
		}
		Page<MerchantDataDTO> datas = 
				carsokAcountMapper.selectMerchantData(params , merchantInfoRequest.getAcountIds());
		if(datas != null) {
			return datas.toPageInfo();
		}
		return null;
	}



}
