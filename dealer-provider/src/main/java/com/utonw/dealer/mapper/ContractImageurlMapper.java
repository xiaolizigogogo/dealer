package com.utonw.dealer.mapper;

import com.utonw.dealer.api.dto.response.CustomerContractResponse;
import com.utonw.dealer.api.entity.ContractImageurl;
import com.baomidou.mybatisplus.mapper.BaseMapper;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * Mapper接口
 * </p>
 *
 * @author wangyj
 * @since 2017-05-09
 */
public interface ContractImageurlMapper extends BaseMapper<ContractImageurl> {

	List<CustomerContractResponse> selectCustomerContract(Map map);

}