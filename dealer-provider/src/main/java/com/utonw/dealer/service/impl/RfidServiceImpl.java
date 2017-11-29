package com.utonw.dealer.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.utonw.dealer.api.entity.CarsokAcount;

import com.utonw.dealer.api.entity.MerchantApply;
import com.utonw.dealer.api.service.RfidService;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author mwe
 * Created by SEELE on 2017/9/26.
 */
@Transactional
@Service(version = "1.0.0", timeout = 1500000)
public class RfidServiceImpl implements RfidService{
    @Override
    public CarsokAcount getAcountList(String id) {
        CarsokAcount acount =new CarsokAcount();
        acount = acount.selectOne(new EntityWrapper<CarsokAcount>().in("id",id));
        return acount;
    }

    @Override
    public MerchantApply geterchantApply(String acount) {
        MerchantApply merchantApplys = new MerchantApply();
        merchantApplys =  merchantApplys.selectOne(new EntityWrapper<com.utonw.dealer.api.entity.MerchantApply>().eq("acountId",acount));
        return merchantApplys;
    }
}
