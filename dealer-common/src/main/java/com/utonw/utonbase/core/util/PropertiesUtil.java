package com.utonw.utonbase.core.util;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.*;

/**
 * Parsing The Configuration File
 * 
 * @author ShenHuaJie
 * @version 2016年7月30日 下午11:41:53
 */
public final class PropertiesUtil extends PropertyPlaceholderConfigurer {
	private static final byte[] KEY = { 9, -1, 0, 5, 39, 8, 6, 19 };
	private static Map<String, String> ctxPropertiesMap = new HashMap<String, String>();
	private static List<String> decryptProperties;
	private static List<File> fileList = new ArrayList<File>();

//	@Override
//	protected void loadProperties(Properties props) throws IOException {
//		super.loadProperties(props);
////		ctxPropertiesMap = new HashMap<String, String>();
//		for (Object key : props.keySet()) {
//			String keyStr = key.toString();
//			String value = props.getProperty(keyStr);
//			if (decryptProperties != null && decryptProperties.contains(keyStr)) {
//				value = SecurityUtil.decryptDes(value, KEY);
//				props.setProperty(keyStr, value);
//			}
//			ctxPropertiesMap.put(keyStr, value);
//		}
//	}
	
	static {

		File file = new File(PropertiesUtil.class.getResource("/config").getPath());
		showDirectory(file);
		for (int i = 0; i < fileList.size(); i++) {
			try {
				InputStream in = new FileInputStream(fileList.get(i));
				;
				Properties props = new Properties();
				props.load(in);
				for (Object key : props.keySet()) {
					String keyStr = key.toString();
					String value = props.getProperty(keyStr);
					if (decryptProperties != null && decryptProperties.contains(keyStr)) {
						value = SecurityUtil.decryptDes(value, KEY);
						props.setProperty(keyStr, value);
					}
					ctxPropertiesMap.put(keyStr, value);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public static void showDirectory(File param){
        File[] files = param.listFiles();
        for(File file:files){
        	if(file.getName().endsWith(".properties")) {
        		fileList.add(file);
        	}else if(file.isDirectory()){
                showDirectory(file);
            }
        }
    }

	/**
	 * @param decryptPropertiesMap
	 *            the decryptPropertiesMap to set
	 */
	public void setDecryptProperties(List<String> decryptProperties) {
		this.decryptProperties = decryptProperties;
	}

	/**
	 * Get a value based on key , if key does not exist , null is returned
	 * 
	 * @param key
	 * @return
	 */
	public static String getString(String key) {
		try {
			return ctxPropertiesMap.get(key);
		} catch (MissingResourceException e) {
			return null;
		}
	}

	/**
	 * Get a value based on key , if key does not exist , null is returned
	 * 
	 * @param key
	 * @return
	 */
	public static String getString(String key, String defaultValue) {
		try {
			String value = ctxPropertiesMap.get(key);
			if (DataUtil.isEmpty(value)) {
				return defaultValue;
			}
			return value;
		} catch (MissingResourceException e) {
			return defaultValue;
		}
	}

	/**
	 * 根据key获取值
	 * 
	 * @param key
	 * @return
	 */
	public static int getInt(String key) {
		return Integer.parseInt(ctxPropertiesMap.get(key));
	}

	/**
	 * 根据key获取值
	 * 
	 * @param key
	 * @param defaultValue
	 * @return
	 */
	public static int getInt(String key, int defaultValue) {
		String value = ctxPropertiesMap.get(key);
		if (StringUtils.isBlank(value)) {
			return defaultValue;
		}
		return Integer.parseInt(value);
	}

	/**
	 * 根据key获取值
	 * 
	 * @param key
	 * @param defaultValue
	 * @return
	 */
	public static boolean getBoolean(String key, boolean defaultValue) {
		String value = ctxPropertiesMap.get(key);
		if (StringUtils.isBlank(value)) {
			return defaultValue;
		}
		return new Boolean(value);
	}

}
