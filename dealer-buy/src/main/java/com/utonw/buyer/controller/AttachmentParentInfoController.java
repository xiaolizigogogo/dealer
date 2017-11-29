package com.utonw.buyer.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSON;
import com.google.common.base.Objects;
import com.maiqianweng.service.AttachmentParentInfoService;
import com.utonw.dealer.api.model.BaseResult;
import com.utonw.dealer.api.service.ILoanServiceCSD;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping("attachmentParentInfo")
@Api(value = "attachmentParentInfo", description = "附件信息")
public class AttachmentParentInfoController {

	private static final Logger logger = LoggerFactory.getLogger("AttachmentParentInfoController.class");
	
	@Reference(version = "1.0.0",timeout = 1500000)
	AttachmentParentInfoService attachmentParentInfoService;
	
	@RequestMapping(value = "/getattachmentParentInfo/{taskCode}", method = RequestMethod.GET)
	@ApiOperation(value = "获取附件信息")
	public BaseResult getattachmentParentInfo(@PathVariable String taskCode) {
		
		if(Objects.equal("All", taskCode)) {
			taskCode = "";
		}
		return new BaseResult(attachmentParentInfoService.queryByTask(taskCode), "0000", "成功");
	}
}
