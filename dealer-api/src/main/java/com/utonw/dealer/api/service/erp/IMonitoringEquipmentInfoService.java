package com.utonw.dealer.api.service.erp;

import java.util.List;

import com.utonw.dealer.api.entity.erp.MonitoringEquipmentInfo;

public interface IMonitoringEquipmentInfoService {
	
	void updateById(MonitoringEquipmentInfo monitoringEquipmentInfo);

	void deleteById(Integer monitoringEquipmentId);

	void insertMonitoringEquipmentInfo(MonitoringEquipmentInfo monitoringEquipmentInfo);

	public List<MonitoringEquipmentInfo> showInfoBymerchantId(String merchantId) throws Exception;
	
	public Integer showNumberByMerchantId(String merchantId);

}
