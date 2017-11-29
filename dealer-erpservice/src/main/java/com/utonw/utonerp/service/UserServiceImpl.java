package com.utonw.utonerp.service;

import com.alibaba.fastjson.JSONObject;
import com.utonw.dealer.api.dto.request.erp.LoanOperateResult;
import com.utonw.dealer.api.entity.erp.*;
import com.utonw.dealer.api.enums.erp.RoleEnum;
import com.utonw.dealer.api.service.erp.IModuleManageService;
import com.utonw.dealer.api.service.erp.IUserService;
import com.utonw.dealer.api.util.erp.Constants;
import com.utonw.dealer.api.util.erp.PageModel;
import com.utonw.dealer.api.vo.UserRoleIdVo;
import com.utonw.utonbase.core.erpcommon.config.ParamterControl;
import com.utonw.utonerp.core.dao.BaseDao;
import com.utonw.utonbase.core.erpcommon.utils.IdcardUtils;
import com.utonw.utonbase.core.erpcommon.utils.PasswordTools;
import com.utonw.utonbase.core.erpcommon.utils.SendMessageUtil;
import com.utonw.utonerp.mapper.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * UserService实现类
 * <p/>
 * Created by user on 2015/5/22.
 */
@com.alibaba.dubbo.config.annotation.Service(version = "1.0.0")
@Service("userService")
public class UserServiceImpl implements IUserService {

	
	private static Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

	@Autowired
	private UserMapper userMapper;

	@Autowired
	private RoleManageMapper roleManageMapper;

	@Autowired
	private ModuleManageMapper moduleManageMapper;

	@Autowired
	private IModuleManageService moduleManageService;

	@Autowired
	private RoleUserMapper roleUserMapper;

	@Autowired
	private BaseDao<User> baseDao;

	@Autowired
	private ActivitiAccountBS activitiAccountBS;
	
	@Autowired
	private SystemParam systemParam;
	
	@Autowired
	private DeptMapper deptMapper;

	@Autowired
	private UserLocateMapper userLocateMapper;

	@Autowired
	private SystemParameterMapper systemParameterMapper;

	/**
	 * 根据工号与手机号验证登录
	 *
	 * @param jobNumber
	 *            工号或者手机号
	 * @return
	 */
	@Override
	public Map verifyLogin(String jobNumber, String password) {
		Map<String,Object>result = new HashMap<>();
		User user = userMapper.verifyLogin(jobNumber);
		//判断user是否为空，如果用户为空，则验证结果为false
		if (user == null){
			result.put("code","failure");
		}else {
			//取得用户有效的情况下
			String algorithm = "SHA1";
			String dbPwd = user.getPassword();
			if (PasswordTools.checkPwd(password, dbPwd, algorithm)){
				result.put("code","success");
				result.put("user",user);
			}else {
				result.put("code","failure");
			}
		}
		return result;
	}

	/**
	 * 根据工号与手机号验证登录(不判断session与单点登录，手机端使用)
	 *
	 * @param jobNumber
	 *            工号或者手机号
	 * @param session
	 * @return 是否通过验证
	 */
	@Override
	public boolean verifyLoginWithoutSession(String jobNumber, String password, HttpSession session) {
		User user = userMapper.verifyLogin(jobNumber);
		if (user != null) {
			String algorithm = "SHA1";
			String dbPwd = user.getPassword();
			if (PasswordTools.checkPwd(password, dbPwd, algorithm)) {
				if (session != null) {
					session.setAttribute(Constants.AUTH_USER, user);
				}
				return true;
			}
		}
		return false;
	}


	@Override
	public User verifyUser(String jobNumber) {
		User user = userMapper.verifyUser(jobNumber);
		if (user != null) {
			return user;
		}
		return null;
	}

