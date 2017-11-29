package com.utonw.utonbase.core.erpcommon.utils;

import java.io.InputStream;


import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.converters.Converter;
import com.thoughtworks.xstream.io.xml.DomDriver;

/**
 * bpmn文件解析工具类
 *
 */
public class XstreamUtil {
	/**
	 * 使用xstream插件解析xml，每一个要解析的节点都需要定义一个javabean
	 * @param inputStream 文件输入流
	 * @param clazz  bpmn文件根节点定义的javabean
	 * @param UniversalConverter 转换器（过滤掉一些不需要的节点）
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static <T> T XMLToBean(InputStream inputStream,Class<T> clazz,Converter UniversalConverter){
		XStream xStream = new XStream(new DomDriver());
		xStream.processAnnotations(clazz);
		xStream.registerConverter(UniversalConverter);
		return (T) xStream.fromXML(inputStream);
	}

}
