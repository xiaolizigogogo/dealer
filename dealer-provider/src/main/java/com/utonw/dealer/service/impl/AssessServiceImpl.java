package com.utonw.dealer.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.utonw.dealer.api.dto.CarAssessDTO;
import com.utonw.dealer.api.dto.CarDTO;
import com.utonw.dealer.api.dto.CarFileDTO;
import com.utonw.dealer.api.entity.*;
import com.utonw.dealer.api.enums.CarImageTypeEnum;
import com.utonw.dealer.api.enums.IndentStatusEnum;
import com.utonw.dealer.api.service.IAssessService;
import com.utonw.dealer.base.UploadService;
import com.utonw.dealer.mapper.CarsokPruductOldcarMapper;
import com.utonw.dealer.mapper.MerchantApplyMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by SEELE on 2017/5/5.
 */
@Service(version="1.0.0",timeout = 1500000)
@Transactional
public class AssessServiceImpl extends ServiceImpl<MerchantApplyMapper, MerchantApply> implements IAssessService{
    private static final Logger logger = LoggerFactory.getLogger("MerchantAplVerifyServiceImpl.class");
    @Autowired
    CarsokPruductOldcarMapper carsokPruductOldcarMapper;

    @Autowired
    private UploadService uploadService;
    @Override
    public Map<String,Object> resetParts(CarDTO carDTO) throws Exception {
        logger.info("进入resetParts方法");
        Map<String,Object> result = new HashMap<>();
            CarsokPruductOldcar carsokPruductOldcar = new CarsokPruductOldcar();
            int id =Integer.parseInt(carDTO.getPruductId());
        CarFile carFile1 = new CarFile();
        List<CarFile> file = carFile1.selectList(new EntityWrapper<CarFile>().eq("product_id",carDTO.getPruductId()));
        if (file !=null && file.size()>0){
            List<String> statusList = new ArrayList<>();
            statusList.add("obdBinding");
            statusList.add("obd");
            statusList.add("steeringWheel");
            carFile1.delete(new EntityWrapper<CarFile>().eq("product_id",carDTO.getPruductId()).in("headlineType",statusList));
            MerchantIndent merchantIndent = new MerchantIndent();
            merchantIndent.setWhetherpass("pass");
            merchantIndent.update(new EntityWrapper<MerchantIndent>().eq("productId",carDTO.getPruductId()));
        }

            /**
             * 添加车辆信息
             */
            carsokPruductOldcar.setAriableBox(carDTO.getAriable_box());
            carsokPruductOldcar.setCarColour(carDTO.getCar_colour());
            carsokPruductOldcar.setDisplacement(carDTO.getDisplacement());
            carsokPruductOldcar.setIndoorType(carDTO.getIndoor_type());
            carsokPruductOldcar.setBodyStructure(carDTO.getBody_structure());
            carsokPruductOldcar.setEngine(carDTO.getEngine());
            carsokPruductOldcar.setDisplacement(carDTO.getDisplacement());
            BigDecimal invoice = new BigDecimal(carDTO.getInvoice());
            carsokPruductOldcar.setDrivingWheel(carDTO.getDriving_wheel());
            carsokPruductOldcar.setInvoice(invoice);
            carsokPruductOldcar.update(new EntityWrapper<CarsokPruductOldcar>().eq("pruduct_id",id));
            /**
             * 添加评估信息
             */
            EvaluationSheet evaluationSheet = new EvaluationSheet();
            evaluationSheet.setAppraisersprice( new BigDecimal(carDTO.getAppraisers_price()));
            evaluationSheet.setRemark(carDTO.getRemark());
            evaluationSheet.setCondition(carDTO.getCondition());
            evaluationSheet.setUpdatetime(new Date());
            evaluationSheet.setEvaluationurl(carDTO.getEvaluationurl());
            evaluationSheet.setMaintainurl(carDTO.getMaintainurl());
            //evaluationSheet.setUpdateby(Long.parseLong(carDTO.getUpdateBy()));
            evaluationSheet.setTravellicense(Integer.parseInt(carDTO.getTravelLicense()));
            evaluationSheet.setCommercial(Integer.parseInt(carDTO.getCommercial()));
            evaluationSheet.setLeaveprovince(0);
            evaluationSheet.setBraunassessmentprice(new BigDecimal(carDTO.getBraunAssessmentPrice()));
            evaluationSheet.setSn(carDTO.getSn());
            evaluationSheet.update(new EntityWrapper<EvaluationSheet>().eq("pruductId",id).eq("indentId",carDTO.getIndentId()));
           if (carDTO.getVin()!=null) {
               CarsokProduct carsokProduct = new CarsokProduct();
               carsokProduct.setVin(carDTO.getVin());
               carsokProduct.update(new EntityWrapper<CarsokProduct>().eq("id", id));
           }

        //添加相关图片
        CarFileDTO carFileDTO = carDTO.getCarFileDTO();
        List<CarFile> pictures = new ArrayList<>();
        CarImageTypeEnum[] carImageTypeEnums = CarImageTypeEnum.values();
        JSONObject json = JSON.parseObject(JSONObject.toJSONString(carFileDTO));
        String url = "";
        for (CarImageTypeEnum carImageTypeEnum : carImageTypeEnums) {

            JSONArray jsonArray = json.getJSONArray(carImageTypeEnum.name());
            if (jsonArray == null) {
                continue;
            }
            List<String> idCards = jsonArray.toJavaList(String.class);
            for (String str : idCards) {
                if (str.indexOf("http://") > -1) {
                    url = str;
                } else {
                    url = uploadService.upload(str.substring(str.lastIndexOf(",") + 1));
                }
                CarFile carFile = new CarFile();
                carFile.setHeadlinetype(carImageTypeEnum);
                carFile.setPicpath(url);
                pictures.add(carFile);
            }
        }
        for (int i = 0; i < pictures.size(); i++) {
            CarFile carFile = new CarFile();
            carFile.setPicpath(pictures.get(i).getPicpath());
            carFile.setHeadlinetype(pictures.get(i).getHeadlinetype());
            carFile.setProduct_id(Integer.parseInt(carDTO.getPruductId()));
            carFile.setUpdatetime(new Date());
            carFile.insert();
        }
        result.put("retCode","0000");
        result.put("retMsg","成功");
        return result;
    }

