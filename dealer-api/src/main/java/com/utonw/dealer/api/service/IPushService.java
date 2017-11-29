/**
 * @Description: 友盟推送接口 
 * @author YX  
 * @date 2017年7月28日下午12:00:47
 */
package com.utonw.dealer.api.service;

/**
 * @author YX
 * @date 2017年7月28日 下午12:00:47 
 */
public interface IPushService {

	/**
	 * @Description: 推送
	 * @param taskDefKey   流程节点key
	 * @param businessKey 订单或申请id
	 * @param procKey 
	 * @param assignee  
	 * @param @return    设定文件 
	 * @return boolean    返回类型 
	 * @throws
	 * @author YX
	 */
	public boolean sendPush(String taskDefKey, String businessKey, String procKey, String assignee);
}
