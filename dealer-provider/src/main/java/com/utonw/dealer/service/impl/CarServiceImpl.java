package com.utonw.dealer.service.impl;

import com.alibaba.dubbo.common.utils.StringUtils;
import com.alibaba.dubbo.config.annotation.Service;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.utonw.dealer.api.dto.CarCapitalDTO;
import com.utonw.dealer.api.dto.CarMessageDTO;
import com.utonw.dealer.api.dto.CarSumDTO;
import com.utonw.dealer.api.entity.*;
import com.utonw.dealer.api.enums.CarImageTypeEnum;
import com.utonw.dealer.api.service.ICarService;
import com.utonw.dealer.mapper.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by SEELE on 2017/5/10.
 */
@Service(version = "1.0.0",timeout = 1500000)
public class CarServiceImpl  extends ServiceImpl<MerchantApplyMapper, MerchantApply> implements ICarService {
    private static final Logger logger = LoggerFactory.getLogger("MerchantApplyServiceImpl.class");
    @Autowired
    MerchantIndentMapper merchantIndentMapper;

    @Autowired
    CarsokPruductOldcarMapper carsokPruductOldcarMapper;

    @Autowired
    ProductMapper productMapper;

    @Autowired
    PictureMapper pictureMapper;

    @Override
    public Map<String, Object> getCarMessage(String acountId, int pageNum, int pageSize,String indentState,String productName,List<workflowtask> list) {
        logger.info("进入getCarMessage方法");
        Map<String,Object> result = new HashMap<>();
        List<CarMessageDTO> carMessageDTO = new ArrayList<>();
        BigDecimal b = new BigDecimal(10000);
        if (indentState.equals("1")){
            Page<TaskInfoEntity> page = null;
            page = PageHelper.startPage(pageNum,pageSize);
            List<CarMessage> carMessages = carsokPruductOldcarMapper.queryCarListOne(acountId,productName);
            for (CarMessage car:carMessages){
                CarMessageDTO message =new CarMessageDTO();
                message.setId(car.getId());
                message.setProduct_id(car.getProduct_id());
                message.setFirst_up_time(car.getFirst_up_time());
                message.setMiles(car.getMiles()==null?null:car.getMiles()/10000);
                message.setMiniprice(car.getMiniprice()==null?null:car.getMiniprice().divide(b));
                message.setPrice(car.getPrice()==null?null:car.getPrice().divide(b));
                message.setBrowse_num_times(car.getBrowse_num_times());
                message.setTel_num_times(car.getTel_num_times());
                Date currentDate = new Date();
                long days =(car.getOn_shelf_time()==null?0:currentDate.getTime() - car.getOn_shelf_time().getTime())/ (24*60*60*1000);
                message.setSale_days((int)days);
                message.setC_brand(car.getC_brand());
                message.setC_model(car.getC_model());
                message.setC_type(car.getC_type());
                message.setPic_path(car.getPic_path());
                message.setIndentState(car.getIndentState());
                message.setWhetherPass(car.getWhetherPass());
                message.setRejectRemarks(car.getRejectRemarks());
                message.setVin(car.getVin());
                message.setCloseingPrice(car.getCloseingPrice()==null?"":car.getCloseingPrice().toString());
                message.setZbMoney(car.getZbMoney()==null?"":car.getZbMoney().divide(b).toString());
                carMessageDTO.add(message);
        }
        }else {
            Page<TaskInfoEntity> page = null;
            page = PageHelper.startPage(pageNum, pageSize);
            Map<String,String> map =new HashMap<>();
            map.put("acountId",acountId);
            map.put("indentState",indentState);
            map.put("productName",productName);
            List<CarMessage> carMessages = carsokPruductOldcarMapper.queryCarList(map);
            for (CarMessage car : carMessages) {
                CarMessageDTO message =new CarMessageDTO();
                message.setId(car.getId());
                message.setProduct_id(car.getProduct_id());
                message.setFirst_up_time(car.getFirst_up_time());
                message.setMiles(car.getMiles()==null?null:car.getMiles()/10000);
                message.setMiniprice(car.getMiniprice()==null?null:car.getMiniprice().divide(b));
                message.setPrice(car.getPrice()==null?null:car.getPrice().divide(b));
                message.setBrowse_num_times(car.getBrowse_num_times());
                message.setTel_num_times(car.getTel_num_times());
                Date currentDate = new Date();
                long days =(car.getOn_shelf_time()==null?0:currentDate.getTime() - car.getOn_shelf_time().getTime())/ (24*60*60*1000);
                message.setSale_days((int)days);
                message.setC_brand(car.getC_brand());
                message.setC_model(car.getC_model());
                message.setC_type(car.getC_type());
                message.setPic_path(car.getPic_path());
                if (list!=null && list.size()>0) {
                    for (workflowtask workflowtask : list) {
                        if (workflowtask.getBusinesskey().equals(car.getId())) {
                            message.setIndentState(workflowtask.getTask_def_key());
                            if(StringUtils.isEquals("lended",workflowtask.getTask_def_key())){
                                message.setIndentState("wait_lended");
                            }
                        }

                    }
                }
                if(StringUtils.isNotEmpty(car.getIndentState())) {
                    message.setIndentState(car.getIndentState());
                }
                message.setJudgeMoney(car.getJudgeMoney()==null?null:car.getJudgeMoney());
                message.setVin(car.getVin());
                message.setCloseingPrice(car.getCloseingPrice()==null?"":car.getCloseingPrice().toString());
                message.setZbMoney(car.getZbMoney()==null?"":car.getZbMoney().divide(b).toString());
                message.setWhetherPass(car.getWhetherPass());
                carMessageDTO.add(message);

            }
        }
        result.put("retCode","0000");
        result.put("retMsg","成功");
        result.put("list",carMessageDTO);
        return result;
    }

