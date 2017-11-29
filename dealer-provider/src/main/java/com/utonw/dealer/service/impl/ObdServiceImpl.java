package com.utonw.dealer.service.impl;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.dubbo.config.annotation.Service;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.utonw.dealer.api.entity.MerchantIndent;
import com.utonw.dealer.api.service.ObdService;
import com.utonw.obd.api.model.CarObd;
import com.utonw.obd.api.server.IAppOBDService;
import com.utonw.obd.api.server.OBDService;
import com.utonw.obd.util.result.Response;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * Created by SEELE on 2017/10/9.
 */
@Service(version="1.0.0",timeout = 1500000)
public class ObdServiceImpl implements ObdService {
    private static final Logger logger = LoggerFactory.getLogger("ObdServiceImpl.class");
    @Reference(version="0.1.0",timeout = 150000,check = false)
    IAppOBDService appOBDService;
    @Reference(version="0.1.0",timeout = 150000,check = false)
    OBDService obdService;
    @Override

    public Boolean UnbundlingOBD(String apllyId) {
        logger.info("【传入订单id】："+apllyId);
        MerchantIndent merchantIndent = new MerchantIndent();
        merchantIndent = merchantIndent.selectOne(new EntityWrapper<MerchantIndent>().eq("id",apllyId));
        Response<CarObd> carObd = obdService.getCarObd(apllyId,merchantIndent.getPlatenumber());
        Response response=   appOBDService.unbundlingObd(apllyId,merchantIndent.getPlatenumber(),carObd.getData().getVin());
        logger.info("【返回结果】："+response.getData());
        return (Boolean) response.getData();
    }
}
