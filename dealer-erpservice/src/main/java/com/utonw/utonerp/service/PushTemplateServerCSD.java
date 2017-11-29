package com.utonw.utonerp.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.utonw.dealer.api.entity.PushTemplate;
import com.utonw.dealer.api.service.IPushTemplateServiceCSD;
import com.utonw.utonerp.mapper.PushTemplateMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;


@Service(version = "1.0.0")
public class PushTemplateServerCSD implements IPushTemplateServiceCSD {
	
	@Autowired
    private PushTemplateMapper pushTemplateMapper;

	@Override
	public List<PushTemplate> selectPushTemplate(String taskDefKey) {
		List<PushTemplate> pushTemplateList = pushTemplateMapper.selectPushTemplate(taskDefKey);
		return pushTemplateList;
	}
	
	

}
