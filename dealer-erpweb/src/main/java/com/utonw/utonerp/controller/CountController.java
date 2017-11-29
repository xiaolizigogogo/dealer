package com.utonw.utonerp.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.utonw.dealer.api.entity.erp.User;
import com.utonw.dealer.api.service.IWorkFlowServiceCSD;
import com.utonw.dealer.api.util.erp.Constants;
import com.utonw.utonbase.core.erpcommon.utils.SpringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/count")
public class CountController {
	
	@Reference(version = "1.0.0")
    IWorkFlowServiceCSD workFlowServiceCSD;
	
	@RequestMapping("/new")
	public void initRoleAssign(HttpServletRequest request, HttpServletResponse response){
		User user = (User) request.getSession().getAttribute(Constants.AUTH_USER);
		Integer newcount = workFlowServiceCSD.queryTaskByUuIdcount(user.getUuid());
		Integer daicount = workFlowServiceCSD.queryTaskByUuIddaicount(user.getUuid());
		Map map = new HashMap<>();
		map.put("newcount", newcount);
		map.put("daicount", daicount);
		SpringUtils.renderJson(response, map);
	}
	
	

}
