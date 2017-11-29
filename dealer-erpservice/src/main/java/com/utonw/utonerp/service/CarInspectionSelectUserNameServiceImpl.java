package com.utonw.utonerp.service;

import com.utonw.utonerp.mapper.CarInspectionUserMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.dubbo.config.annotation.Service;
import com.utonw.dealer.api.entity.erp.CarInspectionEntity;
import com.utonw.dealer.api.service.erp.CarInspectionSelectUserNameService;


/**
 * Created by WANGYJ on 2017/5/11.
 */
@Transactional
@Service(version = "1.0.0")
public class CarInspectionSelectUserNameServiceImpl implements CarInspectionSelectUserNameService {
	public Logger logger = LoggerFactory.getLogger(CarInspectionSelectUserNameServiceImpl.class);

	@Autowired
	private CarInspectionUserMapper carInspectionUserMapper;

	@Override
	public String selectUserNameById(int id) {	
		String selectResult;
		CarInspectionEntity cie = carInspectionUserMapper.selectUserNameById(id);
		if(cie==null){
			selectResult = "noUserRecord";
		}else{
			selectResult = cie.getRealname();
		}
		return selectResult;
	}



	

}