	/**
	 * 获取模块树形结构
	 *
	 * @param rbUserId
	 *            登录用户ID
	 * @param parentModuleId
	 *            父模块ID
	 * @return 模块树形结构
	 */
	@Override
	public List<ModuleManageTree> findMyModule(String rbUserId, Integer parentModuleId) {
		List<ModuleManageTree> treeList = new ArrayList<>();
		try {
			UserRoleIdVo userRoleIdVo = new UserRoleIdVo();
			userRoleIdVo.setUuid(rbUserId);

			/** 查询出登录用户所有的角色列表(可以是一个用户多个角色) */
			List<UserRoleIdVo> userList = userMapper.getRoleUserExtendList(userRoleIdVo);
			List<Integer> roleId = new ArrayList<>(); // 去重集合
			if (null != userList && userList.size() > 0) {
				for (UserRoleIdVo u : userList) {
					roleId.add(u.getRbRoleId());
				}
			}

			Map<String, Object> map = new HashMap<>();
			map.put("roleId", roleId);
			map.put("rbUserId", rbUserId);
			map.put("moduleParentId", parentModuleId);

			/** 通过角色ID查询出角色对应的模块列表 */
			List<ModuleManage> list = moduleManageMapper.findMyModule(map);
			treeList = moduleManageService.getModuleManageTreeList(list);
		} catch (Exception e) {
			e.printStackTrace();
			logger.debug("查询出错=====" + e.getMessage());
		}
		return treeList;

	}

	@Override
	public PageModel<User> getUserPage(Integer currentPage, Map<String, Object> param) {
		PageModel<User> pm = new PageModel<>();
		try {
			pm = baseDao.getPage("com.utonw.utonerp.mapper.UserMapper.getUserListPage", param, currentPage);
		} catch (Exception e) {
			e.printStackTrace();
			logger.info("查询用户分页信息失败-----" + e);
		}
		return pm;
	}

	@Override
	public User findById(String uuid) {
		return userMapper.selectUserLocateByUserId(uuid);
	}

	/**
	 * 用户更新或新增
	 *
	 * @param user
	 *            user
	 * @return
	 */
	@Override
	@Transactional
	public int saveOrUpdateUser(User user) {
		logger.info("【用户操作】 user:{}",JSONObject.toJSONString(user));
		user.setActiveFlg(1);
		user.setSex(IdcardUtils.getGenderByIdCard(user.getIdCard()));
		List<Locate> locateList = user.getLocateList();
		userLocateMapper.deleteByUserId(user.getUuid());
		SystemParameter parameter = systemParameterMapper.selectParameterByKey(user.getCompanyId(), Constants.USER_LOGIN_PREFIX);
		//重置密码
		String password = PasswordTools.createPwd(user.getPassword());
		if(user.getPassword()==""){
			String upw = userMapper.selectPasswordover(user.getUuid());
			user.setPassword(upw);
		}else if(user.getPassword()!="" || user.getPassword()!=null){
			user.setPassword(password);
		}
		if (user.getUuid() != null && !"".equals(user.getUuid())&&user.getCreatedAt()==null) {
			activitiAccountBS.saveOrUpdate(user, null);
			convertUserLocateList(user.getLocateList(),user.getUuid());
			return userMapper.updateByPrimaryKeySelective(user);
		} else {
			user.setPassword(PasswordTools.createPwd("123456"));
			user.setCreatedAt(new Date());
			convertUserLocateList(user.getLocateList(),user.getUuid());
			if(parameter.getSysValue() != null || parameter.getSysValue() != ""){
				user.setAccountName(parameter.getSysValue()+user.getAccountName());
			}
			activitiAccountBS.saveOrUpdate(user, null);
			return userMapper.insertSelective(user);
		}
	}

	@Override
	public boolean updateUserNonActivity(String[] uuids) {

		if (uuids != null && uuids.length > 0) {
			for (String uuid : uuids) {
				User user = userMapper.selectByPrimaryKey(uuid);
				if (user != null) {
					user.setActiveFlg(0);
				}
				userMapper.updateByPrimaryKey(user);
				activitiAccountBS.deleteUser(uuid);
			}
			return true;
		}
		return false;
	}

	/**
	 * 根据公司Id的查询名下所有员工
	 *
	 * @param companyId
	 * @return
	 */
	@Override
	public List<User> getUserListByCompanyId(int companyId) {
		return userMapper.getUserListByCompanyId(companyId);
	}

