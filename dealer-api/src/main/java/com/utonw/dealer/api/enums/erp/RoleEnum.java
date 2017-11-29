package com.utonw.dealer.api.enums.erp;

public enum RoleEnum {
	offline("线下",69),
	evaluator("评估师",74),
    ;
	String name;
    int code;

    RoleEnum(String name, int code) {
        this.name = name;
        this.code = code;

    }

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}
}