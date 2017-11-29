package com.utonw.dealer.api.service;

import java.util.List;
import java.util.Map;

import com.github.pagehelper.PageInfo;
import com.utonw.dealer.api.dto.request.CustomerListRequest;
import com.utonw.dealer.api.dto.request.DeleteRequest;
import com.utonw.dealer.api.dto.request.OrderPageRequest;
import com.utonw.dealer.api.entity.MerchantIndentInfo;
import com.utonw.dealer.api.entity.MerchantModify;
import com.utonw.dealer.api.entity.workflowtask;

/**
 * Created by WANGYJ on 2017/5/10.
 */
public interface IOrderService {
	/**
	 * 查询订单
	 * @param orderPageRequest
	 * @param list	
	 * @return
	 */
    Map<String,Object> queryOrderByParams(OrderPageRequest orderPageRequest, List<workflowtask> list);
   
   String updateMerchantIndent(MerchantModify merchantModify);
   /**
    * 查询所有订单
    * 根据订单状态筛选
    * 根据订单号删选
    */
   PageInfo<MerchantIndentInfo> queryOrderByCondition(OrderPageRequest orderPageRequest);
   /**
    * 订单里列表 查询订单数量
    * @return
    */
   Map queryOrderCount();

    /**
     * 查询车商监管信息
     * @return
     */
    Map<String,Object> selectSupervision(CustomerListRequest param);


    /**
     * 查询车商监管信息
     * @return
     */
    Map<String,Object> selectIndentCar(CustomerListRequest param);
    Map<String,Object> getsuperviseInfo(CustomerListRequest param);
    Map<String,Object>   getFinalPosition(CustomerListRequest param);
    
    PageInfo<MerchantIndentInfo> queryOrderByids(OrderPageRequest orderPageRequest);
    int delete(DeleteRequest deleteRequest);
}
