package com.utonw.utonbase.core.erpcommon.utils;

import org.apache.commons.lang3.StringUtils;

public class WorkFlowTypeUtils {

	public static String parseZhforType(String type){
		if(StringUtils.isNotBlank(type)){
			String zhtype="";
			if(type.equalsIgnoreCase("usertask")){
				zhtype="用户任务";
			}else if(type.equalsIgnoreCase("serviceTask")){
				zhtype="系统节点";
			}else if(type.equalsIgnoreCase("startevent")){
				zhtype="开始节点";
			}else if(type.equalsIgnoreCase("exclusivegateway")){
				zhtype="分支节点";
			}else if(type.equalsIgnoreCase("mailtask")){
				zhtype="邮件节点";
			}else if(type.equalsIgnoreCase("endevent")){
				zhtype="结束节点";
			}
			return zhtype;
		}else{
			return "";
		}
	}
}
