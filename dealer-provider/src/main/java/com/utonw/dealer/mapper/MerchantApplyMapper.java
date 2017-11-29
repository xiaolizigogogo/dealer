package com.utonw.dealer.mapper;

import com.utonw.dealer.api.dto.response.*;
import com.utonw.dealer.api.dto.request.CustomerListRequest;
import com.utonw.dealer.api.dto.request.MerchantRequest;
import com.utonw.dealer.api.entity.MerchantApply;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.github.pagehelper.Page;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * Mapper接口
 * </p>
 *
 * @author wangyj
 * @since 2017-05-04
 */
@Mapper
public interface MerchantApplyMapper extends BaseMapper<MerchantApply> {

	ReviewStatusResponse selectReviewStatus();

	List<CustomerListResponse> selectCustomerList(Map map);
	List<CustomerListResponse> selectCustomerApplyList(Map map);
	List<CustomerInfoResponse> selectCustomerInfo(Map map);

	List<CustomerMerPicResponse> selectCustomerMerPic(Map map);

	List<CustomerMerPicResponse> selectCustomerAudioAndAddress(Map map);

	MerchantApply selectMerchantName(String id);
	
	/**
	 * @Description: 根据主键查询申请信息
	 * @param @param applyId
	 * @param @return    设定文件 
	 * @return MerchantApply    返回类型 
	 * @throws
	 * @author YX
	 */
	MerchantApply selectMerchantApplyById(String applyId);

	Page<CustomerListResponse> selectApplyByCondition(MerchantRequest merchantRequest);
	
	Map queryCreditInfo(String customerId);
	
	List<MerchantApply> merchantApplylist(String accountId);

}