package com.utonw.dealer.api.service.erp;


import com.utonw.dealer.api.entity.erp.Company;
import com.utonw.dealer.api.entity.erp.CompanyWithBLOBs;
import com.utonw.dealer.api.util.erp.PageModel;

import java.util.List;
import java.util.Map;

/**
 * Created by user on 2015/5/29.
 */
public interface ICompanyService {
    /**
     * 分页查询分公司列表
     *
     * @param currentPage 当前页数
     * @param param       参数
     * @return 分页对象
     */
    PageModel<Company> getCompanyPage(Integer currentPage, Map<String, Object> param);

    /**
     * 更新或者保存company
     *
     * @param companyWithBLOBs
     * @return
     */
    int saveOrUpdateCompany(CompanyWithBLOBs companyWithBLOBs);

    /**
     * 根据Id查询分公司对象
     *
     * @param id
     * @return
     */
    CompanyWithBLOBs selectByPrimaryKey(int id);

    /**
     * 更新分公司显示状态
     *
     * @param id
     * @return
     */
    boolean updateCompanyValidFlg(String[] id);


    /**
     * 添加用户页面动态查询所属公司
     * @return
     */
    List<Company> queryCompanyList();
    
    /**
     * 添加用户页面根据用户ID查询所属公司
     * @param userId
     */
    List<Company> queryCompanyListByUserId(String userId);
    
    //根据公司名称查询公司信息
    List<Company> queryCompanyInfoByName(String name);

    /**
     * 根据客户id查询公司列表
     * @return
     */
    List<Company> queryCompanyListByCustomerId(String customerId);
  
    /**
     * 动态查询数据访问权限
     * @param uuid
     * @return
     */
    List<Company> queryCompanyDataAccessLevel(String uuid);

    Boolean queryAccountNameExistService(String accountName);
    
}
