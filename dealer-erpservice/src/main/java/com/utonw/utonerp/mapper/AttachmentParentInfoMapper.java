package com.utonw.utonerp.mapper;

import java.util.List;

import com.utonw.dealer.api.entity.AttachmentParentInfo;
import org.springframework.stereotype.Component;

@Component
public interface AttachmentParentInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(AttachmentParentInfo record);

    int insertSelective(AttachmentParentInfo record);

    AttachmentParentInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AttachmentParentInfo record);

    int updateByPrimaryKey(AttachmentParentInfo record);

    List<AttachmentParentInfo> selectAllEnable();

    List<AttachmentParentInfo> selectByTask(String taskCode);
}