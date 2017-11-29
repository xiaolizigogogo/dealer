package com.utonw.utonerp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.utonw.dealer.api.entity.TDistributionRfidEntity;

public interface TDistributionRfidListMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TDistributionRfidEntity record);

    int insertSelective(TDistributionRfidEntity record);

    TDistributionRfidEntity selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TDistributionRfidEntity record);

    int updateByPrimaryKey(TDistributionRfidEntity record);
    
    List<TDistributionRfidEntity> selectByUserId(@Param("UserId") String UserId);
    
    List<TDistributionRfidEntity> selectNullInfo(@Param("dealerId") int dealerId);
    
}