    @Override
    public Map<String, Object> getCarCapital(String productId) {
        logger.info("进入getCarCapital方法");
        Map<String,Object> result =new HashMap<>();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        CarCapitalDetails carCapitalDetails = carsokPruductOldcarMapper.queryCarCapital(Integer.parseInt(productId));
        CarCapitalDTO carCapitalDTO =new CarCapitalDTO();
        BigDecimal thousand = new BigDecimal(10000);
        carCapitalDTO.setApplyMoney(carCapitalDetails.getApplyMoney()==null?null:carCapitalDetails.getApplyMoney().toString());
        carCapitalDTO.setBuyprice(carCapitalDetails.getBuyprice()==null?null:carCapitalDetails.getBuyprice().divide(thousand).toString());
        carCapitalDTO.setC_brand(carCapitalDetails.getC_brand());
        carCapitalDTO.setC_model(carCapitalDetails.getC_model());
        carCapitalDTO.setC_type(carCapitalDetails.getC_type());
        carCapitalDTO.setIndentNumber(carCapitalDetails.getIndentNumber());
        carCapitalDTO.setDeadlineTime(carCapitalDetails.getDeadlineTime()==null?null:carCapitalDetails.getDeadlineTime().toString());
        carCapitalDTO.setEvaluationTime(carCapitalDetails.getEvaluationTime()==null?null:df.format(carCapitalDetails.getEvaluationTime()));
        carCapitalDTO.setFirst_up_time(carCapitalDetails.getFirst_up_time()==null?null:df.format(carCapitalDetails.getFirst_up_time()));
        carCapitalDTO.setHostlingCost(carCapitalDetails.getHostlingCost()==null?null:carCapitalDetails.getHostlingCost().divide(thousand).toString());
        carCapitalDTO.setJudgeMoney(carCapitalDetails.getJudgeMoney()==null?null:carCapitalDetails.getJudgeMoney().divide(thousand).toString());
        carCapitalDTO.setLimitPercentage(carCapitalDetails.getLimitPercentage()==null?null:carCapitalDetails.getLimitPercentage().toString());
        carCapitalDTO.setLoanLimit(carCapitalDetails.getLoanLimit()==null?null:carCapitalDetails.getLoanLimit().divide(thousand).toString());
        carCapitalDTO.setMiles(carCapitalDetails.getMiles()/10000);
        carCapitalDTO.setMiniprice(carCapitalDetails.getMiniprice()==null?null:carCapitalDetails.getMiniprice().divide(thousand).toString());
        carCapitalDTO.setMonthlyInterest(carCapitalDetails.getMonthlyInterest()==null?null:carCapitalDetails.getMonthlyInterest().toString());
        carCapitalDTO.setPrice(carCapitalDetails.getPrice()==null?null:carCapitalDetails.getPrice().divide(thousand).toString());
        carCapitalDTO.setSystemAssess(carCapitalDetails.getSystemAssess()==null?null:carCapitalDetails.getSystemAssess().divide(thousand).toString());
        carCapitalDTO.setPic_path(carCapitalDetails.getPic_path());
        result.put("carCapital",carCapitalDTO);
        CarFile carFile = new CarFile();
       List<CarFile> picture = carFile.selectList(new EntityWrapper<CarFile>().eq("product_id",Integer.parseInt(productId)));
        CarsokCustomerTrnureCar carsokCustomerTrnureCar = new CarsokCustomerTrnureCar();
        carsokCustomerTrnureCar =carsokCustomerTrnureCar.selectOne(new EntityWrapper<CarsokCustomerTrnureCar>().eq("product_id",Integer.parseInt(productId)));
        if (carsokCustomerTrnureCar != null && StringUtils.isNotEmpty(carsokCustomerTrnureCar.getTenureCarnum())) {
            carCapitalDTO.setPlateNumbe(carsokCustomerTrnureCar.getTenureCarnum());
        }
        Map<String,List<String>> map=new HashMap<>();
        List list=null;
       for(CarImageTypeEnum image:CarImageTypeEnum.values()){
            map.put(image.name(),new ArrayList<String>());
       }
        for(int i = 0; i<picture.size();i++){
                list=map.get(picture.get(i).getHeadlinetype().name());
                list.add(picture.get(i).getPicpath());
        }
        result.put("carPicture",map);
        return result;
    }

