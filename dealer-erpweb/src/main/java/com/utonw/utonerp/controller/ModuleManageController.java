package com.utonw.utonerp.controller;


import com.alibaba.dubbo.config.annotation.Reference;
import com.utonw.dealer.api.entity.erp.ModuleManage;
import com.utonw.dealer.api.entity.erp.ModuleManageTree;
import com.utonw.dealer.api.service.erp.IModuleManageService;
import com.utonw.dealer.api.util.erp.Constants;
import com.utonw.dealer.api.util.erp.TreeUtil;
import com.utonw.utonbase.core.erpcommon.utils.SpringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 模块控制器
 * Created by user on 2015/5/26.
 */
@RequestMapping("/module")
@Controller
public class ModuleManageController {

    @Reference(version = "1.0.0")
    IModuleManageService moduleManageService;

    @RequestMapping("/getModuleManageList")
    public void getModuleManageList(HttpServletResponse response) {
        TreeUtil<ModuleManageTree> node = new ModuleManageTree();

        List<ModuleManageTree> list = moduleManageService.getModuleManageList();
        node = node.createTree(list);
        SpringUtils.renderJson(response, node.getChildren());
    }

    /**
     * 检查是否为三级菜单
     *
     * @param request  request
     * @param response response
     */
    @RequestMapping("/checkSelectModule")
    public void checkSelectModule(HttpServletRequest request, HttpServletResponse response) {
        String moduleId = request.getParameter("moduleId");
        if (null != moduleId && !"".equals(moduleId)) {
            ModuleManage mm = moduleManageService.findById(Integer.parseInt(moduleId));
            if (null != mm && mm.getModuleParentId() != null) {
                ModuleManage m = moduleManageService.findById(mm.getModuleParentId());
                if (m.getModuleParentId() != null) {
                    SpringUtils.renderJson(response, Constants.FAILURE);
                } else {
                    SpringUtils.renderJson(response, Constants.SUCCESS);
                }
            } else {
                SpringUtils.renderJson(response, Constants.SUCCESS);
            }
        } else {
            SpringUtils.renderJson(response, Constants.SUCCESS);
        }
    }

    /**
     * 新增/修改模块
     */
    @RequestMapping("/saveOrUpdateModuleManage")
    public void saveOrUpdateModuleManage(@ModelAttribute("moduleManage") ModuleManage moduleManage, HttpServletResponse response) {
        String message = Constants.FAILURE;
        boolean result = moduleManageService.saveOrUpdateModuleManage(moduleManage);
        if (result) {
            message = Constants.SUCCESS;
        }
        SpringUtils.renderJson(response, message);
    }

    /**
     * 跳转到编辑页面
     *
     * @param moduleId 模块ID
     * @return ModelAndView
     */
    @RequestMapping("/editModuleManagePage/{id}")
    public ModelAndView editModuleManagePage(@PathVariable("id") Integer moduleId) {
        ModelAndView modelAndView = new ModelAndView();
        ModuleManageTree moduleManage = moduleManageService.findModuleManageById(moduleId);
        Map<String, Object> map = new HashMap<>();
        map.put("type", "edit");

        modelAndView.addObject("moduleManage", moduleManage);
        modelAndView.addObject("map", map);
        modelAndView.setViewName("/module/moduleManageInfo");
        return modelAndView;
    }

    /**
     * 删除菜单
     *
     * @param id       模块ID
     * @param response response
     */
    @RequestMapping("/delete/{id}")
    public void deleteModuleManage(@PathVariable("id") Integer id, HttpServletResponse response) {
        String result = moduleManageService.deleteModule(id);
        SpringUtils.renderJson(response, result);
    }

    /**
     * 一键清除模块下授权数据
     * @param moduleId 模块ID
     * @param response response
     */
    @RequestMapping("/clearRoleModule/{id}")
    public void clearRoleModule(@PathVariable("id") Integer moduleId, HttpServletResponse response) {

        boolean result = moduleManageService.clearRoleModule(moduleId);
        if (result) {
            SpringUtils.renderJson(response, Constants.SUCCESS);
        } else {
            SpringUtils.renderJson(response, Constants.FAILURE);
        }
    }

    /**
     * 根据角色查询模块列表
     * @param response
     * @param roleId
     */
    @RequestMapping("/getModuleManageListByRole/{roleId}")
    public void getModuleManageListByRole(HttpServletResponse response, @PathVariable("roleId")
    Integer roleId) {
        TreeUtil<ModuleManageTree> node = new ModuleManageTree();
        List<ModuleManageTree> list = moduleManageService.getModuleManageListByRole(roleId);
        node = node.createTree(list);
        SpringUtils.renderJson(response, node.getChildren());
    }


}
