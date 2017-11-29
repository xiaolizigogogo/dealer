package com.utonw.utonbase.core.erpcommon.utils;

import java.util.Comparator;
import java.util.Map;

/**
 * 对比类
 */
public class ComparatorMap implements Comparator{  
	  
    public int compare(Object arg0, Object arg1) {  
        Map<String, Object> map1 = (Map<String, Object>)arg0;  
        Map<String, Object> map2 = (Map<String, Object>)arg1;  
      
        String map1String = (String) map1.get("orderid");  
        String map2String = (String) map2.get("orderid");  
      
        return (map2String).compareTo(map1String);  
    }  
} 
