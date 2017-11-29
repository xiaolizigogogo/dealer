package com.utonw.dealer.service.impl;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.dubbo.config.annotation.Service;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.utonw.dealer.api.dto.*;
import com.utonw.dealer.api.dto.request.MerchantLoanAplRequest;
import com.utonw.dealer.api.entity.*;
import com.utonw.dealer.api.enums.*;
import com.utonw.dealer.api.service.IMerchantAplVerifyService;
import com.utonw.dealer.api.service.IOrderServiceCSD;
import com.utonw.dealer.api.service.IWorkFlowServiceCSD;
import com.utonw.dealer.base.UploadService;
import com.utonw.dealer.mapper.*;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by WANGYJ on 2017/5/8.
 */
@Service(version="1.0.0",timeout = 1500000)
public class MerchantAplVerifyServiceImpl extends ServiceImpl<MerchantApplyMapper, MerchantApply> implements IMerchantAplVerifyService{
    private static final Logger logger = LoggerFactory.getLogger("MerchantAplVerifyServiceImpl.class");

    @Autowired
    private UploadService uploadService;

    @Autowired
    MerchantPictureMapper merchantPictureMapper;

    @Autowired
    MerchantContactinfoMapper merchantContactinfoMapper;

    @Autowired
    MerchantApplyMapper merchantApplyMapper;

    @Autowired
    MerchantIndentMapper merchantIndentMapper;

    @Autowired
    CarsokAcountMapper carsokAcountMapper;

    @Autowired
    MerchantContractMapper merchantContractMapper;

    @Autowired
    ContractImageurlMapper contractImageurlMapper;

    @Autowired
    EvaluationSheetMapper evaluationSheetMapper;

    @Autowired
    CarsokChildAccountMapper carsokChildAccountMapper;
    @Autowired
    CarsokPruductOldcarMapper carsokPruductOldcarMapper;


