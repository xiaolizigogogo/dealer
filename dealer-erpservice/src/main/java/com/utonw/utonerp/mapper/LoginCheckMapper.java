package com.utonw.utonerp.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.utonw.dealer.api.dto.request.LoginRequest;
import com.utonw.dealer.api.entity.LoginUserEntity;

/**
 * <p>
 * Mapper接口
 * </p>
 *
 * @author wangyj
 * @since 2017-07-18
 */
@Component
public interface LoginCheckMapper  {
	LoginUserEntity selectUserByAccount(LoginRequest dto);
	int updatePasswordByAccount(LoginRequest dto);
	List<Integer> selectUserRoleId(@Param("userId") int userId);
}