    @Override
    public List<MerchantIndent> getIndentId(String acountId) {
        MerchantIndent merchantIndent =new MerchantIndent();
        List<MerchantIndent> indents = merchantIndent.selectList(new EntityWrapper<MerchantIndent>().eq("acount_id",acountId));
        return indents ;
    }

    @Override
    public Map<String, Object> getCarSum(String acountId) {
        logger.info("进入getCarSum方法");
        Map<String,Object> result =new HashMap<>();
        String productName ="";
        String indentState ="2";
        String indentState2 ="3";
        List<CarMessage>  listing1 = carsokPruductOldcarMapper.queryCarListOne(acountId,productName);
        Integer sum1 = 0;
        sum1 +=listing1.size();
        Map<String,String> map =new HashMap<>();
        map.put("acountId",acountId);
        map.put("indentState",indentState);
        map.put("productName",productName);
        List<CarMessage> listing2 = carsokPruductOldcarMapper.queryCarList(map);
        Map<String,String> map2 =new HashMap<>();
        map.put("acountId",acountId);
        map.put("indentState",indentState2);
        map.put("productName",productName);
        Integer sum2 = 0;
        sum2 +=listing2.size();
        List<CarMessage> listing3 = carsokPruductOldcarMapper.queryCarList(map);
        Integer sum3 = 0;
        sum3 +=listing3.size();
        CarSumDTO carSumDTO = new CarSumDTO();
        carSumDTO.setListing1(sum1);
        carSumDTO.setListing2(sum2);
        carSumDTO.setListing3(sum3);
        result.put("listing",carSumDTO);
        result.put("retCode","0000");
        result.put("retMsg","成功");
        return result;
    }

    @Override
    public Map carDetail(Map param) {
        Map result = new HashMap();
        result.put("success",false);
        Product product = productMapper.selectByModel(param);
        if(product == null){
            result.put("msg","车辆不存在");
            return result;
        }
        result.put("product",product);
        result.put("picture",pictureMapper.selectByModel(product.getId()));
        result.put("success",true);
        result.put("msg","查询成功");
        return result;
    }


}
