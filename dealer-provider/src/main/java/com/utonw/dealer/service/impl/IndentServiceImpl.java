package com.utonw.dealer.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.utonw.dealer.api.dto.CarFileDTO;
import com.utonw.dealer.api.dto.RepaymentPlanDTO;
import com.utonw.dealer.api.dto.TaskDTO;
import com.utonw.dealer.api.dto.ZyContract;
import com.utonw.dealer.api.entity.*;
import com.utonw.dealer.api.enums.CarImageTypeEnum;
import com.utonw.dealer.api.service.IIndentService;

import com.utonw.dealer.mapper.MerchantContactinfoMapper;
import com.utonw.dealer.mapper.MerchantIndentMapper;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by SEELE on 2017/7/19.
 */
@Service(version="1.0.0",timeout = 1500000)
@Transactional
public class IndentServiceImpl implements IIndentService {
    private static final Logger logger = LoggerFactory.getLogger("IndentServiceImpl.class");
    
    @Autowired
    MerchantContactinfoMapper merchantContactinfoMapper;
    
    @Autowired
    MerchantIndentMapper merchantIndentMapper;
    
    
    @Override
    public Map<String, Object> getCarDealerTaskByUserId(List<ApplyIndentRequest> list, int pageNum, int pageSize, String merchantName) {
        logger.info("进入+++getCarDealerTaskByUserId方法");
        List<String> lists =new ArrayList<>();
        for (int i= 0;list.size()>i;i++){
            lists.add(list.get(i).getApplyId());
        }
        Map<String,Object>result = new HashMap<>();
        Page<TaskInfoEntity> page = null;
        page = PageHelper.startPage(pageNum,pageSize);
        //根据用户id,取得任务列表
        List<TaskInfoEntity> taskInfoEntityList = merchantContactinfoMapper.queryIndentTask(merchantName,lists);
        List<TaskDTO> taskDTOList = new ArrayList<>();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        for (TaskInfoEntity tie : taskInfoEntityList) {
            TaskDTO taskDTO = new TaskDTO();
            //单点任务只有一个
            taskDTO.setTask_number("1");
            taskDTO.setMobile(tie.getMobile() == null ? null : tie.getMobile().toString());
            taskDTO.setMerchantName(tie.getMerchantname());
            taskDTO.setMerchant_address(tie.getMerchantaddress());
            taskDTO.setApply_state(tie.getApplyState());
            taskDTO.setIndentId(tie.getId());
            if (tie.getApplydate() != null) {
                taskDTO.setApply_date(tie.getApplydate() == null ? null : formatter.format(tie.getApplydate()));
            }
            Date date = new Date();
            taskDTO.setCurrentDate(formatter.format(date));
            taskDTO.setCity(tie.getCity());
            taskDTO.setProvince(tie.getProvince());
            taskDTO.setAccountId(tie.getAccountId());
            taskDTO.setTotal(tie.getTotal().toString());
            for (ApplyIndentRequest applyIndentRequest:list){
                if (applyIndentRequest.getApplyId().equals(tie.getId())){
                    taskDTO.setTaskId(applyIndentRequest.getTaskId());
                }
            }
            taskDTOList.add(taskDTO);
        }
        result.put("retCode","0000");
        result.put("retMsg","成功");
        result.put("list",taskDTOList);
        logger.info(taskDTOList==null?"任务列表为空":taskDTOList.size()+"");
        return result;
    }

    @Override
    public Map<String, Object> getIndentTask(List<CompleteTask> list, int pageNum, int pageSize, String merchantName) {
        logger.info("进入+++getIndentTask方法");
        List<String> lists =new ArrayList<>();
        for (int i= 0;list.size()>i;i++){
            lists.add(list.get(i).getApplyId());
        }
        Map<String,Object>result = new HashMap<>();
        Page<TaskInfoEntity> page = null;
        page = PageHelper.startPage(pageNum,pageSize);
        //根据用户id,取得任务列表
        List<TaskInfoEntity> taskInfoEntityList = merchantContactinfoMapper.queryIndentTask(merchantName,lists);
        List<TaskDTO> taskDTOList = new ArrayList<>();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        for (TaskInfoEntity tie : taskInfoEntityList) {
            TaskDTO taskDTO = new TaskDTO();
            //单点任务只有一个
            taskDTO.setTask_number("1");
            taskDTO.setMobile(tie.getMobile() == null ? null : tie.getMobile().toString());
            taskDTO.setMerchantName(tie.getMerchantname());
            taskDTO.setMerchant_address(tie.getMerchantaddress());
            taskDTO.setApply_state(tie.getApplyState());
            taskDTO.setIndentId(tie.getId());
            if (tie.getApplydate() != null) {
                taskDTO.setApply_date(tie.getApplydate() == null ? null : formatter.format(tie.getApplydate()));
            }
            Date date = new Date();
            taskDTO.setCurrentDate(formatter.format(date));
            taskDTO.setCity(tie.getCity());
            taskDTO.setProvince(tie.getProvince());
            taskDTO.setAccountId(tie.getAccountId());
            taskDTO.setTotal(tie.getTotal().toString());
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            for (CompleteTask completeTask:list){
                if (completeTask.getApplyId().equals(tie.getId())){
                    taskDTO.setEndTime(completeTask.getUpdateTime()==null?null:sdf.format(completeTask.getUpdateTime()));
                }
            }
            taskDTOList.add(taskDTO);
        }
        result.put("retCode","0000");
        result.put("retMsg","成功");
        result.put("list",taskDTOList);
        logger.info(taskDTOList==null?"任务列表为空":taskDTOList.size()+"");
        return result;
    }

