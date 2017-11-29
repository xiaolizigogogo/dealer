/**
 * @Description: 领先互联短信配置文件 
 * @author YX  
 * @date 2017年7月29日上午12:24:13
 */
package com.utonw.utonbase.support.sms.lxhl.config;

import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

/**
 * @author YX
 * @date 2017年7月29日 上午12:24:13 
 */
@Data
@Component
@PropertySource("classpath:config/lxhlSms.properties")
public class LXHLSmsConfigure {

    /**
     * @Fields corpID : 账号
     */
    @Value("${lxhl.sms.corpID}")
    private String corpID;

    /**
     * @Fields pwd : 密码
     */
    @Value("${lxhl.sms.corpID}")
    private String pwd;
    
}
