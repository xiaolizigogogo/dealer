package com.utonw.dealer.api.service;

/**
 * Created by SEELE on 2017/10/9.
 */
public interface ObdService {
    /**
     * @Description: AFS解除OBD绑定接口
     * @param apllyId
     * @param @return    设定文件
     * @return Boolean   返回类型
     * @throws
     * @author mwc
     */
    Boolean UnbundlingOBD(String apllyId);

}
