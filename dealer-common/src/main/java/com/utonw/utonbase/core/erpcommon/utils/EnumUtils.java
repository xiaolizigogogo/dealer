package com.utonw.utonbase.core.erpcommon.utils;

import java.util.ArrayList;
import java.util.Collection;
import java.util.EnumSet;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.utonw.dealer.api.enums.erp.EnumBase;
import org.apache.log4j.Logger;

/**
 * 枚举工具类
 * 
 * @author jml 2016年9月17日 EnumUtils.java
 */
public class EnumUtils {

	private static Set<String> scanPackages = new HashSet<String>();

	public static final Logger log = Logger.getLogger(EnumUtils.class);

	private static final Map<Class<?>, Map<String, String>> cachedNameMessageMap = new HashMap<Class<?>, Map<String, String>>();

	private static final Map<Class<?>, Map<String, String>> cachedMessageNameMap = new HashMap<Class<?>, Map<String, String>>();

	private static final Map<Class<?>, Map<String, EnumBase>> cachedNameEnumBaseMap = new HashMap<Class<?>, Map<String, EnumBase>>();

	private static final Map<Class<?>, Map<String, EnumBase>> cachedMessageEnumBaseMap = new HashMap<Class<?>, Map<String, EnumBase>>();

	private static final Map<Class<?>, Map<Number, String>> cachedValueMessageMap = new HashMap<Class<?>, Map<Number, String>>();

	private static final Map<Class<?>, Map<Number, EnumBase>> cachedValueEnumBaseMap = new HashMap<Class<?>, Map<Number, EnumBase>>();

	private static final Map<Class<?>, List<EnumBase>> cachedNameEnumBaseList = new HashMap<Class<?>, List<EnumBase>>();

	private static final Map<String, Class<?>> enumClassMap = new HashMap<String, Class<?>>();

	private static List<Class<? extends EnumBase>> allImplementsEnumBaseEnum = new ArrayList<Class<? extends EnumBase>>();

	/**
	 * 获取当前枚举的前一个枚举,按照value排序
	 * 
	 * @return
	 */
	public static <T extends EnumBase> T getPreviousByValue(T t) {
		T previous = null;
		for (Object enumObj : EnumSet.allOf((Class<? extends Enum>) t.getClass())) {
			EnumBase enumBase = (EnumBase) enumObj;
			if (enumBase.value().doubleValue() < t.value().doubleValue()) {
				if (previous == null) {
					previous = (T) enumBase;
				} else if (previous.value().doubleValue() < enumBase.value().doubleValue()) {
					previous = (T) enumBase;
				}
			}
		}
		return previous;
	}

	/**
	 * 获取当前枚举的下一个枚举,按照value排序
	 * 
	 * @return
	 */
	public static <T extends EnumBase> T getNextByValue(T t) {
		T previous = null;
		for (Object enumObj : EnumSet.allOf((Class<? extends Enum>) t.getClass())) {
			EnumBase enumBase = (EnumBase) enumObj;
			if (enumBase.value().doubleValue() > t.value().doubleValue()) {
				if (previous == null) {
					previous = (T) enumBase;
				} else if (previous.value().doubleValue() > enumBase.value().doubleValue()) {
					previous = (T) enumBase;
				}
			}
		}
		return previous;
	}

	public static Map<String, String> newNameMessageMap(Class<?> enumClass) {
		return new LinkedHashMap<String, String>(getNameMessageMap(enumClass));
	}

	public static Class<?> getClass(String enumClassName) {
		Class<?> clasz = enumClassMap.get(enumClassName);
		if (clasz == null) {
			if (enumClassName.indexOf(".") > 0) {
				try {
					clasz = Class.forName(enumClassName);
					enumClassMap.put(enumClassName, clasz);
					return clasz;
				} catch (ClassNotFoundException e) {
					log.error("无法找到类异常，类名：" + enumClassName);
					return null;
				}
			} else {
				for (String packageName : scanPackages) {
					try {
						clasz = Class.forName(
								packageName + (packageName.endsWith(".") ? enumClassName : "." + enumClassName));
						enumClassMap.put(enumClassName, clasz);
						return clasz;
					} catch (ClassNotFoundException e) {
						// 忽略，准备下一个包查找
					}
				}
			}
			log.error("无法找到类异常，类名：" + enumClassName);
			return null;

		}
		return clasz;
	}

	/**
	 * @param enumClassName
	 * @return
	 */
	public static Object[] enumValues(String enumClassName) {
		Class enumClass = getClass(enumClassName);
		if (enumClass != null) {
			EnumSet set = EnumSet.allOf(enumClass);
			return set.toArray();
		}
		return null;
	}

	public static Map<String, String> newNameMessageMapByClassName(String enumClassName) {
		return new LinkedHashMap<String, String>(getNameMessageMap(getClass(enumClassName)));
	}

	public static Map<String, String> getNameMessageMap(String enumClass) {
		return getNameMessageMap(getClass(enumClass));
	}

