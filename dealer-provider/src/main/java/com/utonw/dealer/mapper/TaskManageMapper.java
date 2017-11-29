package com.utonw.dealer.mapper;

import com.utonw.dealer.api.entity.OrderList;
import com.utonw.dealer.api.entity.TaskManage;
import com.baomidou.mybatisplus.mapper.BaseMapper;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * Mapper接口
 * </p>
 *
 * @author wangyj
 * @since 2017-05-06
 */
public interface TaskManageMapper extends BaseMapper<TaskManage> {
  List<OrderList> getOrderLists(Map<String,Object> map );
}