package com.utonw.dealer.api.service;

import com.utonw.dealer.api.dto.ZyContract;
import com.utonw.dealer.api.entity.ApplyIndentRequest;
import com.utonw.dealer.api.entity.CarsokAcount;
import com.utonw.dealer.api.entity.CompleteTask;
import com.utonw.dealer.api.entity.MerchantIndent;

import java.util.List;
import java.util.Map;

/**
 * Created by SEELE on 2017/7/19.
 */
public interface IIndentService {
    Map<String,Object>   getCarDealerTaskByUserId(List<ApplyIndentRequest>list,int  pageNum,int  pageSize,String  merchantName);
    Map<String,Object>   getIndentTask(List<CompleteTask> list, int  pageNum, int  pageSize, String  merchantName);
    Map<String,Object> updateMerchantIndent(String orderId) throws Exception;
    /**
     * @Description: 获取还款计划
     * @param merchantIndentId  订单id
     * @param @return    设定文件 
     * @return Map<String,Object>    返回类型 
     * @throws
     * @author YX
     */
    Map<String,Object> getRepaymentPlanInfo(String merchantIndentId);

    MerchantIndent selectMerchantIndent(String orderId);
    String  updataIndent(String orderId,String obdState,String supervisetype) throws Exception;

   CarsokAcount getCarsokAccount(Long accountId);
   /**
    * 提交质押合同
    * @param zyContract
    */
  void commitZYContract(ZyContract zyContract);
}
