package com.utonw.utonerp.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.github.pagehelper.PageInfo;
import com.utonw.dealer.api.dto.request.MerchantInfoRequest;
import com.utonw.dealer.api.dto.request.erp.RfidRequest;
import com.utonw.dealer.api.entity.MerchantDataDTO;
import com.utonw.dealer.api.vo.TDistributionRfidVo;
import com.utonw.dealer.api.service.ICarsokAcountService;
import com.utonw.dealer.api.service.erp.IRfidMerchantIdsService;
import com.utonw.obd.api.model.PatrolDetailsInfoVo;
import com.utonw.obd.api.server.TRfidPatrolRecordService;
import com.utonw.utonbase.core.erpcommon.utils.SpringUtils;
import com.utonw.utonerp.common.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import javax.servlet.http.HttpServletResponse;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;


/**
 * Created by SEELE on 2017/9/29.
 */
@RestController
@RequestMapping(value = "/rfid")
public class RfidController extends BaseController {
 @Reference(version="0.1.0",timeout = 15000,check = false)
 TRfidPatrolRecordService tRfidPatrolRecordService;


	@Reference(version="1.0.0",timeout = 15000,check = false)
	IRfidMerchantIdsService iRfidMerchantIdsService;

	@Reference(version="1.0.0",timeout = 15000,check = false)
	ICarsokAcountService iCarsokAcountService;
    /**
     * 获取RFID巡检记录详细表
     */
 @RequestMapping(value = "RfidPatrolRecord" ,method = RequestMethod.POST )
    public void  getRfidPatrolRecord(HttpServletResponse response, @RequestBody RfidRequest rfidRequest){
	 try{
		 PageInfo<PatrolDetailsInfoVo> rfidPatrolRecordDetail= tRfidPatrolRecordService.getRfidPatrolRecordDetail(rfidRequest.getAcountId(),rfidRequest.getPlateNumber(),rfidRequest.getPageNum(),rfidRequest.getPageSize(),rfidRequest.getCarPatrolState());
		 SpringUtils.renderJson(response,rfidPatrolRecordDetail);

	 }catch (Exception e){
		 	
		 e.printStackTrace();
		 SpringUtils.renderJson(response,e.getMessage());
	 }
  }


	 /**
	  * index,车行列表
	  * @param merchantInfoRequest
	  * @param response
	  */
	@RequestMapping(value = "/merchantInfo" , method = RequestMethod.POST)
	public void showMerchantInfo(@RequestBody MerchantInfoRequest merchantInfoRequest ,  HttpServletResponse response) {
		
		List<TDistributionRfidVo> acountDatas = iRfidMerchantIdsService.showAllDealId();
		
		if(acountDatas == null || acountDatas.size() == 0) {
			SpringUtils.renderJson(response,new PageInfo<MerchantDataDTO>());
		}
		
		//新加需求,不懂逻辑代码,这里迭代获取车商id8916, 60, 12186, 18175
		List<Integer> acountIds = new ArrayList<>();
		Iterator<TDistributionRfidVo> iterator = acountDatas.iterator();
		while(iterator.hasNext()) {
			acountIds.add(iterator.next().getDealerId());
		}
		
		if(merchantInfoRequest != null) {
			merchantInfoRequest.setAcountIds(acountIds);
		}
		try {
			PageInfo<MerchantDataDTO> resultDatas = iCarsokAcountService.selectMerchantData(merchantInfoRequest);
			//将clm_csd数据库查询出的数据,添加到回参数据中
			Iterator<TDistributionRfidVo> tDistributionRfidVoIterator = acountDatas.iterator();
			while(tDistributionRfidVoIterator.hasNext()) {
				TDistributionRfidVo tDistributionRfidVo = tDistributionRfidVoIterator.next();
				Iterator<MerchantDataDTO> merchantDataDTOIterator = resultDatas.getList().iterator();
				while(merchantDataDTOIterator.hasNext()) {
					MerchantDataDTO MerchantDataDTO = merchantDataDTOIterator.next();
					if(tDistributionRfidVo.getDealerId().equals(MerchantDataDTO.getId())) {
						MerchantDataDTO.setAccountName(tDistributionRfidVo.getAccountName());
						MerchantDataDTO.setRealName(tDistributionRfidVo.getRealname());
					}
				}
			}
			
			SpringUtils.renderJson(response,resultDatas);
		} catch (Exception e) {
			e.printStackTrace();
			SpringUtils.renderJson(response,e.getMessage());
		}
	}
}
