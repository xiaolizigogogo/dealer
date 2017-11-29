package com.utonw.dealer.api.dto;

import java.io.Serializable;

/**
 * Created by SEELE on 2017/4/21.
 */
public class ApplyDTO implements Serializable {
    private static final long serialVersionUID = 5943293066269574079L;
    private ApplyMoneyDTO applyMoneyDTO;
    private ImageDTO imageDTO;
    private String applyState;
    
    public String getApplyState() {
		return applyState;
	}

	public void setApplyState(String applyState) {
		this.applyState = applyState;
	}

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
}
