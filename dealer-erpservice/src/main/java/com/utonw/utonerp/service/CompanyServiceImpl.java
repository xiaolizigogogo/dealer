package com.utonw.utonerp.service;

import com.utonw.dealer.api.entity.erp.Company;
import com.utonw.dealer.api.entity.erp.CompanyWithBLOBs;
import com.utonw.dealer.api.entity.erp.SysParamter;
import com.utonw.dealer.api.service.erp.ICompanyService;
import com.utonw.dealer.api.util.erp.Constants;
import com.utonw.dealer.api.util.erp.PageModel;
import com.utonw.utonbase.core.erpcommon.config.ParamterControl;
import com.utonw.utonerp.core.dao.BaseDao;
import com.utonw.utonerp.mapper.CompanyMapper;
import com.utonw.utonerp.mapper.SysParamterMapper;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Vector;

/**
 * Created by user on 2015/5/29.
 */

@Service("companyService")
@com.alibaba.dubbo.config.annotation.Service(version = "1.0.0")
public class CompanyServiceImpl implements ICompanyService {

    private static Logger logger = Logger.getLogger(CompanyServiceImpl.class);

    @Autowired
    BaseDao baseDao;

    @Autowired
    CompanyMapper companyMapper;

    @Autowired
    SysParamterMapper sysParamterMapper;
    @Autowired
    SystemParam systemParamManager;
    /**
     * 查询分公司列表
     *
     * @return
     */
    @Override
    public PageModel<Company> getCompanyPage(Integer currentPage, Map<String, Object> param) {
        PageModel<Company> pm = new PageModel<>();
        try {
            pm = baseDao.getPage("com.maiqianweng.mapper.CompanyMapper.getCompanyPage", param,
                    currentPage);
        } catch (Exception e) {
            e.printStackTrace();
            logger.info("查询用户分页信息失败-----" + e);
        }
        return pm;
    }


    /**
     * 更新或者保存company
     *
     * @param companyWithBLOBs companyWithBLOBs
     * @return int
     */
    @Override
    public int saveOrUpdateCompany(CompanyWithBLOBs companyWithBLOBs) {
        companyWithBLOBs.setUpdatedAt(new Date());
        companyWithBLOBs.setValidFlg(true);
        if(ParamterControl.COMPANY_CREDITLIMITANDPERCENTDIS.equals("n") ){
            companyWithBLOBs.setCreditLimit(null);
        }else{
            companyWithBLOBs.setCreditLimit(companyWithBLOBs.getCreditLimit().multiply(new BigDecimal(10000)));
        }
        if (companyWithBLOBs.getId() != null) {
            return companyMapper.updateByPrimaryKeyWithBLOBs(companyWithBLOBs);
        } else {
            companyWithBLOBs.setCreatedAt(new Date());
            //暂定对应，设置分公司的Parent ID不为空s
            //TODO:后续追加多公司管理的情况下，需要设置为母公司的ID.
            companyWithBLOBs.setParentId(Constants.GROUP_COMPANY_ID);
            int id = this.companyMapper.insertCompamy(companyWithBLOBs);
            String[] sys_arr = {"借款附件上传地址:LOAN_ATTACHMENT_FILEUPLOAD_PATH:sys_p"
                    ,"先息后本管理费率:INTEREST_RATES_BEFORE_MANAGE_FEE:sys_p"
                    ,"等额本息管理费率:AVERAGE_CAPITAL_PLUS_INTEREST_MANAGE_FEE:sys_p"
                    ,"借款自增序列号:AUTO_INCREMENT_ID:sys_p"
                    ,"当前年月:CURRENT_YEAR_MONTH:sys_p"
                    ,"GPS按月收取费用:GPS_MONTH_COST:sys_p"
                    ,"GPS一次性收取费用:GPS_ONCE_COST:sys_p"
                    ,"GPS按月一次性收取租金:GPS_MONTH_RENT_COST:sys_p"
                    ,"默认内部业务员返点比例:COMMSSIONRATE:sys_p"
                    ,"默认分销业务员返点比例:LOANCOMMSSIONRATE:fenxiao"
                    ,"推送分销地址:NOTIFY_CHARGE:fenxiao"
                    ,"逾期提醒天数:OVERDUE_DAY:sys_p"
                    ,"域名设置:DOMAIN_SETTIGS:msg"
                    ,"公司名称:COMPANY_TITLE:msg"
                    ,"SMTP服务器地址:STMP_ADDRESS:msg"
                    ,"发送邮件地址:MAIL_ADDRESS:msg"
                    ,"短信账号公司ID:SMS_CORPID:msg"
                    ,"短信账号密码:SMS_PASSWD:msg"
                    ,"自动催收提醒:AUTO_URGEREPAYMENT_DAY:sys_p"
                    ,"图片虚拟路径:IMG_VIRTUAL_PATH:sys_p"
                    ,"合同模板路径:CONTRACT_TEMPLATE_PAHT:sys_p"
                    ,"办理费(押证含GPS):TRANSACT_GPS_COST_HEADYEAR:sys_p"
                    ,"办理费续费(押证含GPS):TRANSACT_GPS_YEAR_COST:sys_p"
                    ,"办理费(押车):TRANSACT_COST:sys_p"
                    ,"合同编号前缀:LOAN_CONTRACT_PREFIX:sys_p"
                    ,"逾期罚息日利率:LOAN_OVERDUE_DAYLYRATE:sys_p"
                    ,"客户自动催收短信:SIMPLE_LOAN_CUSTOMER_SEND_MESSAGE:msg"
                    ,"用户自动催收短信:SIMPLE_LOAN_USER_SEND_MESSAGE:msg"
            };
            //新建分公司的时候需要对集团公司的参数配置进行copy.
            List<SysParamter> sp = sysParamterMapper.selectSysParameterById(Constants.GROUP_COMPANY_ID);
            for(int i=0;i<sys_arr.length;i++){
                SysParamter sys = new SysParamter();
                sys.setSysName(sys_arr[i].split(":")[0]);
                sys.setSysKey(sys_arr[i].split(":")[1]);
                sys.setSysType(sys_arr[i].split(":")[2]);
                for (int j=0;j<sp.size();j++){
                    if (sp.get(j).getSysKey().equals( sys_arr[i].split(":")[1])){
                        sys.setSysValue(sp.get(j).getSysValue());
                        break;
                    }
                }
                sys.setCompanyId(companyWithBLOBs.getId());
                sysParamterMapper.insert(sys);
                systemParamManager.refreshCache();
            }
            return id;
        }
    }


