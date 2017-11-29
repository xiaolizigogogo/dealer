package com.utonw.utonerp.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.utonw.dealer.api.dto.request.erp.SetModalInfo;
import com.utonw.dealer.api.entity.RateConfig;
import com.utonw.dealer.api.service.ILoanServiceCSD;
import com.utonw.dealer.api.util.erp.Constants;
import com.utonw.utonbase.core.erpcommon.utils.SpringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 参数设置
 * Created by SEELE on 2017/9/14.
 */
@RequestMapping("/setting")
@Controller
public class ParameterSettingController {
    @Reference(version = "1.0.0")
    ILoanServiceCSD iLoanServiceCSD;

    @RequestMapping("/systemParameterSetting")
    public void getParameterSetting(HttpServletRequest request, HttpServletResponse response){
        try {
            List<RateConfig> rateConfigs =iLoanServiceCSD.selectParameterSetting();
            SpringUtils.renderJson(response, rateConfigs);
        }catch (Exception e){
            e.printStackTrace();
        }

    }
    @RequestMapping("/{type}")
    public  void  addParameterSetting(HttpServletResponse response, @RequestBody SetModalInfo setModalInfo, @PathVariable("type") String type){
        try {
            if (type.equals("add")) {
                iLoanServiceCSD.addFinancingRate(setModalInfo.getDayRange(), setModalInfo.getRate());
                SpringUtils.renderJson(response, Constants.SUCCESS);
            }else {
                iLoanServiceCSD.updateFinancingRate(setModalInfo.getDayRange(), setModalInfo.getRate(),setModalInfo.getId(),true);
                SpringUtils.renderJson(response, Constants.SUCCESS);
            }
        }catch (Exception e){
            e.printStackTrace();
            SpringUtils.renderJson(response, Constants.FAILURE);
        }

    }
    
    @RequestMapping("/delete/{id}")
    public  void  delete(HttpServletResponse response, @PathVariable("id") Integer id ){
        try {
            iLoanServiceCSD.updateFinancingRate(null, null, id, false);
            SpringUtils.renderJson(response, Constants.SUCCESS);
        }catch (Exception e){
            e.printStackTrace();
        }

    }


}
