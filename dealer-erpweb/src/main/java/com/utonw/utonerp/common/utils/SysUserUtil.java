package com.utonw.utonerp.common.utils;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.alibaba.dubbo.config.annotation.Reference;
import com.utonw.dealer.api.entity.erp.ModuleManageTree;
import com.utonw.dealer.api.entity.erp.User;
import com.utonw.dealer.api.service.erp.IUserService;
import com.utonw.dealer.api.util.erp.Constants;
import com.utonw.utonbase.core.erpcommon.utils.CacheUtil;
import com.utonw.utonbase.core.erpcommon.utils.TreeUtil;

/**
 * 系统用户工具类
 * Created by fuyung on 15-7-8.
 */
@Component
public class SysUserUtil {

    static Logger logger = LoggerFactory.getLogger(SysUserUtil.class);

    @Reference(version = "1.0.0")
    private IUserService userService;

    /**
     * 获取当前登陆用户信息
     *
     * @return User
     */
    public  User getSessionLoginUser() {
        if (getSession() == null) {
            throw new RuntimeException("get session is null");
        }
        return (User) getSession().getAttribute(Constants.AUTH_USER);
    }

    public  HttpSession getSession() {
        if (getCurRequest() != null) {
            return getCurRequest().getSession();
        }
        return null;
    }

    /**
     * 获得当前的request
     */
    public HttpServletRequest getCurRequest() {
        RequestAttributes requestAttributes = RequestContextHolder.currentRequestAttributes();
        if (requestAttributes != null && requestAttributes instanceof ServletRequestAttributes) {
            ServletRequestAttributes servletRequestAttributes = (ServletRequestAttributes)
                    requestAttributes;
            return servletRequestAttributes.getRequest();
        }
        return null;
    }

    /**
     * 获取登陆用户所拥有的模块
     *
     * @return <code>List<ModuleManageTree></code>
     */
    public List<ModuleManageTree> getModule(Integer parentModuleId) {
        User user = getSessionLoginUser();

        /** 缓存中的key值：UserModule+用户UUID+_模块名称 */
        String cacheKey = Constants.USER_MODULE + user.getUuid() + "_" + (parentModuleId == null
                ? "" : parentModuleId);

        List<ModuleManageTree> list = CacheUtil.get(Constants.SYS_MODULE_CACHE, cacheKey);

        if (list == null) {
            logger.debug("cacheKey=["+ cacheKey + "] no cache");
            /** 查询出登录用户所拥有的模块列表 */
            list = userService.findMyModule(user.getUuid(), parentModuleId);

            TreeUtil<ModuleManageTree> node = new TreeUtil<>();
            node.createTree(list);

            CacheUtil.put(Constants.SYS_MODULE_CACHE, cacheKey, list);
        }
        return list;
    }
    public  String refreshModuleCache(){
        User user = getSessionLoginUser();
        CacheUtil.clear(Constants.SYS_MODULE_CACHE);
        /** 缓存中的key值：UserModule+用户UUID+_模块名称 */
        String cacheKey = Constants.USER_MODULE + user.getUuid() + "_";

        /** 查询出登录用户所拥有的模块列表 */
        List<ModuleManageTree> list = userService.findMyModule(user.getUuid(), null);
        TreeUtil<ModuleManageTree> node = new TreeUtil<>();
        node.createTree(list);
        CacheUtil.put(Constants.SYS_MODULE_CACHE, cacheKey, list);
        return  Constants.SUCCESS;
    }
}
