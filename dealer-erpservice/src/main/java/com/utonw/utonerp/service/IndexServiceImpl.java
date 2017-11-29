package com.utonw.utonerp.service;

import com.utonw.dealer.api.entity.erp.HomePageBean;
import com.utonw.dealer.api.entity.erp.User;
import com.utonw.dealer.api.service.erp.IIndexService;
import com.utonw.utonerp.mapper.CustomerRegisterInfoMapper;
import com.utonw.utonerp.mapper.LoanInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;

/**
 * 首页
 * Created by fuyung on 15-7-7.
 */
@Service("indexService")
@com.alibaba.dubbo.config.annotation.Service(version = "1.0.0")
public class IndexServiceImpl implements IIndexService {


    @Autowired
    CustomerRegisterInfoMapper customerRegisterInfoMapper;

    @Autowired
    LoanInfoMapper loanInfoMapper;

    @Override
    public HomePageBean queryPlatFormInfo(User user) {


        /** 查询昨日新增客户数 */
        Long cusCount = customerRegisterInfoMapper.queryYestdAddCus();

        /** 查询昨日新增借款笔数 */
        Long loanCount = loanInfoMapper.queryYestdAddLoanCount();

        /** 查询昨日新增借款金额 */
        BigDecimal loanMoney = loanInfoMapper.queryYestdAddLoanMoney();


        /**查询本月出帐笔数*/
        Long monthLoan = loanInfoMapper.queryMonthLoanCount(user.getUuid());

        /**查询本月放款金额*/
        BigDecimal monthLoanMoney = loanInfoMapper.queryMonthLoanMoney(user.getUuid());

        HomePageBean homePageBean = new HomePageBean();
        homePageBean.setYestdAddCustomer(cusCount.toString());
        homePageBean.setYestdAddLoanCount(loanCount.toString());
        homePageBean.setYestdAddLoanMoney(loanMoney.toString());
        homePageBean.setMonthLoanCount(monthLoan.toString());
        homePageBean.setMonthLoanMoney(monthLoanMoney.toString());


        return homePageBean;
    }
}
