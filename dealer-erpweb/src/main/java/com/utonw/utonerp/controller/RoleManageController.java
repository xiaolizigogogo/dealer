package com.utonw.utonerp.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.utonw.dealer.api.entity.erp.ModuleManageTree;
import com.utonw.dealer.api.entity.erp.RoleManage;
import com.utonw.dealer.api.service.erp.IModuleManageService;
import com.utonw.dealer.api.service.erp.IRoleManageService;
import com.utonw.dealer.api.util.erp.Constants;
import com.utonw.dealer.api.util.erp.PageModel;
import com.utonw.utonbase.core.erpcommon.utils.SpringUtils;
import com.utonw.utonerp.common.utils.SysUserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 角色管理控制器
 * Created by user on 2015/5/26.
 */
@Controller
@RequestMapping("roleManage")
public class RoleManageController {

	@Reference(version = "1.0.0")
    IRoleManageService roleManageService;

    @Reference(version = "1.0.0")
    IModuleManageService moduleManageService;

    @Resource
    SysUserUtil sysUserUtil;
    /**
     * 跳转到新增角色
     *
     * @return user/role_add
     */
    @RequestMapping("/addRoleManagePage")
    public ModelAndView addRoleManagePage() {
        return new ModelAndView("user/role_add", "type", "add");
    }

    /**
     * 新增修改角色
     *
     * @param request request
     * @param response response
     */
    @RequestMapping("/saveOrUpdateRoleManage")
    public void saveOrUpdateRoleManage(HttpServletRequest request, HttpServletResponse response) {
        String roleId = request.getParameter("roleId");
        String roleName = request.getParameter("roleName");
        String[] moduleIds = request.getParameterValues("moduleIds[]");
        String userId = sysUserUtil.getSessionLoginUser().getUuid();
        boolean result = roleManageService.saveOrUpdateRoleManage((roleId == null || roleId.equals("")) ? null : Integer.parseInt(roleId), roleName, moduleIds,userId);
        if (result) {
            SpringUtils.renderJson(response, Constants.SUCCESS);
        } else {
            SpringUtils.renderJson(response, Constants.FAILURE);
        }
    }

    /**
     * 跳转角色列表
     *
     * @return user/role
     */
    @RequestMapping("/toRoleManagePage")
    public ModelAndView getRoleManagePage() {
        return new ModelAndView("user/role");
    }

    /**
     * 查询角色列表分页
     *
     * @param request request
     * @param response response
     */
    @RequestMapping("/getRoleManageList")
    public void getRoleManageList(HttpServletRequest request, HttpServletResponse response) {
        String currentPage = request.getParameter("currentPage");
        if (null == currentPage) {
            currentPage = "1";
        }
        String roleName = request.getParameter("roleName") == "" ? null : request.getParameter("roleName");
        Map<String, Object> param = new HashMap<>();
        param.put("roleName", roleName);
        PageModel pm = roleManageService.getRoleManageList(Integer.parseInt(currentPage), param);
        SpringUtils.renderJson(response, pm);
    }

    /**
     * 删除
     *
     * @param id 角色ID
     * @param response response
     */
    @RequestMapping("/deleteRoleManage/{id}")
    public void deleteRoleManage(@PathVariable("id") Integer id, HttpServletResponse response) {
        SpringUtils.renderJson(response, roleManageService.delete(id));
    }

    /**
     * 跳转修改角色
     *
     * @param id 角色ID
     * @return user/updateRoleManage
     */
    @RequestMapping("/editRoleManagePage/{id}")
    public ModelAndView editRoleManagePage(@PathVariable("id") Integer id) {
        ModelAndView modelAndView = new ModelAndView();
        RoleManage roleManage = roleManageService.findById(id);
        List<ModuleManageTree> moduleManageList = moduleManageService.findModuleByRoleId(roleManage.getRoleId());
        modelAndView.addObject("roleManage", roleManage);
        modelAndView.addObject("moduleManageList", moduleManageList);
        modelAndView.setViewName("user/updateRoleManage");
        return modelAndView;
    }

    /**
     * 个人角色(用户授权)
     *
     * @param request  request
     * @param response response
     */
    @RequestMapping("/grantRoleUser")
    public void grantRoleUser(HttpServletRequest request, HttpServletResponse response) {
         String userId = request.getParameter("userId");
        String[] roleIds = request.getParameterValues("roleIds[]");
        
        boolean result = roleManageService.grantRoleUser(userId, roleIds);
        //更新缓存数据
        sysUserUtil.refreshModuleCache();
        if (result) {
            SpringUtils.renderJson(response, Constants.SUCCESS);
        } else {
            SpringUtils.renderJson(response, Constants.FAILURE);
        }
    }
    
    /**
     * 分配角色(用户授权)
     *
     * @param request  request
     * @param response response
     */
    @RequestMapping("/asssignRoleUser")
    public void asssignRoleUser(HttpServletRequest request, HttpServletResponse response) {
        String userId = request.getParameter("userId");
        String[] roleIds = request.getParameterValues("roleIds[]");
        String loginUserId = sysUserUtil.getSessionLoginUser().getUuid();
        boolean result = roleManageService.asssignRoleUser(userId, roleIds, loginUserId);
        if (result) {
            SpringUtils.renderJson(response, Constants.SUCCESS);
        } else {
            SpringUtils.renderJson(response, Constants.FAILURE);
        }
    }
}
