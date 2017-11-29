package com.utonw.dealer.service.impl;

import com.alibaba.dubbo.common.utils.StringUtils;
import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.dubbo.config.annotation.Service;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.github.pagehelper.PageHelper;
import com.utonw.dealer.api.dto.BankCarDel;
import com.utonw.dealer.api.dto.BankCardAndMerchantDTO;
import com.utonw.dealer.api.dto.BankCardDTO;
import com.utonw.dealer.api.entity.BankCard;
import com.utonw.dealer.api.entity.CompleteRequest;
import com.utonw.dealer.api.enums.CarDealerApplyEnum;
import com.utonw.dealer.api.service.IBankCarService;
import com.utonw.dealer.api.service.IOrderServiceCSD;
import com.utonw.dealer.api.service.IWorkFlowServiceCSD;
import com.utonw.dealer.api.util.BankUtil;
import com.utonw.dealer.mapper.BankCardMapper;
import com.utonw.dealer.mapper.MerchantApplyMapper;
import com.utonw.dealer.api.entity.MerchantApply;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by SEELE on 2017/5/8.
 */
@Service(version = "1.0.0",timeout = 1500000)
public class BankCardServiceImpl  extends ServiceImpl<MerchantApplyMapper, MerchantApply> implements IBankCarService {
    private static final Logger logger = LoggerFactory.getLogger("MerchantApplyServiceImpl.class");
    @Reference(version="1.0.0",timeout = 1500000)
    IWorkFlowServiceCSD workFlowServiceCSD;
    @Autowired
    BankCardMapper bankCardMapper;
    @Override
    public  Map<String,Object> addBankcard(BankCardDTO bankCardDTO,String account) {
        logger.info("进入addBankcard方法");
         Map<String,Object> result = new HashMap<>();
         String id = bankCardDTO.getAcountId();
         logger.info("传入的acountId:"+id);
         BankCard   bankCard = new BankCard();
         List<BankCard> bank  = bankCard.selectList(new EntityWrapper<BankCard>().eq("acount_id",account));
        if (bank.size()!= 0){
         for (int i=0; i<bank.size();i++) {
             if (bank.get(i).getCardstate().toString().equals(bankCardDTO.getCard_state())){
                 result.put("retCode","9999");
                 result.put("retMsg","重复提交");
                 return result;
             }
         }
        }
         String name = BankUtil.getNameOfBank(bankCardDTO.getBank_number());
        if (StringUtils.isEmpty(name)){
            result.put("retCode","9999");
            result.put("retMsg","卡号无效");
            return result;
        }
         bankCard.setAcountId(Long.valueOf(account));
         bankCard.setBanknumber(bankCardDTO.getBank_number());
         bankCard.setCardtype(bankCardDTO.getCard_type());
         bankCard.setCardholder(bankCardDTO.getCardholder());
         bankCard.setCardstate(Integer.parseInt(bankCardDTO.getCard_state()));
         bankCard.setBankname(name.substring(0,name.lastIndexOf("·")));
         bankCard.setCreateddata(new Date());
         if(id.equals(null)) {
             bankCard.setUpdateby(Long.valueOf(id));
         }
         bankCard.insert();
         result.put("retCode","0000");
         result.put("retMsg","绑定成功");
        return result;
    }

    @Override
    public List getBankCard(String id) {
        logger.info("进入getBankCard方法");
        logger.info("传入的acountId:+"+id);
        BankCard   bankCard = new BankCard();
        List<BankCard> bank = bankCard.selectList(new EntityWrapper<BankCard>().eq("acount_id",id));
        return bank;
    }

    @Override
    public Map<String, Object> delBankcard(BankCarDel bankCarDel) {
        logger.info("进入delBankcard方法");
        Map<String,Object> result = new HashMap<>();
        String id = bankCarDel.getAcountId();
        logger.info("删除的acountId:"+id);
        BankCard   bankCard = new BankCard();
        Integer cardState = Integer.parseInt(bankCarDel.getCardState());
        bankCard.delete(new EntityWrapper<BankCard>().eq("acount_id",id).eq("cardstate",cardState));
        result.put("retCode","0000");
        result.put("retMsg","删除成功");
        return result;
    }

    @Override
    public Map<String, Object> getAccountTaskId(String applyId){
        logger.info("进入getAccountTaskId方法");
        Map<String,Object> result = new HashMap<>();
        try {
            MerchantApply merchantApply2 = new MerchantApply();
            merchantApply2.setSubmitstate(3);
            merchantApply2.update(new EntityWrapper<MerchantApply>().eq("acountId",applyId));
            MerchantApply merchantApply = new MerchantApply();
            merchantApply  = merchantApply.selectOne(new EntityWrapper<MerchantApply>().eq("acountId",applyId));
            CompleteRequest completeRequest = new CompleteRequest();
            completeRequest.setApplyId(merchantApply.getId());
            completeRequest.setTaskKey(CarDealerApplyEnum.bind_bankCard.name());
            workFlowServiceCSD.completeEnd(completeRequest);
            result.put("retCode","0000");
            result.put("retMsg","请求成功");
            return result;
        }catch (Exception e){
             e.printStackTrace();
            result.put("retCode","0000");
            result.put("retMsg","请求成功");
            return result;
        }

    }

    @Override
    public List<BankCardAndMerchantDTO> getMerchantBankCard(Map param) {
        PageHelper.startPage(
                Integer.valueOf(param.get("pageNum").toString()),Integer.valueOf(param.get("pageSize").toString()));
        return bankCardMapper.selectMerchantBankCard(param);
    }

    @Override
    public Boolean modifyBankCardNumber(Map param) {
        BankCard bankCard = new BankCard();
        bankCard.selectById(new EntityWrapper<BankCard>().eq("id",param.get("id")));
        bankCard.setBanknumber(param.get("bankNumber").toString());
        return bankCard.updateById();
    }
}
