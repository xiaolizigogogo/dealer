package com.utonw.utonerp.interceptor;


import com.utonw.dealer.api.entity.erp.User;
import com.utonw.dealer.api.util.erp.Constants;
import com.utonw.utonbase.core.erpcommon.config.ParamterControl;
import org.apache.log4j.Logger;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * 后台管理拦截器
 * Created by user on 15-6-4.
 */
public class AdminContextInterceptor extends HandlerInterceptorAdapter {

    Logger logger = Logger.getLogger(AdminContextInterceptor.class);

    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response, Object handler)
            throws Exception {
        String uri = request.getRequestURI();
        if (uri.endsWith("login.html") || uri.endsWith("loginHtml.html") || uri.equals("" +
                "/errorHandler/404") || uri.equals("/errorHandler/500") || uri.startsWith
                ("/api/user/login") || uri.startsWith("/api/distribution/") || uri.startsWith
                ("/api/repayPlan")|| uri.startsWith("/financeManager/getUserCommissonFee")
                || uri.startsWith("/mail/sendmail") || uri.startsWith("/mail/tesetpassword.html")
                || uri.startsWith("/loan/forgetpassword.html") || uri.startsWith("/loan/modifypassword.html")
                || uri.startsWith("/loan/forgetpasswordtelephone.html")|| uri.startsWith("/user/sendMessagePassword")||
                uri.startsWith("/loan/updatePasswordByMobile.html")||uri.startsWith("/loan/updatePasswordByMobiletoupdate")
                ||uri.startsWith("/user/compareverifiCode")||uri.startsWith("/loan/updatepasswordformobile.html")
                ||uri.startsWith("/user/updatethePassword")||uri.startsWith("/loan/forget.html")||uri.startsWith("/error")) {
            return true;
        }

        if (uri.contains("/api/")) {
            /*String token = request.getHeader("token");
            logger.debug("token:" + token);
            User user = SysUserMap.userMap.get(token);
            if (user == null) {
                logger.debug("未登录.....");
                BaseResponseEntity<Object> responseEntity = new BaseResponseEntity<>();
                responseEntity.setRetCode(ResponseCode.NO_LOGIN);
                responseEntity.setMessage("未登录");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(JsonUtil.toJsonByJackson(responseEntity));
                return false;
            }*/

            return true;
        }

        if (request.getSession().getAttribute(Constants.AUTH_USER) == null) {
            logger.debug("登录检查，未登录，跳转登录页面....");
            // 跳转登录页面
            response.sendRedirect("/admin/user/login.html");
            return false;
        }



        HttpSession session = request.getSession();
        User user = (User) session.getAttribute(Constants.AUTH_USER);
//        if (session.getAttribute(Constants.AUTH_USER) == null) {
//            response.sendRedirect(request.getContextPath() + "/other/toLogin");
//            return false;
//        }
        String LoginRepeat = ParamterControl.REPEAT_LOGIN;
        //多用户登录限制判断,并给出提示信息
        if(LoginRepeat.equals("n")){
        boolean isLogin = false;
        if (user != null) {
            Map<String, String> loginUserMap =  (Map<String, String>) request.getSession().getServletContext().getAttribute("loginUserMap");
            String sessionId = session.getId();
            for (String key : loginUserMap.keySet()) {
                //用户已在另一处登录
                if (key.equals(user.getIdCard()) && !loginUserMap.containsValue(sessionId)) {
                    isLogin = true;
                    break;
                }
            }
        }
        if (isLogin) {
         //   Map<String, String> loginOutTime = (Map<String, String>) session.getServletContext().getAttribute("loginOutTime");
        	 logger.debug("此账号已在另一地点登陆，您被迫下线。如果不是本人操作，请您及时修改密码。");
        	 //清除当前用户session
        	 session.invalidate();
             // 跳转登录页面
             response.sendRedirect("/login.html");
             return false;
        }
       }
        return true;
    }
}

