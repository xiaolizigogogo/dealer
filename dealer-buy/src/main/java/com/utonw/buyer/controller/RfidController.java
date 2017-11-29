package com.utonw.buyer.controller;

import com.alibaba.dubbo.common.utils.StringUtils;
import com.alibaba.dubbo.config.annotation.Reference;
import com.utonw.dealer.api.dto.DetermineBindingTypeDTO;
import com.utonw.dealer.api.dto.RfidDTO;
import com.utonw.dealer.api.dto.RfidParameterDTO;
import com.utonw.dealer.api.dto.SupervisionType;
import com.utonw.dealer.api.entity.CarsokAcount;
import com.utonw.dealer.api.entity.LoanHandlerRequest;
import com.utonw.dealer.api.entity.MerchantIndent;
import com.utonw.dealer.api.enums.CarDealerRepaymentEnum;
import com.utonw.dealer.api.model.BaseResult;
import com.utonw.dealer.api.service.IIndentService;
import com.utonw.dealer.api.service.ILoanDetails;
import com.utonw.dealer.api.service.ILoanServiceCSD;
import com.utonw.dealer.api.service.IuserServiceCSD;
import com.utonw.obd.api.model.CarObd;
import com.utonw.obd.api.model.RfidParameter;
import com.utonw.obd.api.model.TCarRfid;
import com.utonw.obd.api.server.OBDService;
import com.utonw.obd.api.server.RFIDService;
import com.utonw.obd.util.result.Response;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;

/**
 * Created by SEELE on 2017/10/9.
 */
@RestController
@RequestMapping(value = "rfid")
public class RfidController {
	
    private Logger logger = LoggerFactory.getLogger(ObdController.class);
    
    @Reference(version="0.1.0",timeout = 15000,check = false)
    RFIDService rfidService;
    @Reference(version="0.1.0",timeout = 15000,check = false)
    OBDService obdService;
    @Reference(version="1.0.0",timeout = 1500000)
    IIndentService indentService;
    @Reference(version = "1.0.0",timeout = 1500000)
    IuserServiceCSD iuserServiceCSD;
    @Reference(version = "1.0.0",timeout = 1500000)
    ILoanServiceCSD loanServiceCSD;
    @Reference(version = "1.0.0",timeout = 1500000)
    ILoanDetails loanDetails;


    @RequestMapping(value = "/bindingCarRFID",method = RequestMethod.POST)
    @ApiOperation(value = "绑定RFID")
    public BaseResult bindingCarRFID(@RequestBody RfidDTO rfidDTO) {
        try {
           MerchantIndent merchantIndent = new MerchantIndent();
            merchantIndent = indentService.selectMerchantIndent(rfidDTO.getOrderId());
            CarsokAcount carsokAcount = indentService.getCarsokAccount(merchantIndent.getAcountId());
            if (StringUtils.isNotEmpty(merchantIndent.getSupervisetype()) && merchantIndent.getObdstate().equals("1") && merchantIndent.getSupervisetype().equals("RFID")){
                rfidService.unbundlingCarRFID(rfidDTO.getOrderId(), merchantIndent.getPlatenumber(),rfidDTO.getRfidLabelId(),rfidDTO.getRfidSerialNumber());
            }
            Response response = rfidService.bindingCarRFID(rfidDTO.getOrderId(),merchantIndent.getPlatenumber(),rfidDTO.getRfidLabelId(),rfidDTO.getRfidSerialNumber(),
                    rfidDTO.getDealerName(),rfidDTO.getDealerPhone(),Long.valueOf(carsokAcount.getId()),merchantIndent.getProductid());

            logger.error("返回值：" + response);

            if (response.getCode().equals("1000")) {

                String  obdState ="1";
                String  supervisetype = "RFID";
                indentService.updataIndent(rfidDTO.getOrderId(),obdState,supervisetype);
                return new BaseResult("", "0000", "绑定成功");

            }

            return new BaseResult("", "0001", response.getMessage());

        } catch (Exception e) {

            logger.error("绑定异常：" + e);
            e.printStackTrace();
            return new BaseResult("", "9999", "系统异常");

        }
        }
    @RequestMapping(value = "/unbundlingRFID",method = RequestMethod.POST)
    @ApiOperation(value = "解绑rfid")
    public BaseResult unbundlingRFID(@RequestBody RfidDTO rfidDTO, HttpServletRequest request) {
        try {

            /*MerchantIndent merchantIndent = new MerchantIndent();
            merchantIndent = indentService.selectMerchantIndent(rfidDTO.getOrderId());*/
            Response response = rfidService.unbundlingCarRFID(rfidDTO.getOrderId(),rfidDTO.getPlateNumber(),rfidDTO.getRfidLabelId(),rfidDTO.getRfidSerialNumber() );
            logger.error("返回值：" + response);
            LoanHandlerRequest loanHandlerRequest=new LoanHandlerRequest();
            loanHandlerRequest.setApprovalAmount(new BigDecimal("0"));
            loanHandlerRequest.setApprovalId(rfidDTO.getOrderId());
            loanHandlerRequest.setApprovalLevel(rfidDTO.getTaskKey());
            loanHandlerRequest.setApprovalStatus("pass");
            loanHandlerRequest.setApprovalConclusion("拆除");
            loanHandlerRequest.setOrderId(rfidDTO.getOrderId());
            loanHandlerRequest.setTaskId(rfidDTO.getTaskId());
            loanServiceCSD.reviewApprovalStatus(loanHandlerRequest);
            loanDetails.insertIndentStatus(rfidDTO.getOrderId(), CarDealerRepaymentEnum.repayment_end.name(), "pass");
            String  obdState ="2";
            String  supervisetype = "RFID";
            indentService.updataIndent(rfidDTO.getOrderId(),obdState,supervisetype);
            return new BaseResult("", "0000", "解绑成功");
        } catch (Exception e) {
            logger.error("绑定异常：" + e);
            e.printStackTrace();
            return new BaseResult("", "9999", "系统异常");
        }
    }

