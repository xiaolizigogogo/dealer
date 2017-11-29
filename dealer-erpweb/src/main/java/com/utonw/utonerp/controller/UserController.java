package com.utonw.utonerp.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSONObject;
import com.maiqianweng.service.AttachmentParentInfoService;
import com.utonw.consumerloan.api.entity.SysUser;
import com.utonw.consumerloan.api.service.sys.SysUserService;
import com.utonw.dealer.api.entity.erp.Locate;
import com.utonw.dealer.api.entity.erp.ModuleManageTree;
import com.utonw.dealer.api.entity.erp.RoleManage;
import com.utonw.dealer.api.entity.erp.User;
import com.utonw.dealer.api.service.erp.IRoleManageService;
import com.utonw.dealer.api.service.erp.IUserService;
import com.utonw.dealer.api.util.erp.Constants;
import com.utonw.dealer.api.util.erp.PageModel;
import com.utonw.utonbase.core.erpcommon.config.ParamterControl;
import com.utonw.utonbase.core.erpcommon.utils.CacheUtil;
import com.utonw.utonbase.core.erpcommon.utils.PasswordTools;
import com.utonw.utonbase.core.erpcommon.utils.SpringUtils;
import com.utonw.utonbase.core.erpcommon.utils.UUIDGenerator;
import com.utonw.utonbase.core.util.DozerMapperUtil;
import com.utonw.utonerp.common.utils.SysUserUtil;
import com.utonw.utonerp.core.VerifyExecutor;

/**
 * 用户控制类 Created by user on 2015/5/22.
 */
@Controller
@RequestMapping("/user")
public class UserController extends BaseController {

	@Reference(version = "1.0.0")
	IUserService userService;

	@Reference(version = "1.0.0")
	IRoleManageService roleManageService;

	@Reference(version = "1.0.0")
	private AttachmentParentInfoService attachmentParentInfoService;

	@Reference(version = "1.0.0", check = false)
	private SysUserService sysUserService;

	@Autowired
	private SysUserUtil sysUserUtil;

