package com.utonw.dealer.api.entity.erp;

import java.io.Serializable;

public class CustomerRegisterInfoWithBLOBS extends CustomerRegisterInfo implements Serializable {

	private static final long serialVersionUID = -6546371110438374584L;
	private CustomerAccountInfo customerAccountInfo;
	

	public CustomerAccountInfo getCustomerAccountInfo() {
		return customerAccountInfo;
	}

	public void setCustomerAccountInfo(CustomerAccountInfo customerAccountInfo) {
		this.customerAccountInfo = customerAccountInfo;
	}
	
	
	
}
