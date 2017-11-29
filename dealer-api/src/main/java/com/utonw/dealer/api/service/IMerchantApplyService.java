package com.utonw.dealer.api.service;


import com.utonw.dealer.api.dto.ApplyDTO;


import com.utonw.dealer.api.dto.SaveFinancingPicture;
import com.utonw.dealer.api.dto.request.ApplicationStatus;
import com.utonw.dealer.api.dto.request.SignTask;
import com.utonw.dealer.api.entity.*;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;
import java.util.Map;


/**
 * <p>
 * 服务类
 * </p>
 *
 * @author wangyj
 * @since 2017-05-04
 */
public interface IMerchantApplyService extends IService<MerchantApply> {
    MerchantIndent getIndentId(String productId);
    Map<String,Object> createApply(ApplyDTO applyDTO);
    Map<String,List<String>> getAttachment(String acount_id);
    Map<String,Object> getTaskByUserId(List<ApplyIndentRequest> list, int pageNum, int pageSize, String merchantName,List<ApplyIndentRequest> withCapital);
    Map<String,Object>  getTaskByList(List<ApplyIndentRequest> list, int pageNum, int pageSize, String merchantName);
    Map<String,Object> getAllocationAudit(String acount_id);
    Map<String,Object> getDealerInformationVerification(String acountId);
    Map<String,Object>  getOrderList(String acountId,int pageNum,int pageSize,String status,String productName,List<ApplyIndentRequest> list,String task_key);
    OrderStatusUpdate selectUpdateTime(String orderId, String productId);
    OrderStatus selectCreatedate(String orderId);
    Map<String,Object>  updateApplicationStatus(ApplicationStatus applicationStatus);
    Map<String,Object>  updateSignTask(SignTask signTask);
    Map<String,Object> saveFinancingPicture( SaveFinancingPicture SaveFinancingPicture);
    Map<String,Object> getAlreadyTask(List<CompleteTask> list, int pageNum, int pageSize, String merchantName);


}
