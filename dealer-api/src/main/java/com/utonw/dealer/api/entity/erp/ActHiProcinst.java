package com.utonw.dealer.api.entity.erp;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 
 * </p>
 *
 * @author wangyj
 * @since 2017-07-18
 */

public class ActHiProcinst implements Serializable {

    private static final long serialVersionUID = 1L;


	private String id;

	private String procInstId;

	private String businessKey;

	private String procDefId;

	private Date startTime;

	private Date endTime;

	private Long duration;

	private String startUserId;

	private String startActId;

	private String endActId;

	private String superProcessInstanceId;

	private String deleteReason;



	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getProcInstId() {
		return procInstId;
	}

	public void setProcInstId(String procInstId) {
		this.procInstId = procInstId;
	}

	public String getBusinessKey() {
		return businessKey;
	}

	public void setBusinessKey(String businessKey) {
		this.businessKey = businessKey;
	}

	public String getProcDefId() {
		return procDefId;
	}

	public void setProcDefId(String procDefId) {
		this.procDefId = procDefId;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public Long getDuration() {
		return duration;
	}

	public void setDuration(Long duration) {
		this.duration = duration;
	}

	public String getStartUserId() {
		return startUserId;
	}

	public void setStartUserId(String startUserId) {
		this.startUserId = startUserId;
	}

	public String getStartActId() {
		return startActId;
	}

	public void setStartActId(String startActId) {
		this.startActId = startActId;
	}

	public String getEndActId() {
		return endActId;
	}

	public void setEndActId(String endActId) {
		this.endActId = endActId;
	}

	public String getSuperProcessInstanceId() {
		return superProcessInstanceId;
	}

	public void setSuperProcessInstanceId(String superProcessInstanceId) {
		this.superProcessInstanceId = superProcessInstanceId;
	}

	public String getDeleteReason() {
		return deleteReason;
	}

	public void setDeleteReason(String deleteReason) {
		this.deleteReason = deleteReason;
	}


}
