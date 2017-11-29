package com.utonw.dealer.mapper;

import com.utonw.dealer.api.entity.MerchantContactinfo;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.utonw.dealer.api.entity.TaskInfoEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * Mapper接口
 * </p>
 *
 * @author wangyj
 * @since 2017-05-04
 */
@Mapper
public interface MerchantContactinfoMapper extends BaseMapper<MerchantContactinfo> {
    List<TaskInfoEntity> queryTaskList(Map<String,Object> map);
    List<TaskInfoEntity>queryIndentTask(@Param("merchantName")String merchantName, @Param("indentId")List<String> indentId);
}