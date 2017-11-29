package com.utonw.dealer.api.service.erp;


import com.utonw.dealer.api.entity.erp.SystemParameter;

import java.util.List;
import java.util.Map;

/**
 * Created by user on 2017/1/20.
 */
public interface IToolService {
	
	/**
	 * 查找工程文件目录下bpm文件
	 * @return
	 */
	List<String> queryBpmnList();
	
	/**
	 * 插入解析后的bpmn文件内容到数据库中
	 * @return
	 */
	boolean insertBpmnDataList(String[] dataTable, String taskType);
	/**
	 * 取得所有的系统参数
	 * @Param param
	 * @return
	 */
	List<SystemParameter> getAllParameterByCompanyIdAndType(Map param);
	/**
	 * 更新系统参数
	 * @Param param
	 * @return
	 */
	int updateParameterByCompanyIdAndType(SystemParameter systemParameter);
	/**
	 * 取得全部系统参数
	 * @return
	 */
	List<SystemParameter> getAllParameter();
	/**
	 * 更新系统参数系统参数
	 * @return
	 */
	int updatesystemParameter(SystemParameter param);
	/**
	 * 取得系统参数
	 * @param companyId
	 * @param sysKey
	 * @return
	 */
	SystemParameter getParameterByKey(Integer companyId, String sysKey);
}
