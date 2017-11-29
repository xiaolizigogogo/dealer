package com.utonw.dealer.api.service.erp;


import com.utonw.dealer.api.entity.erp.HomePageBean;
import com.utonw.dealer.api.entity.erp.User;

/**
 * 首页service
 * Created by fuyung on 15-7-7.
 */
public interface IIndexService {

    /**
     * 查询平台动态信息
     *
     * @return HomePageBean
     */
    HomePageBean queryPlatFormInfo(User user);
}
