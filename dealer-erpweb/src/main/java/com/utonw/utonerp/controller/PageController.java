package com.utonw.utonerp.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.utonw.dealer.api.entity.erp.ModuleManageTree;
import com.utonw.dealer.api.entity.erp.User;
import com.utonw.dealer.api.service.erp.IUserService;
import com.utonw.dealer.api.util.erp.Constants;
import com.utonw.utonerp.common.utils.SysUserUtil;
import com.utonw.utonbase.core.erpcommon.utils.TreeUtil;
import com.utonw.utonerp.common.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;



/**
 * 页面跳转控制类
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/page")
public class PageController extends BaseController {

    @Reference(version = "1.0.0")
    IUserService userService;

    @Resource
    private SysUserUtil sysUserUtil;
	
	 /**
     * 页面跳转到主页
     *folder表示文件夹、page表示页面
     * @param page 页面名称
     * @return ModelAndView
     */
    @RequestMapping(value = "/merchant/{folder}/{page}")
    public ModelAndView toPage(@PathVariable("page") String page,@PathVariable("folder") String folder, HttpServletRequest request) {

        ModelAndView modelAndView = new ModelAndView();
        if (page.equals("index")) {
            /** 查询出登录用户所拥有的模块列表 */
        	User user = (User) request.getSession().getAttribute(Constants.AUTH_USER);
            List<ModuleManageTree> list = userService.findMyModule(user.getUuid(), null);
            TreeUtil<ModuleManageTree> node = new TreeUtil<>();
            node.createTree(list);

            List<ModuleManageTree> list1 = sysUserUtil.getModule(null);
            modelAndView.addObject("moduleList", list1);
            for (ModuleManageTree mmt : list) {
                if (mmt.getModuleParentId() == null) {
                    modelAndView.addObject("moduleId", mmt.getModuleId());
                    break;
                }
            }
        }
        modelAndView.setViewName("merchant/"+folder +"/"+ page);
        return modelAndView;
    
    }
}
