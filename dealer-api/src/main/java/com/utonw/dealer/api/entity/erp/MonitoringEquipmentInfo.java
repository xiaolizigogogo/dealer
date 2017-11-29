package com.utonw.dealer.api.entity.erp;

import java.io.Serializable;
import java.util.Date;


public class MonitoringEquipmentInfo implements Serializable{

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	/**
	 * 封面地址
	 */
    private String posterUrl;

    /**
     * 视频播放地址
     */
    private String videoUrl;
    
    /**
     * 是否删除
     */
    private Integer status;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 修改时间
     */
    private Date updateTime;

    /**
     * 车商id
     */
    private String merchantId;
    
    /**
     * 摄像头名称
     */
    private String monitoringName;
    
    /**
     * 摄像头编号
     */
    private String monitoringNum;
    
    /**
     * 创建人
     */
    private String createPeople;
    
    /**
     * 修改人
     */
    private String updatePeople;
    
    

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPosterUrl() {
		return posterUrl;
	}

	public void setPosterUrl(String posterUrl) {
		this.posterUrl = posterUrl;
	}

	public String getVideoUrl() {
		return videoUrl;
	}

	public void setVideoUrl(String videoUrl) {
		this.videoUrl = videoUrl;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public String getMerchantId() {
		return merchantId;
	}

	public void setMerchantId(String merchantId) {
		this.merchantId = merchantId;
	}

	public String getMonitoringName() {
		return monitoringName;
	}

	public void setMonitoringName(String monitoringName) {
		this.monitoringName = monitoringName;
	}

	public String getMonitoringNum() {
		return monitoringNum;
	}

	public void setMonitoringNum(String monitoringNum) {
		this.monitoringNum = monitoringNum;
	}

	public String getCreatePeople() {
		return createPeople;
	}

	public void setCreatePeople(String createPeople) {
		this.createPeople = createPeople;
	}

	public String getUpdatePeople() {
		return updatePeople;
	}

	public void setUpdatePeople(String updatePeople) {
		this.updatePeople = updatePeople;
	}
    
    

}