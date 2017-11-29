package com.utonw.dealer.api.entity.erp;

import java.io.Serializable;

/**
 * @author Administrator
 *
 */
public class RoleAssign implements Serializable {

	private static final long serialVersionUID = -4942064123312754917L;
	private Integer Id;
	
	private Integer roleId;
	
	private String userId;
	
	private String customerId;

	public Integer getId() {
		return Id;
	}

	public void setId(Integer id) {
		Id = id;
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	
	

}

