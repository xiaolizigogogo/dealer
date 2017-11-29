package com.utonw.utonbase.core.erpcommon.utils;

import java.util.UUID;

/**
 * UUID生成类
 */
public class UUIDGenerator {

    /**
     * 创建一个没有中划线的uuid
     *
     * @return String uuid
     */
    public static String getUUID() {

        String s = UUID.randomUUID().toString();
        s = s.replace("-", "");
        return s.toUpperCase();
    }

    /**
     * 批量生成UUID
     *
     * @param number 生成个数
     * @return String[] uuid数组
     */
    public static String[] getUUIDs(int number) {

        if (number < 1) {
            return null;
        }
        String[] uuids = new String[number];
        for (int i = 0; i < number; i++) {
            uuids[i] = getUUID();
        }
        return uuids;
    }
}