    /**
     * 根据Id查询分公司对象
     *
     * @param id
     * @return
     */
    @Override
    public CompanyWithBLOBs selectByPrimaryKey(int id) {
        return companyMapper.selectByPrimaryKey(id);
    }

    /**
     * 更新分公司显示状态
     *
     * @param id
     * @return
     */
    @Override
    public boolean updateCompanyValidFlg(String[] id) {
        if (id != null && id.length > 0) {

            for (String ids : id) {
                CompanyWithBLOBs companyWithBLOBs = companyMapper.selectByPrimaryKey(Integer
                        .parseInt(ids));
                if (companyWithBLOBs != null) {
                    companyWithBLOBs.setValidFlg(false);
                }
                companyMapper.updateByPrimaryKey(companyWithBLOBs);
            }
            return true;
        }
        return false;
    }

    /**
     * 添加用户页面动态查询所属公司
     * @return
     */
    @Override
    public List<Company> queryCompanyList() {
        List<Company> list = companyMapper.queryCompanyList();
        return list;
    }

    /**
     * 添加用户页面动态查询所属公司
     * @return
     */
    @Override
    public List<Company> queryCompanyListByUserId(String userId) {
        List<Company> list = companyMapper.queryCompanyListByUserId(userId);
        return list;
    }

    /**
     * 添加用户指定查询公司信息
     * @return
     */
    @Override
    public List<Company> queryCompanyInfoByName(String name) {
        List<Company> list = companyMapper.queryCompayByName(name);
        return list;
    }
    /**
     * 根据客户ID查询公司列表
     * @param customerId 客户ID
     * @return
     */
    @Override
    public List<Company> queryCompanyListByCustomerId(String customerId) {
        List<Company> list;
        if (customerId == null){
            list = new Vector<Company>();
        }else
        {
            list = companyMapper.queryCompanyListByCustomerId(customerId);
        }
        return list;
    }

    /**
     * 动态查询数据访问权限
     *
     * @param response
     */
    public List<Company> queryCompanyDataAccessLevel(String uuid) {
        List<Company> list = companyMapper.queryCompanyDataAccessLevel(uuid);
        return list;
    }

    /**
     * 查询账户名是否存在
     */
    public Boolean queryAccountNameExistService(String accountName){
        Boolean chk = Boolean.FALSE;
        Boolean result = companyMapper.selectAccountNameExistService(accountName);
        if(result != null){
            return result;
        }
        return chk;
    }

}
