package com.utonw.dealer.api.entity;

import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author wangyj
 * @since 2017-07-18
 */

public class LoginUserEntity implements Serializable {

	/**
    *
    */
   private static final long serialVersionUID = 1L;
   private int id;
   private String account;
   private String password;
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

}
