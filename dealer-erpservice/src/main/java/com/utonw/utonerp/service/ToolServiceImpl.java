package com.utonw.utonerp.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.utonw.dealer.api.entity.TaskName;
import com.utonw.dealer.api.entity.erp.BpmnUserTask;
import com.utonw.dealer.api.entity.erp.SystemParameter;
import com.utonw.dealer.api.service.erp.IToolService;
import com.utonw.utonbase.core.erpcommon.utils.JsonUtil;
import com.utonw.utonerp.mapper.SystemParameterMapper;
import com.utonw.utonerp.mapper.TaskNameMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * Tool service实现类
 * Created by user on 2017/1/20.
 */
@Service("toolService")
@com.alibaba.dubbo.config.annotation.Service(version = "1.0.0")
@Transactional
public class ToolServiceImpl implements IToolService {
	
	@Autowired
	TaskNameMapper taskNameMapper;
	@Autowired
	SystemParameterMapper systemParameterMapper;

	/* 
	 * 查找所有.bpmn文件路径
	 * (non-Javadoc)
	 * @see com.maiqianweng.service.IToolService#queryBpmnList()
	 */
	@Override
	public List<String> queryBpmnList() {
		String bpmnPath = Thread.currentThread().getContextClassLoader().getResource("").toString()+"activiti";
		bpmnPath = bpmnPath.replace('/', '\\');//将/换成\  
		bpmnPath = bpmnPath.replace("file:", "");// 去掉file:
		bpmnPath = bpmnPath.substring(1);//去掉第一个/
		List<String> list = new ArrayList<String>();
		File baseDir  = new File(bpmnPath);
		ContinueToFind(baseDir,list);	
		return list;
	}
	/**
	 * 查找工程目录target\classes\activiti\目录下.bpmn的文件，如果存在二级目录继续查找
	 * @param baseDir
	 * @param list
	 */
	public void ContinueToFind(File baseDir,List<String> list){
		if(!baseDir.exists()){
			throw new RuntimeException("查找失败，activiti目录不存在！");
			//System.out.println("查找失败，activiti目录不存在！");
		}else{
			String[] filelist = baseDir.list();
			for(int i = 0 ; i < filelist.length ; i++){
				File newBpmnPath = new File(baseDir + "\\" + filelist[i]);	
					if(!newBpmnPath.isDirectory()){
						String str = newBpmnPath.getName().substring(newBpmnPath.getName().length()-5,newBpmnPath.getName().length());
						if(str.equals(".bpmn")){
							list.add(newBpmnPath.getAbsolutePath());
						}
					}else{
						ContinueToFind(newBpmnPath,list);
					}
				}
			}
		}
	@Override
	public boolean insertBpmnDataList(String[] dataTable,String taskType) {
		boolean r = true;
		TaskName taskName = new TaskName();
		try {
			for (String array : dataTable) {
			String data = "{"+array+"}";
			BpmnUserTask userTask = JsonUtil.readValue(data, BpmnUserTask.class);
			taskName.setTaskName(userTask.getName());
			taskName.setTaskCode(userTask.getId());
			taskName.setTaskType(taskType);
			taskNameMapper.insertSelective(taskName);
			}
		} catch (Exception e) {
			r=false;
			throw new RuntimeException("系统错误，插入失败！");
		}
		return r;
	}

	@Override
	public List<SystemParameter> getAllParameterByCompanyIdAndType(Map param) {
		return systemParameterMapper.selectAllParameterByCompanyIdAndType(param);
	}

	@Override
	public int updateParameterByCompanyIdAndType(SystemParameter systemParameter) {
		return systemParameterMapper.updateByPrimaryKeySelective(systemParameter);
	}

	@Override
	public List<SystemParameter> getAllParameter() {
		return systemParameterMapper.selectAllParameter();
	}

	@Override
	public int updatesystemParameter(SystemParameter param) {
		return systemParameterMapper.updateBySysKey(param);
	}

	@Override
	public SystemParameter getParameterByKey(Integer companyId, String sysKey) {
		return systemParameterMapper.selectParameterByKey(companyId, sysKey);
	}

}


