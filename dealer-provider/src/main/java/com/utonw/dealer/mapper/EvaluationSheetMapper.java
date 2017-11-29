package com.utonw.dealer.mapper;


import java.util.Map;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.utonw.dealer.api.dto.response.AppraisalInfoResponse;
import com.utonw.dealer.api.dto.response.EvaluationSheetResponse;
import com.utonw.dealer.api.entity.EvaluationSheet;
import com.utonw.dealer.api.entity.OrderStatus;
import com.utonw.dealer.api.entity.OrderStatusUpdate;

/**
 * <p>
 * Mapper接口
 * </p>
 *
 * @author wangyj
 * @since 2017-05-05
 */
public interface EvaluationSheetMapper extends BaseMapper<EvaluationSheet> {

	AppraisalInfoResponse selectAppraisalInfo(String id);
	OrderStatusUpdate selectUpdatetime(Map<String,String> map);
	Map<String, Object> selectEvaluateInfoById(String id);
}