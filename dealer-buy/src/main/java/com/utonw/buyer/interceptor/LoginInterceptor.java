package com.utonw.buyer.interceptor;

import java.math.BigDecimal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.dubbo.common.utils.StringUtils;
import com.alibaba.dubbo.container.Main;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.utonw.dealer.api.enums.UserTypeEnum;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.connection.RedisConnection;

import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;

import org.springframework.stereotype.Service;

import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;



@Service
public class LoginInterceptor extends HandlerInterceptorAdapter {
	private Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	@Autowired
	private JedisConnectionFactory jedisConnectionFactory;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		if (jedisConnectionFactory == null) {
			BeanFactory factory = WebApplicationContextUtils
					.getRequiredWebApplicationContext(request.getServletContext());
			jedisConnectionFactory =  factory.getBean(JedisConnectionFactory.class);
		}
		RedisConnection redisConnection = jedisConnectionFactory.getConnection();
		try {
			String token = request.getHeader("token");
			logger.info("LoginFilter doFilter token:" + token);
			String subToken = request.getHeader("subToken");
			logger.info("LoginFilter doFilter subToken:" + subToken);
			if (request.getRequestURI().indexOf("/swagger-resources") != -1 || request.getRequestURI().indexOf("v2") != -1|| request.getRequestURI().indexOf("login") != -1) {
				return true;
			}
			// 主账户
			if (!StringUtils.isEmpty(token)) {
				boolean acount = redisConnection.exists(token.getBytes());
				//判定token类型
			
				if (acount == true) {
					byte[] children = redisConnection.get(token.getBytes());
					if(token.indexOf(UserTypeEnum.offline_staff.name())!=-1){
						String account=new String(children);
						logger.info("主账号："+account);
						request.setAttribute("account",account);
						return true;
					}
					else{
						JSONObject obj = JSON.parseObject(children, JSONObject.class);
						String account = obj.getString("account");
						logger.info("主账号："+account);
						request.setAttribute("account",account);
						return true;
					}
				}
			}
			// 子账户
			else if (!StringUtils.isEmpty(subToken)) {
				boolean acount = redisConnection.exists(subToken.getBytes());
				if (acount == true) {
					byte[] children = redisConnection.get(subToken.getBytes());
					if(subToken.indexOf(UserTypeEnum.offline_staff.name())!=-1){
						String account=new String(children);
						logger.info("主账号："+account);
						request.setAttribute("account",account);
						return true;
					}
					else{
						JSONObject obj = JSON.parseObject(children, JSONObject.class);
						String account = obj.getString("accountPhone");
						String childAccountMobile =obj.getString("childAccountMobile");
						logger.info("子账号查的主账号："+account);
						logger.info("子账号："+childAccountMobile);
						request.setAttribute("account",account);
						request.setAttribute("childAccountMobile",childAccountMobile);
						return true;
					}
				}
			} else {
				response.setContentType("application/json");
				response.setCharacterEncoding("utf-8");
				response.getWriter().write("{\"message\":\"请登录\"}");
				response.flushBuffer();
				return false;
			}
			response.setContentType("application/json");
			response.setCharacterEncoding("utf-8");
			response.getWriter().write("{\"message\":\"请登录\"}");
			response.flushBuffer();
			return false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			redisConnection.close();
			redisConnection.closePipeline();
		}
	}

}





