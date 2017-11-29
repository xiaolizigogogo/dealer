package com.utonw.utonerp.mapper;

import java.util.List;
import java.util.Map;

import com.utonw.dealer.api.entity.PushTemplate;


public interface PushTemplateMapper {
	
	List<PushTemplate> selectPushTemplate(String taskDefKey);

}
