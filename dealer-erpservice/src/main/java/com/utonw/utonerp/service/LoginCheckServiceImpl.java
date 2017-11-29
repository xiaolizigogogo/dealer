package com.utonw.utonerp.service;

import java.util.List;

import com.utonw.utonerp.mapper.LoginCheckMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.dubbo.config.annotation.Service;
import com.utonw.dealer.api.dto.request.LoginRequest;
import com.utonw.dealer.api.entity.LoginUserEntity;
import com.utonw.dealer.api.service.LoginCheckService;


/**
 * Created by WANGYJ on 2017/5/11.
 */
@Transactional
@Service(version = "1.0.0")
public class LoginCheckServiceImpl implements LoginCheckService {
	public Logger logger = LoggerFactory.getLogger(LoginCheckServiceImpl.class);

	@Autowired
	private LoginCheckMapper loginCheckMapper;

	@Override
	public LoginUserEntity selectUserByAccount(LoginRequest dto) {
		
		return loginCheckMapper.selectUserByAccount(dto);
	}

	@Override
	public int updatePasswordByAccount(LoginRequest dto) {
		System.out.println("-----------------------------------------------------------------------------------LoginCheckServiceImpl-----updatePasswordByAccount");
		return loginCheckMapper.updatePasswordByAccount(dto);
	}

	@Override
	public List<Integer> selectRoleIdByUserId(int userId) {
		return loginCheckMapper.selectUserRoleId(userId);
	}
	
	

}
