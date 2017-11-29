package com.utonw.utonbase.support.sms.enums;

/**
 * Created by WANGYJ on 2017/9/7.
 */
public enum  SmsServiceProvider {
    lxhl("北京领先互联"),
            ;
    String serviceprovider;

    SmsServiceProvider(String serviceprovider) {
        this.serviceprovider = serviceprovider;
    }

    public String SmsServiceProvider() {
        // TODO Auto-generated method stub
        return serviceprovider;
    }
}
