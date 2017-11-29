package com.utonw.utonbase.core.util;

import com.utonw.utonbase.core.Constants;
import com.utonw.utonbase.support.cache.CacheManager;
import com.utonw.utonbase.support.cache.RedisHelper;
import com.utonw.utonbase.support.cache.RedissonHelper;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;

public class CacheUtil {
	private static Logger logger = LogManager.getLogger(CacheUtil.class);
	private static CacheManager cacheManager;

	public static void setCacheManager(CacheManager cacheManager) {
		CacheUtil.cacheManager = cacheManager;
	}

	public static CacheManager getCache() {
		if (cacheManager == null) {
			synchronized (CacheUtil.class) {
				if (cacheManager == null) {
					cacheManager = new RedisHelper();
				}
			}
		}
		return cacheManager;
	}

	/** 获取锁 */
	public static boolean getLock(String key) {
		try {
			if (!getCache().exists(key)) {
				synchronized (CacheUtil.class) {
					if (!getCache().exists(key)) {
						if (getCache().setnx(key, System.currentTimeMillis())) {
							return true;
						}
					}
				}
			}
			int expires = 1000 * 60 * 3;
			String currentValue = (String) getCache().get(key);
			if (currentValue != null && Long.parseLong(currentValue) < System.currentTimeMillis() - expires) {
				unlock(key);
				return getLock(key);
			}
			return false;
		} catch (Exception e) {
			logger.error(Constants.Exception_Head, e);
			return false;
		}
	}

	public static void unlock(String key) {
		getCache().del(key);
	}
}
