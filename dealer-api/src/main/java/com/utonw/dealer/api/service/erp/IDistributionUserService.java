package com.utonw.dealer.api.service.erp;

import java.util.List;
import com.utonw.dealer.api.dto.request.erp.MerchantInfoTotal;
import com.utonw.dealer.api.entity.erp.DistributionUser;

/**
 * @author zhangzheng
 * @date 2017年10月9日下午2:27:05 分配线下人员
 */
public interface IDistributionUserService {
	public List<DistributionUser> DistributionUser(String location);
	public void setUserInfo(MerchantInfoTotal merchantInfoRequest);
}