    @Override
    @Transactional
    public Map<String, Object> updateMerchantAplVerify(ApplyVerifyDTO applyVerifyDTO) throws  Exception{
        Map<String,Object> ret = new HashMap<>();
            //删除该车商的所有的图片
            Long accountId = Long.parseLong(applyVerifyDTO.getApplyMoneyDTO().getAcountId());
            merchantPictureMapper.delete(new EntityWrapper<MerchantPicture>().eq("acountId",accountId));
            //更新基本信息
            MerchantApply merchantApply = new MerchantApply();
            merchantApply.setAcountid(Long.parseLong(applyVerifyDTO.getApplyMoneyDTO().getAcountId()));
            merchantApply.setMerchantname(applyVerifyDTO.getApplyMoneyDTO().getMerchantName());
            merchantApply.setLicensenumber(applyVerifyDTO.getApplyMoneyDTO().getLicense_number());
            merchantApply.setOrganizationcode(applyVerifyDTO.getApplyMoneyDTO().getOrganization_code());
            merchantApply.setReviewstatus(1);
            //更新复核信息
            merchantApply.setCarportnumber(Integer.valueOf(applyVerifyDTO.getMerchantVerifyDTO().getParkSpaceNumber()));
            merchantApply.setRepertorynumber(Integer.valueOf(applyVerifyDTO.getMerchantVerifyDTO().getInStoreCarNumber()));
            merchantApply.setScale(applyVerifyDTO.getMerchantVerifyDTO().getMerchantScale());
            merchantApply.setRemark(applyVerifyDTO.getMerchantVerifyDTO().getRemark());
            merchantApply.update(new EntityWrapper<MerchantApply>().eq("acountId",accountId));

            //删除联络人信息
            merchantContactinfoMapper.delete(new EntityWrapper<MerchantContactinfo>().eq("acountId",accountId));


            //更新联络人信息
            for (int i = 0; i < applyVerifyDTO.getApplyMoneyDTO().getPerson().size(); i++) {
                MerchantContactinfo merchantContactinfo = new MerchantContactinfo();
                merchantContactinfo.setAcountid(Long.parseLong(applyVerifyDTO.getApplyMoneyDTO().getAcountId()));
                merchantContactinfo.setPersonname(applyVerifyDTO.getApplyMoneyDTO().getPerson().get(i).getPositionNmane());
                merchantContactinfo.setRolename(Integer.parseInt(applyVerifyDTO.getApplyMoneyDTO().getPerson().get(i).getPositionFo()));
                merchantContactinfo.setPhonenumber(applyVerifyDTO.getApplyMoneyDTO().getPerson().get(i).getPositionPhone());
                merchantContactinfo.insert();
            }
            //保存图片
            ImageDTO imageDTO = applyVerifyDTO.getImageDTO();
            List<MerchantPicture> pictures = new ArrayList<>();
            ImageTypeEnum[] imageTypes = ImageTypeEnum.values();
            JSONObject json= JSON.parseObject(JSONObject.toJSONString(imageDTO));
            HashMap<String, List<String>> map = new HashMap<String, List<String>>();
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
            //保存图片信息
            for (int i = 0; i < pictures.size(); i++) {
                MerchantPicture merchantPicture = new MerchantPicture();
                merchantPicture.setAcountid(accountId);
                merchantPicture.setFileurl(pictures.get(i).getFileurl());
                merchantPicture.setFiletitle(pictures.get(i).getFiletitle());
                merchantPicture.setCreatedate(new Date());
                merchantPicture.insert();
            }
            //添加定位地址
            MerchantRegion merchantRegion = new MerchantRegion();
            if (applyVerifyDTO.getApplyMoneyDTO().getXxregionId()== null) {
                merchantRegion.setApplyId(applyVerifyDTO.getApplyMoneyDTO().getApplyId());
                merchantRegion.setProvince(StringUtils.isEmpty(applyVerifyDTO.getApplyMoneyDTO().getProvince())?applyVerifyDTO.getApplyMoneyDTO().getCity():applyVerifyDTO.getApplyMoneyDTO().getProvince());
                merchantRegion.setCity(applyVerifyDTO.getApplyMoneyDTO().getCity());
                merchantRegion.setDistrict(applyVerifyDTO.getApplyMoneyDTO().getDistrict());
                merchantRegion.setDetailedAddress(applyVerifyDTO.getApplyMoneyDTO().getDetailed_address());
                merchantRegion.setContractTime(new Date());
                merchantRegion.setType("offline_staff");
                merchantRegion.insert();
            }

            //添加视频
            MerchantVideo merchantVideo =new MerchantVideo();
            if (applyVerifyDTO.getApplyMoneyDTO().getVideoId() == null) {
                merchantVideo.setVideourl(applyVerifyDTO.getApplyMoneyDTO().getVideoUrl());
                merchantVideo.setApplyid(applyVerifyDTO.getApplyMoneyDTO().getApplyId());
                merchantVideo.setCreateddate(new Date());
                merchantVideo.setVideotitle("scene");
                merchantVideo.insert();
            }else {
                merchantVideo.setVideourl(applyVerifyDTO.getApplyMoneyDTO().getVideoUrl());
                merchantVideo.update(new EntityWrapper<MerchantVideo>().eq("id",applyVerifyDTO.getApplyMoneyDTO().getVideoId()));
            }


        ret.put("retCode","0000");
        ret.put("retMsg","保存成功");
        return ret;
    }

