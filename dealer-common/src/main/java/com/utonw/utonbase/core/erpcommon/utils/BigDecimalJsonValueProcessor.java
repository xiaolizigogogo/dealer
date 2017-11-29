package com.utonw.utonbase.core.erpcommon.utils;

import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;

import java.text.DecimalFormat;


/**
 * 类说明
 *
 * @简述： 数字型 处理器
 * @作者：
 * @版本： 1.0
 * @邮箱：
 * @修改时间：2014-3-27 下午12:16:24
 */
public class BigDecimalJsonValueProcessor implements JsonValueProcessor {

    public static final String Default_DECIAML_PATTERN = "#0.00";
    private DecimalFormat decimalFormat;

    /**
     *
     */
    public BigDecimalJsonValueProcessor(String datePattern) {
        try {
            decimalFormat = new DecimalFormat(datePattern);
        } catch (Exception e) {
            decimalFormat = new DecimalFormat(Default_DECIAML_PATTERN);
        }
    }

    /*
     * (non-Javadoc)
     *
     * @see
     * net.sf.json.processors.JsonValueProcessor#processArrayValue(java.lang
     * .Object, net.sf.json.JsonConfig)
     */
    @Override
    public Object processArrayValue(Object value, JsonConfig jsonConfig) {
        return process(value);
    }

    /*
     * (non-Javadoc)
     *
     * @see
     * net.sf.json.processors.JsonValueProcessor#processObjectValue(java.lang
     * .String, java.lang.Object, net.sf.json.JsonConfig)
     */
    @Override
    public Object processObjectValue(String key, Object value,
                                     JsonConfig jsonConfig) {
        return process(value);
    }

    private Object process(Object value) {
        if (value == null) {
            return "";
        } else {
            return decimalFormat.format(value);
        }
    }

}
