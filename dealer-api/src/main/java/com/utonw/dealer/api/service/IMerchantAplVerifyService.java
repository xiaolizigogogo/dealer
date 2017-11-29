package com.utonw.dealer.api.service;

import com.baomidou.mybatisplus.service.IService;
import com.utonw.dealer.api.dto.ApplyVerifyDTO;
import com.utonw.dealer.api.dto.CompanyDetailsDTO;
import com.utonw.dealer.api.dto.TrialReivewDTO;
import com.utonw.dealer.api.dto.request.MerchantLoanAplRequest;
import com.utonw.dealer.api.entity.MerchantApply;

import java.util.Map;

/**
 * Created by WANGYJ on 2017/5/8.
 */
public interface IMerchantAplVerifyService extends IService<MerchantApply> {
    Map<String,Object> updateMerchantAplVerify(ApplyVerifyDTO applyVerifyDTO) throws  Exception;
    Map<String,Object> submitOrderTrialReview(TrialReivewDTO trialReivewDTO);
    Map<String,Object> getMerchantInfoByIndentId(MerchantLoanAplRequest merchantLoanAplRequest);
    Map<String,Object> queryCompanyDetails(CompanyDetailsDTO companyDetailsDTO);
    Map<String,Object> queryCarDetails(String productId);
}
