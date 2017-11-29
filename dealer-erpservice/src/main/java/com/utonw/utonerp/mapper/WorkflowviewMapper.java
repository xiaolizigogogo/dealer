package com.utonw.utonerp.mapper;
import com.github.pagehelper.Page;
import com.utonw.dealer.api.entity.workflowtask;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public interface WorkflowviewMapper {
    List<workflowtask> queryTaskByUserId(Map param);
    List<workflowtask> queryTaskByUuId(String uuid);
    Integer queryTaskByUuIdcount(@Param("uuid") String uuid, @Param("boolvalue") Boolean boolvalue);
    workflowtask getTaskId(String appylId);
	List<workflowtask> selectByBussinessKeys(List<String> ids);
	workflowtask selectByBussinessKey(String applyId);
	List<Map> selectMerchantCount(String userId, String procKey);
    List<workflowtask>  querywithCapital(String uuid);
    List<workflowtask>  selectWorkflowtask(List<String> ids);

    Page<workflowtask> selectTaskByTaskKey(String name, String name1);

    List<Map<String,String>> selectApplyCount(String workFlowType);

    List<workflowtask> selectApplyByApplyIds(List<String> ids);
	List<Map<String, String>> selectRepaymentCount(String uuid, String workFlowType);
	List<workflowtask> selectByBussinessKeysAndKey(List<String> ids, String name);
	
	workflowtask selectByTaskId(String taskId);
	
	List<workflowtask> selectTaskkeyByProcKey(String name, String name1);
	Map<String,Integer> selectCountBynode(@Param("nodeList") List<String> nodeList);
	List<Map<String, String>> selectOverdueCount(String uuid);
    int deleteByBusinessKey(String businessKey);
}