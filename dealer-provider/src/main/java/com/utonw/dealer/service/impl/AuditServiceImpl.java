package com.utonw.dealer.service.impl;

import com.alibaba.dubbo.common.utils.StringUtils;
import com.alibaba.dubbo.config.annotation.Service;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.utonw.dealer.api.dto.AuditContractDTO;
import com.utonw.dealer.api.dto.CarsokProductDTO;
import com.utonw.dealer.api.entity.*;
import com.utonw.dealer.api.enums.AuditContracEnum;
import com.utonw.dealer.api.service.IAuditService;
import com.utonw.dealer.base.UploadService;
import com.utonw.dealer.mapper.CarsokProductMapper;
import com.utonw.dealer.mapper.MerchantApplyMapper;
import com.utonw.dealer.mapper.MerchantIndentMapper;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;


/**
 * Created by SEELE on 2017/5/8.
 */
@Service(version="1.0.0",timeout = 1500000)
@Transactional
public class AuditServiceImpl extends ServiceImpl<MerchantApplyMapper, MerchantApply> implements IAuditService {
    private static final Logger logger = LoggerFactory.getLogger("MerchantAplVerifyServiceImpl.class");
    //图片服务器地址
   /* @Value("${pic.host}")
    private String pichost;*/
    @Autowired
    private UploadService uploadService;
    @Autowired
    MerchantIndentMapper merchantIndentMapper;
    @Autowired
    CarsokProductMapper carsokProductMapper;
    @Override
    public Map<String, Object> getAudit(String acountId) {
        logger.info("进入getAudit方法");
        Long id =Long.parseLong(acountId);
        logger.info("传入的acount:"+id);
        Map<String,Object> result = new HashMap();
        MerchantApply merchantApply = new MerchantApply();
        result.put("companyData",merchantApply.selectOne(new EntityWrapper<MerchantApply>().eq("acountId", id)));
        MerchantContract merchantContract = new MerchantContract();
        result.put("aitContractDTO",merchantContract.selectList(new EntityWrapper<MerchantContract>().eq("acountId", id)));
        BankCard bankCard = new BankCard();
        result.put("BankCardDTO",bankCard.selectList(new EntityWrapper<BankCard>().eq("acount_id",id)));
        MerchantIndent merchantIndent = new MerchantIndent();
        result.put("merchantIndent",merchantIndent.selectOne(new EntityWrapper<MerchantIndent>().eq("acount_id",id)));
        MerchantContractName merchantContractName =new MerchantContractName();
        result.put("ContractName",merchantContractName.selectList(new EntityWrapper<MerchantContractName>().orderBy("ContractOrder")));
        result.put("retCode","0000");
        result.put("retMsg","成功");
         return  result;
    }

    @Override
    public Map<String, Object> queryAuditContract(AuditContractDTO auditContractDTO) {
        logger.info("进入queryAuditContract方法");
        Random ran=new Random();
        logger.info("传进来的acountId:"+auditContractDTO.getAcountId());
        Map<String,Object> result = new HashMap<>();
        MerchantContract   merchantContract = new MerchantContract();
        //先删除摄像头图片
        merchantContract.delete(new EntityWrapper<MerchantContract>().eq("acountId",auditContractDTO.getAcountId()).eq("contractType","CameraPicture"));
        try {
        List<MerchantContract> pictures = new ArrayList<>();
        List<String>  cameraPicture =   auditContractDTO.getCameraPicture();
            for (String url:cameraPicture) {
                String picture = null;
                MerchantContract   merchantContracts = new MerchantContract();
                if(url.indexOf("http://")>-1){
                   picture =url;
                }else {
                     picture = uploadService.upload(url.substring(url.lastIndexOf(",") + 1));
                }
                merchantContracts.setContracttype(AuditContracEnum.valueOf("CameraPicture"));
                merchantContracts.setContractpath(picture);
                pictures.add(merchantContracts);
            }

        for (int i = 0; i < pictures.size(); i++) {
            String random="";

            for(int j=0;j<6;j++){
                random=random+ ran.nextInt(9);
            }
            Long   id = Long.valueOf(auditContractDTO.getAcountId());
            MerchantContract merchantContract1= new MerchantContract();
            merchantContract1.setContracttype(pictures.get(i).getContracttype());
            merchantContract1.setContractpath(pictures.get(i).getContractpath());
            merchantContract1.setContractnum( "UT"+random);
            merchantContract1.setAcountid(id);
            merchantContract1.setUploaddate(new Date());
            merchantContract1.insert();
        }
        }catch (Exception e)
        {
            e.printStackTrace();
            result.put("retCode","9999");
            result.put("retMsg","保存更新失败");
            throw new RuntimeException(JSON.toJSONString(result));
        }
        result.put("retCode","0000");
        result.put("retMsg","上传成功");
        result.put("data","上传成功");
        return result;
    }

    @Override
    public Map<String, Object> delMerchantContract(String id) {
        MerchantContract merchantContract =new MerchantContract();
        merchantContract.delete(new EntityWrapper<MerchantContract>().eq("id",id));
        return null;
    }

	@Override
	public Map<String, Object> getAgreement(String pruductId, String acountId) {
		Map<String,Object> result = new HashMap<>();
		try {
			result.put("pruductId", pruductId);
			result.put("acountId", acountId);
            CarsokProductDTO carsokProductDTO =new CarsokProductDTO();
            carsokProductDTO = carsokProductMapper.getAgreement(result);
            MerchantIndent merchantIndent =new MerchantIndent();
            merchantIndent= merchantIndent.selectOne(new EntityWrapper<MerchantIndent>().eq("productId",pruductId));
            if (merchantIndent!=null) {
                carsokProductDTO.setPlateNumber(merchantIndent.getPlatenumber()==null?null:merchantIndent.getPlatenumber());
                carsokProductDTO.setJudgeMoney(merchantIndent.getJudgemoney());
            }
			result.clear();
			result.put("carsokProductDTO", carsokProductDTO);
			result.put("retCode","0000");
			result.put("retMsg","成功");
		} catch (Exception e) {
			e.printStackTrace();
            result.put("retCode","9999");
            result.put("retMsg","查询签订合同失败");
            //throw new RuntimeException(JSON.toJSONString(result));
		}
		return result;
	}

    @Override
    public Map<String, Object> deleteAgreement(String contractId) {
        Map<String,Object> result = new HashMap<>();
        try {
            CarContract carContract = new CarContract();
           boolean deleteok =  carContract.delete(new EntityWrapper<CarContract>().eq("id", contractId));
           if (deleteok){
               result.put("retCode","0000");
               result.put("retMsg","删除成功");
           }else {
               result.put("retCode","9999");
               result.put("retMsg","删除失败");
           }

        }catch (Exception e){
            result.put("retCode","9999");
            result.put("retMsg","删除失败");
        }
        return result;
    }
}
