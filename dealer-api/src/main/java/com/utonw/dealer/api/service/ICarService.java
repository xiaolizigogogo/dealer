package com.utonw.dealer.api.service;


import com.utonw.dealer.api.entity.MerchantIndent;
import com.utonw.dealer.api.entity.workflowtask;

import java.util.List;
import java.util.Map;

/**
 * Created by SEELE on 2017/5/10.
 */
public interface ICarService {
    Map<String,Object> getCarMessage(String acountId,int pageNum,int pageSize,String indentState,String productName,List<workflowtask> list);
    Map<String,Object> getCarCapital(String pruductId);
    List<MerchantIndent> getIndentId(String acountId);
    Map<String,Object> getCarSum(String acountId);
    Map carDetail(Map param);
}
