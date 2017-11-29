package com.utonw.utonerp.config;

import com.utonw.utonerp.interceptor.AdminContextInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;


@Configuration
public class InterceptorConfig extends WebMvcConfigurerAdapter {

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new AdminContextInterceptor()).addPathPatterns("/**")
				.excludePathPatterns("/**/*.css")
				.excludePathPatterns("/**/*.js")
				.excludePathPatterns("/**/*.eot")
				.excludePathPatterns("/**/*.svg")
				.excludePathPatterns("/**/*.woff")
				.excludePathPatterns("/**/*.woff2")
				.excludePathPatterns("/**/*.ttf")
				.excludePathPatterns("/**/*.gif")
				.excludePathPatterns("/**/*.png")
				.excludePathPatterns("/**/*.jpg")
				.excludePathPatterns("*.css");
	}
}
