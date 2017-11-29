/**
 * @Description: TODO(用一句话描述该文件做什么) 
 * @author YX  
 * @date 2017年10月17日下午3:02:10
 */
package com.utonw.dealer.api.dto;

/**
 * @author YX
 * @date 2017年10月17日 下午3:02:10 
 */
public class SupervisionType {

	/**
	 * @Fields bindingType : 绑定类型 0、未绑定 1、OBD 2、RFID
	 */
	private int bindingType;
	
	/**
	 * @Fields rfidOrObd : rfid或者obd号
	 */
	private String rfidOrObd;
	
	/**
	 * @Fields rfidSerialNumber : RFID串号
	 */
	private String rfidSerialNumber;

	public int getBindingType() {
		return bindingType;
	}

	public void setBindingType(int bindingType) {
		this.bindingType = bindingType;
	}

	public String getRfidOrObd() {
		return rfidOrObd;
	}

	public void setRfidOrObd(String rfidOrObd) {
		this.rfidOrObd = rfidOrObd;
	}

	public String getRfidSerialNumber() {
		return rfidSerialNumber;
	}

	public void setRfidSerialNumber(String rfidSerialNumber) {
		this.rfidSerialNumber = rfidSerialNumber;
	}
	
}
