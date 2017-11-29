package com.utonw.dealer.api.service;

import com.utonw.dealer.api.dto.DealerCarDetailDTO;

public interface CarsokProductService {

	DealerCarDetailDTO selectDealerCarDetail(Integer carId);
}
