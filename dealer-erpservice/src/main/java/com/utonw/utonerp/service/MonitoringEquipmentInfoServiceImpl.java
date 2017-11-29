package com.utonw.utonerp.service;
import java.util.Date;
import java.util.List;

import com.utonw.utonerp.mapper.MonitoringEquipmentInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import com.alibaba.dubbo.config.annotation.Service;
import com.utonw.dealer.api.entity.erp.MonitoringEquipmentInfo;
import com.utonw.dealer.api.service.erp.IMonitoringEquipmentInfoService;


@Service(version="1.0.0")
public class MonitoringEquipmentInfoServiceImpl implements IMonitoringEquipmentInfoService {

	@Autowired
	MonitoringEquipmentInfoMapper monitoringEquipmentInfoMapper;

	@Override
	public void updateById(MonitoringEquipmentInfo monitoringEquipmentInfo) {
		// TODO Auto-generated method stub
		monitoringEquipmentInfo.setUpdateTime(new Date());
		monitoringEquipmentInfoMapper.updateById(monitoringEquipmentInfo);
	}

	@Override
	public void deleteById(Integer  monitoringNum) {
		//需要循环删除
		// TODO Auto-generated method stub
		monitoringEquipmentInfoMapper.deleteById(monitoringNum);

	}

	@Override
	public void insertMonitoringEquipmentInfo(MonitoringEquipmentInfo monitoringEquipmentInfo) {
			monitoringEquipmentInfo.setCreateTime(new Date());
			monitoringEquipmentInfo.setUpdateTime(new Date());
			monitoringEquipmentInfoMapper.insertSelective(monitoringEquipmentInfo);
		
		
	}
	
	@Override
	public List<MonitoringEquipmentInfo> showInfoBymerchantId(String merchantId) throws Exception{
		
		if(merchantId == null || merchantId.equals("")) {
			throw new RuntimeException("车商标识为空");
		}
		return monitoringEquipmentInfoMapper.selectInfoBymerchantId(merchantId);
	}

	@Override
	public Integer showNumberByMerchantId(String merchantId) {
		
		return monitoringEquipmentInfoMapper.selectCountByMerchantId(merchantId);
	}

	
	
}
