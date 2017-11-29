package com.utonw.utonerp.service;

import com.utonw.dealer.api.entity.erp.TodoDefineEntity;
import com.utonw.dealer.api.service.erp.TodoDefineService;
import com.utonw.utonerp.mapper.TodoDefineEntityMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service("todoDefineService")
@Transactional
public class TodoDefineServiceImpl implements TodoDefineService {

    Logger log = LoggerFactory.getLogger(getClass());

    private static Logger logger = LoggerFactory.getLogger(TodoDefineServiceImpl.class);


    @Autowired
    TodoDefineEntityMapper todoDefineDao;


    @Override
    public TodoDefineEntity findByBusiness(String business) {

        TodoDefineEntity entity  = todoDefineDao.selectByBussinessId(business);

        System.out.println(entity.getBusiness());
        return entity;
    }

}
