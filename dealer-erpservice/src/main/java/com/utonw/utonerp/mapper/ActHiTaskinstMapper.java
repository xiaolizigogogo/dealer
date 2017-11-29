package com.utonw.utonerp.mapper;

import org.apache.ibatis.annotations.Param;

/**
 * <p>
 * Mapper接口
 * </p>
 *
 * @author wangyj
 * @since 2017-07-18
 */
public interface ActHiTaskinstMapper  {
	
	Integer queryTaskByUuIdcount(@Param("uuid") String uuid);

}