    /**
     * 评估信息
     * @param indentId
     * @return
     */
    @Override
    public Map<String,Object>  getAssess(String indentId) {
        logger.info("进入getAssess方法");
        Map<String,Object> result = new HashMap<>();
        CarAssessDTO carAssessDTO = new CarAssessDTO();
        Assess assess = carsokPruductOldcarMapper.selectByIdCar(indentId);
        BigDecimal thousand = new BigDecimal(10000);
        if (assess.getBuyprice() != null){
            carAssessDTO.setBuyprice(assess.getBuyprice().divide(thousand).toString());
        }
        carAssessDTO.setCar_plate(assess.getCar_plate());
        carAssessDTO.setCity(assess.getCity());
        if (assess.getHostlingCost() != null){
            carAssessDTO.setHostlingCost(assess.getHostlingCost().divide(thousand).toString());
        }
        carAssessDTO.setIndentNumber(assess.getIndentNumber());
        carAssessDTO.setMerchant_address(assess.getMerchant_address());
        carAssessDTO.setMerchant_name(assess.getMerchant_name());
        carAssessDTO.setProduct_name(assess.getProduct_name());

        if (assess.getMiles()!=null) {
            carAssessDTO.setMiles(Integer.toString(assess.getMiles() / 10000));
        }
        carAssessDTO.setMobile(assess.getMobile());
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        carAssessDTO.setOn_shelf_time(assess.getOn_shelf_time()==null?null:df.format(assess.getOn_shelf_time()));
        carAssessDTO.setPayment_method(assess.getPayment_method());
        if (assess.getSystemAssess() != null){
            carAssessDTO.setSystemAssess(assess.getSystemAssess().divide(thousand).toString());
        }
        carAssessDTO.setVin(assess.getVin());
        carAssessDTO.setCondition(assess.getCondition());
        carAssessDTO.setRemark(assess.getRemark());
        carAssessDTO.setAriable_box(assess.getAriable_box());
        carAssessDTO.setCar_colour(assess.getCar_colour());
        carAssessDTO.setDisplacement(assess.getDisplacement());
        carAssessDTO.setBody_structure(assess.getBody_structure());
        carAssessDTO.setIndoor_type(assess.getIndoor_type()==null?null:assess.getIndoor_type());
        carAssessDTO.setDriving_wheel(assess.getDriving_wheel());
        carAssessDTO.setEngine(assess.getEngine());
        if (assess.getInvoice() !=null) {
            carAssessDTO.setInvoice(String.valueOf(assess.getInvoice()));
        }
        carAssessDTO.setTravelLicense(String.valueOf(assess.getTravelLicense()));
        carAssessDTO.setCondition(assess.getCondition());
        carAssessDTO.setCommercial(String.valueOf(assess.getCommercial()));
        carAssessDTO.setLeaveProvince(String.valueOf(assess.getLeaveProvince()));
        carAssessDTO.setAppraisersPrice(String.valueOf(assess.getAppraisersPrice()));
        result.put("assess",carAssessDTO);
        result.put("retCode","0000");
        result.put("retMsg","成功");
        return result;
    }


}
