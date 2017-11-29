package com.utonw.dealer.service.impl;

import com.alibaba.dubbo.common.utils.StringUtils;
import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.dubbo.config.annotation.Service;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.utonw.dealer.api.dto.*;
import com.utonw.dealer.api.dto.CompanyDTO;
import com.utonw.dealer.api.dto.request.ApplicationStatus;
import com.utonw.dealer.api.dto.request.SignTask;
import com.utonw.dealer.api.dto.request.TaskManageStatus;
import com.utonw.dealer.api.entity.*;
import com.utonw.dealer.api.enums.*;
import com.utonw.dealer.api.service.IMerchantApplyService;
import com.utonw.dealer.api.service.IWorkFlowServiceCSD;
import com.utonw.dealer.base.UploadService;
import com.utonw.dealer.mapper.*;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.transaction.annotation.Transactional;


import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.List;

import java.util.ArrayList;
import java.util.Date;

/**
 * <p>
 * 商户申请表  服务实现类
 * </p>
 *
 * @author wangyj
 * @since 2017-05-04
 */
@Service(version="1.0.0",timeout = 1500000)
@Transactional
public class MerchantApplyServiceImpl extends ServiceImpl<MerchantApplyMapper, MerchantApply> implements IMerchantApplyService {
    private static final Logger logger = LoggerFactory.getLogger("MerchantApplyServiceImpl.class");

    @Autowired
    MerchantContactinfoMapper merchantContactinfoMapper;

    @Autowired
    TaskManageMapper  taskManageMapper;

    /*@Value("${image.path}")
    private String image;*/
    @Autowired
    private UploadService uploadService;
    @Autowired
    MerchantApplyAuditMapper merchantApplyAuditMapper;
    @Autowired
    EvaluationSheetMapper evaluationSheetMapper;
    @Reference(version = "1.0.0",timeout = 1500000)
    IWorkFlowServiceCSD  workFlowServiceCSD;
    /**
     * 查询订单信息
     * @param productId
     * @return
     */
    @Override
    public  MerchantIndent getIndentId(String productId) {
        MerchantIndent merchantIndent = new MerchantIndent();
        merchantIndent =  merchantIndent.selectOne(new EntityWrapper<MerchantIndent>().eq("productId",productId));
        return merchantIndent;
    }

