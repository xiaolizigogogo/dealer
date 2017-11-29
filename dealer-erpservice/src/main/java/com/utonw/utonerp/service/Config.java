package com.utonw.utonerp.service;

import com.utonw.utonerp.task.ExecutionListenerForSendMessage;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;


@Configuration
public class Config {
	@Bean
	public ExecutionListenerForSendMessage executionListenerForSendMessage(){
		return new ExecutionListenerForSendMessage();
	}
}
