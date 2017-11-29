package com.utonw.dealer.api.dto.request.erp;

import java.util.Date;

/**
 * 附件请求
 * @author jml
 *
 *
 */
public class AttachmentInfoRequest {
    private Integer id;

    private String attachmentName;

    private String attachmentCode;

    private Integer attachmentOrder;

    private String attachmentType;

    private Integer attachmentParentId;

    private Boolean enable;

    private Date gmtCreate;

    private Date gmtModify;

    private Boolean attachmentUnique;

    private Boolean attachmentRequired;

    private String json;

    private String memo;
    
    private Integer attachmentNum;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getAttachmentName() {
		return attachmentName;
	}

	public void setAttachmentName(String attachmentName) {
		this.attachmentName = attachmentName;
	}

	public String getAttachmentCode() {
		return attachmentCode;
	}

	public void setAttachmentCode(String attachmentCode) {
		this.attachmentCode = attachmentCode;
	}

	public Integer getAttachmentOrder() {
		return attachmentOrder;
	}

	public void setAttachmentOrder(Integer attachmentOrder) {
		this.attachmentOrder = attachmentOrder;
	}

	public String getAttachmentType() {
		return attachmentType;
	}

	public void setAttachmentType(String attachmentType) {
		this.attachmentType = attachmentType;
	}

	public Integer getAttachmentParentId() {
		return attachmentParentId;
	}

	public void setAttachmentParentId(Integer attachmentParentId) {
		this.attachmentParentId = attachmentParentId;
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

	public Boolean getAttachmentUnique() {
		return attachmentUnique;
	}

	public void setAttachmentUnique(Boolean attachmentUnique) {
		this.attachmentUnique = attachmentUnique;
	}

	public Boolean getAttachmentRequired() {
		return attachmentRequired;
	}

	public void setAttachmentRequired(Boolean attachmentRequired) {
		this.attachmentRequired = attachmentRequired;
	}

	public String getJson() {
		return json;
	}

	public void setJson(String json) {
		this.json = json;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public Integer getAttachmentNum() {
		return attachmentNum;
	}

	public void setAttachmentNum(Integer attachmentNum) {
		this.attachmentNum = attachmentNum;
	}
    
    
}
