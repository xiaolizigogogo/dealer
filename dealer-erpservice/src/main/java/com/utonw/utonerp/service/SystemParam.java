package com.utonw.utonerp.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.utonw.dealer.api.entity.erp.SystemParameter;
import com.utonw.dealer.api.service.erp.ISystemParam;
import com.utonw.utonerp.mapper.SystemParameterMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 */
@Component
@Service(version = "1.0.0")
public class SystemParam implements ISystemParam{
    public static Map<Integer, Map<String, String>> systemParamMaps = null;

    @Autowired
    SystemParameterMapper systemParameterMapper;

    /**
     * 刷新系统参数
     */
    public void refreshCache() {
        if (null == systemParamMaps) {
            systemParamMaps = new HashMap<>();
        }
        /* 查询出所有系统参数 */
        List<SystemParameter> paramList = systemParameterMapper.selectAllParameter();

        for (SystemParameter aParamList : paramList) {
            Integer companyId = aParamList.getCompanyId();

            Map<String, String> systemParamMap = new HashMap<>();
            for (SystemParameter param : paramList) {
                if (companyId.compareTo(param.getCompanyId()) == 0) { //
                    // 将同一个公司的系统参数放到同一个map集合中
                    systemParamMap.put(param.getSysKey(), param.getSysValue());
                }
            }
            systemParamMaps.put(companyId, systemParamMap);
        }
    }

    public int updateBySysKey(Integer companyId, String sysKey, String sysValue) {
        SystemParameter param = new SystemParameter();
        param.setSysKey(sysKey);
        param.setSysValue(sysValue);
        param.setCompanyId(companyId);
        return systemParameterMapper.updateBySysKey(param);
    }

    /**
     * 获取系统参数
     *
     * @param companyId 公司ID
     * @param sysKey    参数key
     * @return 参数值
     */
    public String getSystemParam(Integer companyId, String sysKey) {
        if (null == systemParamMaps) {
            refreshCache();
        }
        Map<String, String> systemParamMap = systemParamMaps.get(companyId);
        if (systemParamMap == null) {
            throw new RuntimeException("[companyId:" + companyId + "] system parameter not " +
                    "found!");
        }
        return systemParamMap.get(sysKey);

    }

    /**
     * 获取系统参数(同步)
     */
    public String getSystemParamSync(Integer companyId, String sysKey) {
        SystemParameter parameter = systemParameterMapper.selectParameterByKey(companyId, sysKey);
        if (parameter != null) {
            return parameter.getSysValue();
        }
        return "";
    }

    /**
     * 获取系统参数为空返回0
     */
    public String getSystemParamWithZero(Integer companyId, String sysKey) {
        String tmpStr = getSystemParam(companyId, sysKey);
        if (tmpStr == null)
            return "0";
        return tmpStr;
    }

    /**
     * 获取系统参数为空返回""
     */
    public String getSystemParamWithBlank(Integer companyId, String sysKey) {
        String tmpStr = getSystemParam(companyId, sysKey);
        if (tmpStr == null)
            return "";
        return tmpStr;
    }
}
