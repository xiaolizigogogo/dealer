package com.utonw.utonerp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.dubbo.config.annotation.Reference;
import com.utonw.dealer.api.entity.erp.RoleUser;
import com.utonw.dealer.api.entity.erp.User;
import com.utonw.dealer.api.service.erp.IRoleManageService;
import com.utonw.utonbase.core.erpcommon.utils.SpringUtils;
import com.utonw.utonerp.common.controller.BaseController;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.utonw.dealer.api.dto.request.DeleteRequest;
import com.utonw.dealer.api.enums.DeleteTypeEnum;
import com.utonw.dealer.api.service.IOrderService;

@Controller
@RequestMapping("/delete")
public class DeleteController extends BaseController {
	@Reference(version = "1.0.0")
	IOrderService orderSerivce;

	@Reference(version = "1.0.0")
	IRoleManageService roleManageService;
	Logger logger= Logger.getLogger(DeleteController.class);
	@RequestMapping("customer/{id}")
	public void deleteCustomer(HttpServletRequest request, HttpServletResponse response,
			@PathVariable("id") String id) {
		try {
			if(!checkUser(request)){
				SpringUtils.renderText(response, "-2");
				return;
			}
			DeleteRequest deleteRequest = new DeleteRequest();
			deleteRequest.setId(id);
			deleteRequest.setDeleteTypeEnum(DeleteTypeEnum.Customer);
			SpringUtils.renderText(response, ""+orderSerivce.delete(deleteRequest));
		} catch (Exception e) {
			logger.error("【删除客户失败】,{"+e.toString()+"}");
			SpringUtils.renderText(response, "-1");
		}
	}

	@RequestMapping("order/{id}")
	public void deleteOrder(HttpServletRequest request, HttpServletResponse response, @PathVariable("id") String id) {
		try {
			if(!checkUser(request)){
				SpringUtils.renderText(response, "-2");
				return;
			}
			DeleteRequest deleteRequest = new DeleteRequest();
			deleteRequest.setId(id);
			deleteRequest.setDeleteTypeEnum(DeleteTypeEnum.Order);
			SpringUtils.renderText(response, ""+orderSerivce.delete(deleteRequest));
		} catch (Exception e) {
			logger.error("【删除客户失败】,{"+e.toString()+"}");
			SpringUtils.renderText(response, "-1");
		}
	}

	@RequestMapping("bankCard/{id}")
	public void deleteBankCard(HttpServletRequest request, HttpServletResponse response,
			@PathVariable("id") String id) {
		try {
			if(!checkUser(request)){
				SpringUtils.renderText(response, "-2");
				return;
			}
			DeleteRequest deleteRequest = new DeleteRequest();
			deleteRequest.setId(id);
			deleteRequest.setDeleteTypeEnum(DeleteTypeEnum.BankCard);
			int i=orderSerivce.delete(deleteRequest);
			SpringUtils.renderText(response,i+"");
		} catch (Exception e) {
			logger.error("【删除客户失败】,{"+e.toString()+"}");
			SpringUtils.renderText(response, "-1");
		}
	}
	public boolean checkUser(HttpServletRequest request){
		User user=getCurrentUser(request);
		List<RoleUser> roleUsers=roleManageService.getRoleUserList(user.getUuid());
		for(RoleUser roleUser:roleUsers){
			if(roleUser.getRbRoleId()==1){
				return true;
			}
		}
		return false;
	}

}
