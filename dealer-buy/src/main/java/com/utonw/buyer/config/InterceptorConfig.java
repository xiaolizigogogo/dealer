package com.utonw.buyer.config;

import com.utonw.buyer.interceptor.LoginInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;


@Configuration
public class InterceptorConfig extends WebMvcConfigurerAdapter {

	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new LoginInterceptor()).excludePathPatterns("/error","/swagger-ui.html","/swagger-resources","/swagger**","/login","/evaluationSheet/getUpToken");
	}

}
