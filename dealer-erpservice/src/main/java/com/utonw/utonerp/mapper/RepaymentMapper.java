package com.utonw.utonerp.mapper;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import com.utonw.dealer.api.entity.erp.Repayment;
import com.utonw.dealer.api.vo.CommissionVo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;


@Component
public interface RepaymentMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table repayment
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(String uuid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table repayment
     *
     * @mbggenerated
     */
    int insert(Repayment record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table repayment
     *
     * @mbggenerated
     */
    int insertSelective(Repayment record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table repayment
     *
     * @mbggenerated
     */
    Repayment selectByPrimaryKey(String uuid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table repayment
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(Repayment record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table repayment
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(Repayment record);

    List<Repayment> selectHaveRepaymentDetailByLoanId(@Param("loanId") String loanId, @Param
            ("array") Integer[] status);

    /**
     * 根据还款明细id查询还款
     *
     * @param replanDetaiId
     * @return
     */
    List<Repayment> selectRepaymentByDetailId(String replanDetaiId);


    List<Repayment> selectActualRepaymentDetail(@Param("loanId") String loanId);

    /**
     * 根据借款id查询
     *
     * @param loanId
     * @return
     */
    List<Repayment> selectByLoanId(String loanId);


    /**
     * 通过流程实例查询
     *
     * @param processinsId
     * @return
     */
    Repayment selectByprocessinsId(String processinsId);

    Repayment selectByRepayPlanId(Long replanDetaiId);
    Repayment selectByRepayPlanIdNoState(Long replanDetaiId);

    /**
     * 查询最后一次还款催收
     *
     * @return
     */
    Repayment selectMaxCurrentRepaymentByLoanId(@Param("loanId") String loanId);


    /**
     * 已还款查询（佣金计算使用）

     * @return
     */
//    List<CommissionVo> selectRepaymentCommissionDetail(@Param("openId") String openId, @Param("customerName") String customerName, @Param("endDate") Date endDate, @Param("startDate") Date startDate, @Param("userName") String userName,
//                                                        @Param("idCard") String idCard,@Param("orderId") String orderId,@Param("page") Integer page,@Param("pageSize")Integer pageSize);

    List<CommissionVo> selectRepaymentCommissionDetail(Map<String, Object> map);

    Map<String, Object> selectRepaymentSumCount(@Param("startDate") String startDate, @Param("endDate") String endDate);
    
    BigDecimal selectReapySumByLoanId(String loanId);
    
    Repayment selectLastRepaymentByLoanId(String loanId);
    
    List<String> selectRepaymentEnd(String dateRange, List list);
    
    BigDecimal selectRepayMoneyByRepaymentId(String uuid);
    
    BigDecimal selectRepayMoney(String id, String p, String isRepay);
    
    BigDecimal selectSumRepayMoney(String id);
    /**
     * 查询本期还款金额
     * @param param 本期还款的ID
     * @return 本金还款金额的总金额
     */
    Map<String,Object> selectNeedRepaySumById(String param);
    /**
     * 已经出账的放款总额
     * @param map
     * @return
     */
    BigDecimal selectRepaymentCommissionTotalSum(Map<String, Object> map);
}