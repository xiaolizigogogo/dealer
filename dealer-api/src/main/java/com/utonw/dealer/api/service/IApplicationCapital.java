package com.utonw.dealer.api.service;

import com.utonw.dealer.api.dto.EvaluationSheetDTO;

import java.io.IOException;
import java.util.Map;
import java.util.Objects;

/**
 * Created by SEELE on 2017/5/9.
 */
public interface IApplicationCapital {
    Map<String,Object> updateFinancing(EvaluationSheetDTO evaluationSheetDTO) throws IOException;
    String  getUploadToken();
    Map<String,Object> selectAcountRegionld();
    Map<String,Object> selsctCarsokInfo(String productId,String acount);
}
