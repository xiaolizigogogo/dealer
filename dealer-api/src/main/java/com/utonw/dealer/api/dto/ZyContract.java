/**
 * @Description: TODO(用一句话描述该文件做什么) 
 * @author YX  
 * @date 2017年7月27日下午4:01:11
 */
package com.utonw.dealer.api.dto;

import java.io.Serializable;

/**
 * @author YX
 * @date 2017年7月27日 下午4:01:11 
 */
public class ZyContract implements Serializable {

	/**
	 * @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么)
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * @Fields taskId : 任务id
	 */
	private String taskId;
	
	/**
	 * @Fields indentId : 订单id
	 */
	private String indentId;
	
	/**
	 * @Fields taskKey : 任务英文名
	 */
	private String taskKey;
	
	private String afterPlateNumber;
	
	private CarFileDTO carFileDTO;

	public String getAfterPlateNumber() {
		return afterPlateNumber;
	}

	public void setAfterPlateNumber(String afterPlateNumber) {
		this.afterPlateNumber = afterPlateNumber;
	}

	public CarFileDTO getCarFileDTO() {
		return carFileDTO;
	}

	public void setCarFileDTO(CarFileDTO carFileDTO) {
		this.carFileDTO = carFileDTO;
	}

	public String getTaskId() {
		return taskId;
	}

	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}

	public String getIndentId() {
		return indentId;
	}

	public void setIndentId(String indentId) {
		this.indentId = indentId;
	}

	public String getTaskKey() {
		return taskKey;
	}

	public void setTaskKey(String taskKey) {
		this.taskKey = taskKey;
	}
	
}