    @Override
    public Map<String, Object> updateMerchantIndent(String orderId) throws Exception {
        Map<String,Object> result = new HashMap<>();
        MerchantIndent merchantIndent =new MerchantIndent();
        merchantIndent.setIndentstate("repayment");
        merchantIndent.update(new EntityWrapper<MerchantIndent>().eq("id",orderId));
        result.put("retCode","0000");
        result.put("retMsg","成功");
        return result;
    }

    /* (non-Javadoc)
     * @see com.utonw.dealer.api.service.IIndentService#getMerchantIndentInfo(java.lang.String)
     */
	@Override
	public Map<String, Object> getRepaymentPlanInfo(String merchantIndentId) {
		
		logger.info("进入getRepaymentPlanInfo方法");
        Map<String,Object> result = new HashMap<>();
        RepaymentPlanDTO repaymentPlanDTO = new RepaymentPlanDTO();
        
        RepaymentPlan repaymentPlan = merchantIndentMapper.getRepaymentPlanInfo(merchantIndentId);
        
        if(repaymentPlan != null){
        	//TODO: 确认必要 repaymentplan定义不一致
        	/*BeanUtils.copyProperties(repaymentPlan,repaymentPlanDTO);*/
//        	repaymentPlanDTO.setDeadlineTime(repaymentPlan.getDeadlineTime());
//        	repaymentPlanDTO.setInterestRate(repaymentPlan.getInterestRate());
//        	repaymentPlanDTO.setJudgeMoney(repaymentPlan.getJudgeMoney());
//        	repaymentPlanDTO.setMerchantName(repaymentPlan.getMerchantName());
//        	repaymentPlanDTO.setRealName(repaymentPlan.getRealName());
        }
        
        result.put("repaymentPlan",repaymentPlanDTO);
        result.put("retCode","0000");
        result.put("retMsg","成功");
        return result;
	}

    @Override
    public MerchantIndent selectMerchantIndent(String orderId) {
        MerchantIndent merchantIndent =new MerchantIndent();
        merchantIndent =merchantIndent.selectOne(new EntityWrapper<MerchantIndent>().eq("id",orderId));
        return merchantIndent;
    }

    @Override
    public String updataIndent(String orderId,String obdState,String supervisetype) throws Exception{
        MerchantIndent merchantIndent =new MerchantIndent();
        merchantIndent.setSupervisetype(supervisetype);
        merchantIndent.setObdstate(obdState);
        merchantIndent.update(new EntityWrapper<MerchantIndent>().eq("id",orderId));
        return null;
    }

    @Override
    public CarsokAcount getCarsokAccount(Long accountId) {
        CarsokAcount carsokAcount =new CarsokAcount();
        carsokAcount= carsokAcount.selectOne(new EntityWrapper<CarsokAcount>().eq("account",accountId));

        return carsokAcount;
    }

	@Override
	public void commitZYContract(ZyContract zyContract) {
		MerchantIndent merchantIndent=new MerchantIndent().selectById(zyContract.getIndentId());
		merchantIndent.setAfterPlatenumber(zyContract.getAfterPlateNumber());
		merchantIndent.setId(zyContract.getIndentId());
		merchantIndent.updateById();
        CarFileDTO carFileDTO = zyContract.getCarFileDTO();
        List<CarFile> pictures = new ArrayList<>();
        CarImageTypeEnum[] carImageTypeEnums = CarImageTypeEnum.values();
        JSONObject json = JSON.parseObject(JSONObject.toJSONString(carFileDTO));
        if(json!=null){
        	
        
        String url="";
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
                   continue;
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
            carFile.setProduct_id(merchantIndent.getProductid());
            carFile.setUpdatetime(new Date());
            carFile.insert();
        }
        }
	}

}
