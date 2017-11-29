package com.utonw.utonbase.core.erpcommon.utils;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.*;

/**
 * json 格式输入 公用
 * SpringUtils.java
 * 2013-12-6
 */
public class SpringUtils {

    // header 常量定义
    private static final String ENCODING_PREFIX = "encoding";
    private static final String NOCACHE_PREFIX = "no-cache";
    private static final String ENCODING_DEFAULT = "UTF-8";
    private static final boolean NOCACHE_DEFAULT = true;
    private static JsonConfig config = new JsonConfig();
    private static Logger logger = LoggerFactory.getLogger(SpringUtils.class);

    // 绕过jsp直接输出文本的函数 //

    /**
     * 得到页面传递的参数封装成map
     */

    public static Map<String, String> getParameters(HttpServletRequest request) {
        Map<String, String> p = new HashMap<String, String>();
        if (request == null) {
            request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
                    .getRequest();
        }
        Map req = request.getParameterMap();
        if ((req != null) && (!req.isEmpty())) {

            Collection keys = req.keySet();
            for (Iterator i = keys.iterator(); i.hasNext(); ) {
                String key = (String) i.next();
                Object value = req.get(key);
                Object v = null;
                if ((value.getClass().isArray())
                        && (((Object[]) value).length > 0)) {
                    v = ((Object[]) value)[0];
                } else {
                    v = value;
                }
                if ((v != null) && ((v instanceof String))) {
                    String s = ((String) v).trim();
                    if (s.length() > 0) {
                        p.put(key, s);
                    }
                }
            }
        }
        return p;
    }

    /**
     * 直接输出内容的简便函数.
     */
    public static void render(HttpServletResponse response, final String contentType, final
    String content, final String... headers) {
        try {
            // 分析headers参数
            String encoding = ENCODING_DEFAULT;
            boolean noCache = NOCACHE_DEFAULT;
            for (String header : headers) {
                String headerName = StringUtils.substringBefore(header, ":");
                String headerValue = StringUtils.substringAfter(header, ":");

                if (StringUtils.equalsIgnoreCase(headerName, ENCODING_PREFIX)) {
                    encoding = headerValue;
                } else if (StringUtils.equalsIgnoreCase(headerName, NOCACHE_PREFIX)) {
                    noCache = Boolean.parseBoolean(headerValue);
                } else
                    throw new IllegalArgumentException(headerName + "不是一个合法的header类型");
            }
            // 设置headers参数
            String fullContentType = contentType + ";charset=" + encoding;
            response.setContentType(fullContentType);
            if (noCache) {
                response.setHeader("Pragma", "No-cache");
                response.setHeader("Cache-Control", "no-cache");
                response.setDateHeader("Expires", 0);
            }

            response.getWriter().write(content);
            response.getWriter().flush();
	        response.getWriter().close();
        } catch (IOException e) {
            logger.error(e.getMessage(), e);
        }
    }

    /**
     * 直接输出文本.
     */
    public static void renderText(HttpServletResponse response, final String text, final
    String... headers) {
        render(response, "text/plain", text, headers);
    }

    /**
     * 直接输出HTML.
     */
    public static void renderHtml(HttpServletResponse response, final String html, final
    String... headers) {
        render(response, "text/html", html, headers);
    }

    /**
     * 直接输出XML.
     */
    public static void renderXml(HttpServletResponse response, final String xml, final String...
            headers) {
        render(response, "text/xml", xml, headers);
    }

    /**
     * 直接输出JSON格式
     *
     * @param string json字符串.
     */
    public static void renderJson(HttpServletResponse response, final String string, final
    String... headers) {
        render(response, "application/json", string, headers);
    }

    /**
     * 直接输出JSON.
     * <p/>
     * 将Map对象,将被转化为json字符串.
     */
    @SuppressWarnings("unchecked")
    public static void renderJson(HttpServletResponse response, final Map map, final String...
            headers) {
        config.registerJsonValueProcessor(Date.class, new DateJsonValueProcessor("yyyy-MM-dd " +
                "HH:mm:ss"));
        config.registerJsonValueProcessor(Timestamp.class, new DateJsonValueProcessor("yyyy-MM-dd" +
                " HH:mm:ss"));
        config.registerJsonValueProcessor(BigDecimal.class, new BigDecimalJsonValueProcessor("#0" +
                ".00"));
        String jsonString = JSONObject.fromObject(map, config).toString();
        renderJson(response, jsonString, headers);
    }

    /**
     * 直接输出JSON.  Java对象,将被转化为json字符串.
     */
    public static void renderJson(HttpServletResponse response, final Object object, final
    String... headers) {
        config.registerJsonValueProcessor(Date.class, new DateJsonValueProcessor("yyyy-MM-dd " +
                "HH:mm:ss"));
        config.registerJsonValueProcessor(Timestamp.class, new DateJsonValueProcessor("yyyy-MM-dd" +
                " HH:mm:ss"));
        config.registerJsonValueProcessor(BigDecimal.class, new BigDecimalJsonValueProcessor("#0" +
                ".00"));
        String jsonString = JSONObject.fromObject(object, config).toString();
        renderJson(response, jsonString, headers);
    }

    /**
     * list 输出json
     * 2013-12-12
     * cjx
     */
    public static void renderJson(HttpServletResponse response, final List object, final
    String... headers) {
        config.registerJsonValueProcessor(Date.class, new DateJsonValueProcessor("yyyy-MM-dd " +
                "HH:mm:ss"));
        config.registerJsonValueProcessor(Timestamp.class, new DateJsonValueProcessor("yyyy-MM-dd" +
                " HH:mm:ss"));
        config.registerJsonValueProcessor(BigDecimal.class, new BigDecimalJsonValueProcessor("#0" +
                ".00"));
        JSONArray json = JSONArray.fromObject(object, config);
        renderJson(response, json.toString(), headers);
    }
}
