/**
 * @Description: 推送实现 
 * @author YX  
 * @date 2017年7月28日下午12:04:59
 */
package com.utonw.dealer.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.dubbo.config.annotation.Service;
import com.utonw.dealer.api.entity.MerchantApply;
import com.utonw.dealer.api.entity.MerchantIndent;
import com.utonw.dealer.api.entity.PushTemplate;
import com.utonw.dealer.api.service.IPushService;
import com.utonw.dealer.api.service.IPushTemplateServiceCSD;
import com.utonw.dealer.api.service.IuserServiceCSD;
import com.utonw.dealer.common.push.YMPushConfig;
import com.utonw.dealer.common.push.YMPushUtil;
import com.utonw.dealer.mapper.MerchantApplyMapper;
import com.utonw.dealer.mapper.MerchantIndentMapper;

/**
 * @author YX
 * @date 2017年7月28日 下午12:04:59 
 */
@Service(version="1.0.0",timeout = 1500000)
@Transactional
public class PushServiceImpl implements IPushService {
	
	private static final Logger logger = LoggerFactory.getLogger("IPushServiceImpl.class");
	
	@Autowired
	MerchantIndentMapper merchantIndentMapper;
	
	@Autowired
	MerchantApplyMapper merchantApplyMapper;
	
	@Reference(version="1.0.0", timeout=2000)
	IPushTemplateServiceCSD iPushTemplateServiceCSD;
	
	@Reference(version="1.0.0", timeout=2000)
	IuserServiceCSD iuserServiceCSD;
	
	@Autowired
	YMPushConfig yMPushConfig;
	
	/* (non-Javadoc)
	 * @see com.utonw.dealer.api.service.IPushService#sendPush(java.lang.String, java.lang.String, java.lang.String)
	 */
	@SuppressWarnings("finally")
	@Override
	public boolean sendPush(String taskDefKey, String businessKey, String procKey, String assignee) {
		
		logger.info("sendPush IN taskDefKey:{}, businessKey:{}, procKey:{}, assignee:{}", taskDefKey, businessKey, procKey, assignee);
		
		boolean pushResult = true;
		
		try {
			
			String mark = null;
			String content = null;
			
			//根据key查询模板
			List<PushTemplate> pushTemplates = iPushTemplateServiceCSD.selectPushTemplate(taskDefKey);
			
			if(pushTemplates.size() > 0){
				
				for (PushTemplate pushTemplate : pushTemplates) {
					
					logger.info("pushTemplate：" + pushTemplate.toString());
					
					content = pushTemplate.getPushTemplateContent();
					
					int pushObject = pushTemplate.getPushObject();
					
					if(pushObject == 1){  //任务人
						
						if(!"".equals(assignee) && assignee != null){
							
							String accountName = iuserServiceCSD.selectAccountName(assignee);
							
							if(!"".equals(accountName) && accountName != null){
								
								mark = accountName;
							}
						}else{
							
							logger.info("assignee参数为空");
						}
					}else if(pushObject == 2){  //车商
						
						if("CarDealerLoan".equals(procKey)){   //查询订单表的车商
							
							//根据订单id查询车商手机号
							MerchantIndent merchantIndent =  merchantIndentMapper.selectMerchantIndentById(businessKey);
							
							logger.info("merchantIndent:" + merchantIndent.toString());
							
							if(merchantIndent != null){
								
								mark = merchantIndent.getAcountId().toString();
							}
						}else if("CarDealerApply".equals(procKey)){  //查询申请表的车商
							
							//根据申请id查询车商手机号
							MerchantApply merchantApply = merchantApplyMapper.selectMerchantApplyById(businessKey);
							
							logger.info("merchantApply:" + merchantApply.toString());
							
							if(merchantApply != null){
								
								mark = merchantApply.getAcountid().toString();
							}
						}
					}
					
					//发送推送消息
					if(!"".equals(mark) && mark != null && !"".equals(content) && content != null){
						
						YMPushUtil pushUtil = new YMPushUtil();
						pushResult = pushUtil.sendCustomizedCast(mark, content, yMPushConfig);
						
						logger.info("sendPush 推送结果：" + pushResult);
					}else{
						
						logger.info("mark或者content为空");
					}
				}
			}else{
				
				logger.info("此流程节点【" + taskDefKey + "】无模板");
			}
			
		} catch (Exception e) {
			
			pushResult = false;
			
			e.printStackTrace();
		}finally{
			
			logger.info("sendPush OUT pushResult:{}",pushResult);
			
			return pushResult;
		}
		
	}

}
