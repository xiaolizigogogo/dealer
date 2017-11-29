package com.utonw.dealer.api.dto;

import java.io.Serializable;
import java.util.List;

/**
 * Created by SEELE on 2017/4/21.
 */
public class AuditContractDTO implements Serializable {
    private static final long serialVersionUID = 1296392141482155362L;

    private List<String> CameraPicture;//摄像头
    private String acountId;

    public String getAcountId() {
        return acountId;
    }

    public void setAcountId(String acountId) {
        this.acountId = acountId;
    }

    public List<String> getCameraPicture() {
        return CameraPicture;
    }

    public void setCameraPicture(List<String> cameraPicture) {
        CameraPicture = cameraPicture;
    }

}
