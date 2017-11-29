package com.utonw.utonbase.core.util;

import org.dozer.DozerBeanMapper;
import org.dozer.Mapper;

public class DozerMapperUtil {
	
	private static Mapper instance;
	
	private DozerMapperUtil() {
		
	}
	
	public static synchronized Mapper getInstance() {
		if(instance == null) {
			instance = new DozerBeanMapper();
		}
		
		return instance;
	}

}