	@SuppressWarnings("unchecked")
	public static Map<String, String> getNameMessageMap(Class enumClass) {
		Map<String, String> nameMessageMap = cachedNameMessageMap.get(enumClass);
		if (nameMessageMap == null) {
			EnumSet<?> enumSet = EnumSet.allOf(enumClass);
			nameMessageMap = new LinkedHashMap<String, String>();
			for (Object obj : enumSet) {
				EnumBase enumObj = (EnumBase) obj;
				nameMessageMap.put(enumObj.name(), enumObj.message());
			}
			cachedNameMessageMap.put(enumClass, nameMessageMap);
		}
		return nameMessageMap;
	}

	public static Map<String, String> getMessageNameMap(String enumClass) {
		return getMessageNameMap(getClass(enumClass));
	}

	@SuppressWarnings("unchecked")
	public static Map<String, String> getMessageNameMap(@SuppressWarnings("rawtypes") Class enumClass) {
		Map<String, String> messageNameMap = cachedMessageNameMap.get(enumClass);
		if (messageNameMap == null) {
			EnumSet<?> enumSet = EnumSet.allOf(enumClass);
			messageNameMap = new LinkedHashMap<String, String>();
			for (Object obj : enumSet) {
				EnumBase enumObj = (EnumBase) obj;
				messageNameMap.put(enumObj.message(), enumObj.name());
			}
			cachedMessageNameMap.put(enumClass, messageNameMap);
		}
		return messageNameMap;
	}

	public static Map<String, EnumBase> newNameEnumBaseMap(Class<?> enumClass) {
		return new LinkedHashMap<String, EnumBase>(getNameEnumBaseMap(enumClass));
	}

	public static Map<String, EnumBase> getNameEnumBaseMap(String enumClass) {
		return getNameEnumBaseMap(getClass(enumClass));
	}

	@SuppressWarnings("unchecked")
	public static Map<String, EnumBase> getNameEnumBaseMap(Class enumClass) {
		Map<String, EnumBase> nameEnumBaseMap = cachedNameEnumBaseMap.get(enumClass);
		if (nameEnumBaseMap == null) {
			EnumSet enumSet = EnumSet.allOf(enumClass);
			nameEnumBaseMap = new LinkedHashMap<String, EnumBase>();
			for (Object obj : enumSet) {
				EnumBase enumObj = (EnumBase) obj;
				nameEnumBaseMap.put(enumObj.name(), enumObj);
			}
			cachedNameEnumBaseMap.put(enumClass, nameEnumBaseMap);
		}
		return nameEnumBaseMap;
	}

	@SuppressWarnings("unchecked")
	public static Map<String, EnumBase> getMessageEnumBaseMap(Class enumClass) {
		Map<String, EnumBase> messageEnumBaseMap = cachedMessageEnumBaseMap.get(enumClass);
		if (messageEnumBaseMap == null) {
			EnumSet enumSet = EnumSet.allOf(enumClass);
			messageEnumBaseMap = new LinkedHashMap<String, EnumBase>();
			for (Object obj : enumSet) {
				EnumBase enumObj = (EnumBase) obj;
				messageEnumBaseMap.put(enumObj.message(), enumObj);
			}
			cachedMessageEnumBaseMap.put(enumClass, messageEnumBaseMap);
		}
		return messageEnumBaseMap;
	}

	public static Map<Number, String> newValueMessageMap(Class<?> enumClass) {
		return new LinkedHashMap<Number, String>(getValueMessageMap(enumClass));
	}

	@SuppressWarnings("unchecked")
	public static List<EnumBase> getEnumBaseList(String enumClass) {
		return getEnumBaseList(getClass(enumClass));
	}

	/**
	 * 返回枚举类的所有实例
	 * 
	 * @param enumClass
	 * @return
	 */
	public static <T extends Enum<T>> List<T> values(Class<T> enumClass) {
		return new ArrayList<T>(EnumSet.allOf(enumClass));
	}

	@SuppressWarnings("unchecked")
	public static Map<Number, String> getValueMessageMap(Class enumClass) {
		Map<Number, String> valueMessageMap = cachedValueMessageMap.get(enumClass);
		if (valueMessageMap == null) {
			EnumSet enumSet = EnumSet.allOf(enumClass);
			valueMessageMap = new LinkedHashMap<Number, String>();
			for (Object obj : enumSet) {
				EnumBase enumObj = (EnumBase) obj;
				valueMessageMap.put(enumObj.value(), enumObj.message());
			}
			cachedValueMessageMap.put(enumClass, valueMessageMap);
		}
		return valueMessageMap;
	}

	@SuppressWarnings("unchecked")
	public static Map<Number, String> getValueMessageMap(String className) {
		return getValueMessageMap(getClass(className));
	}

	public static Map<Number, EnumBase> newValueEnumBaseMap(Class<?> enumClass) {
		return new LinkedHashMap<Number, EnumBase>(getValueEnumBaseMap(enumClass));
	}

