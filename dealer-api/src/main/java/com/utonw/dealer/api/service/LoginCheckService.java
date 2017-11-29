package com.utonw.dealer.api.service;

import java.util.List;

import com.utonw.dealer.api.dto.request.LoginRequest;
import com.utonw.dealer.api.entity.LoginUserEntity;

public interface LoginCheckService {
	LoginUserEntity selectUserByAccount(LoginRequest dto);
	int updatePasswordByAccount(LoginRequest dto);
	List<Integer> selectRoleIdByUserId(int userId);
}