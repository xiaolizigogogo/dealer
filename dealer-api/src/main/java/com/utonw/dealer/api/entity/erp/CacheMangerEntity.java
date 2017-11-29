package com.utonw.dealer.api.entity.erp;

import java.io.Serializable;

/**
 * 缓存管理实体类
 * Created by fuyung on 15-7-13.
 */
public class CacheMangerEntity implements Serializable {

    private static final long serialVersionUID = -5133934697849647508L;
    private String cacheName;
    private long cacheHitCount;
    private long cacheMissCount;
    private float cacheHitPercent;


    public String getCacheName() {
        return cacheName;
    }

    public void setCacheName(String cacheName) {
        this.cacheName = cacheName;
    }

    public long getCacheHitCount() {
        return cacheHitCount;
    }

    public void setCacheHitCount(long cacheHitCount) {
        this.cacheHitCount = cacheHitCount;
    }

    public long getCacheMissCount() {
        return cacheMissCount;
    }

    public void setCacheMissCount(long cacheMissCount) {
        this.cacheMissCount = cacheMissCount;
    }

    public float getCacheHitPercent() {
        return cacheHitPercent;
    }

    public void setCacheHitPercent(float cacheHitPercent) {
        this.cacheHitPercent = cacheHitPercent;
    }
}
