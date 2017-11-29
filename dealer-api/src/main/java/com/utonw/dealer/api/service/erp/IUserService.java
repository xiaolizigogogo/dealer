package com.utonw.dealer.api.service.erp;


import com.utonw.dealer.api.dto.request.erp.LoanOperateResult;
import com.utonw.dealer.api.entity.erp.ModuleManageTree;
import com.utonw.dealer.api.entity.erp.RoleManage;
import com.utonw.dealer.api.entity.erp.User;
import com.utonw.dealer.api.util.erp.PageModel;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * userService
 * <p/>
 * Created by user on 2015/5/22.
 */
public interface IUserService {

    /**
     * 根据工号与手机号验证登录
     *
     * @param jobNumber 工号或手机号
     * @param password  密码
     * @param session
     * @return 是否通过验证
     */
//    boolean verifyLogin(String jobNumber, String password, HttpSession session);
    Map verifyLogin(String jobNumber, String password);

    /**
     * 根据工号与手机号验证登录(不判断session与单点登录，手机端使用)
     *
     * @param jobNumber 工号或手机号
     * @param password  密码
     * @param session
     * @return 是否通过验证
     */
    boolean verifyLoginWithoutSession(String jobNumber, String password, HttpSession session);

    User verifyUser(String jobNumber);


    /**
     * 获取模块树形结构
     *
     * @param rbUserId       用户ID
     * @param parentModuleId 父模块ID
     * @return ModuleManageTree List
     */
    List<ModuleManageTree> findMyModule(String rbUserId, Integer parentModuleId);

    /**
     * 分页查询用户列表
     *
     * @param currentPage 当前页数
     * @param param       参数map
     * @return 分页对象
     */
    PageModel<User> getUserPage(Integer currentPage, Map<String, Object> param);

    /**
     * 根据用户UUID查询user对象
     *
     * @param uuid 用户UUID
     * @return User
     */
    User findById(String uuid);

    /**
     * 更新或者添加user
     *
     * @param user user
     * @return user对象
     */
    int saveOrUpdateUser(User user);

    /**
     * 更新用户状态为不可用
     *
     * @param uuids 用户状态
     * @return true/false
     */
    boolean updateUserNonActivity(String[] uuids);


    /**
     * 根据公司Id的查询名下所有员工
     *
     * @param companyId
     * @return
     */
    List<User> getUserListByCompanyId(int companyId);

    /**
     * 查询角色下的所有用户
     *
     * @param roleId
     * @return
     */
    List<User> selectUserByRoleId(Integer roleId);

    /**
     * 通过用户id查询它的所有角色
     *
     * @param userId
     * @return
     */
    List<RoleManage> selectRoleByUserId(String userId);


    /**
     * 根据公司ID和部门Id关联查询所属用户
     *
     * @param companyId
     * @param deptId
     * @return
     */
    List<User> queryComIdDeptId(int companyId, int deptId);

    /**
     * 新增公告加载员工
     */
    List<User> queryComIdDeptIds(int companyId, List<Integer> deptList);
    
    /**
     * 修改密码
     * @param user
     * @return
     */
    int updatePwd(User user);

    /**
     *  验证用户手机号码与身份证号是否存在
     * @param paramMap
     * @return
     */
    boolean verifyIdCard(Map<String, Object> paramMap);
    //查询角色的List
    List<String> queryRoleType(String param);
    
    /**
     * 提供一个用来修改订单归属人的
     */
    LoanOperateResult modifiyLoanOwner(String loanId, String uuid);
    /**
     * 提供一个用来修改任务归属的
     */
    LoanOperateResult modifiyTaskOwner(String loanId, String uuid);
    
    /**
	 * 催收短信发送
	 * @param smsContent
	 * @param userId
	 * @return
	 */
	String SysgeLoginSubmitSms(String smsContent, String userId);
	
	
	/**
	 * 获取验证码
	 */
	String SysgePasswordSms(String smsContent, String mobile);
	
	/**
	 * 验证码校验
	 */
	boolean verificationCode(String mobile, int verifiCode);
	
	/**
	 * 通过手机修改密码
	 * @param mobile
	 * @param password
	 * @return
	 */
	String usemobileupdatepassword(String mobile, String password);
    /**
     * 修改任务的归属人
     * @param userId
     * @param processInstaceId
     * @return
     */
    void modifiyTaskApplyUser(String userId, String processInstaceId);
    /**
     * 修改任务的开始人
     * @param userId
     * @param processInstaceId
     * @return
     */
    void modifiyTaskStartUser(String userId, String processInstaceId);
    /**
     * 取得所有用户
     * @return
     */
    List<User> getAllUser();
    /**
     * 根据ID查询用户信息
     * @param userId 用户ID
     * @return
     */
    User getUserById(String userId);
    /**
     * 更新用户信息
     * @param user 用户信息
     * @return
     */
    void updateSelectiveUserById(User user);
    /**
     * 根据省市区查找线下员工
     */
    List<User> getOfflineStaff(Map<String, Object> param);
}