	@SuppressWarnings("unchecked")
	public static Map<Number, EnumBase> getValueEnumBaseMap(Class enumClass) {
		Map<Number, EnumBase> nameEnumBaseMap = cachedValueEnumBaseMap.get(enumClass);
		if (nameEnumBaseMap == null) {
			EnumSet enumSet = EnumSet.allOf(enumClass);
			nameEnumBaseMap = new LinkedHashMap<Number, EnumBase>();
			for (Object obj : enumSet) {
				EnumBase enumObj = (EnumBase) obj;
				nameEnumBaseMap.put(enumObj.value(), enumObj);
			}
			cachedValueEnumBaseMap.put(enumClass, nameEnumBaseMap);
		}
		return nameEnumBaseMap;
	}

	public static List<EnumBase> toEnumBaseList(Class enumClass) {
		return new ArrayList<EnumBase>(getEnumBaseList(enumClass));
	}

	private static List<EnumBase> getEnumBaseList(Class enumClass) {
		List<EnumBase> enumBaseList = cachedNameEnumBaseList.get(enumClass);
		if (enumBaseList == null) {
			EnumSet enumSet = EnumSet.allOf(enumClass);
			enumBaseList = new ArrayList<EnumBase>();
			for (Object obj : enumSet) {
				EnumBase enumObj = (EnumBase) obj;
				enumBaseList.add(enumObj);
			}
			cachedNameEnumBaseList.put(enumClass, enumBaseList);
		}
		return enumBaseList;
	}

	public static List<Class<? extends EnumBase>> getAllImplementsEnumBaseEnum() {
		return allImplementsEnumBaseEnum;
	}

	/**
	 * 
	 * @param enumClass
	 * @return
	 */
	public static <T extends Enum<T>> Map<String, T> toMessageMap(Class<T> enumClass) {
		Map<String, T> map = new HashMap<String, T>();
		EnumSet<T> enumSet = EnumSet.allOf(enumClass);
		for (T obj : enumSet) {
			map.put(((EnumBase) obj).message(), obj);
		}
		return map;
	}

	public static EnumBase numberValueOf(Class<?> enumType, Number value) {
		return getValueEnumBaseMap(enumType).get(value);
	}

	/**
	 * @param enumList
	 * @return
	 */
	public static List<String> toName(Collection<? extends Enum<?>> enumList) {
		if (enumList == null)
			return null;

		List<String> enumNameList = new ArrayList<String>();
		for (Enum<?> enumObj : enumList) {
			enumNameList.add(enumObj.name());
		}
		return enumNameList;
	}

	/**
	 * @param enumList
	 * @return
	 */
	public static List<String> toEnumBaseName(Collection<? extends EnumBase> enumList) {
		if (enumList == null)
			return null;

		List<String> enumNameList = new ArrayList<String>();
		for (EnumBase enumObj : enumList) {
			enumNameList.add(enumObj.name());
		}
		return enumNameList;
	}

	/**
	 * @param enumList
	 * @return
	 */
	public static List<String> toMessage(Collection<? extends EnumBase> enumList) {
		if (enumList == null)
			return null;

		List<String> enumNameList = new ArrayList<String>();
		for (EnumBase enumObj : enumList) {
			enumNameList.add(enumObj.message());
		}
		return enumNameList;
	}

	public static List<String> toMessage(EnumBase[] enumList) {
		if (enumList == null)
			return null;

		List<String> enumNameList = new ArrayList<String>();
		for (EnumBase enumObj : enumList) {
			enumNameList.add(enumObj.message());
		}
		return enumNameList;
	}

	/**
	 * 转换成value列表
	 * 
	 * @param <T>
	 * @param enumList
	 * @return
	 */
	public static <T extends EnumBase> List<Number> toValue(Collection<T> enumList) {
		if (enumList == null)
			return null;

		List<Number> enumNameList = new ArrayList<Number>();
		for (EnumBase enumObj : enumList) {
			enumNameList.add(enumObj.value());
		}
		return enumNameList;
	}

	public static <T extends Enum<T>> List<T> toEnum(Class<T> enumClass, Collection<String> enumNameList) {
		if (enumNameList == null)
			return null;

		List<T> enumList = new ArrayList<T>();
		for (String enumName : enumNameList) {
			enumList.add(Enum.valueOf(enumClass, enumName));
		}
		return enumList;
	}

	public static <T extends Enum<T>> List<T> toEnum(Class<T> enumClass, String[] enumNameList) {
		if (enumNameList == null)
			return null;

		List<T> enumList = new ArrayList<T>();
		for (String enumName : enumNameList) {
			enumList.add(Enum.valueOf(enumClass, enumName));
		}
		return enumList;
	}

	/**
	 * @param enumList
	 * @return
	 */
	public static List<String> toName(Enum<?>[] enumList) {
		if (enumList == null)
			return null;

		List<String> enumNameList = new ArrayList<String>();
		for (Enum<?> enumObj : enumList) {
			enumNameList.add(enumObj.name());
		}
		return enumNameList;
	}

}
