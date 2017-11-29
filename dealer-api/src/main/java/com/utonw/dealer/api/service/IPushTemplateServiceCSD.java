package com.utonw.dealer.api.service;

import java.util.List;


import com.utonw.dealer.api.entity.PushTemplate;

public interface IPushTemplateServiceCSD {

//	Map<String, Object> delectPushTemplate(String pushTemplateId);
//	Map<String, Object> updatePushTemplate(String pushTemplateId);
	List<PushTemplate> selectPushTemplate(String taskDefKey);
	
}
