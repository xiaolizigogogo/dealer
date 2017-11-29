package com.utonw.dealer.api.service;


import javax.xml.ws.Response;

/**
 * Created by SEELE on 2017/8/8.
 */
public interface IAppOBDService {
    /**
     * 绑定OBD
     * @param orderId
     * @param plateNumber
     * @return
     */
    Response<Boolean> updateCarObd(String orderId, String plateNumber);
    /**
     * 解绑OBD
     * @param orderId
     * @param plateNumber
     * @return
     */
    Response<Boolean> unbundlingObd(String orderId, String plateNumber);

}
