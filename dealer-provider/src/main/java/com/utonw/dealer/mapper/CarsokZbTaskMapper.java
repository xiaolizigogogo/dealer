package com.utonw.dealer.mapper;


import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.utonw.dealer.api.dto.response.CarEnclosure;
import com.utonw.dealer.api.entity.CarsokZbTask;

import java.util.List;

/**
 * <p>
 * Mapper接口
 * </p>
 *
 * @author wangyj
 * @since 2017-07-07
 */
public interface CarsokZbTaskMapper extends BaseMapper<CarsokZbTask> {
  CarEnclosure selectCarEnclosure(String productId);

}