    @Override
    public Map<String, Object> submitOrderTrialReview(TrialReivewDTO trialReivewDTO) {
        Map<String,Object> result = new HashMap<>();
        try {
            //参数有效性检查
            if (trialReivewDTO.getApplyid() == null){
                result.put("retCode","9999");
                result.put("retMsg","参数错误:applyid为空");
            }
            String applyId = trialReivewDTO.getApplyid();
            int applyCount = merchantIndentMapper.selectCount(new EntityWrapper<MerchantIndent>().eq("id",applyId));
            if (applyCount < 1){
                result.put("retCode","9999");
                result.put("retMsg","参数错误:applyid错误，没有该申请记录");
                return result;
            }
            //进行数据插入
            MerchantApplyAudit merchantApplyAudit = new MerchantApplyAudit();
            merchantApplyAudit.setApplyid(trialReivewDTO.getApplyid());
            merchantApplyAudit.setApprovalamount(new BigDecimal(trialReivewDTO.getApprovalamount()));
            merchantApplyAudit.setCreatedate(new Date());
            merchantApplyAudit.setPassed(trialReivewDTO.getPassed());
            merchantApplyAudit.setRemarks(trialReivewDTO.getRemarks());
            merchantApplyAudit.insert();
            TaskManage taskManage = new TaskManage();
            taskManage.setStatus(1);
            taskManage.update(new EntityWrapper<TaskManage>().eq("indentId",applyId).eq("roleId","ptpzcsry"));
            result.put("retCode","0000");
            result.put("retMsg","成功");
        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public Map<String, Object> getMerchantInfoByIndentId(MerchantLoanAplRequest merchantLoanAplRequest) {
        Map<String,Object> result = new HashMap<>();
        try{
            //判断订单号是否为空
            //参数有效性检查
            if (merchantLoanAplRequest.getIndentId() == null){
                result.put("retCode","9999");
                result.put("retMsg","参数错误：intend_uuid为空");
            }
            String intend_uuid = merchantLoanAplRequest.getIndentId();
            int applyCount = merchantIndentMapper.selectCount(new EntityWrapper<MerchantIndent>().eq("id",intend_uuid));
            if (applyCount < 1){
                result.put("retCode","9999");
                result.put("retMsg","参数错误:indent_uuid错误，没有该申请记录");
            }
            //查询订单的信息
            MerchantIndent merchantIndent = new MerchantIndent();
            merchantIndent.setId(intend_uuid);
            MerchantIndent merchantIndent_real = merchantIndentMapper.selectOne(merchantIndent);
            //查询车商的信息
            Long accountId = merchantIndent_real.getAcountId();

            //根据车商信息取出车商资质信息
            List<MerchantApply> merchantApplyList = merchantApplyMapper.selectList(new EntityWrapper<MerchantApply>().eq("acountId",accountId));
            //判断是否有数据
            if ((merchantApplyList.size() == 0) || (merchantApplyList.size() > 1)){
                result.put("retCode","9999");
                result.put("retMsg","数据错误:没找到车商资质申请的记录，或者多于一条资质申请记录");
                return result;
            }
            MerchantApply merchantApply = merchantApplyList.get(0);
            //查询放款中订单的个数
            //待放款及还款中的状态
            List<Integer> statusList = new ArrayList<>();
            statusList.add(IndentStatusEnum.getCodeByStatus("lended"));
            statusList.add(IndentStatusEnum.getCodeByStatus("repayment"));
            int count = merchantIndentMapper.selectCount(new EntityWrapper<MerchantIndent>().eq("acount_id",accountId)
                    .in("indentState",statusList));
            //查询合同及合同的路径
            //查询合同列表
            List<MerchantContract> merchantContractList = merchantContractMapper.selectList(new EntityWrapper<MerchantContract>().eq("acountId",accountId));
            //查询合同类型图片
            Map<String,Object>map = new HashMap<>();
            List<ContractImageurl> contractImageurlList = contractImageurlMapper.selectByMap(map);
            Map<String,Object> contractImageUrlMap = new HashMap<>();
            for (ContractImageurl contractImageurl:contractImageurlList){
                contractImageUrlMap.put(contractImageurl.getContracttype().toString(),contractImageurl.getImageurl());
            }
            //查询评估信息
            EvaluationSheet evaluationSheet = new EvaluationSheet();
            evaluationSheet.setIndentid(merchantIndent_real.getId());
            EvaluationSheet evaluationSheet_real = evaluationSheetMapper.selectOne(evaluationSheet);
            Long eval_account = evaluationSheet_real.getUpdateby();

            //查询评估师
            CarsokChildAccount carsokChildAccount = new CarsokChildAccount();

            carsokChildAccount.setChildAccountMobile(eval_account.toString());
            CarsokChildAccount carsokChildAccount_real = carsokChildAccountMapper.selectOne(carsokChildAccount);

            //查询评估师所在的公司信息
            CarsokAcount carsokAcount = new CarsokAcount();
            carsokAcount.setAccount(carsokChildAccount_real.getAccountPhone());
            CarsokAcount carsokAcount_real = carsokAcountMapper.selectOne(carsokAcount);

            //查询申请表信息
            MerchantApplyAudit merchantApplyAudit =new MerchantApplyAudit();
            merchantApplyAudit =merchantApplyAudit.selectOne(new EntityWrapper<MerchantApplyAudit>().eq("applyId",intend_uuid));

            //组装结果
            //合同图片
            List<ContractDTO> contractDTOList = new ArrayList<>();
            for (MerchantContract merchantContract:merchantContractList){
                ContractDTO contractDTO = new ContractDTO();
                contractDTO.setContract_path(merchantContract.getContractpath());
                contractDTO.setContract_type(merchantContract.getContracttype());
                contractDTO.setImageurl((String)contractImageUrlMap.get(contractDTO.getContract_type()));
                contractDTO.setContractNum(merchantContract.getContractnum());
                contractDTOList.add(contractDTO);
            }
            //车商信息
            MerchantInfoDTO merchantInfoDTO = new MerchantInfoDTO();
            merchantInfoDTO.setAcountId(accountId==null?null:accountId.toString());
            merchantInfoDTO.setProductId(evaluationSheet_real.getPruductid()==null?null:evaluationSheet_real.getPruductid().toString());
            merchantInfoDTO.setApplymoney(merchantIndent_real.getApplymoney()==null?null:merchantIndent_real.getApplymoney().toString());
            merchantInfoDTO.setAppraisers_price(evaluationSheet_real.getAppraisersprice()==null?null:evaluationSheet_real.getAppraisersprice().toString());
            merchantInfoDTO.setAuditstatus(merchantApply.getReviewstatus()==null?null:QualificationStatusEnum.getStatusByCode(merchantApply.getReviewstatus()));
            merchantInfoDTO.setCity(carsokAcount_real.getCity());
            merchantInfoDTO.setProvince(carsokAcount_real.getProvince());
            merchantInfoDTO.setFinancing_number(String.valueOf(count));
            merchantInfoDTO.setLimitPercentage(merchantApply.getLimitpercentage()==null?null:merchantApply.getLimitpercentage().toString());
            merchantInfoDTO.setLoanLimit(merchantApply.getLoanlimit()==null?null:merchantApply.getLoanlimit().toString());
            merchantInfoDTO.setMerchant_address(carsokAcount_real.getMerchantAddress());
            merchantInfoDTO.setMerchant_name(merchantApply.getMerchantname());
            merchantInfoDTO.setMobile(carsokAcount_real.getMobile());
            merchantInfoDTO.setMonthlyInterest(merchantApply.getMonthlyinterest()==null?null:merchantApply.getMonthlyinterest().toString());
            merchantInfoDTO.setMerchant_price(evaluationSheet_real.getAppraisersprice()==null?null:evaluationSheet_real.getAppraisersprice().toString());
            merchantInfoDTO.setApplyId(merchantLoanAplRequest.getIndentId());
            //评估师相关信息
            AppraiserDTO appraiserDTO = new AppraiserDTO();
            appraiserDTO.setMerchant_name(carsokAcount_real.getMerchantName());
            appraiserDTO.setMobile(carsokChildAccount_real.getChildAccountMobile());
            appraiserDTO.setReal_name(carsokChildAccount_real.getChildAccountName());
            //评估信息相关
            MerchantApplyAuditDTO merchantApplyAuditDTO =new MerchantApplyAuditDTO();
            if (merchantApplyAudit != null) {
                merchantApplyAuditDTO.setApprovalAmount(merchantApplyAudit.getApprovalamount() == null ? null : String.valueOf(merchantApplyAudit.getApprovalamount()));
                merchantApplyAuditDTO.setPassed(merchantApplyAudit.getPassed() == null ? null : String.valueOf(merchantApplyAudit.getPassed()));
                merchantApplyAuditDTO.setRemarks(merchantApplyAudit.getRemarks() == null ? null : merchantApplyAudit.getRemarks());
            }
            MerchantAplInfoDTO merchantAplInfoDTO = new MerchantAplInfoDTO();
            merchantAplInfoDTO.setAppraiserDTO(appraiserDTO);
            merchantAplInfoDTO.setContractDTO(contractDTOList);
            merchantAplInfoDTO.setMerchantInfoDTO(merchantInfoDTO);
            merchantAplInfoDTO.setMerchantApplyAuditDTO(merchantApplyAuditDTO);
            result.put("data",merchantAplInfoDTO);
            result.put("retCode","0000");
            result.put("retMsg","成功");
        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 获取公司详情
     * @param companyDetailsDTO
     * @return
     */
    @Override
    public Map<String, Object> queryCompanyDetails(CompanyDetailsDTO companyDetailsDTO) {
        logger.info("进入queryCompanyDetails方法：");
        Map<String,Object> result = new HashMap<>();
        String acountId =companyDetailsDTO.getAcountId();
        logger.info("传入acountId:"+acountId);
        CompanyDetails companyDetails =new CompanyDetails();
        companyDetails = merchantIndentMapper.getCompanyDetails(companyDetailsDTO.getIndentId());
        /**
         * 查询订单信息
         */
        MerchantIndent merchantInfo = new MerchantIndent();
        //查询放款中订单的个数
        //待放款及还款中的状态
        List<Integer> statusList = new ArrayList<>();
        statusList.add(IndentStatusEnum.getCodeByStatus("lended"));
        statusList.add(IndentStatusEnum.getCodeByStatus("repayment"));
        int allocatedTotal=  merchantInfo.selectCount(new EntityWrapper<MerchantIndent>().eq("acount_id",acountId).in("indentState",statusList));
         companyDetails.setAllocatedTotal(allocatedTotal);
        BigDecimal  applyMoney = companyDetails.getApplyMoney();
        companyDetails.setApplyMoney(applyMoney);
         result.put("company",companyDetails);

        /**
         * 查询相关照片
         */
        MerchantPicture merchantPicture = new MerchantPicture();
        List<MerchantPicture>  merchantPictures =  merchantPicture.selectList(new EntityWrapper<MerchantPicture>().eq("acountId",acountId));
        Map<String,List<String>> map=new HashMap<>();
        List list=null;
        for(ImageTypeEnum image:ImageTypeEnum.values()){
            map.put(image.name(),new ArrayList<String>());
        }
        for(int i = 0; i<merchantPictures.size();i++){
            list=map.get(merchantPictures.get(i).getFiletitle().name());
            list.add(merchantPictures.get(i).getFileurl());
        }
        result.put("picture",map);
        MerchantContactinfo merchantContactinfo = new MerchantContactinfo();
        result.put("Contactinfo",merchantContactinfo.selectList(new EntityWrapper<MerchantContactinfo>().eq("acountId",acountId)));
        return result;
    }

    @Override
    public Map<String, Object> queryCarDetails(String productId) {
        logger.info("进入queryCarDetails方法");
         Map<String,Object> result = new HashMap<>();
        CarDetails carDetails=carsokPruductOldcarMapper.queryCarDetails(Integer.parseInt(productId));
        /**
         * 组装车辆信息
         */
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        BigDecimal b = new BigDecimal(10000);
        CarDetailsDTO carDetailsDTO = new CarDetailsDTO();
        carDetailsDTO.setBuyprice(carDetails.getBuyprice()==null?null:carDetails.getBuyprice().divide(b).toString());
        carDetailsDTO.setC_brand(carDetails.getC_brand());
        carDetailsDTO.setC_model(carDetails.getC_model());
        carDetailsDTO.setC_type(carDetails.getC_type());
        carDetailsDTO.setFirst_up_time(carDetails.getFirst_up_time()==null?null:df.format(carDetails.getFirst_up_time()));
        carDetailsDTO.setHostlingCost(carDetails.getHostlingCost()==null?null:carDetails.getHostlingCost().divide(b).toString());
        carDetailsDTO.setMiles(Integer.toString(carDetails.getMiles() / 10000));
        carDetailsDTO.setMiniprice(carDetails.getMiniprice()==null?null:carDetails.getMiniprice().divide(b).toString());
        carDetailsDTO.setPrice(carDetails.getProvince());
        carDetailsDTO.setProvince(carDetails.getProvince());
        carDetailsDTO.setReal_name(carDetails.getReal_name());
        carDetailsDTO.setSystemAssess(carDetails.getSystemAssess()==null?null:carDetails.getSystemAssess().divide(b).toString());
        result.put("carDetails",carDetailsDTO);
        /**
         * 获取图片
         */
        CarsokPicture carsokPicture = new CarsokPicture();
        result.put("carPicture",carsokPicture.selectList(new EntityWrapper<CarsokPicture>().eq("product_id",productId)));
        CarFile carFile = new CarFile();
       List<CarFile> carFiles=carFile.selectList(new EntityWrapper<CarFile>().eq("product_id",productId));
        Map<String,List<String>> map=new HashMap<>();
        List list=null;
        for(CarImageTypeEnum image:CarImageTypeEnum.values()){
            map.put(image.name(),new ArrayList<String>());
        }
        for(int i = 0; i<carFiles.size();i++){
            list=map.get(carFiles.get(i).getHeadlinetype().name());
            list.add(carFiles.get(i).getPicpath());
        }
        result.put("carFile",map);
         return result;
    }

}
