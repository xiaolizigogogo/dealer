package com.utonw.dealer.api.service;

import com.utonw.dealer.api.entity.CarsokAcount;
import com.utonw.dealer.api.entity.MerchantApply;


import java.util.List;

/**
 * Created by SEELE on 2017/9/26.
 */
public interface RfidService {
   CarsokAcount getAcountList(String id);
   MerchantApply geterchantApply(String acount);
}
