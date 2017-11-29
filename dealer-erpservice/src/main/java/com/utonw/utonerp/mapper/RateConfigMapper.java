package com.utonw.utonerp.mapper;

import java.util.List;
import java.util.Map;

import com.utonw.dealer.api.entity.RateConfig;

public interface RateConfigMapper {
	public List<RateConfig> selectRateConfigs(String companyId);
	int updateFinancingRate(Map<String, Object> map);
	int	insertFinancingRate(Map<String, Object> map);
}
