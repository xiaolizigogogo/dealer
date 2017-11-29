package com.utonw.utonbase.core.erpcommon.controller;

import com.utonw.dealer.api.entity.erp.User;
import com.utonw.dealer.api.util.erp.Constants;
import com.utonw.utonbase.core.erpcommon.Editor.DoubleEditor;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * controller 基类
 * Created by user on 2015/5/29.
 */
public class BaseController {

    /**
     * SpringMVC bean无法绑定java.util.Date和double类型的数据时，需要在InitBinder前对数据进行处理
     *
     * @param binder binder
     */
    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
        binder.registerCustomEditor(Double.class, new DoubleEditor());
    }


    public User getCurrentUser(HttpServletRequest request){
        User user = (User) request.getSession().getAttribute(Constants.AUTH_USER);
        return user;
    }



}
