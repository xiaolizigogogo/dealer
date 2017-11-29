package com.utonw.dealer.api.dto;

import java.awt.*;
import java.io.Serializable;
import java.util.List;

/**
 * Created by WANGYJ on 2017/5/9.
 */
public class MerchantAplInfoDTO implements Serializable{
    private static final long serialVersionUID = -6285314012778563633L;
    //合同相关信息
    private List<ContractDTO> contractDTO;
    //车商及评估结果信息
    private MerchantInfoDTO  merchantInfoDTO;
    //评估师相关信息
    private AppraiserDTO appraiserDTO;
   //申请表相关信息
    private MerchantApplyAuditDTO merchantApplyAuditDTO;

    public MerchantApplyAuditDTO getMerchantApplyAuditDTO() {
        return merchantApplyAuditDTO;
    }

    public void setMerchantApplyAuditDTO(MerchantApplyAuditDTO merchantApplyAuditDTO) {
        this.merchantApplyAuditDTO = merchantApplyAuditDTO;
    }

    public List<ContractDTO> getContractDTO() {
        return contractDTO;
    }

    public void setContractDTO(List<ContractDTO> contractDTO) {
        this.contractDTO = contractDTO;
    }
    public MerchantInfoDTO getMerchantInfoDTO() {
        return merchantInfoDTO;
    }

    public void setMerchantInfoDTO(MerchantInfoDTO merchantInfoDTO) {
        this.merchantInfoDTO = merchantInfoDTO;
    }

    public AppraiserDTO getAppraiserDTO() {
        return appraiserDTO;
    }

    public void setAppraiserDTO(AppraiserDTO appraiserDTO) {
        this.appraiserDTO = appraiserDTO;
    }
}
