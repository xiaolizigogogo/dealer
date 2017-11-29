package com.utonw.utonerp.controller;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.github.pagehelper.PageInfo;
import com.utonw.obd.api.dto.CarInspectionDto;
import com.utonw.obd.api.model.CarInspectionResponse;
import com.utonw.obd.api.server.CarInspectionRecordsService;
import com.utonw.utonbase.core.erpcommon.utils.SpringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.dubbo.config.annotation.Reference;
import com.utonw.dealer.api.service.erp.CarInspectionSelectUserNameService;

/**
 * 
 * @author Wangyan
 *
 */
@RestController
@RequestMapping("/carInspection")
public class CarInspectionController {
    @Reference(version = "0.1.0",check=false)
	CarInspectionRecordsService carInspectionRecordsService;
    @Reference(version = "1.0.0")
    CarInspectionSelectUserNameService carInspectionSelectUserNameService;
    @RequestMapping(value="/supervisionsList" , method = RequestMethod.POST)
    public  void selectSupervisions(@RequestBody CarInspectionDto carInspectionDto, HttpServletResponse response){
    	try{
    		PageInfo<CarInspectionResponse> resultPage = carInspectionRecordsService.selectCarInspectionRecords(carInspectionDto.getDealerId(),carInspectionDto.getPatrolStartTime(),
    												carInspectionDto.getPatrolEndTime(),carInspectionDto.getPageNum(),carInspectionDto.getPageSize());
    		List<CarInspectionResponse> list = resultPage.getList();
    		for(CarInspectionResponse cir : list){
    			cir.setPatrolAccountId(carInspectionSelectUserNameService.selectUserNameById(Integer.valueOf(cir.getPatrolAccountId())));
    		}
    		SpringUtils.renderJson(response,resultPage);
    	}catch(Exception e){
			e.printStackTrace();
			SpringUtils.renderJson(response,e.getMessage());
    	}
    }
}
