/**
 * @Description: TODO(用一句话描述该文件做什么) 
 * @author YX  
 * @date 2017年10月17日下午2:46:47
 */
package com.utonw.dealer.api.dto;

/**
 * @author YX
 * @date 2017年10月17日 下午2:46:47 
 */
public class DetermineBindingTypeDTO {

	/**
	 * @Fields orderId : 订单号
	 */
	private String orderId;
	
	/**
	 * @Fields plateNumber : 车牌号
	 */
	private String plateNumber;

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getPlateNumber() {
		return plateNumber;
	}

	public void setPlateNumber(String plateNumber) {
		this.plateNumber = plateNumber;
	}
	
}
