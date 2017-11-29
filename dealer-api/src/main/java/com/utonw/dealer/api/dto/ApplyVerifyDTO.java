package com.utonw.dealer.api.dto;

import java.io.Serializable;

/**
 * Created by WANGYJ on 2017/5/8.
 */
public class ApplyVerifyDTO implements Serializable {
    private static final long serialVersionUID = 6154220909516861132L;
    private ApplyMoneyDTO applyMoneyDTO;
    private ImageDTO imageDTO;
    private MerchantVerifyDTO merchantVerifyDTO;

    public ApplyMoneyDTO getApplyMoneyDTO() {
        return applyMoneyDTO;
    }

    public void setApplyMoneyDTO(ApplyMoneyDTO applyMoneyDTO) {
        this.applyMoneyDTO = applyMoneyDTO;
    }

    public ImageDTO getImageDTO() {
        return imageDTO;
    }

    public void setImageDTO(ImageDTO imageDTO) {
        this.imageDTO = imageDTO;
    }

    public MerchantVerifyDTO getMerchantVerifyDTO() {
        return merchantVerifyDTO;
    }

    public void setMerchantVerifyDTO(MerchantVerifyDTO merchantVerifyDTO) {
        this.merchantVerifyDTO = merchantVerifyDTO;
    }
}
