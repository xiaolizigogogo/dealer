package com.utonw.utonerp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.utonw.dealer.api.entity.erp.DistributionUser;

/**
 * @author zhangzheng
 * @date 2017年10月9日下午2:23:20
 */
public interface DistributionUserMapper {
	public List<DistributionUser> selectUserName(@Param("province") String province, @Param("city") String city, @Param("district") String district);
}
