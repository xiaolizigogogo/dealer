package com.utonw.utonerp.service;


import com.utonw.dealer.api.entity.erp.TodoInsEntity;
import com.utonw.dealer.api.service.erp.TodoInsService;
import com.utonw.utonerp.mapper.TodoInsEntityMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("todoInsService")
@Transactional
public class TodoInsServiceImpl implements TodoInsService {

	@Autowired
	TodoInsEntityMapper todoinsDao;

	@Override
	public TodoInsEntity findBybusinesskey(String businesskey) {
		return todoinsDao.findBybusinesskey(businesskey);


	}

	@Override
	public void add(TodoInsEntity todoins) {

		todoinsDao.insert(todoins);
	}

}
