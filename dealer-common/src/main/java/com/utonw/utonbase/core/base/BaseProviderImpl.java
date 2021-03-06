package com.utonw.utonbase.core.base;

import com.alibaba.fastjson.JSON;
import com.utonw.utonbase.core.Constants;
import com.utonw.utonbase.core.util.ExceptionUtil;
import com.utonw.utonbase.core.util.InstanceUtil;
import com.utonw.utonbase.support.dbcp.ChooseDataSource;
import com.utonw.utonbase.support.dbcp.HandleDataSource;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.apache.log4j.Logger;
import java.util.List;
import java.util.Map;

public abstract class BaseProviderImpl implements ApplicationContextAware, BaseProvider {
	protected static Logger logger = Logger.getLogger(BaseProviderImpl.class);;
	private ApplicationContext applicationContext;

	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		this.applicationContext = applicationContext;
	}

	public Parameter execute(Parameter parameter) {
		System.out.println("execute begin.");
		String no = parameter.getNo();
//		logger.info("{} request：{}", no, JSON.toJSONString(parameter));
		Object service = applicationContext.getBean(parameter.getService());
		try {
			Long id = parameter.getId();
			BaseModel model = parameter.getModel();
			List<?> list = parameter.getList();
			Map<?, ?> map = parameter.getMap();
			String method = parameter.getMethod();
			Object[] param = parameter.getParam();
			try {
				L: for (String key : ChooseDataSource.METHODTYPE.keySet()) {
					for (String type : ChooseDataSource.METHODTYPE.get(key)) {
						if (method.startsWith(type)) {
							logger.info(key);
							HandleDataSource.putDataSource(key);
							break L;
						}
					}
				}
			} catch (Exception e) {
				logger.error(e);
				HandleDataSource.putDataSource("write");
			}
			Object result = null;
			if (param != null) {
				result = InstanceUtil.invokeMethod(service, method, param);
			} else if (id != null) {
				result = InstanceUtil.invokeMethod(service, method, id);
			} else if (model != null) {
				result = InstanceUtil.invokeMethod(service, method, model);
			} else if (list != null) {
				result = InstanceUtil.invokeMethod(service, method, list);
			} else if (map != null) {
				result = InstanceUtil.invokeMethod(service, method, map);
			} else {
				result = InstanceUtil.invokeMethod(service, method);
			}
			if (result != null) {
				Parameter response = new Parameter(result);
//				logger.info("{} response：{}", no, JSON.toJSONString(response));
				return response;
			}
			logger.info("{} response empty."+ no);
			return null;
		} catch (Exception e) {
			String msg = ExceptionUtil.getStackTraceAsString(e);
			logger.error(no + " " + Constants.Exception_Head + msg, e);
			throw e;
		}
	}
}
