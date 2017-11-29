package com.utonw.dealer.api.dto.request;

import java.io.Serializable;

/**
 * Created by SEELE on 2017/8/8.
 */
public class LoginRequest implements Serializable {
    /**
     *
     */
    private static final long serialVersionUID = 1L;
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
  
}
