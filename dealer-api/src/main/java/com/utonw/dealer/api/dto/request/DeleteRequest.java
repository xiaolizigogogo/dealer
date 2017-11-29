package com.utonw.dealer.api.dto.request;

import java.io.Serializable;
import java.util.List;

import com.utonw.dealer.api.enums.DeleteTypeEnum;

public class DeleteRequest implements Serializable{
	private String id;
	private DeleteTypeEnum deleteTypeEnum;
	private List<String> ids;
	
	public List<String> getIds() {
		return ids;
	}

	public void setIds(List<String> ids) {
		this.ids = ids;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public DeleteTypeEnum getDeleteTypeEnum() {
		return deleteTypeEnum;
	}
	public void setDeleteTypeEnum(DeleteTypeEnum deleteTypeEnum) {
		this.deleteTypeEnum = deleteTypeEnum;
	}
	
}
