package com.utonw.utonerp.task;

import com.utonw.utonerp.mapper.WorkflowviewMapper;
import org.activiti.engine.delegate.DelegateExecution;
import org.activiti.engine.delegate.ExecutionListener;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Service;

import com.alibaba.dubbo.config.annotation.Reference;
import com.utonw.dealer.api.entity.workflowtask;
import com.utonw.dealer.api.service.IPushService;

@Service
public class ExecutionListenerForSendMessage implements  ExecutionListener,ApplicationContextAware {
	@Reference(version="1.0.0" ,check=false)
	private IPushService  pushService;
	@Autowired
	WorkflowviewMapper workflowviewMapper;
	private ApplicationContext applicationContext;
	Logger logger=LoggerFactory.getLogger(ExecutionListenerForSendMessage.class);
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Override
	public void notify(DelegateExecution execution) throws Exception {
		if(true){
			return;
		}
		if(pushService==null){
			pushService=(IPushService)applicationContext.getBean("pushService");
		}
		if(workflowviewMapper==null){
			workflowviewMapper=(WorkflowviewMapper)applicationContext.getBean("workflowviewMapper");
		}
		logger.info("ExecutionListenerForSendMessage:"+execution.getProcessDefinitionId(),execution.getProcessDefinitionId());
		logger.info("workflowviewMapper:"+workflowviewMapper,workflowviewMapper);
		logger.info("pushService:"+pushService,pushService);
		workflowtask workflowtask=workflowviewMapper.selectByTaskId(execution.getProcessDefinitionId());
		if(workflowtask==null){
			pushService.sendPush(execution.getCurrentActivityId(),execution.getProcessBusinessKey(), workflowtask.getProckey(),workflowtask.getAssignee());
			return ;
		}
		pushService.sendPush(execution.getCurrentActivityId(),execution.getProcessBusinessKey(), workflowtask.getProckey(),workflowtask.getAssignee());
	}


	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		this.applicationContext=applicationContext;
	}
}
