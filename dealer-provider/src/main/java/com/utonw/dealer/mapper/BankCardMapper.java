package com.utonw.dealer.mapper;


import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.utonw.dealer.api.dto.BankCardAndMerchantDTO;
import com.utonw.dealer.api.entity.BankCard;

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
public interface BankCardMapper extends BaseMapper<BankCard> {

	List<BankCard> selectCustomerBankInfo(Map param);

	List<BankCardAndMerchantDTO> selectMerchantBankCard(Map map);
}