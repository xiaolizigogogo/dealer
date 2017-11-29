package com.utonw.dealer.mapper;


import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.utonw.dealer.api.dto.response.CarPicResponse;
import com.utonw.dealer.api.entity.CarFile;

import java.util.List;

/**
 * <p>
 * Mapper接口
 * </p>
 *
 * @author wangyj
 * @since 2017-05-05
 */
public interface CarFileMapper extends BaseMapper<CarFile> {

	List<CarPicResponse> selectCarFilePic(String id);

	List<String> selectCarPicByIndentId(String id);
}