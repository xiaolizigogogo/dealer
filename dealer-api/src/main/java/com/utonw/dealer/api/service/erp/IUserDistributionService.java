package com.utonw.dealer.api.service.erp;

import java.util.List;
import com.utonw.dealer.api.dto.request.erp.CarDistributionRequest;
import com.utonw.dealer.api.entity.erp.UserDistributionInfo;


public interface IUserDistributionService {
	public List<UserDistributionInfo> userDistributionInfo(CarDistributionRequest carDistributionRequest);

}
