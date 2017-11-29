package com.utonw.dealer.api.service;

import com.utonw.dealer.api.dto.BankCarDel;
import com.utonw.dealer.api.dto.BankCardDTO;

import java.util.List;
import java.util.Map;

/**
 * Created by SEELE on 2017/5/8.
 */
public interface IBankCarService {
    Map<String,Object> addBankcard(BankCardDTO bankCardDTO,String account);
    List getBankCard(String id);
    Map<String, Object> delBankcard(BankCarDel bankCarDel);
    Map<String,Object>  getAccountTaskId(String applyId);
    List getMerchantBankCard(Map param);
    Boolean modifyBankCardNumber(Map param);
}
