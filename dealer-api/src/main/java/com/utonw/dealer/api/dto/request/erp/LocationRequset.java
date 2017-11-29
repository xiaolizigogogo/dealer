package com.utonw.dealer.api.dto.request.erp;

import java.io.Serializable;

public class LocationRequset implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private String location;

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

}
