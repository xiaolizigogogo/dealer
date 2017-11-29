package com.utonw.dealer.mapper;


import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.utonw.dealer.api.dto.response.CarPurchaseContract;
import com.utonw.dealer.api.entity.CarContract;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * Mapper接口
 * </p>
 *
 * @author wangyj
 * @since 2017-07-25
 */
public interface CarContractMapper extends BaseMapper<CarContract> {

	Map selectContractPicAndVideo(String id);

	List<CarPurchaseContract> selectPurchaseContract(String productId);
}