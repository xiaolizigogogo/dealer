package com.utonw.utonerp.mapper;

import java.util.List;

import com.utonw.dealer.api.entity.TaskName;
import org.springframework.stereotype.Component;

@Component
public interface TaskNameMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TaskName record);

    int insertSelective(TaskName record);

    TaskName selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TaskName record);

    int updateByPrimaryKey(TaskName record);

	List<TaskName> selectAllEnable();
}