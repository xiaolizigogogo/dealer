package com.utonw.utonerp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.utonw.dealer.api.entity.erp.MonitoringEquipmentInfo;;

public interface MonitoringEquipmentInfoMapper {
	
	int insertSelective(MonitoringEquipmentInfo record);

	/*
	 * 通过ID更新
	 */
	void updateById(MonitoringEquipmentInfo record);

	/*
	 * 通过ID逻辑删除
	 */
	void deleteById(@Param("deleteId") Integer record);
    
    /*
     * 通过车商id查询该车商下的设备信息
     */
    List<MonitoringEquipmentInfo> selectInfoBymerchantId(String merchantId);
    
    Integer selectCountByMerchantId(String merchantId);
}