    @RequestMapping(value = "/getRfidParameter",method = RequestMethod.POST)
    @ApiOperation(value = "获取RFID标签id和RFID串号")
    public BaseResult getRfidParameter(@RequestBody RfidParameterDTO rfidParameterDTO) {
        try {

        	Response<RfidParameter> response = rfidService.getRfidParameter(rfidParameterDTO.getVin());
        	logger.info("getRfidParameter返回值：" + response);
        	
        	if(response.isSuccess() && !response.isEmpty()){
        		
        		RfidParameter rfidParameter = response.getData();
                
                return new BaseResult(rfidParameter, "0000", "成功");
        	}else{
        		
        		return new BaseResult("", "9999", "失败");
        	}
        	
        } catch (Exception e) {
        	
            logger.error("绑定异常：" + e);
            e.printStackTrace();
            return new BaseResult("", "9999", "系统异常");
        }
    }

    @RequestMapping(value = "/determineBindingType",method = RequestMethod.POST)
    @ApiOperation(value = "判断绑定类型是OBD还是RFID")
    public BaseResult determineBindingType(@RequestBody DetermineBindingTypeDTO determineBindingTypeDTO) {
        try {

        	SupervisionType supervisionType = new SupervisionType();
        	
        	//判断是否已绑定OBD
        	Response<CarObd> responseCarObd = obdService.getCarObd(determineBindingTypeDTO.getOrderId(), determineBindingTypeDTO.getPlateNumber());
        	
        	if(responseCarObd.isSuccess() && !responseCarObd.isEmpty()){   //说明已绑定OBD
        		
        		CarObd carObd = responseCarObd.getData();
        		
        		supervisionType.setBindingType(1);
        		supervisionType.setRfidOrObd(carObd.getSn());
        		return new BaseResult(supervisionType, "0000", "成功");
        	}else{
        		
        		logger.info("getCarObd返回值：" + responseCarObd);
        	}
        	
        	//判断是否已绑定RFID
        	Response<TCarRfid> responseTCarRfid = rfidService.getCarRFIDInfo(determineBindingTypeDTO.getOrderId(), determineBindingTypeDTO.getPlateNumber());
        	
        	if(responseTCarRfid.isSuccess() && !responseTCarRfid.isEmpty()){
        		
        		TCarRfid tCarRfid = responseTCarRfid.getData();
        		
        		if("1".equals(tCarRfid.getBindState()) || "2".equals(tCarRfid.getBindState())){
        			
        			TCarRfid carRfid = responseTCarRfid.getData();
        			
        			supervisionType.setBindingType(2);
        			supervisionType.setRfidOrObd(carRfid.getRfidLabelId());
        			supervisionType.setRfidSerialNumber(carRfid.getRfidSerialNumber());
            		return new BaseResult(supervisionType, "0000", "成功");
        		}
        		
        	}else{
        		
        		logger.info("getCarRFIDInfo返回值：" + responseCarObd);
        	}
        	
        	supervisionType.setBindingType(0);
        	return new BaseResult(supervisionType, "0000", "成功");
        		
        } catch (Exception e) {
        	
            logger.error("绑定异常：" + e);
            e.printStackTrace();
            return new BaseResult("", "9999", "系统异常");
        }
    }
    
}
