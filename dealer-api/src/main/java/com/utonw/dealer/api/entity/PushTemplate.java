package com.utonw.dealer.api.entity;

import java.io.Serializable;
import java.util.Date;

public class PushTemplate implements Serializable{

    private static final long serialVersionUID = 1L;

	/**
	 * 推送模板id
	 */
	private Integer pushTemplateId;

	/**
	 * 节点key
	 */
	private String nodeKey;

	/**
	 * 推送模板内容
	 */
	private String pushTemplateContent;

	/**
	 * 推送对象 1:任务人 2:车商
	 */
	private Integer pushObject;

	/**
	 * 数据状态 1:未删除 2:已删除
	 */
	private String status;

	/**
	 * 更新者id
	 */
	private String updateId;
	
	/**
	 * 更新时间
	 */
	private Date updateTime;
	
	public Integer getPushTemplateId() {
		return pushTemplateId;
	}

	public void setPushTemplateId(Integer pushTemplateId) {
		this.pushTemplateId = pushTemplateId;
	}

	public String getNodeKey() {
		return nodeKey;
	}

	public void setNodeKey(String nodeKey) {
		this.nodeKey = nodeKey;
	}

	public String getPushTemplateContent() {
		return pushTemplateContent;
	}

	public void setPushTemplateContent(String pushTemplateContent) {
		this.pushTemplateContent = pushTemplateContent;
	}

	public Integer getPushObject() {
		return pushObject;
	}

	public void setPushObject(Integer pushObject) {
		this.pushObject = pushObject;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getUpdateId() {
		return updateId;
	}

	public void setUpdateId(String updateId) {
		this.updateId = updateId;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	@Override
	public String toString() {
		return "PushTemplate [pushTemplateId=" + pushTemplateId + ", nodeKey=" + nodeKey + ", pushTemplateContent="
				+ pushTemplateContent + ", pushObject=" + pushObject + ", status=" + status + ", updateId=" + updateId
				+ ", updateTime=" + updateTime + "]";
	}

}