	private Logger logger= Logger.getLogger(UserController.class);
	/**
	 * 根据工牌号与手机号验证登录
	 *
	 * @param request
	 *            request
	 * @return success/failure
	 */
	@RequestMapping("/loginHtml")
	@ResponseBody
	public String loginHtml(HttpServletRequest request) {

		VerifyExecutor ve = new VerifyExecutor();
		ve.setParam("info.properties");
		ve.verify();
		String lic_status = CacheUtil.get(Constants.LIC_CACHE, "lic");
		if (lic_status.equals("outdate")) {
			return "outdate";
		}

		try {
			String jobNumber = request.getParameter("jobNumber");
			String password = request.getParameter("password");
			Map map = userService.verifyLogin(jobNumber, password);
			HttpSession session = request.getSession();
			if (map.get("code").toString().equals("success")) {
				request.getSession().setAttribute("attachmentTypes", attachmentParentInfoService.queryAllEnable());
				String sessionId = session.getId();
				User user = (User) map.get("user");
				String LoginRepeat = ParamterControl.REPEAT_LOGIN;
				Map<String, String> loginUserMap = new HashMap<>();
				if (LoginRepeat.equals("n")) {
					for (String key : loginUserMap.keySet()) {
						if (key.equals(user.getIdCard()) && !loginUserMap.containsKey(key)) {
							loginUserMap.remove(user.getIdCard());
							break;
						}
					}
					loginUserMap.put(user.getIdCard(), sessionId);
					session.getServletContext().setAttribute("loginUserMap", loginUserMap);
				}
				if (session != null) {
					session.setAttribute(Constants.AUTH_USER, user);
				}
				return "success";
			} else {
				return "failure";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "failure";
	}

	/**
	 * 验证原始密码
	 *
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/verifyOldPassword")
	public String verifyOldPassword(HttpServletRequest request) {
		String password = request.getParameter("userPassword");
		User user = sysUserUtil.getSessionLoginUser();
		// if (userService.verifyLogin(user.getIdCard(), password,
		// request.getSession())) {
		// return "success";
		// }
		return "failure";
	}

	/**
	 * 验证新密码是否与旧密码一致
	 *
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/verifyNewoldPwd")
	public String verifyNewoldPwd(HttpServletRequest request) {
		String newPass = request.getParameter("newPass");
		User user = sysUserUtil.getSessionLoginUser();
		// if (userService.verifyLogin(user.getMobile(), newPass,
		// request.getSession())) {
		// return "success";
		// }
		return "failure";
	}

	/**
	 * 页面跳转
	 *
	 * @param page
	 *            页面名称
	 * @return ModelAndView
	 */
	@RequestMapping(value = "/layout/{page}")
	public ModelAndView toPage(@PathVariable("page") String page, HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		if (page.equals("index")) {
			/** 查询出登录用户所拥有的模块列表 */

			// List<ModuleManageTree> list =
			// userService.findMyModule(user.getUuid(), null);
			// TreeUtil<ModuleManageTree> node = new TreeUtil<>();
			// node.createTree(list);

			List<ModuleManageTree> list = sysUserUtil.getModule(null);
			modelAndView.addObject("moduleList", list);
			for (ModuleManageTree mmt : list) {
				if (mmt.getModuleParentId() == null) {
					modelAndView.addObject("moduleId", mmt.getModuleId());
					break;
				}
			}
		}
		modelAndView.setViewName("layout/" + page);
		return modelAndView;
	}

    /**
     * 页面跳转
     *
     *            页面名称
     * @return ModelAndView
     */
    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public String toLogin(HttpServletRequest request) {
        return "login";
    }

    /**
	 * 根据父模块获取模块下面的子菜单
	 *
	 * @param parentModuleId
	 *            父菜单Id
	 * @return modelAndView
	 */
	@RequestMapping(value = "/getUserModuleByRole/{parentModuleId}")
	public ModelAndView getUserModuleByRole(@PathVariable("parentModuleId") Integer parentModuleId,
                                            HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		// 对应的模块儿
		// User user = (User)
		// request.getSession().getAttribute(Constants.AUTH_USER);
		// List<ModuleManageTree> list =
		// userService.findMyModule(user.getUuid(), parentModuleId);
		// TreeUtil<ModuleManageTree> node = new TreeUtil<>();
		// node.createTree(list);

		List<ModuleManageTree> list1 = sysUserUtil.getModule(parentModuleId);

		modelAndView.addObject("moduleList", list1);
		modelAndView.addObject("parentModuleId", parentModuleId);
		modelAndView.setViewName("layout/left");
		return modelAndView;
	}

	/**
	 * 查询用户列表--分页
	 *
	 * @param request
	 *            request
	 * @param response
	 *            response
	 */
	@RequestMapping("/list/page")
	public void getUserListPage(HttpServletRequest request, HttpServletResponse response) {
		String currentPage = request.getParameter("currentPage");// 当前页数
		if (null == currentPage) {
			currentPage = "1";
		}
		User LoginUser = sysUserUtil.getSessionLoginUser();
		Map<String, Object> param = new HashMap<>();
		param.put("mobile", request.getParameter("mobile"));
		param.put("role", request.getParameter("role"));
		param.put("name", request.getParameter("name"));
		param.put("userId", LoginUser.getUuid());
		param.put("dataAccessLevel", LoginUser.getDataAccessLevel());
		PageModel<User> pm = userService.getUserPage(Integer.parseInt(currentPage), param);
		SpringUtils.renderJson(response, pm);
	}

	/**
	 * 跳转至用户分配角色页面，分配角色
	 */
	@RequestMapping("/toAssignRolePage/{uuid}")
	public ModelAndView toAssignRolePage(@PathVariable("uuid") String uuid, HttpServletRequest request) {

		ModelAndView modelAndView = new ModelAndView("user/assignRoles");
		User user = userService.findById(uuid);
		User loginUser = sysUserUtil.getSessionLoginUser();
		Map<String, List<RoleManage>> roleManage = roleManageService.getRoleAssignByUser(uuid, loginUser.getUuid());
		modelAndView.addObject("roleManage", roleManage);
		modelAndView.addObject("user", user);
		return modelAndView;
	}

	/**
	 * 跳转至用户角色页面，查询出用户已有的角色和可分配的角色
	 */
	@RequestMapping("/toPersonalRolePage/{uuid}")
	public ModelAndView toSetRolePage(@PathVariable("uuid") String uuid, HttpServletRequest request) {

		ModelAndView modelAndView = new ModelAndView();
		User user = userService.findById(uuid);
		User LoginUser = sysUserUtil.getSessionLoginUser();
		Map<String, List<RoleManage>> map = roleManageService.getRoleManageByUser(uuid, LoginUser.getUuid());

		modelAndView.addObject("inRole", map.get("inRole"));
		modelAndView.addObject("inRoleSize", map.get("inRole").size());
		modelAndView.addObject("noRole", map.get("noRole"));
		modelAndView.addObject("noRoleSize", map.get("noRole").size());
		modelAndView.addObject("user", user);

		modelAndView.setViewName("user/personalRoles");
		return modelAndView;
	}

	@RequestMapping("/toUserInfoPage")
	public ModelAndView toUserInfoPage(HttpServletRequest request) {
		String uuid = request.getParameter("uuid");

		// List<Company> companyList = companyService.queryCompanyList();

		ModelAndView modelAndView = new ModelAndView("user/userAdd");
		// modelAndView.addObject("companyList", companyList);

		if (uuid != null) {
			User user = userService.findById(uuid);
			if (user != null && user.getUserLocateList() != null) {
				modelAndView.addObject("userLocate", user.getUserLocateList());
			}
			modelAndView.addObject("user", user);
		}
		return modelAndView;
	}

	/**
	 * 保存或更新用户信息
	 *
	 * @param userMap
	 *            需要保存或更新的用户对象
	 * @param response
	 *            response
	 */
	@RequestMapping(value = "/saveOrUpdateUserInfo", method = RequestMethod.POST)
	public void saveOrUpdateUserInfo(@RequestParam Map<String,String> userMap, HttpServletRequest request,
                                     HttpServletResponse response) {
		List<Locate> locateList = new ArrayList<>();
		for (int i = 0; i < request.getParameterValues("province").length; i++) {
			Locate locate = new Locate();
			locate.setProvince(request.getParameterValues("province")[i]);
			locate.setCity(request.getParameterValues("city")[i]);
			locate.setDistrict(request.getParameterValues("district")[i]);
			locateList.add(i, locate);
		}
		User user = new User();
		DozerMapperUtil.getInstance().map(userMap,user);
		user.setLocateList(locateList);
		user.setCreatedAt(new Date());
		if(!StringUtils.isEmpty(user.getUuid())){
			user.setCreatedAt(null);
		}
		else{
			user.setUuid(UUIDGenerator.getUUID());
		}
		if (userService.saveOrUpdateUser(user) > 0) {
			if(user.getCreatedAt()!=null){
				try{
					SysUser sysUser = new SysUser();
					sysUser.setCreateTime(new Date());
					sysUser.setNikename(user.getNickname());
					sysUser.setPassword(user.getPassword());
					sysUser.setUuid(user.getUuid());
					sysUser.setUsername(user.getAccountName());
					sysUser.setMobile(user.getMobile());
					sysUser.setStatus(1);
					sysUser.setEmail(user.getEmail());
					sysUser.setDeptId(4L);
					List<Long> roleIdList=new ArrayList<Long>();
					roleIdList.add(1l);
					sysUser.setRoleIdList(roleIdList);
					sysUserService.save(sysUser);
					logger.info("【添加用户到消费贷成功】,user:{"+JSONObject.toJSONString(sysUser)+"}");
				}
				catch (Exception e) {
					logger.error("【添加用户到消费贷失败】,error:{"+e.toString()+"}");
				}
			}
			SpringUtils.renderJson(response, Constants.SUCCESS);
		} else {
			SpringUtils.renderJson(response, Constants.FAILURE);
		}
	}

	/**
	 * 删除用户（将状态更新为不可用）
	 *
	 * @param request
	 *            request
	 * @param response
	 *            response
	 */
	@RequestMapping(value = "/delete")
	public void deleteUserInfo(HttpServletRequest request, HttpServletResponse response) {
		String uuid = request.getParameter("uuid");
		String[] uuids = uuid.split(",");
		if (userService.updateUserNonActivity(uuids)) {
			SpringUtils.renderJson(response, Constants.SUCCESS);
		} else {
			SpringUtils.renderJson(response, Constants.FAILURE);
		}
	}

	/**
	 * 根据公司Id的查询名下所有员工
	 *
	 * @param request
	 * @param response
	 */
	@ResponseBody
	@RequestMapping("/getUserListByCompanyId")
	public void getUserListByCompanyId(HttpServletRequest request, HttpServletResponse response) {
		String companyId = request.getParameter("companyId");
		SpringUtils.renderJson(response, userService.getUserListByCompanyId(Integer.parseInt(companyId)));
	}

	/**
	 * 根据公司ID和部门Id关联查询所属用户
	 *
	 * @param request
	 * @param response
	 */
	@ResponseBody
	@RequestMapping("/queryComIdDeptId")
	public void queryComIdDeptId(HttpServletRequest request, HttpServletResponse response) {
		String companyId = request.getParameter("companyId");
		String deptId = request.getParameter("deptId");
		SpringUtils.renderJson(response,
				userService.queryComIdDeptId(Integer.parseInt(companyId), Integer.parseInt(deptId)));
	}

	/**
	 * 新增公告加载员工
	 *
	 * @param request
	 * @param response
	 */
	@ResponseBody
	@RequestMapping("/queryComIdDeptIds")
	public void queryComIdDeptIds(HttpServletRequest request, HttpServletResponse response) {
		String companyId = request.getParameter("companyId");
		String[] deptId = request.getParameterValues("deptId");
		// System.out.println(companyId+deptId);
		List<String> deptListString = new ArrayList<String>();
		Collections.addAll(deptListString, deptId);
		List<Integer> deptList = new ArrayList<Integer>();
		for (String str : deptListString) {
			int listD = Integer.parseInt(str);
			deptList.add(listD);
		}
		SpringUtils.renderJson(response, userService.queryComIdDeptIds(Integer.parseInt(companyId), deptList));
	}

	/**
	 * 修改密码
	 *
	 * @param password
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/updatePwd", method = RequestMethod.POST)
	public void updatePwd(String password, HttpServletRequest request, HttpServletResponse response) {
		User user = new User();
		user.setPassword(password);
		User sessionUser = sysUserUtil.getSessionLoginUser();
		user.setUuid(sessionUser.getUuid());

		if (userService.updatePwd(user) > 0) {
			SpringUtils.renderJson(response, Constants.SUCCESS);
		} else {
			SpringUtils.renderJson(response, Constants.FAILURE);
		}
	}

	/**
	 * 用户注销
	 *
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping("/loginOut")
	public void loginOut(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession(false);// 防止创建session
		if (session == null) {
			response.sendRedirect("/login");
			return;
		}
		session.removeAttribute(Constants.AUTH_USER);
		response.sendRedirect("/admin/login");

	}

	/**
	 * 显示用户名
	 *
	 */
	@RequestMapping("/nameHtml")
	public void nameHtml(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute(Constants.AUTH_USER);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		// 取得用户姓名
		resultMap.put("name", user.getRealname());
		SpringUtils.renderJson(response, resultMap);
	}

	/**
	 * 首次进入登录页面
	 *
	 * @return
	 */
	@RequestMapping("/goLogin")
	public ModelAndView goLogin() {

		ModelAndView modelAndView = new ModelAndView("/login");

		return modelAndView;
	}

	/**
	 * 验证用户手机号码与身份证号是否存在
	 *
	 * @param request
	 * @param response
	 */
	@RequestMapping("/verifyIdCard")
	public void verifyIdCard(HttpServletRequest request, HttpServletResponse response) {
		String mobile = request.getParameter("mobile");
		String idCard = request.getParameter("idCard");
		String email = request.getParameter("email");

		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("mobile", StringUtils.isNotBlank(mobile) ? mobile : null);
		paramMap.put("idCard", StringUtils.isNotBlank(idCard) ? idCard : null);
		paramMap.put("email", StringUtils.isNotBlank(email) ? email : null);

		if (StringUtils.isNotBlank(mobile) || StringUtils.isNotBlank(idCard) || StringUtils.isNotBlank(email)) {
			if (userService.verifyIdCard(paramMap)) {
				SpringUtils.renderJson(response, Constants.SUCCESS);
			} else {
				SpringUtils.renderJson(response, Constants.FAILURE);
			}
		} else {
			SpringUtils.renderJson(response, Constants.SUCCESS);
		}
	}

	/**
	 * 根据uuId查询User对象
	 *
	 * @param request
	 * @param response
	 */
	@ResponseBody
	@RequestMapping("/getUserById")
	public void getUserById(HttpServletRequest request, HttpServletResponse response) {
		String uuid = request.getParameter("uuid");
		SpringUtils.renderJson(response, userService.findById(uuid));
	}

	/**
	 * 验证用户手机号码与身份证号是否存在
	 *
	 * @param request
	 * @param response
	 */
	@RequestMapping("/queryRoleList")
	public void queryRoleList(HttpServletRequest request, HttpServletResponse response) {
		List<String> list = userService.queryRoleType(null);
		Map<String, Object> map = new HashMap<>();
		map.put("roleItem", list);
		SpringUtils.renderJson(response, map);
	}

	/**
	 * 登陆发送短信
	 *
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/SysgeLoginSubmitSms")
	public String SysgeLoginSubmitSms(HttpServletRequest request) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String smsContent = "【" + ParamterControl.LOGO_DISPLAY + "】您的账号在 " + df.format(new Date()) + " 登录了"
				+ ParamterControl.LOGO_DISPLAY + "金融管理系统，如非本人操作，请及时修改密码。";
		User LoginUser = getCurrentUser(request);
		String userId = LoginUser.getUuid();
		String returnStr = userService.SysgeLoginSubmitSms(smsContent, userId);
		return returnStr;
	}

	@ResponseBody
	@RequestMapping("/sendMessagePassword")
	public String sendMessagePassword(HttpServletRequest request, HttpServletResponse response) {
		int[] array = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };
		Random rand = new Random();
		for (int i = 10; i > 1; i--) {
			int index = rand.nextInt(i);
			int tmp = array[index];
			array[index] = array[i - 1];
			array[i - 1] = tmp;
		}
		int result = 0;
		for (int i = 0; i < 6; i++) {
			result = result * 10 + array[i];
		}
		User user = new User();
		user.setVerifiCode(result);
		String smsContent = "您收到的验证码为:" + result;
		String mobile = request.getParameter("mobile");
		String returnStr = userService.SysgePasswordSms(smsContent, mobile);
		return returnStr;
	}

	@ResponseBody
	@RequestMapping("/compareverifiCode")
	public String compareverifiCode(HttpServletRequest request, HttpServletResponse response) {
		String code = request.getParameter("verifiCode");
		int verifiCode = Integer.parseInt(code);
		String mobile = request.getParameter("mobile");
		if (userService.verificationCode(mobile, verifiCode)) {
			return "success";
		} else {
			return "failure";
		}
	}

	@ResponseBody
	@RequestMapping("/updatethePassword")
	public void updatethePassword(HttpServletRequest request, HttpServletResponse response) {
		String mobile = request.getParameter("mobile");
		String date1 = request.getParameter("date");
		long date = Long.parseLong(date1);
		Map<String, Object> map = new HashMap<>();
		String password = PasswordTools.createPwd(request.getParameter("newpass"));
		Calendar cal = Calendar.getInstance();
		long time = cal.getTimeInMillis();
		long minutes = time - date;
		if (minutes < 180000) {
			// 计算差值，毫秒数
			String a = userService.usemobileupdatepassword(mobile, password);
			map.put("a", a);
			SpringUtils.renderJson(response, map);
		} else if (minutes > 180000) {
			String a = "overtime";
			map.put("a", a);
			SpringUtils.renderJson(response, map);
		} else {
			map.put("a", "no");
			SpringUtils.renderJson(response, map);
		}
	}
}
