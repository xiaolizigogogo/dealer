package com.utonw.dealer.mapper;


import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.github.pagehelper.Page;
import com.utonw.dealer.api.dto.request.OrderPageRequest;
import com.utonw.dealer.api.dto.response.IndentCountResponse;
import com.utonw.dealer.api.dto.response.LoanInfoResponse;
import com.utonw.dealer.api.entity.*;

/**
 * <p>
 * Mapper接口
 * </p>
 *
 * @author wangyj
 * @since 2017-05-05
 */
public interface MerchantIndentMapper extends BaseMapper<MerchantIndent> {

	CompanyDetails getCompanyDetails(String id);

    List<TaskInfoErpEntity> queryIndentInfoErp(Map<String,Object> map);

	// 贷前订单状态统计
	IndentCountResponse selectIndentCount(String id);

	// 借款需求基本信息
	LoanInfoResponse selectLoanInfo(String id);

	List<MerchantIndent> selectorderForm(String date);

	/**
	 * @Description: 查询还款计划
	 * @param @param merchantIndentId
	 * @param @return    设定文件 
	 * @return RepaymentPlan    返回类型
	 * @throws
	 * @author YX
	 */
	RepaymentPlan getRepaymentPlanInfo(String merchantIndentId);
	
	/**
	 * @Description: 根据主键查询
	 * @param @param indentId
	 * @param @return    设定文件 
	 * @return MerchantIndent    返回类型 
	 * @throws
	 * @author YX
	 */
	MerchantIndent selectMerchantIndentById(String indentId);

	Page<MerchantIndentInfo> selectOrderByCondition(OrderPageRequest orderPageRequest);

	Map selectOrderCount();

	List<Supervision> selectSupervisionList(Map<String,Object> map );
	List<Supervision> selectIndentCar(Map<String,Object> map);

	int selectIndentLendedCount(Long acountId);
	
	Page<MerchantIndentInfo> selectOrderByids(OrderPageRequest orderPageRequest);
}