    @Override
    public  Map<String,Object> createApply(ApplyDTO applyDTO) {
        logger.info("进入createApply方法");
        Long accountId = Long.parseLong(applyDTO.getApplyMoneyDTO().getAcountId());
        logger.info("商户 account:"+accountId);
        Map<String,Object> result = new HashMap<>();
        MerchantApply merchantApplys = new MerchantApply();
        merchantApplys = merchantApplys.selectOne(new EntityWrapper<MerchantApply>().eq("acountId",accountId));
        try {
            //添加申请信息
            MerchantApply merchantApply = new MerchantApply();
            merchantApply.setAcountid(accountId);
            merchantApply.setMerchantname(applyDTO.getApplyMoneyDTO().getMerchantName());
            merchantApply.setLicensenumber(applyDTO.getApplyMoneyDTO().getLicense_number());
            merchantApply.setOrganizationcode(applyDTO.getApplyMoneyDTO().getOrganization_code());
            merchantApply.setApplydate(new Date());
            merchantApply.setReviewstatus(0);
            merchantApply.setSubmitstate(1);
            String province=StringUtils.isEmpty(applyDTO.getApplyMoneyDTO().getProvince())?applyDTO.getApplyMoneyDTO().getCity():applyDTO.getApplyMoneyDTO().getProvince();
            merchantApply.setProvince(province);
            merchantApply.setCity(applyDTO.getApplyMoneyDTO().getCity());
            merchantApply.setDistrict(applyDTO.getApplyMoneyDTO().getDistrict());
            merchantApply.setIdcard(applyDTO.getApplyMoneyDTO().getIdcard());
            if (merchantApplys == null){
                merchantApply.insert();
                result.put("applyId", merchantApply.getId());
            }else {
                merchantApply.setUpdatetime(new Date());
                merchantApply.update(new EntityWrapper<MerchantApply>().eq("acountId",accountId));
                result.put("applyId", merchantApplys.getId());
            }

            //添加地址信息
            MerchantRegion merchantRegion=new  MerchantRegion();
            merchantRegion.setCity(applyDTO.getApplyMoneyDTO().getCity());
            merchantRegion.setProvince(province);
            merchantRegion.setDistrict(applyDTO.getApplyMoneyDTO().getDistrict());
            if (StringUtils.isEmpty(applyDTO.getApplyMoneyDTO().getStreet()) || applyDTO.getApplyMoneyDTO().getStreet().equals("null")) {
                merchantRegion.setDetailedAddress(province + applyDTO.getApplyMoneyDTO().getCity() + applyDTO.getApplyMoneyDTO().getDistrict());
            }else {
                merchantRegion.setDetailedAddress(province + applyDTO.getApplyMoneyDTO().getCity() + applyDTO.getApplyMoneyDTO().getDistrict() + applyDTO.getApplyMoneyDTO().getStreet());
            }
            merchantRegion.setContractTime(new Date());
            merchantRegion.setUpdateTime(new Date());
            merchantRegion.setDealerAddress(applyDTO.getApplyMoneyDTO().getDealer_address());
            merchantRegion.setApplyId(merchantApply.getId());
            merchantRegion.setType(UserTypeEnum.dealer.name());
            if (merchantApplys == null){
                merchantRegion.insert();
            }else {
                merchantRegion.update(new EntityWrapper<MerchantRegion>().eq("apply_id",merchantApplys.getId()).eq("type","dealer"));
            }
            //添加法人电话
            MerchantContactinfo contactinfo = new MerchantContactinfo();
            List<MerchantContactinfo> merchantContactinfos=contactinfo.selectList(new EntityWrapper<MerchantContactinfo>().eq("acountId",accountId));
            if(merchantContactinfos.size()>1) {
                contactinfo.delete(new EntityWrapper<MerchantContactinfo>().eq("acountId",accountId));
                for (int i = 0; i < applyDTO.getApplyMoneyDTO().getPerson().size(); i++) {
                    MerchantContactinfo merchantContactinfo = new MerchantContactinfo();
                    merchantContactinfo.setAcountid(accountId);
                    merchantContactinfo.setPersonname(applyDTO.getApplyMoneyDTO().getPerson().get(i).getPositionNmane());
                    merchantContactinfo.setRolename(Integer.parseInt(applyDTO.getApplyMoneyDTO().getPerson().get(i).getPositionFo()));
                    merchantContactinfo.setPhonenumber(applyDTO.getApplyMoneyDTO().getPerson().get(i).getPositionPhone());
                    merchantContactinfo.insert();
                }
            }else {
                for (int i = 0; i < applyDTO.getApplyMoneyDTO().getPerson().size(); i++) {
                    MerchantContactinfo merchantContactinfo = new MerchantContactinfo();
                    merchantContactinfo.setAcountid(accountId);
                    merchantContactinfo.setPersonname(applyDTO.getApplyMoneyDTO().getPerson().get(i).getPositionNmane());
                    merchantContactinfo.setRolename(Integer.parseInt(applyDTO.getApplyMoneyDTO().getPerson().get(i).getPositionFo()));
                    merchantContactinfo.setPhonenumber(applyDTO.getApplyMoneyDTO().getPerson().get(i).getPositionPhone());
                    merchantContactinfo.insert();
                }
            }
          //  添加图片
            ImageDTO imageDTO = applyDTO.getImageDTO();
            List<MerchantPicture> pictures = new ArrayList<>();
            ImageTypeEnum[] imageTypes = ImageTypeEnum.values();
            JSONObject json= JSON.parseObject(JSONObject.toJSONString(imageDTO));
            String url = null;
            for (ImageTypeEnum imageType : imageTypes) {
                JSONArray jsonArray=json.getJSONArray(imageType.name());
                if(jsonArray==null){
                    continue;
                }
                List<String> idCards = jsonArray.toJavaList(String.class);
                for (String str : idCards) {
                    if(str.indexOf("http://")>-1){
                        url=str;
                    }else {
                        url = uploadService.upload(str.substring(str.lastIndexOf(",") + 1));
                    }

                    MerchantPicture MerchantPicture = new MerchantPicture();
                    MerchantPicture.setFiletitle(imageType);
                    MerchantPicture.setFileurl(url);
                    pictures.add(MerchantPicture);
                }
            }
            MerchantPicture merchantPictures = new MerchantPicture();
            List<MerchantPicture> Pictures =merchantPictures.selectList(new EntityWrapper<MerchantPicture>().eq("acountId",accountId));
            if (Pictures.size()>1) {
                merchantPictures.delete(new EntityWrapper<MerchantPicture>().eq("acountId",accountId));
                for (int i = 0; i < pictures.size(); i++) {
                    MerchantPicture merchantPicture = new MerchantPicture();
                    merchantPicture.setAcountid(Long.parseLong(applyDTO.getApplyMoneyDTO().getAcountId()));
                    merchantPicture.setFileurl(pictures.get(i).getFileurl());
                    merchantPicture.setFiletitle(pictures.get(i).getFiletitle());
                    merchantPicture.setCreatedate(new Date());
                    merchantPicture.setAcountid(accountId);
                    merchantPicture.insert();
                }
            }else {
                for (int i = 0; i < pictures.size(); i++) {
                    MerchantPicture merchantPicture = new MerchantPicture();
                    merchantPicture.setAcountid(Long.parseLong(applyDTO.getApplyMoneyDTO().getAcountId()));
                    merchantPicture.setFileurl(pictures.get(i).getFileurl());
                    merchantPicture.setFiletitle(pictures.get(i).getFiletitle());
                    merchantPicture.setCreatedate(new Date());
                    merchantPicture.setAcountid(accountId);
                    merchantPicture.insert();
                }
            }
        }catch (Exception e){
            e.printStackTrace();
            result.put("retCode","9999");
            result.put("retMsg","提交失败");
            logger.info("返回结果"+result);
            return result;
        }
        result.put("retCode","0000");
        result.put("retMsg","提交成功");
        logger.info("返回结果"+result);
        return result;

    }

