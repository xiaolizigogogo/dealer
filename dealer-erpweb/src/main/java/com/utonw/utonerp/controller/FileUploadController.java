package com.utonw.utonerp.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.utonw.utonbase.core.erpcommon.config.ParamterControl;
import com.utonw.utonbase.core.erpcommon.utils.SpringUtils;
import com.utonw.utonbase.core.erpcommon.utils.UploadUtil;
import com.utonw.utonerp.common.controller.BaseController;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.dubbo.common.utils.StringUtils;

@Controller
@RequestMapping("/upload")
public class FileUploadController extends BaseController {
	
	Logger logger = Logger.getLogger(FileUploadController.class);

	/**
	 * 还款凭证base64编码上传七牛服务器
	 * @param response
	 * @param base64
	 */
	@RequestMapping("/fileUpload")
	public void fileUpload(HttpServletRequest request,HttpServletResponse response, String base64){
		Map<String, Object> resultMap = new HashMap<>();
		base64 = base64.substring(base64.indexOf(",")+1,base64.length());
		resultMap.put("success", false);
		String name = UUID.randomUUID().toString().replaceAll("-", "")+".jpg";
		String path = request.getSession().getServletContext().getRealPath(ParamterControl.TEMPORARY_DIR);
		File file = new File(path);
		if(!file.exists() && !file.isDirectory()){
			file.mkdir();
		}
		String filepath = path+"/"+name;
		boolean tag = UploadUtil.generateImage(base64, path+"/"+name);
		if(tag){
		      String key = null;
			try {
				key = UploadUtil.upload(filepath);
			} catch (IOException e) {
				logger.error("fileUploadCause" + e.getCause());
				logger.error("fileUploadMessage" + e.getMessage());
				e.printStackTrace();
			}
		      if(!StringUtils.isEmpty(key)){
		         UploadUtil.deleteFiles(filepath);
		         String imgurl = key;
		         resultMap.put("imgurl", imgurl);
		         resultMap.put("success", true);
		      }
		   }
		SpringUtils.renderJson(response,resultMap);
	}
}
