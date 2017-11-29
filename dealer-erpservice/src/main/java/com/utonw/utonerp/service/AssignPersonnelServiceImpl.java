package com.utonw.utonerp.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.utonw.dealer.api.entity.TDistributionRfid;
import com.utonw.dealer.api.service.AssignPersonnelService;
import com.utonw.utonerp.mapper.TDistributionRfidMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @author mwc
 * Created by SEELE on 2017/9/26.
 */
@Service(version="1.0.0")
public class AssignPersonnelServiceImpl implements AssignPersonnelService {
    @Autowired
    TDistributionRfidMapper tDistributionRfidMapper;

    @Override
    public List<TDistributionRfid> getTDistributionRfid(String uuid) {
     List<TDistributionRfid> tDistributionRfids  = tDistributionRfidMapper.selecttDistributionRfidList(uuid);
        return tDistributionRfids;
    }
}
