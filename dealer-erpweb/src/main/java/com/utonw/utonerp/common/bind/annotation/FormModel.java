package com.utonw.utonerp.common.bind.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * <p>绑定请求参数到模型，并且暴露到模型中供页面使用</p>
 * <p>不同于@ModelAttribute</p>
 */
@Target({ElementType.PARAMETER})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface FormModel {

    /**
     * 指定请求参数的前缀和暴露到模型对象的名字供视图使用
     */
    String value();

}
