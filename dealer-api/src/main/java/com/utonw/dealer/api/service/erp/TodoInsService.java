package com.utonw.dealer.api.service.erp;


import com.utonw.dealer.api.entity.erp.TodoInsEntity;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface TodoInsService {

	public TodoInsEntity findBybusinesskey(String businesskey);


	
	public void add(TodoInsEntity todoins);
	
}
