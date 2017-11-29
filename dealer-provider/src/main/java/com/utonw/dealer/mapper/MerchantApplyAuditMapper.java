package com.utonw.dealer.mapper;


import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.utonw.dealer.api.entity.MerchantApplyAudit;
import com.utonw.dealer.api.entity.OrderStatus;

/**
 * <p>
 * Mapper接口
 * </p>
 *
 * @author wangyj
 * @since 2017-05-05
 */
public interface MerchantApplyAuditMapper extends BaseMapper<MerchantApplyAudit> {
	
	 MerchantApplyAudit selectMerchantName(String id);

	OrderStatus selectCreatedate(String id);

}