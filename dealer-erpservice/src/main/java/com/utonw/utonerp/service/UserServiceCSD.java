package com.utonw.utonerp.service;


import com.utonw.utonerp.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.dubbo.config.annotation.Service;
import com.utonw.dealer.api.service.IuserServiceCSD;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service(version = "1.0.0")
public class UserServiceCSD implements IuserServiceCSD {

	@Autowired
	UserMapper userMapper;

	@Override
	public String selectAccountName(String uuid) {
		return userMapper.selectAccountName(uuid);
	}

	@Override
	public Map downloadPdf(Map param) {
		Map result = new HashMap();

		return null;
	}

	@Override
	public List<String> getUserInfo() throws Exception{
		List<String>  userInfoList =	userMapper.getUserInfoList();
		return userInfoList;
	}

}
