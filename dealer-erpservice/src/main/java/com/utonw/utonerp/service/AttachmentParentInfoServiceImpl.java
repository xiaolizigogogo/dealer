package com.utonw.utonerp.service;

import java.util.List;

import com.alibaba.dubbo.config.annotation.Service;
import com.utonw.dealer.api.entity.AttachmentParentInfo;
import com.utonw.utonerp.mapper.AttachmentParentInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;

import com.maiqianweng.service.AttachmentParentInfoService;

@Service(version = "1.0.0")
public class AttachmentParentInfoServiceImpl implements AttachmentParentInfoService{
	@Autowired
	private AttachmentParentInfoMapper attachmentParentInfoMapper;
	@Override
	public List<AttachmentParentInfo> queryAllEnable() {
		return attachmentParentInfoMapper.selectAllEnable();
	}
	@Override
	public List<AttachmentParentInfo> queryByTask(String taskCode) {
		return attachmentParentInfoMapper.selectByTask(taskCode);
	}

}
