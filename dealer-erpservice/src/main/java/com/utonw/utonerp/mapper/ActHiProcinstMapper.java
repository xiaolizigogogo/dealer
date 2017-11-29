package com.utonw.utonerp.mapper;


import com.utonw.dealer.api.entity.ApplyIndentRequest;
import com.utonw.dealer.api.entity.CompleteTask;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * <p>
 * Mapper接口
 * </p>
 *
 * @author wangyj
 * @since 2017-07-18
 */
@Component
public interface ActHiProcinstMapper  {
   List<ApplyIndentRequest> selectCompleteTask(String uuid);
   List<ApplyIndentRequest> queryAlreadyCapital(String uuid);
}