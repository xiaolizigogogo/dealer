package com.utonw.utonbase.core.erpcommon.utils;

import java.util.Comparator;

/**
 * 对比类
 */
public class MyCompartor implements Comparator {
    @Override
    public int compare(Object o1, Object o2) {
        return ((TreeUtil) o1).getMineId().compareTo(((TreeUtil) o2).getMineId());
    }
}
