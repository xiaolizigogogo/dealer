package com.utonw.utonerp.task;

import org.activiti.engine.delegate.DelegateTask;
import org.activiti.engine.delegate.TaskListener;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.fastjson.JSONObject;

public class TaskListenerForSendMessage implements  TaskListener{
	Logger logger=LoggerFactory.getLogger(TaskListenerForSendMessage.class);
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public void notify(DelegateTask delegateTask) {
		logger.info("TaskListenerForSendMessage:",delegateTask);
		return;
	}





}
