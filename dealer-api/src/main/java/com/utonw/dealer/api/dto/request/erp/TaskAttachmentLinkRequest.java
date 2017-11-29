package com.utonw.dealer.api.dto.request.erp;

import java.util.List;

/**
 * 
 * @author jml
 *
 *
 */
public class TaskAttachmentLinkRequest {
	//
	private String taskCode;
	
	private List<Integer> attachmentInfos;

	public String getTaskCode() {
		return taskCode;
	}

	public void setTaskCode(String taskCode) {
		this.taskCode = taskCode;
	}

	public List<Integer> getAttachmentInfos() {
		return attachmentInfos;
	}

	public void setAttachmentInfos(List<Integer> attachmentInfos) {
		this.attachmentInfos = attachmentInfos;
	}
	
	
}
