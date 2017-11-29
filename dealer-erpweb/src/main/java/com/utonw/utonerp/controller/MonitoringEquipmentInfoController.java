package com.utonw.utonerp.controller;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.utonw.dealer.api.entity.erp.User;
import com.utonw.dealer.api.util.erp.Constants;
import com.utonw.utonbase.core.erpcommon.utils.SpringUtils;
import com.utonw.utonerp.common.controller.BaseController;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.dubbo.config.annotation.Reference;
import com.github.pagehelper.PageInfo;
import com.utonw.dealer.api.dto.request.CarsokAcountRequest;
import com.utonw.dealer.api.entity.CarsokAcountDTO;
import com.utonw.dealer.api.entity.erp.MonitoringEquipmentInfo;
import com.utonw.dealer.api.service.ICarsokAcountService;
import com.utonw.dealer.api.service.erp.IMonitoringEquipmentInfoService;

@RestController
@RequestMapping("/emi")
public class MonitoringEquipmentInfoController extends BaseController {
	
	@Reference(version="1.0.0")
	IMonitoringEquipmentInfoService iMonitoringEquipmentInfoService;
	
	@Reference(version = "1.0.0")
	ICarsokAcountService iCarsokAcountService;
	
	private Integer defaultPageSize = 15;
	
	@RequestMapping(value="/deleteEmi/{deleteId}" , method = RequestMethod.GET)
	public String deleteEmiById(@PathVariable("deleteId") Integer id , HttpServletResponse response) {
		try {
			iMonitoringEquipmentInfoService.deleteById(id);
			return "0000";
		} catch (Exception e) {
			return "9999";
		}
	}
	
	@RequestMapping(value="/updateEmi" , method = RequestMethod.POST)
	public String updateEmi(@RequestBody MonitoringEquipmentInfo monitoringEquipmentInfo , HttpServletRequest request) {
		try {
			User user =(User)  request.getSession().getAttribute(Constants.AUTH_USER);
			monitoringEquipmentInfo.setUpdatePeople(user.getAccountName());
			iMonitoringEquipmentInfoService.updateById(monitoringEquipmentInfo);
			return "0000";
			
		} catch (Exception e) {
			return "9999";
		}
		
	}
	
	@RequestMapping(value="/insertEmi" , method = RequestMethod.POST)
	public String insertEmi(@RequestBody MonitoringEquipmentInfo monitoringEquipmentInfo , HttpServletRequest request) {
		try {
			User user = (User) request.getSession().getAttribute(Constants.AUTH_USER); 
			monitoringEquipmentInfo.setCreatePeople(user.getAccountName());
			iMonitoringEquipmentInfoService.insertMonitoringEquipmentInfo(monitoringEquipmentInfo);
			return "0000";
		} catch (Exception e) {
			return "9999";
		}
		
	}

	/**
	 * zhangyu
	 * 检索车商
	 * @param carsokAcountRequest
	 * @param modelAndView
	 * @return
	 */
	@RequestMapping(value = "/showMer.html" , method = RequestMethod.POST)
	public void showMerchantList(@RequestBody CarsokAcountRequest carsokAcountRequest , HttpServletRequest request , HttpServletResponse response) {
		
		if(carsokAcountRequest == null) {
			carsokAcountRequest = new CarsokAcountRequest();
		}
		Integer pageNum = carsokAcountRequest.getPageNum();
		Integer pageSize = carsokAcountRequest.getPageSize();
		if(pageNum == null && pageSize == null) {
			pageNum = 1;
			pageSize = defaultPageSize;
		}
		try {
			PageInfo<CarsokAcountDTO> pageInfo = iCarsokAcountService.selectAcountInfoByWhere(carsokAcountRequest);
			if(pageInfo != null) {
				List<CarsokAcountDTO> list = pageInfo.getList();
				Iterator<CarsokAcountDTO> iterator = list.iterator();
				while(iterator.hasNext()) {
					CarsokAcountDTO carsokAcountDTO = iterator.next();
					carsokAcountDTO.setMonInfoListSize(iMonitoringEquipmentInfoService.showNumberByMerchantId(carsokAcountDTO.getId()));
				}
				SpringUtils.renderJson(response,pageInfo);
			}
		} catch (Exception e) {
			e.printStackTrace();
			SpringUtils.renderJson(response,e.getMessage());
		}
	}

	/**
	 * zhangyu
	 * 通过车商id获取设备信息
	 * @param merchantId
	 * @param modelAndView
	 * @return
	 */
	@RequestMapping(value = "/showEmi/{id}" , method = RequestMethod.GET)
	public void showEmiInfo(@PathVariable("id") String merchantId , HttpServletResponse response) {
		
		try {
			List<MonitoringEquipmentInfo> emiInfo = iMonitoringEquipmentInfoService.showInfoBymerchantId(merchantId);
			SpringUtils.renderJson(response,emiInfo);
		} catch (Exception e) {
			e.printStackTrace();
			SpringUtils.renderJson(response,e.getMessage());
		}
	}
	
}
