package com.maiqianweng.service;

import java.util.List;

import com.utonw.dealer.api.entity.AttachmentParentInfo;

public interface AttachmentParentInfoService {

	public List<AttachmentParentInfo> queryAllEnable();

	public List<AttachmentParentInfo> queryByTask(String taskCode);

}
