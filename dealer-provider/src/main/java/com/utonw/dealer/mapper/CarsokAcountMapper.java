package com.utonw.dealer.mapper;

import com.utonw.dealer.api.entity.CarsokAcount;
import com.utonw.dealer.api.entity.CarsokAcountDTO;
import com.utonw.dealer.api.entity.MerchantDataDTO;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.github.pagehelper.Page;

/**
 * <p>
 * Mapper接口
 * </p>
 *
 * @author wangyj
 * @since 2017-05-09
 */
public interface CarsokAcountMapper extends BaseMapper<CarsokAcount> {
	
	/**
	 * 检索查询车商信息
	 * @param merchantName
	 * @param mobile
	 * @return
	 */
	Page<CarsokAcountDTO> selectAcountInfoByWhere(@Param("acountName") String acountName , @Param("acountMobile") String acountMobile);

	/**
	 * RFID相关,办理过RFID的车行信息,检索搜索
	 * @param acountName
	 * @param acountMobile
	 * @param acountIds
	 * @return
	 */
	Page<MerchantDataDTO> selectMerchantData(@Param("params") Map<String , String> params , @Param("list") List<Integer> list);
    String getIdByAccount(@Param("account") String account);
}