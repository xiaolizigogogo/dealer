package com.utonw.utonerp.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.utonw.dealer.api.entity.erp.CacheMangerEntity;
import com.utonw.dealer.api.entity.erp.SystemParameter;
import com.utonw.dealer.api.entity.erp.User;
import com.utonw.dealer.api.service.erp.ISystemParam;
import com.utonw.dealer.api.service.erp.IToolService;
import com.utonw.dealer.api.util.erp.Constants;
import com.utonw.utonbase.core.erpcommon.utils.SpringUtils;
import com.utonw.utonerp.common.utils.SysUserUtil;
import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 监控
 * Created by fuyung on 15-7-13.
 */
@Controller
@RequestMapping("/monitor")
public class MonitorController {

    @Autowired
    CacheManager cacheManager;

    @Reference(version = "1.0.0")
    IToolService toolService;

    @Reference(version = "1.0.0")
    ISystemParam systemParamManager;

    @Autowired
    SysUserUtil sysUserUtil;

    @RequestMapping("/ehcache")
    public ModelAndView EHCacheManager() {

        List<CacheMangerEntity> cacheMangerList = new ArrayList<>();


        String[] cacheNames = cacheManager.getCacheNames();
        for (String cacheName : cacheNames) {
            CacheMangerEntity cacheMangerEntity = new CacheMangerEntity();
            Cache cache = cacheManager.getCache(cacheName);

            cacheMangerEntity.setCacheName(cache.getName());
            long cacheHitCount = cache.getStatistics().cacheHitCount();
            long cacheMissCount = cache.getStatistics().cacheMissCount();

            cacheMangerEntity.setCacheHitCount(cacheHitCount);
            cacheMangerEntity.setCacheMissCount(cacheMissCount);
            long totalCache = cacheHitCount + cacheMissCount;

            cacheMangerEntity.setCacheHitPercent((float) (cacheHitCount * 1.0 / totalCache));

            cacheMangerList.add(cacheMangerEntity);
        }

        return new ModelAndView("/monitor/ehcacheMonitor", "cacheManager", cacheMangerList);
    }

    @RequestMapping(value = "/ehcache/clear", method = RequestMethod.POST)
    public void clear(HttpServletRequest request, HttpServletResponse response) {

        String[] cacheNames = request.getParameterValues("cacheNames[]");
        for (String cacheName : cacheNames) {
            cacheManager.getCache(cacheName).removeAll();
        }
        SpringUtils.renderJson(response, Constants.SUCCESS);
    }

    @RequestMapping(value = "/system/setParam")
    public ModelAndView getSystemParameter(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView("/monitor/parameterSetting");

        User user = sysUserUtil.getSessionLoginUser();
        Map<String,Object> param = new HashMap();
        param.put("companyId",user.getCompanyId());
        param.put("type",request.getParameter("type"));
        List<SystemParameter> paramList = toolService.getAllParameterByCompanyIdAndType(param);

        modelAndView.addObject("paramList", paramList);
        modelAndView.addObject("type",request.getParameter("type"));
        return modelAndView;
    }

    @RequestMapping(value = "/system/setParam/edit")
    public String editParameter(HttpServletRequest request) {
        Integer id = Integer.parseInt(request.getParameter("id"));
        String sysValue = request.getParameter("sysValue");
        SystemParameter systemParam = new SystemParameter();
        systemParam.setId(id);
        systemParam.setSysValue(sysValue);

        int i = toolService.updateParameterByCompanyIdAndType(systemParam);

        if (i > 0) {
            systemParamManager.refreshCache();
            return "redirect:/admin/loan/operation_success.jsp";
        }
        return "redirect:/admin/loan/operation_error.jsp";
    }
}
