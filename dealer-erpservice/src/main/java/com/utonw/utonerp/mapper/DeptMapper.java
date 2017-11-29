package com.utonw.utonerp.mapper;

import com.utonw.dealer.api.entity.erp.Dept;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public interface DeptMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dept
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dept
     */
    int insert(Dept record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dept
     */
    int insertSelective(Dept record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dept
     */
    Dept selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dept
     */
    int updateByPrimaryKeySelective(Dept record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dept
     */
    int updateByPrimaryKeyWithBLOBs(Dept record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dept
     */
    int updateByPrimaryKey(Dept record);


    Dept queryDeptById(Integer id);

    /**
     * 添加用户需要查询的归属公司部门
     *
     * @param companyId
     * @param type
     * @return
     */
    List<Dept> queryDeptComById(@Param("companyId") int companyId, @Param("type") String type);

    /**
     * 消息群发加载所有部门
     * @param companyId
     * @return
     */
    List<Dept> queryDeptAll(@Param("companyId") int companyId);
    
    /**
     * 根据借款ID查询该笔业务所在部门的部门负责人的ID
     *
     * @param loanId 借款ID
     * @return 部门负责人ID
     */
    String selectDeptPrincipalIdByLoanId(@Param("loanId") String loanId);

    /**
     *根据公司ID及部门名称查询公司部门
     *
     * @param map
     * @return
     */
    List<Dept> queryDepByCompIdAndCompName(Map map);
}