    @Override
    public Map<String,List<String>> getAttachment(String acount_id ) {
        logger.info(acount_id+"ID+++++");
        MerchantPicture merchantPicture =new MerchantPicture();
        long accountId=Long.valueOf(acount_id);
        List<MerchantPicture> pictureList = merchantPicture.selectList(new EntityWrapper<MerchantPicture>().eq("acountId",accountId) );
        Map<String,List<String>> map=new HashMap<>();
        List list=null;
        for(ImageTypeEnum image:ImageTypeEnum.values()){
            map.put(image.name(),new ArrayList<String>());
        }
        for(int i = 0; i<pictureList.size();i++){
            list=map.get(pictureList.get(i).getFiletitle().name());
            list.add(pictureList.get(i).getFileurl());
        }
        return map;
    }

    @Override
    public Map<String,Object>  getTaskByUserId(List<ApplyIndentRequest> list, int pageNum, int pageSize, String merchantName,List<ApplyIndentRequest> withCapital) {
        logger.info("进入+++getTaskByUserId方法");
        List<String> lists = new ArrayList<>();
        for (int i = 0; list.size() > i; i++) {
            lists.add(list.get(i).getApplyId());
        }
        Map<String, Object> result = new HashMap<>();

        Map<String, Object> map = new HashMap<>();
        map.put("merchantName", merchantName);
        map.put("lists", lists);
        List<CarDealerApplyEnum> carDealerApplyEnums = Arrays.asList(CarDealerApplyEnum.values());
        List<CarDealerLoanEnum> carDealerLoanEnums = Arrays.asList(CarDealerLoanEnum.values());
        List<CarDealerReviewEnum> carDealerReviewEnums = Arrays.asList(CarDealerReviewEnum.values());
        //根据用户id,取得任务列表
        List<TaskInfoEntity> taskInfoEntityList = merchantContactinfoMapper.queryTaskList(map);
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
            taskDTO.setRoleId("ptxxry");
            taskDTO.setIndentId(tie.getId());
            if (tie.getApplydate() != null) {
                taskDTO.setApply_date(tie.getApplydate() == null ? null : formatter.format(tie.getApplydate()));
            }
            Date date = new Date();
            taskDTO.setCurrentDate(formatter.format(date));
            taskDTO.setCity(tie.getCity());
            taskDTO.setProvince(tie.getProvince());
            taskDTO.setAccountId(tie.getAccountId());
            for (ApplyIndentRequest applyIndentRequest : list) {
                if (applyIndentRequest.getApplyId().equals(tie.getId())) {
                    taskDTO.setReview_conclusion(applyIndentRequest.getReview_conclusion());
                    taskDTO.setEndTime(applyIndentRequest.getUpdateTime()==null?null:formatter.format(applyIndentRequest.getUpdateTime()));
                    taskDTO.setTask_key(applyIndentRequest.getTaskName());
                    for (CarDealerApplyEnum carDealerApplyEnum : carDealerApplyEnums) {
                        if (StringUtils.isNotEmpty(applyIndentRequest.getTaskName())) {
                            if (applyIndentRequest.getTaskName().trim().equals(carDealerApplyEnum.name())) {
                                taskDTO.setTask_name("待" + carDealerApplyEnum.getMessage());
                                if (StringUtils.isNotEmpty(applyIndentRequest.getReview_status()) && applyIndentRequest.getReview_status().indexOf(carDealerApplyEnum.name()) > -1 && applyIndentRequest.getReview_status().indexOf("back") > -1) {
                                    taskDTO.setTask_name("待重新处理");
                                }

                            }
                        }
                    }
                        taskDTO.setTaskId(applyIndentRequest.getTaskId());
                }


            }
            taskDTOList.add(taskDTO);
        }
        Map<String,Object> capita = new HashMap<>();
        for (int i = 0; withCapital.size() > i; i++) {
            if ( capita.get(withCapital.get(i).getTaskName())!=null){
                List<String>  list1 = (List<String>) capita.get(withCapital.get(i).getTaskName());
                list1.add(withCapital.get(i).getApplyId());
            }else {
                List<String> list2 =new ArrayList<String>();
                list2.add(withCapital.get(i).getApplyId());
                capita.put(withCapital.get(i).getTaskName(),list2);
            }
        }
        Iterator<Map.Entry<String, Object>> it = capita.entrySet().iterator();
        while (it.hasNext()) {
            Map.Entry<String, Object> entry = it.next();
            System.out.println("key= " + entry.getKey() + " and value= " + entry.getValue());
            List<TaskInfoEntity> taskInfoEntity = merchantContactinfoMapper.queryIndentTask(merchantName,(List<String>) entry.getValue());
        //所有的任务
            for (TaskInfoEntity ties : taskInfoEntity) {
                if (ties.getId()!= null ) {
                TaskDTO taskDTOS = new TaskDTO();
                //单点任务只有一个
                taskDTOS.setTask_number("1");
                taskDTOS.setMobile(ties.getMobile() == null ? null : ties.getMobile().toString());
                taskDTOS.setMerchantName(ties.getMerchantname());
                taskDTOS.setMerchant_address(ties.getMerchantaddress());
                taskDTOS.setApply_state(ties.getApplyState());
                taskDTOS.setIndentId(ties.getId());
                taskDTOS.setRoleId("ptclpgs");
                if (ties.getApplydate() != null) {
                    taskDTOS.setApply_date(ties.getApplydate() == null ? null : formatter.format(ties.getApplydate()));
                }
                Date date = new Date();
                 taskDTOS.setCurrentDate(formatter.format(date));
                taskDTOS.setCity(ties.getCity());
                taskDTOS.setProvince(ties.getProvince());
                taskDTOS.setAccountId(ties.getAccountId());
                taskDTOS.setTotal(ties.getTotal().toString());
                //循环所有的申请
                for (ApplyIndentRequest applyIndentRequests : list) {
                    //如果匹配设置申请的信息
                    if (applyIndentRequests.getApplyId().equals(ties.getId())) {
                        taskDTOS.setReview_conclusion(applyIndentRequests.getReview_conclusion());
                        taskDTOS.setEndTime(applyIndentRequests.getUpdateTime()==null?null:formatter.format(applyIndentRequests.getUpdateTime()));
                        taskDTOS.setTask_key(applyIndentRequests.getTaskName());
                        for (CarDealerLoanEnum carDealerLoanEnums1 : carDealerLoanEnums) {
                            if (StringUtils.isNotEmpty(applyIndentRequests.getTaskName())) {
                                if (applyIndentRequests.getTaskName().equals(carDealerLoanEnums1.name())) {
                                    taskDTOS.setTask_name("待" + carDealerLoanEnums1.getMessage());
                                    if (StringUtils.isNotEmpty(applyIndentRequests.getReview_status()) && applyIndentRequests.getReview_status().indexOf(carDealerLoanEnums1.name()) > -1 && applyIndentRequests.getReview_status().indexOf("back") > -1) {
                                        taskDTOS.setTask_name("待重新处理");
                                    }

                                }
                            }
                        }
                        taskDTOS.setTaskId(applyIndentRequests.getTaskId());
                    }

                }
                    taskDTOList.add(taskDTOS);
                }
            }
            }
            result.put("retCode", "0000");
            result.put("retMsg", "成功");
        List<TaskDTO> MemberArticleBeanPage = new ArrayList<TaskDTO>();
        int currIdx = (pageNum > 1 ? (pageNum -1) * pageSize : 0);
        for (int i = 0; i < pageSize && i < taskDTOList.size() - currIdx; i++) {
            TaskDTO taskDTO = taskDTOList.get(currIdx + i);
            MemberArticleBeanPage.add(taskDTO);
        }
        TaskDTO.ComparatorUser u=new TaskDTO.ComparatorUser();
        Collections.sort(MemberArticleBeanPage, u);
            result.put("list", MemberArticleBeanPage);
            logger.info(taskDTOList == null ? "任务列表为空" : taskDTOList.size() + "");
            return result;
        }

    @Override
    public Map<String, Object> getTaskByList(List<ApplyIndentRequest> list, int pageNum, int pageSize, String merchantName) {
        logger.info("进入+++getTaskByUserId方法");
        List<String> lists = new ArrayList<>();
        for (int i = 0; list.size() > i; i++) {
            lists.add(list.get(i).getApplyId());
        }
        Map<String, Object> result = new HashMap<>();

        Map<String, Object> map = new HashMap<>();
        map.put("merchantName", merchantName);
        map.put("lists", lists);
        List<CarDealerApplyEnum> carDealerApplyEnums = Arrays.asList(CarDealerApplyEnum.values());
        List<CarDealerLoanEnum> carDealerLoanEnums = Arrays.asList(CarDealerLoanEnum.values());
        List<CarDealerReviewEnum> carDealerReviewEnums = Arrays.asList(CarDealerReviewEnum.values());
        //根据用户id,取得任务列表
        List<TaskInfoEntity> taskInfoEntityList = merchantContactinfoMapper.queryTaskList(map);
        List<TaskDTO> taskDTOList = new ArrayList<>();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        for (ApplyIndentRequest applyIndentRequest : list) {
            for (TaskInfoEntity tie : taskInfoEntityList) {
                if (applyIndentRequest.getApplyId().equals(tie.getId())) {
                    TaskDTO taskDTO = new TaskDTO();
                    //单点任务只有一个
                    taskDTO.setTask_number("1");
                    taskDTO.setMobile(tie.getMobile() == null ? null : tie.getMobile().toString());
                    taskDTO.setMerchantName(tie.getMerchantname());
                    taskDTO.setMerchant_address(tie.getMerchantaddress());
                    taskDTO.setApply_state(tie.getApplyState());
                    taskDTO.setRoleId("ptxxry");
                    taskDTO.setIndentId(tie.getId());
                    if (tie.getApplydate() != null) {
                        taskDTO.setApply_date(tie.getApplydate() == null ? null : formatter.format(tie.getApplydate()));
                    }
                    Date date = new Date();
                    taskDTO.setCurrentDate(formatter.format(date));
                    taskDTO.setCity(tie.getCity());
                    taskDTO.setProvince(tie.getProvince());
                    taskDTO.setAccountId(tie.getAccountId());
                    taskDTO.setReview_conclusion(applyIndentRequest.getReview_conclusion());
                    taskDTO.setEndTime(applyIndentRequest.getUpdateTime() == null ? null : formatter.format(applyIndentRequest.getUpdateTime()));
                    taskDTO.setTask_key(applyIndentRequest.getTaskName());
                    for (CarDealerApplyEnum carDealerApplyEnum : carDealerApplyEnums) {
                        if (StringUtils.isNotEmpty(applyIndentRequest.getTaskName())) {
                            if (applyIndentRequest.getTaskName().trim().equals(carDealerApplyEnum.name())) {
                                taskDTO.setTask_name("待" + carDealerApplyEnum.getMessage());
                                if (StringUtils.isNotEmpty(applyIndentRequest.getReview_status()) && applyIndentRequest.getReview_status().indexOf(carDealerApplyEnum.name()) > -1 && applyIndentRequest.getReview_status().indexOf("back") > -1) {
                                    taskDTO.setTask_name("待重新处理");
                                }

                            }
                        }

                        taskDTO.setTaskId(applyIndentRequest.getTaskId());
                    }
                    taskDTOList.add(taskDTO);
                }

            }
        }
            List<TaskInfoEntity> taskInfoEntity = merchantContactinfoMapper.queryIndentTask(merchantName,lists);
            //所有的任务
            //循环所有的申请
            for (ApplyIndentRequest applyIndentRequests : list) {
            for (TaskInfoEntity ties : taskInfoEntity) {
                //如果匹配设置申请的信息
                if (applyIndentRequests.getApplyId().equals(ties.getId())) {
                    TaskDTO taskDTOS = new TaskDTO();
                    //单点任务只有一个
                    taskDTOS.setTask_number("1");
                    taskDTOS.setMobile(ties.getMobile() == null ? null : ties.getMobile().toString());
                    taskDTOS.setMerchantName(ties.getMerchantname());
                    taskDTOS.setMerchant_address(ties.getMerchantaddress());
                    taskDTOS.setApply_state(ties.getApplyState());
                    taskDTOS.setIndentId(ties.getId());
                    taskDTOS.setRoleId("ptclpgs");
                    if (ties.getApplydate() != null) {
                        taskDTOS.setApply_date(ties.getApplydate() == null ? null : formatter.format(ties.getApplydate()));
                    }
                    Date date = new Date();
                    taskDTOS.setCurrentDate(formatter.format(date));
                    taskDTOS.setCity(ties.getCity());
                    taskDTOS.setProvince(ties.getProvince());
                    taskDTOS.setAccountId(ties.getAccountId());
                   /* taskDTOS.setTotal(ties.getTotal().toString());*/
                            taskDTOS.setReview_conclusion(applyIndentRequests.getReview_conclusion());
                            taskDTOS.setEndTime(applyIndentRequests.getUpdateTime()==null?null:formatter.format(applyIndentRequests.getUpdateTime()));
                            taskDTOS.setTask_key(applyIndentRequests.getTaskName());
                            for (CarDealerLoanEnum carDealerLoanEnums1 : carDealerLoanEnums) {
                                if (StringUtils.isNotEmpty(applyIndentRequests.getTaskName())) {
                                    if (applyIndentRequests.getTaskName().equals(carDealerLoanEnums1.name())) {
                                        taskDTOS.setTask_name("待" + carDealerLoanEnums1.getMessage());
                                        if (StringUtils.isNotEmpty(applyIndentRequests.getReview_status()) && applyIndentRequests.getReview_status().indexOf(carDealerLoanEnums1.name()) > -1 && applyIndentRequests.getReview_status().indexOf("back") > -1) {
                                            taskDTOS.setTask_name("待重新处理");
                                        }

                                    }
                                }
                            taskDTOS.setTaskId(applyIndentRequests.getTaskId());
                        }
                    taskDTOList.add(taskDTOS);
                }
                }
            }

        result.put("retCode", "0000");
        result.put("retMsg", "成功");
        List<TaskDTO> MemberArticleBeanPage = new ArrayList<TaskDTO>();
        int currIdx = (pageNum > 1 ? (pageNum -1) * pageSize : 0);
        for (int i = 0; i < pageSize && i < taskDTOList.size() - currIdx; i++) {
            TaskDTO taskDTO = taskDTOList.get(currIdx + i);
            MemberArticleBeanPage.add(taskDTO);
        }
        TaskDTO.ComparatorUser u=new TaskDTO.ComparatorUser();
        Collections.sort(MemberArticleBeanPage, u);
        result.put("list", MemberArticleBeanPage);
        logger.info(taskDTOList == null ? "任务列表为空" : taskDTOList.size() + "");
        return result;
    }

    /**
     * 查询审核状态
     * @param acount_id
     * @return
     */
    @Override
    public Map<String, Object> getAllocationAudit(String acount_id) {
        logger.info("请求acount_Id:"+acount_id);
        Map<String, Object> result = new HashMap<>();
        MerchantApply merchantApply = new MerchantApply();
        merchantApply = merchantApply.selectOne(new EntityWrapper<MerchantApply>().eq("acountId", acount_id));
        logger.info("申请表查询结果："+merchantApply);
        List<String> applyId = new ArrayList<>();
        List<TaskDTO> taskDTOList = new ArrayList<>();
        if (merchantApply != null) {
            applyId.add(merchantApply.getId());
            List<workflowtask> workflowtasks =workFlowServiceCSD.queryByApplyIds(applyId);
            if(workflowtasks.size()>=1) {
                List<CarDealerApplyEnum> carDealerApplyEnums = Arrays.asList(CarDealerApplyEnum.values());
                for (workflowtask workflowtask : workflowtasks) {
                    TaskDTO taskDTO = new TaskDTO();
                    taskDTO.setReview_conclusion(workflowtask.getReview_conclusion());
                    for (CarDealerApplyEnum carDealerApplyEnum : carDealerApplyEnums) {
                        if (StringUtils.isEquals(workflowtask.getReview_status(), CarDealerReviewEnum.nopass.name())) {
                            taskDTO.setReview_conclusion(workflowtask.getReview_conclusion());
                            taskDTO.setTask_key(merchantApply.getSubmitstate().toString());
                            taskDTO.setReview_status(workflowtask.getReview_status());
                            taskDTO.setMerchantName(merchantApply.getMerchantname());
                            continue;
                        }
                        if (StringUtils.isEquals(carDealerApplyEnum.name(),workflowtask.getTask_def_key())) {
                            taskDTO.setTask_name("待" + carDealerApplyEnum.getMessage());
                        }
                    }
                    taskDTO.setTask_key(merchantApply.getSubmitstate().toString());
                    taskDTO.setReview_status(workflowtask.getReview_status());
                    taskDTO.setMerchantName(merchantApply.getMerchantname());
                    taskDTOList.add(taskDTO);
                }
            }else {
                TaskDTO taskDTO = new TaskDTO();
                taskDTO.setTask_key(merchantApply.getSubmitstate().toString());
                taskDTO.setMerchantName(merchantApply.getMerchantname());
                taskDTOList.add(taskDTO);
            }
        }else {
            TaskDTO taskDTO = new TaskDTO();
            taskDTO.setTask_key("-1");
            taskDTOList.add(taskDTO);
        }
            result.put("data",taskDTOList);
            result.put("retCode", "0000");
            result.put("retMsg", "成功");
            return result;
        }

    @Override
    public Map<String, Object> getDealerInformationVerification(String acountId) {
        logger.info("进入getDealerInformationVerification：+++++++++++++++");
        logger.info("传入acountId："+acountId);
        Map<String, Object> result = new HashMap<>();
        //申请表信息
        MerchantApply merchantApply = new MerchantApply();
        merchantApply=merchantApply.selectOne(new EntityWrapper<MerchantApply>().eq("acountId",acountId));
        //地址表信息
        MerchantRegion  merchantRegion =new MerchantRegion();
        List <MerchantRegion>  merchantRegions=merchantRegion.selectList(new EntityWrapper<MerchantRegion>().eq("apply_id",merchantApply.getId()));
        //视频表信息
        MerchantVideo merchantVideo =new MerchantVideo();
        merchantVideo  =   merchantVideo.selectOne( new EntityWrapper<MerchantVideo>().eq("applyId",merchantApply.getId()));
         ApplyMoneyDTO  apply =new ApplyMoneyDTO();
        apply.setMerchantName(merchantApply.getMerchantname());
        apply.setLicense_number(merchantApply.getLicensenumber());
        apply.setOrganization_code(merchantApply.getOrganizationcode());
        apply.setCarPortNumber(merchantApply.getCarportnumber()==null?null:String.valueOf(merchantApply.getCarportnumber()));
        apply.setRepertoryNumber(merchantApply.getRepertorynumber()==null?null:String.valueOf(merchantApply.getRepertorynumber()));
        apply.setScale(merchantApply.getScale());
        apply.setRemark(merchantApply.getRemark());
        apply.setIdcard(merchantApply.getIdcard());
        if (merchantVideo != null) {
            apply.setVideoUrl(merchantVideo.getVideourl());
            apply.setVideoId(merchantVideo.getId());
        }
        for (MerchantRegion region:merchantRegions){
            if (region.getType().equals(UserTypeEnum.dealer.name())){
                apply.setRegionId(region.getId());
                apply.setProvince(region.getProvince());
                apply.setCity(region.getCity());
                apply.setDistrict(region.getDistrict());
                apply.setDealer_address(region.getDealerAddress());
                apply.setDetailed_address(region.getProvince()+region.getCity()+(StringUtils.isNotEmpty(region.getDistrict())?region.getDistrict():"")+region.getDetailedAddress());
            }else {
                apply.setXxregionId(region.getId());
                apply.setOffline_staff(region.getDetailedAddress());
            }
        }
        MerchantContactinfo merchantContactinfo =new MerchantContactinfo();
        List<MerchantContactinfo> telephone = merchantContactinfo.selectList(new EntityWrapper<MerchantContactinfo>().eq("acountId",acountId));
        List<ContactPersonDTO> person=new ArrayList<>();
        for(MerchantContactinfo m:telephone){
            ContactPersonDTO c=new ContactPersonDTO();
            c.setPositionFo(m.getRolename().toString());
            c.setPositionNmane(m.getPersonname());
            c.setPositionPhone(m.getPhonenumber());
            person.add(c);
        }
        apply.setPerson(person);
        CompanyDTO companyDTO= new CompanyDTO();
        CarsokAcount carsokAcount =new CarsokAcount();
        carsokAcount=carsokAcount.selectOne(new EntityWrapper<CarsokAcount>().eq("account",acountId));
        companyDTO.setMerchant_name(carsokAcount.getMerchantName());
        companyDTO.setMobile(carsokAcount.getMobile());
        companyDTO.setMerchant_address(carsokAcount.getMerchantAddress());
        companyDTO.setCity(carsokAcount.getCity());
        companyDTO.setProvince(carsokAcount.getProvince());
        result.put("merchantApply",apply);
        result.put("companyDTO",companyDTO);

        return result;
    }

    @Override
    public Map<String, Object> getOrderList(String acountId,int pageNum,int pageSize,String status,String productName,List<ApplyIndentRequest> list ,String task_key) {
        logger.info("进入updateApplicationStatus：++++++++++++");
        logger.info("传入acountid:"+acountId);
        Map<String, Object> result = new HashMap<>();
        Map<String,Object> map = new HashMap<>();
        map.put("acountId",acountId);
        List<String> lists = new ArrayList<>();

            for (int i = 0; list.size() > i; i++) {
                if (task_key.equals(list.get(i).getTaskName())) {
                lists.add(list.get(i).getApplyId());
            }
        }
        if (lists.size()<= 0){
            List<CarOrderDTO> carOrderDTOS = new ArrayList<>();
            result.put("orderList",carOrderDTOS);
            result.put("retCode", "0000");
            result.put("retMsg", "暂无数据");
            return result;
        }
        map.put("list",lists);
        map.put("productName",productName);
        Page<TaskInfoEntity> page = null;
        page = PageHelper.startPage(pageNum,pageSize);
        List<OrderList> orderLists=taskManageMapper.getOrderLists(map);
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        List<CarOrderDTO> carOrderDTOS = new ArrayList<>();
        for (OrderList m:orderLists){
            CarOrderDTO carOrderDTO =new CarOrderDTO();
            carOrderDTO.setProductId(m.getProductId().toString());
            BigDecimal b = new BigDecimal(10000);
            carOrderDTO.setIndentState(m.getIndentState());
            carOrderDTO.setIndentNumber(m.getIndentNumber());
            carOrderDTO.setApplyMoney(m.getApplyMoney()==null?null:m.getApplyMoney().toString());
            carOrderDTO.setMiles(m.getMiles()==null?null:Integer.toString(m.getMiles()/10000));
            carOrderDTO.setPic_path(m.getPic_path());
            carOrderDTO.setMiniprice(m.getMiniprice()==null?null:m.getMiniprice().divide(b).toString());
            carOrderDTO.setProduct_name(m.getProduct_name());
            carOrderDTO.setPrice(m.getPrice()==null?null:m.getPrice().divide(b).toString());
            carOrderDTO.setOn_shelf_time(m.getOn_shelf_time()==null?null:df.format(m.getOn_shelf_time()));
            carOrderDTO.setIndentId(m.getIndentId());
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date date = new Date();
            for (ApplyIndentRequest applyIndentRequest:list){
                if (applyIndentRequest.getApplyId().equals(m.getIndentId())){
                    carOrderDTO.setTaskId(applyIndentRequest.getTaskId());
                    carOrderDTO.setApplyId(applyIndentRequest.getApplyId());
                    carOrderDTO.setTaskKey(applyIndentRequest.getTaskName());
                }
            }
            carOrderDTO.setPlateNumber(m.getPlateNumber());
            carOrderDTO.setVin(m.getVin());
            carOrderDTO.setCurrentTime(formatter.format(date));
            carOrderDTO.setEvaluationTime(m.getEvaluationTime()==null?null:formatter.format(m.getEvaluationTime()));
            carOrderDTO.setAuditTime(m.getUpdateTime()==null?null:formatter.format(m.getUpdateTime()));
            carOrderDTOS.add(carOrderDTO);
        }

        result.put("orderList",carOrderDTOS);
        result.put("retCode", "0000");
        result.put("retMsg", "成功");
        return result;
    }

    @Override
    public OrderStatusUpdate selectUpdateTime(String orderId,String productId) {
        Map<String,String> map =new HashMap<>();
        map.put("orderId",orderId);
        map.put("productId",productId);
        OrderStatusUpdate orderStatus =  evaluationSheetMapper.selectUpdatetime(map);

        return orderStatus;
    }

    @Override
    public OrderStatus selectCreatedate(String orderId) {
        OrderStatus status =  merchantApplyAuditMapper.selectCreatedate(orderId);
        return status;
    }

    /**
     * 更改申请状态
     * @param applicationStatus
     * @return
     */
    @Override
    public Map<String, Object> updateApplicationStatus(ApplicationStatus applicationStatus) {
        logger.info("进入updateApplicationStatus：++++++++++++");
        Map<String, Object> result = new HashMap<>();
        try {
            String acountId = applicationStatus.getAcountId();
           logger.info("传入acountid:"+acountId);
            MerchantApply merchantApply = new MerchantApply();
            merchantApply.setVerifystatus(Integer.valueOf(applicationStatus.getVerifyStatus()));
            merchantApply.update(new EntityWrapper<MerchantApply>().eq("acountId", acountId));
        }catch (Exception e){
            e.printStackTrace();
            result.put("retCode","9999");
            result.put("retMsg","保存更新失败");
            return result;
        }
        result.put("retCode", "0000");
        result.put("retMsg", "成功");
        return result;
    }

    @Override
    public Map<String, Object> updateSignTask(SignTask signTask) {
        logger.info("进入updateSignTask方法");
        Map<String, Object> result = new HashMap<>();
        try {
            TaskManage taskManage=new TaskManage();
            taskManage  = taskManage.selectOne(new EntityWrapper<TaskManage>().eq("id",signTask.getTaskId()));
            if(taskManage.getTaskassigee() != null){
                result.put("retCode","9999");
                result.put("retMsg","已有人签收此单");
                return result;
            }else {
                taskManage.setTaskassigee(Long.valueOf(signTask.getMerchantId()));
                taskManage.update(new EntityWrapper<TaskManage>().eq("id", signTask.getTaskId()));
            }
        }catch (Exception e){
            e.printStackTrace();
            result.put("retCode","9999");
            result.put("retMsg","保存失败");
            return result;
        }
        result.put("retCode", "0000");
        result.put("retMsg", "成功");
        return result;
    }
    @Override
    public Map<String, Object> saveFinancingPicture( SaveFinancingPicture SaveFinancingPicture) {
        logger.info("进入saveFinancingPicture方法");
        Map<String, Object> result = new HashMap<>();
        try {
            List<String> list =new ArrayList<>();
            JSONObject json= JSON.parseObject(JSONObject.toJSONString(SaveFinancingPicture));
            Set<String> keyset = json.keySet();
            for (String key:keyset){
                JSONArray jsonArray = json.getJSONArray(key);
                List<String> idCards = jsonArray.toJavaList(String.class);
                for (String str : idCards) {
                    String url=null;
                    logger.info("base64:" + str.substring(str.lastIndexOf(",") + 1));
                    if (str.indexOf("http://") > -1) {
                        url = str;
                    } else {
                         url = uploadService.upload(str.substring(str.lastIndexOf(",") + 1));
                        list.add(url);
                    }
                }
            }

            result.put("returnValue",list);
        }catch (Exception e){
            e.printStackTrace();
            result.put("retCode","9999");
            result.put("retMsg","保存失败");
            return result;
        }
        result.put("retCode","0000");
        result.put("retMsg","保存成功");
        return result;
    }

    @Override
    public Map<String, Object> getAlreadyTask(List<CompleteTask> list, int pageNum, int pageSize, String merchantName) {
        logger.info("进入+++getAlreadyTask方法");
        List<String> lists =new ArrayList<>();
        for (int i= 0;list.size()>i;i++){
            lists.add(list.get(i).getApplyId());
        }
        Map<String,Object> map =new HashMap<>();
        map.put("merchantName",merchantName);
        map.put("lists",lists);
        Map<String,Object>result = new HashMap<>();
        Page<TaskInfoEntity> page = null;
        page = PageHelper.startPage(pageNum,pageSize);
        //根据用户id,取得任务列表
        List<TaskInfoEntity> taskInfoEntityList = merchantContactinfoMapper.queryTaskList(map);
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
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            for (CompleteTask completeTask:list){
                if (completeTask.getApplyId().equals(tie.getId())){

                    taskDTO.setEndTime(sdf.format(completeTask.getUpdateTime()));
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


}

