package com.utonw.dealer.service.impl;

import com.alibaba.dubbo.common.utils.StringUtils;
import com.alibaba.dubbo.config.annotation.Service;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;


import com.utonw.dealer.api.dto.CarFileDTO;
import com.utonw.dealer.api.dto.EvaluationSheetDTO;
import com.utonw.dealer.api.dto.response.CarEnclosure;
import com.utonw.dealer.api.entity.*;
import com.utonw.dealer.api.enums.CarImageTypeEnum;
import com.utonw.dealer.api.service.IApplicationCapital;

import com.utonw.dealer.api.util.UploadUtil;
import com.utonw.dealer.base.UploadService;
import com.utonw.dealer.mapper.CarsokZbTaskMapper;
import com.utonw.dealer.mapper.MerchantApplyMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.*;

/**
 * Created by SEELE on 2017/5/9.
 */
@Service(version="1.0.0",timeout = 1500000)
@Transactional
public class ApplicationCapitalServiceImpl extends ServiceImpl<MerchantApplyMapper, MerchantApply> implements IApplicationCapital{
    private static final Logger logger = LoggerFactory.getLogger("MerchantAplVerifyServiceImpl.class");
    @Autowired
    private UploadService uploadService;
    @Autowired
    CarsokZbTaskMapper carsokZbTaskMapper;
    @Override
    public Map<String,Object> updateFinancing(EvaluationSheetDTO evaluationSheetDTO) throws IOException {
        logger.info("进入updateFinancing方法");
        Map<String, Object> result = new HashMap<>();
        Long accountId = Long.parseLong(evaluationSheetDTO.getAcountId());
        logger.info("传入的accountId："+accountId);
        //查询订单
        MerchantIndent indent = new MerchantIndent();
        indent=indent.selectOne(new EntityWrapper<MerchantIndent>().eq("productId",evaluationSheetDTO.getOldcar_id()));
        if(indent!=null){
            CarFile carFile1 = new CarFile();
            carFile1.delete(new EntityWrapper<CarFile>().eq("product_id",evaluationSheetDTO.getOldcar_id()));
        }
        //添加订单信息
            MerchantIndent merchantIndent = new MerchantIndent();

            if (!StringUtils.isEmpty(evaluationSheetDTO.getCustom_limit())) {
                BigDecimal thousand = new BigDecimal(10000);
                BigDecimal applyMoney = new BigDecimal(evaluationSheetDTO.getCustom_limit());
                merchantIndent.setApplymoney(applyMoney);
            }
 
            //---新增参数----------
            merchantIndent.setIslegalperson(evaluationSheetDTO.getIsLegalPerson());  //是否是法人
            merchantIndent.setInterestRate(evaluationSheetDTO.getInterestRate());   //利率
            merchantIndent.setDeadlinetime(evaluationSheetDTO.getDeadlineTime());   //还款周期
            merchantIndent.setVideoUrl(evaluationSheetDTO.getVideoUrl());   //视频地址
            merchantIndent.setPlatenumber(evaluationSheetDTO.getPlateNumber());
            merchantIndent.setWhetherpass("pass");
           if (indent == null ) {
               String id = UUID.randomUUID().toString().replaceAll("-", "");
               merchantIndent.setAcountId(accountId);
               merchantIndent.setProductid(Integer.parseInt(evaluationSheetDTO.getOldcar_id()));
               merchantIndent.setIndentnumber(evaluationSheetDTO.getOrderStr());
               merchantIndent.setCreatedtime(new Date());
               merchantIndent.setId(id);
               merchantIndent.insert();
           }else {
        	   merchantIndent.setId(indent.getId());
               merchantIndent.update(new EntityWrapper<MerchantIndent>().eq("id",merchantIndent.getId()));
           }
            result.put("id", merchantIndent.getId());

            //添加评估信息
            EvaluationSheet evaluationSheet = new EvaluationSheet();
            evaluationSheet.setAcountid(accountId);
            evaluationSheet.setIndentid(merchantIndent.getId());
            evaluationSheet.setPruductid(Integer.parseInt(evaluationSheetDTO.getOldcar_id()));
            BigDecimal thousand = new BigDecimal(10000);
            if (!StringUtils.isEmpty(evaluationSheetDTO.getSystem_assess())) {
                BigDecimal systemAssess = new BigDecimal(evaluationSheetDTO.getSystem_assess());
                evaluationSheet.setSystemassess(systemAssess.multiply(thousand));
            }
            if (!StringUtils.isEmpty(evaluationSheetDTO.getBuyprice())) {
                BigDecimal buyprice = new BigDecimal(evaluationSheetDTO.getBuyprice());
                evaluationSheet.setBuyprice(buyprice.multiply(thousand));
            }
            if (!StringUtils.isEmpty(evaluationSheetDTO.getHostling_cost())) {
                BigDecimal hostling_cost = new BigDecimal(evaluationSheetDTO.getHostling_cost());
                evaluationSheet.setHostlingcost(hostling_cost.multiply(thousand));
            }
            evaluationSheet.setEvaluationurl(evaluationSheetDTO.getEvaluationUrl());
            evaluationSheet.setEvaluationtime(new Date());
        if (indent == null ) {
            evaluationSheet.insert();
        }else {
            evaluationSheet.update(new EntityWrapper<EvaluationSheet>().eq("indentId",indent.getId()));
        }

            //添加相关图片
            CarFileDTO carFileDTO = evaluationSheetDTO.getCarFileDTO();
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
                carFile.setProduct_id(Integer.parseInt(evaluationSheetDTO.getOldcar_id()));
                carFile.setUpdatetime(new Date());
                carFile.insert();
            }
            //添加收车价格
            CarsokProduct carsokProduct = new CarsokProduct();
            carsokProduct.setVin(evaluationSheetDTO.getVin());
            if (!StringUtils.isEmpty(evaluationSheetDTO.getBuyprice())) {
                BigDecimal hostling_cost = new BigDecimal(evaluationSheetDTO.getBuyprice());
                carsokProduct.setCloseingprice(hostling_cost);
            }
            carsokProduct.update(new EntityWrapper<CarsokProduct>().eq("id", evaluationSheetDTO.getOldcar_id()));
            //添加整备价格
            CarsokZbTask carsokZbTask = new CarsokZbTask();
            carsokZbTask = carsokZbTask.selectOne(new EntityWrapper<CarsokZbTask>().eq("product_id", evaluationSheetDTO.getOldcar_id()));
            if (carsokZbTask != null) {
                CarsokZbTaskZby carsokZbTaskZby = new CarsokZbTaskZby();
                if (!StringUtils.isEmpty(evaluationSheetDTO.getHostling_cost())) {
                    BigDecimal hostling_cost = new BigDecimal(evaluationSheetDTO.getHostling_cost());
                    carsokZbTaskZby.setZbmoney(hostling_cost.multiply(thousand));
                }
                carsokZbTaskZby.update(new EntityWrapper<CarsokZbTaskZby>().eq("tid", carsokZbTask.getId()));
            }
        result.put("retCode","0000");
        result.put("retMsg","保存成功");
        result.put("data","保存成功");
        logger.info("返回结果"+result);
        return result;
    }

    @Override
    public String getUploadToken() {
        UploadUtil uploadUtil = null;
        String  id = uploadUtil.getUpToken();
        return id;
    }

    @Override
    public Map<String, Object> selectAcountRegionld() {
        logger.info("进入selectAcountRegionld方法");
        Map<String, Object> result = new HashMap<>();
        try {
            CarsokAccountRegionld carsokAccountRegionld = new CarsokAccountRegionld();
            List<CarsokAccountRegionld> regionlds = carsokAccountRegionld.selectList(new EntityWrapper<CarsokAccountRegionld>());
            result.put("data",regionlds);
        }catch (Exception e){
           e.printStackTrace();
            result.put("retCode","9999");
            result.put("retMsg","查询失败");
            logger.info("返回结果"+result.get("retMsg"));
            return result;
        }
        result.put("retCode","0000");
        result.put("retMsg","查询成功");
        logger.info("返回结果"+result.get("retMsg"));
        return result;
    }

    @Override
    public Map<String, Object> selsctCarsokInfo(String productId,String acount) {
        Map<String,Object> map =new HashMap<>();
        CarsokPicture carsokPicture = new CarsokPicture();
        List<CarsokPicture> pictures = carsokPicture.selectList(new EntityWrapper<CarsokPicture>().eq("product_id",productId));
        CarContract carContract =new CarContract();
        carContract = carContract.selectOne(new EntityWrapper<CarContract>().eq("carId",productId));
        MerchantApply merchantApply = new MerchantApply();
        merchantApply = merchantApply.selectOne(new EntityWrapper<>().eq("acountId",acount));
        CarsokCustomerTrnureCar carsokCustomerTrnureCar = new CarsokCustomerTrnureCar();
        carsokCustomerTrnureCar =carsokCustomerTrnureCar.selectOne(new EntityWrapper<CarsokCustomerTrnureCar>().eq("product_id",productId));
        if (carsokCustomerTrnureCar!=null && StringUtils.isNotEmpty(carsokCustomerTrnureCar.getTenureCarnum())) {
            map.put("plateNumbe",carsokCustomerTrnureCar.getTenureCarnum());
        }
        CarEnclosure carEnclosure =   carsokZbTaskMapper.selectCarEnclosure(productId);
       if (carEnclosure !=null){
           map.put("carEnclosure",carEnclosure);
      }else {
           CarEnclosure carEnclosure1 = new CarEnclosure();
           map.put("carEnclosure",carEnclosure1);
       }
        map.put("monthlyInterest",merchantApply.getMonthlyinterest());

        map.put("pictures",pictures);

        map.put("carContract",carContract);
        return map;
    }
}
