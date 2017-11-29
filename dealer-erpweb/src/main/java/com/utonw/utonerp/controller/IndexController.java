package com.utonw.utonerp.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.utonw.dealer.api.entity.erp.HomePageBean;
import com.utonw.dealer.api.entity.erp.User;
import com.utonw.dealer.api.service.erp.IIndexService;
import com.utonw.dealer.api.service.erp.ISystemParam;
import com.utonw.dealer.api.service.erp.IUserService;
import com.utonw.dealer.api.service.erp.WorkFlowService;
import com.utonw.dealer.api.util.erp.Constants;
import com.utonw.utonbase.core.erpcommon.utils.JsonUtil;
import com.utonw.utonbase.core.erpcommon.utils.SpringUtils;
import com.utonw.utonerp.common.utils.SysUserUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * index
 * Created by user on 2015/5/22.
 */
@RestController
@RequestMapping("/")
public class IndexController {

    @Reference(version = "1.0.0")
    ISystemParam systemParam;

//    @Autowired
//    ILoanService loanService;

    @Reference(version = "1.0.0")
    IUserService userService;

    @Reference(version = "1.0.0")
    IIndexService indexService;

    @Reference(version = "1.0.0")
    private WorkFlowService workFlowService;

    @Resource
    SysUserUtil sysUserUtil;
    /**
     * 通用的页面跳转方法
     * 传入的request参数会封装到map中
     */
//    @RequestMapping("{folder}/{fileName}")
//    public ModelAndView toPage(@PathVariable String folder,
//                               @PathVariable String fileName, HttpServletRequest request) {
//        ModelAndView modelAndView = new ModelAndView(folder + "/" + fileName);
//        modelAndView.addObject("map", SpringUtils.getParameters(request));
//        return modelAndView;
//    }

    /**
     * 通用的页面跳转方法
     * 传入的request参数会封装到map中
     */
//    @RequestMapping("{fileName}")
//    public ModelAndView toPage(@PathVariable String fileName, HttpServletRequest request) {
//        ModelAndView modelAndView = new ModelAndView(fileName);
//        modelAndView.addObject("map", SpringUtils.getParameters(request));
//        return modelAndView;
//    }

    /**
     * 刷新系统参数
     *
     * @param response
     */
    @RequestMapping("refreshCache")
    public void refreshCache(HttpServletResponse response) {
        systemParam.refreshCache();
        sysUserUtil.refreshModuleCache();
        SpringUtils.renderJson(response, Constants.SUCCESS);
    }


    /**
     * 后台首页查询还款总数
     *
     * @return
     */
    @RequestMapping("toRemind")
    public void queryUserList(HttpServletRequest request, HttpServletResponse response) throws
            UnsupportedEncodingException {
        String uuid = request.getParameter("uuid"); // 当前登陆用户的UUID
//        Long result = loanService.queryRepayDayConut("0");

        Integer  totalCount  = workFlowService.querytodoListAll(uuid);

        /* return */
        Map<String, Object> map = new HashMap<>();
//        map.put("repayCount", result);
        map.put("totalCount", totalCount);
        SpringUtils.renderJson(response, map);
    }


    /**
     * 后台首页查询需还款总笔数
     *
     * @return
     */
    @RequestMapping("queryRepaymentCount")
    @ResponseBody
    public String queryTodayCount(HttpServletRequest request) {

        String endTime = request.getParameter("type");
        Long result = 0L;
//        Long result = loanService.queryRepayDayConut(endTime);

        return result.toString();
    }

    @RequestMapping("queryPlatFormInfo")
    @ResponseBody
    public String queryPlatFormInfo(HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute(Constants.AUTH_USER);
        HomePageBean homePageBean = indexService.queryPlatFormInfo(user);
        return JsonUtil.toJsonByJackson(homePageBean);
    }


    /**
     * 后台首页当前公司下的用户总数
     *
     * @param request
     * @return
     */
    @RequestMapping("/queryUserCount")
    @ResponseBody
    public String queryUserCount(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute(Constants.AUTH_USER);
        List result = userService.getUserListByCompanyId(user.getCompanyId());
        int count = result.size();
        return count + "";
    }

    @RequestMapping(value = "getSysParameter", produces ="text/html;charset=UTF-8")
    @ResponseBody
    public String getSysParameter(HttpServletRequest request) {
        String retVal = "";
        String sysKey = request.getParameter("sysKey");
        User user = sysUserUtil.getSessionLoginUser();
        String cost = systemParam.getSystemParam(user.getCompanyId(), sysKey.toUpperCase());
        if (Constants.GPS_MONTH_COST.equals(sysKey.toUpperCase())) {
            retVal = "首次支付" + systemParam.getSystemParam(user.getCompanyId(), Constants
                    .GPS_MONTH_RENT_COST) + "元, 按月支付租金：" + cost + "元";
        } else if (Constants.GPS_ONCE_COST.equals(sysKey.toUpperCase())){
            retVal = "一次买断支付" + cost + "元";
        }
        return retVal;
    }
}
