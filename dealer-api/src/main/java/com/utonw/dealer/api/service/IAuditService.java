package com.utonw.dealer.api.service;

import com.utonw.dealer.api.dto.AuditContractDTO;

import java.util.Map;

/**
 * Created by SEELE on 2017/5/8.
 */
public interface IAuditService {
    Map<String, Object> getAudit(String acountId);
    Map<String, Object> queryAuditContract(AuditContractDTO auditContractDTO);
    Map<String,Object> delMerchantContract(String id);
    Map<String,Object> getAgreement(String pruductId, String acountId);
    Map<String,Object> deleteAgreement(String contractId);
}
