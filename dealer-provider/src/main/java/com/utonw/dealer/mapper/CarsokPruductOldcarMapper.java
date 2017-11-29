package com.utonw.dealer.mapper;

import com.utonw.dealer.api.entity.*;
import com.baomidou.mybatisplus.mapper.BaseMapper;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * Mapper接口
 * </p>
 *
 * @author wangyj
 * @since 2017-05-05
 */
public interface CarsokPruductOldcarMapper extends BaseMapper<CarsokPruductOldcar> {

 Assess selectByIdCar(String indentId);
 List<CarMessage> queryCarList(Map<String,String> map);
 CarCapitalDetails queryCarCapital(int id);
 CarDetails  queryCarDetails(int id);
 List<CarMessage> queryCarListOne(String  acountId,String productName);
 CarsokPruductOldcar selectCarInfo(String id);
}