package com.utonw.utonerp.mapper;


import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.utonw.dealer.api.entity.erp.CarInspectionEntity;

/**
 * <p>
 * Mapper接口
 * </p>
 *
 * @author wangyj
 * @since 2017-07-18
 */
@Component
public interface CarInspectionUserMapper  {
	CarInspectionEntity selectUserNameById(@Param("id") int id);
}