package com.utonw.dealer.api.dto.request.erp;

/**
 * 返回结果
 * @author jml
 *
 *
 */
public class LoanOperateResult {
	//success
	private boolean success;//删除还是修改
	private String message;
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}
	
}
