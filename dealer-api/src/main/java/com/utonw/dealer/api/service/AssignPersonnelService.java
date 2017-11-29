package com.utonw.dealer.api.service;

import com.utonw.dealer.api.entity.TDistributionRfid;

import java.util.List;

/**
 * Created by SEELE on 2017/9/26.
 */
public interface AssignPersonnelService {
    List<TDistributionRfid> getTDistributionRfid(String uuid);
}
