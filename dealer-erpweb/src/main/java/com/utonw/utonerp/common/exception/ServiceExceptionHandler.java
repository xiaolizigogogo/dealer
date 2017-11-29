package com.utonw.utonerp.common.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by WANGYJ on 2017/10/31.
 */
//@ControllerAdvice
//public class ServiceExceptionHandler {
//    public static final String DEFAULT_ERROR_VIEW = "error/error";
//    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
//    @ExceptionHandler(Exception.class)
//    public ModelAndView defaultErrorHandler(HttpServletRequest req, Exception e) throws Exception {
//        ModelAndView mav = new ModelAndView();
//        //页面暂时没有使用，可以不展示
//        mav.addObject("exception", e);
//        mav.addObject("url", req.getRequestURL());
//        mav.setViewName(DEFAULT_ERROR_VIEW);
//        return mav;
//    }
//}
