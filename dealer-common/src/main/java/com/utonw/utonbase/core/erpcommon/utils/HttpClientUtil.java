package com.utonw.utonbase.core.erpcommon.utils;

import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * HttpClient
 * Created by Vic on 2016/2/19.
 */
public class HttpClientUtil {

    public static String post(String url, Map<String, String> paramMap) throws
            UnsupportedEncodingException {
        CloseableHttpClient httpclient = HttpClients.createDefault();

        HttpPost httpPost = new HttpPost(url);
        List<NameValuePair> nvps = new ArrayList<>();
        for (String key : paramMap.keySet()) {
            nvps.add(new BasicNameValuePair(key, paramMap.get(key)));
        }
        httpPost.setEntity(new UrlEncodedFormEntity(nvps));
        String retStr;
        try (CloseableHttpResponse response2 = httpclient.execute(httpPost)) {
            System.out.println("response status:" + response2.getStatusLine());
            HttpEntity entity = response2.getEntity();
            retStr = EntityUtils.toString(entity, Charset.forName("UTF-8"));
            EntityUtils.consume(entity);
            return retStr;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
        //Map<String, String> paramMap = new HashMap<>();
        //paramMap.put("orderId", "1234");
        //paramMap.put("charge", "10000");
        //paramMap.put("periods", "2");
        //try {
        //    HttpClientUtil.post("http://202.103.190.101/car/notifyCharge", paramMap);
        //} catch (UnsupportedEncodingException e) {
        //    e.printStackTrace();
        //}
        Map<String, String> paramMap = new HashMap<>();
        paramMap.put("userName", "1234");
        paramMap.put("password", "123");
        try {
            System.out.println(HttpClientUtil.post("http://120.25.126.86:8889/api/user/login",
                    paramMap));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }
}