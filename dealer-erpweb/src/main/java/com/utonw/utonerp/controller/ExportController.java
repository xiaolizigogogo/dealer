package com.utonw.utonerp.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.dubbo.config.annotation.Reference;
import com.utonw.dealer.api.dto.request.erp.ExportRequest;
import com.utonw.utonbase.core.erpcommon.utils.SpringContext;
import com.utonw.utonbase.core.erpcommon.utils.SpringUtils;
import com.utonw.utonbase.core.erpcommon.utils.WordUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.utonw.dealer.api.service.IOrderService;

@RequestMapping("export")
public class ExportController {
	@Reference(version = "1.0.0")
	private IOrderService orderService;
	public static String tem_path="/file/";
	@RequestMapping("orderList")
	@ResponseBody 
	public void exportOrderList(HttpServletRequest request,HttpServletResponse response,ExportRequest exportRequest){
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("list", exportRequest.getMaps());
		String path= SpringContext.getResourceRootRealPath()+tem_path+UUID.randomUUID().toString();
		String fileName="订单列表";
		String fullFile=new WordUtil().createExecl(path, data,fileName , "order_execl.ftl", SpringContext.getResourceRootRealPath()+"/templete");
		SpringUtils.renderText(response, fullFile);
	}
}
