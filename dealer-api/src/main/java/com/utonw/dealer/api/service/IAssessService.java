package com.utonw.dealer.api.service;

import com.utonw.dealer.api.dto.CarDTO;
import com.utonw.dealer.api.entity.Assess;

import java.util.Map;

/**
 * Created by SEELE on 2017/5/5.
 */
public interface IAssessService {
    Map<String,Object> resetParts(CarDTO carDTO)  throws Exception;


    Map<String,Object> getAssess(String id);
}