	@Override
	public List<User> selectUserByRoleId(Integer roleId) {
		List<RoleUser> listRoleUser = roleUserMapper.findRoleUserById(roleId, null);
		List<User> userList = new ArrayList<User>();
		for (RoleUser roleUser : listRoleUser) {
			User user = userMapper.selectByPrimaryKey(roleUser.getRbUserId());
			userList.add(user);
		}
		return userList;
	}

	@Override
	public List<RoleManage> selectRoleByUserId(String userId) {
		List<RoleUser> listRoleUser = roleUserMapper.findRoleUserById(null, userId);
		List<RoleManage> roleList = new ArrayList<RoleManage>();
		for (RoleUser roleUser : listRoleUser) {
			RoleManage roleManage = roleManageMapper.selectByPrimaryKey(roleUser.getRbRoleId());
			roleList.add(roleManage);
		}
		return roleList;
	}

	/**
	 * 根据公司ID和部门Id关联查询所属用户
	 *
	 * @param companyId
	 * @param deptId
	 * @return
	 */
	@Override
	public List<User> queryComIdDeptId(int companyId, int deptId) {
		List<User> users = new ArrayList<>();
		try {
			users = userMapper.queryComIdDeptId(companyId, deptId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return users;
	}
	
	/**
	 * 
	 */
	@Override
	public List<User> queryComIdDeptIds(int companyId, List<Integer> deptId) {
		List<User> users = new ArrayList<>();
		try {
			users = userMapper.queryComIdDeptIds(companyId, deptId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return users;
	}
	

	/**
	 * 修改密码
	 *
	 * @param user
	 * @return
	 */
	@Override
	public int updatePwd(User user) {
		try {
			user.setPassword(PasswordTools.createPwd(user.getPassword()));
			return userMapper.updateByPrimaryKeySelective(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	/**
	 * 验证用户手机号码与身份证号是否存在
	 * 
	 * @param paramMap
	 * @return
	 */
	@Override
	public boolean verifyIdCard(Map<String, Object> paramMap) {
		try {
			User user = userMapper.verifyIdCard(paramMap);
			return user == null;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public List<String> queryRoleType(String param) {
		List<String> resultlist;
		try {
			resultlist = userMapper.queryRoleType(param);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return resultlist;
	}

	@Override
	public LoanOperateResult modifiyLoanOwner(String loanId, String uuid) {
		LoanOperateResult loanOperateResult = new LoanOperateResult();
		User user = userMapper.selectByPrimaryKey(uuid);
		if (user == null) {
			loanOperateResult.setMessage("目标用户不存在");
		}
		Dept dept=deptMapper.selectByPrimaryKey(user.getDeptId());
		userMapper.updateLoanOwner(uuid, loanId,dept.getPrincipalId(),dept.getId());
		loanOperateResult.setSuccess(true);
		return loanOperateResult;
	}
	@Override
	public LoanOperateResult modifiyTaskOwner(String loanId,String uuid){
		LoanOperateResult loanOperateResult = new LoanOperateResult();
		User user = userMapper.selectByPrimaryKey(uuid);
		if (user == null) {
			loanOperateResult.setMessage("目标用户不存在");
		}
		userMapper.updateTaskOwner(uuid, loanId);
		loanOperateResult.setSuccess(true);
		return loanOperateResult;
	}

	/* 登陆发送短信
     * (non-Javadoc)
     * @see com.maiqianweng.service.IUserService#SysgeLoginSubmitSms(java.lang.String, java.lang.String)
     */
    @Override
    public String SysgeLoginSubmitSms(String smsContent, String userId) {
        String returnStr = "0000";
        String LoginPrompt = ParamterControl.LOGIN_PROMPT;
//        if (smsCount == 1 || smsCount == 100) {
//            CacheUtil.clear("smsEcache");
//            smsCount++;
//        }
//        SimpleDateFormat myFmt = new SimpleDateFormat("yyyyMMdd");
//        String flagDate = myFmt.format(new Date());
        //短信的账号信息
        Map<String,String> corpinfo = new HashMap<>();
        corpinfo.put("CorpID",systemParam.getSystemParam(Constants.GROUP_COMPANY_ID,"SMS_CORPID"));
        corpinfo.put("Pwd",systemParam.getSystemParam(Constants.GROUP_COMPANY_ID,"SMS_PASSWD"));
        String title = systemParam.getSystemParam(Constants.GROUP_COMPANY_ID,"COMPANY_TITLE");

        User LoginUser= userMapper.selectByPrimaryKey(userId);
        
        if (LoginUser != null && LoginPrompt.equals("y")){
            String moblie = LoginUser.getMobile();
            //moblie = "15012770988";
            Map<String,Object> map = new HashMap<>();
            map.put("content", smsContent);
            SendMessageUtil.sendMessage(Constants.USER_DEFINED, moblie,title, map,corpinfo);
//            boolean flg = CacheUtil.isCacheByKey("smsEcache", flagDate + moblie);
//            if (!flg) {
//                returnStr = smsUtil.sendSms(userId, moblie, smsContent);
//                CacheUtil.put("smsEcache", flagDate + moblie, moblie);
//            }
        }
        return returnStr;
    }

	@Override
	public String SysgePasswordSms(String smsContent,String mobile) {
		String returnStr = "0000";
		Map<String,String> corpinfo = new HashMap<>();
        corpinfo.put("CorpID",systemParam.getSystemParam(Constants.GROUP_COMPANY_ID,"SMS_CORPID"));
        corpinfo.put("Pwd",systemParam.getSystemParam(Constants.GROUP_COMPANY_ID,"SMS_PASSWD"));
        String title = systemParam.getSystemParam(Constants.GROUP_COMPANY_ID,"COMPANY_TITLE");
        String vc = smsContent.substring(9,15);
        int verifiCode = Integer.parseInt(vc);
        User mobileUser = userMapper.selectByMobile(mobile);
//        SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//        Date now = new Date();
//        String creatverifiCodetime = sm.format(now);
        userMapper.updateverifiCode(verifiCode,mobile);
        if(mobileUser != null){
        	String mobiles = mobileUser.getMobile();
        	Map<String,Object> map = new HashMap<>();
            map.put("content", smsContent);
            SendMessageUtil.sendMessage(Constants.USER_DEFINED, mobiles,title, map,corpinfo);
        }else{
        	returnStr = "0001";
        }
		return returnStr;
	}

	@Override
	public boolean verificationCode(String mobile,int verifiCode) {
		User mobileUser = userMapper.selectByMobile(mobile);
		int verifiCodes = mobileUser.getVerifiCode();
		if(verifiCodes==verifiCode){
			return true;
		}
		return false;
	}

	@Override
	public String usemobileupdatepassword(String mobile, String password) {
		String a = "no";
		if(userMapper.updatePasswordofmobile(mobile, password)>0){
			a = "yes";
		}
		return a;
	}

	@Override
	public void modifiyTaskApplyUser(String userId, String processInstaceId) {
		userMapper.modifiyTaskApplyUser(userId, processInstaceId);
	}

	@Override
	public void modifiyTaskStartUser(String userId, String processInstaceId) {
		userMapper.modifiyTaskStartUser(userId, processInstaceId);
	}

	@Override
	public List<User> getAllUser() {
		return userMapper.selectAllUser();
	}

	@Override
	public User getUserById(String userId) {
		return  userMapper.selectByPrimaryKey(userId);
	}

	@Override
	public void updateSelectiveUserById(User user) {
		userMapper.updateByPrimaryKeySelective(user);
	}

	@Override
	public List<User> getOfflineStaff(Map<String, Object> param) {
		if(param.containsKey("role")){
			String role=param.get("role").toString();
			int code=Enum.valueOf(RoleEnum.class,role).getCode();
			param.put("role",code);
		}
		return userMapper.getOfflineStaff(param);
	}


	private Integer convertUserLocateList(List<Locate> locateList,String uuid){
		Integer result = new Integer(0);
		for(int i = 0; i < locateList.size(); i++){
			UserLocate userLocate = new UserLocate();
			userLocate.setUserId(uuid);
			userLocate.setProvince(locateList.get(i).getProvince());
			userLocate.setCity(locateList.get(i).getCity());
			userLocate.setDistrict(locateList.get(i).getDistrict());
			userLocate.setCreateDate(new Date());
			userLocateMapper.insertSelective(userLocate);
			result++;
		}
		return result;
	}
}
