package com.utonw.dealer.api.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class AttachmentParentInfo implements Serializable{

	private static final long serialVersionUID = 8931674270796160358L;
	
	private Integer id;

	private String name;

	private String code;

	private String memo;

	private Boolean enable;

	private Date gmtCreate;

	private Date gmtModify;

	private Integer order;

	private List<AttachmentInfo> attachmentInfos;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public Boolean getEnable() {
		return enable;
	}

	public void setEnable(Boolean enable) {
		this.enable = enable;
	}

	public Date getGmtCreate() {
		return gmtCreate;
	}

	public void setGmtCreate(Date gmtCreate) {
		this.gmtCreate = gmtCreate;
	}

	public Date getGmtModify() {
		return gmtModify;
	}

	public void setGmtModify(Date gmtModify) {
		this.gmtModify = gmtModify;
	}

	public Integer getOrder() {
		return order;
	}

	public void setOrder(Integer order) {
		this.order = order;
	}

	public List<AttachmentInfo> getAttachmentInfos() {
		return attachmentInfos;
	}

	public void setAttachmentInfos(List<AttachmentInfo> attachmentInfos) {
		this.attachmentInfos = attachmentInfos;
	}
	

}
