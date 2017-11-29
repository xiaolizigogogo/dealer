package com.utonw.dealer.api.service.erp;

/**
 * Created by WANGYJ on 2017/11/7.
 */
public interface ISystemParam {
    void refreshCache();
    int updateBySysKey(Integer companyId, String sysKey, String sysValue);
    String getSystemParam(Integer companyId, String sysKey);
    String getSystemParamSync(Integer companyId, String sysKey);
    String getSystemParamWithZero(Integer companyId, String sysKey);
    String getSystemParamWithBlank(Integer companyId, String sysKey);
}

