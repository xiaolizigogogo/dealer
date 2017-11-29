package com.utonw.utonbase.core.erpcommon.utils;


import java.util.Properties;

public class OSChecker {
    public static boolean isOSLinux() {
        Properties prop = System.getProperties();

        String os = prop.getProperty("os.name");
        if (os != null && os.toLowerCase().indexOf("linux") > -1) {
            return true;
        } else {
            return false;
        }
    }
}
 
