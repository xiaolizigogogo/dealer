package com.utonw.utonerp.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.utonw.dealer.api.entity.TDistributionRfidEntity;
import com.utonw.dealer.api.service.TDistributionRfidService;
import com.utonw.utonerp.mapper.TDistributionRfidListMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
@Service(version="1.0.0",timeout = 1500000)
@Transactional
public class TDistributionRfidServiceImpl implements TDistributionRfidService{
	@Autowired
	TDistributionRfidListMapper tDistributionRfidMapper;
	@Override
	public List<Integer> selectTDistributionRfid(String UserId) {
		// TODO Auto-generated method stub
		List<TDistributionRfidEntity> tDistributionRfidList =
				tDistributionRfidMapper.selectByUserId(UserId);
		/* 将有效的userId名下的dealerId(车行Id取出)*/
		List<Integer> dealerIdList = new ArrayList<Integer>();
		for(TDistributionRfidEntity tDistributionRfid:tDistributionRfidList) {
			dealerIdList.add(tDistributionRfid.getDealerId());
		}
     return dealerIdList;
	}

}
