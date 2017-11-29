package com.utonw.utonbase.core.util;

import com.alibaba.fastjson.JSON;
import com.utonw.utonbase.core.Constants;
import com.utonw.utonbase.support.Token;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

@Component
public class TokenUtil {
	@Resource
	private RedisUtils redisUtils;
	public void setTokenInfo(String token, String value, long seconds) {
		try {
			//加上固定的前缀方便后期做维护的时候进行清除
			redisUtils.set(Constants.TOKEN_KEY+token,value,(long) seconds);
		} catch (Exception e) {
			throw new RuntimeException("保存token失败，错误信息：", e);
		}
	}

	public void delToken(String token) {
		try {
			redisUtils.del(Constants.TOKEN_KEY+ token);
		} catch (Exception e) {
			throw new RuntimeException("删除token失败，错误信息：", e);
		}
	}

	public String getTokenInfo(String token) {
		String tokenString = redisUtils.get(Constants.TOKEN_KEY+token);
		return tokenString;
	}
}
