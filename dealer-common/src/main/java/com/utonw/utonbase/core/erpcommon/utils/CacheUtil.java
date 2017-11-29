package com.utonw.utonbase.core.erpcommon.utils;


import net.sf.ehcache.Ehcache;
import net.sf.ehcache.Element;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cache.Cache;
import org.springframework.cache.ehcache.EhCacheCacheManager;

import java.util.List;

/**
 * EHCache缓存工具类
 * Created by fuyung on 15-7-8.
 */
public class CacheUtil {

    static Logger logger = LoggerFactory.getLogger(CacheUtil.class);

    static EhCacheCacheManager cacheManager = SpringContext.getBean("cacheManager");

    /**
     * 添加到缓存中
     *
     * @param cacheName 配置的缓存name
     * @param key       存储缓存key
     * @param value     值
     */
    public static <T> void put(String cacheName, String key, T value) {
        if (StringUtils.isNotBlank(key)) {
            getCache(cacheName).put(key, value);
        }
    }

    /**
     * 添加到缓存中
     *
     * @param cacheName         配置的缓存name
     * @param key               存储缓存key
     * @param value             值
     * @param timeToIdleSeconds 设置超时时间
     */
    public static <T> void put(String cacheName, String key, T value, int timeToIdleSeconds) {
        Ehcache cache = getEhcache(cacheName);
        Element element = new Element(key, value);
        element.setTimeToIdle(timeToIdleSeconds);
        cache.put(element);
    }

    @SuppressWarnings("unchecked")
    public static List<String> getnonExpiredKeys(String cacheName) {
        Ehcache cache = getEhcache(cacheName);
        return cache.getKeysWithExpiryCheck();
    }


    /**
     * 删除缓存中的信息
     *
     * @param cacheName 配置的缓存name
     * @param key       存储缓存key
     */
    public static void evict(String cacheName, String key) {
        if (StringUtils.isNotBlank(key)) {
            getCache(cacheName).evict(key);
        }
    }

    public static boolean remove(String cacheName, String key) {
        Ehcache cache = getEhcache(cacheName);
        return cache.remove(key);
    }

    /**
     * 清空某一个缓存，全部清除
     *
     * @param cacheName 配置的缓存name
     */
    public static void clear(String cacheName) {
        if (getCache(cacheName) != null) {
            getCache(cacheName).clear();
        }
    }

    /**
     * 得到缓存中的信息
     *
     * @param cacheName 配置的缓存name
     * @param key       存储缓存key
     */
    @SuppressWarnings("unchecked")
    public static <T> T get(String cacheName, String key) {
        T value = null;
        if (StringUtils.isNotBlank(key)) {
            Cache ce = getCache(cacheName);
            if (ce == null){
                return value;
            }
            Cache.ValueWrapper val = getCache(cacheName).get(key);
            if (val != null) {
                value = (T) val.get();
            }
        }
        return value;
    }

    /**
     * 是否存在key中的缓存
     *
     * @param cacheName 配置的缓存name
     * @param key       存储缓存key
     * @return false 不存在    true:存在
     */
    public static boolean isCacheByKey(String cacheName, String key) {
        Cache.ValueWrapper val = getCache(cacheName).get(key);
        return val != null;
    }

    /**
     * 通过spring得到缓存管理对象
     *
     * @param cacheName 配置的缓存name
     * @return Cache
     */
    public static Cache getCache(String cacheName) {
        return cacheManager.getCache(cacheName);
    }

    /**
     * 底层的ehcache的缓存管理对象
     * @param cacheName 配置的缓存name
     * @return Ehcache
     */
    public static Ehcache getEhcache(String cacheName) {
        Ehcache cache = null;
        if (cacheManager != null) {
            cache = cacheManager.getCacheManager().getCache(cacheName);
        } else {
            logger.error("spring的管理对象cacheManager是null");
            throw new NullPointerException("spring的管理对象cacheManager是null");
        }
        return cache;
    }



}
