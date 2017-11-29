package com.utonw.dealer.base.controller;

import java.util.Date;

import com.utonw.dealer.base.response.JsonResponse;

/**
 * Created by SEELE on 2017/4/18.
 */
public class BaseController {
    public JsonResponse response(String retCode, String retMsg, Object data){
        JsonResponse jsonResponse = new JsonResponse();
        jsonResponse.setTimestamp(new Date());
        jsonResponse.setRetCode(retCode);
        jsonResponse.setRetMsg(retMsg);
        jsonResponse.setData(data);
        return jsonResponse;
    }
}
