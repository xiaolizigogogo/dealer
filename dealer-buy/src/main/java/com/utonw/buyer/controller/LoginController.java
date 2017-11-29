package com.utonw.buyer.controller;

import java.util.Map;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.druid.util.StringUtils;
import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSONObject;
import com.utonw.consumerloan.api.service.sys.SysUserTokenService;
import com.utonw.dealer.api.enums.UserTypeEnum;
import com.utonw.dealer.api.model.BaseResult;
import com.utonw.dealer.api.service.ILoanServiceCSD;

@RestController
public class LoginController {
	@Reference(version="1.0.0")
	private ILoanServiceCSD loanServiceCSD;	
	@Autowired
	private JedisConnectionFactory jedisConnectionFactory;
	@Reference(version="1.0.0",check=false)
	private SysUserTokenService sysUserTokenService;
	private static Logger logger=LoggerFactory.getLogger(LoginController.class);
	@RequestMapping("login")
	public BaseResult login(@RequestBody Map<String,String> map){
		RedisConnection redisConnection=jedisConnectionFactory.getConnection();
		try{
			Map resultMap=loanServiceCSD.login(map.get("loginName"), map.get("password"));
			if(StringUtils.equals("success",resultMap.get("code").toString())){
				String token=UserTypeEnum.offline_staff.name()+UUID.randomUUID().toString().replaceAll("-", "");
				redisConnection.set(token.getBytes(),JSONObject.parseObject(JSONObject.toJSONString(resultMap.get("user"))).getString("uuid").getBytes());
				try{
					sysUserTokenService.createTokenRedisForCLD(JSONObject.parseObject(JSONObject.toJSONString(resultMap.get("user"))).getString("uuid"),true,token);	
					logger.info("【登录消费贷成功】token:{},user:{}",token,JSONObject.parseObject(JSONObject.toJSONString(resultMap.get("user"))).getString("uuid"));
				}catch (Exception e) {
					logger.error("【登录消费贷失败】,error:{}",e.toString());
				}
				return new BaseResult(token,"0000","登陆成功");
			}
			else{
				return new BaseResult(null,"0001","登录失败");
			}
		}catch (Exception e) {
			return new BaseResult(e,"0002","系统异常");
		}
		finally {
			redisConnection.close();
		}
	}
}
