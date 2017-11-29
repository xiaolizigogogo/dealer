/**
 * @Description: 友盟配置文件 
 * @author YX  
 * @date 2017年7月29日上午12:24:13
 */
package com.utonw.dealer.common.push;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * @author YX
 * @date 2017年7月29日 上午12:24:13 
 */
@Component
public class YMPushConfig {

	@Value("${AppKey}")
    private String appKey;

    @Value("${AppMasterSecret}")
    private String appMasterSecret;

    @Value("${AndriodAppKey}")
    private String andriodAppKey;

    @Value("${AndriodAppMasterSecret}")
    private String andriodAppMasterSecret;

	public String getAppKey() {
		return appKey;
	}

	public void setAppKey(String appKey) {
		this.appKey = appKey;
	}

	public String getAppMasterSecret() {
		return appMasterSecret;
	}

	public void setAppMasterSecret(String appMasterSecret) {
		this.appMasterSecret = appMasterSecret;
	}

	public String getAndriodAppKey() {
		return andriodAppKey;
	}

	public void setAndriodAppKey(String andriodAppKey) {
		this.andriodAppKey = andriodAppKey;
	}

	public String getAndriodAppMasterSecret() {
		return andriodAppMasterSecret;
	}

	public void setAndriodAppMasterSecret(String andriodAppMasterSecret) {
		this.andriodAppMasterSecret = andriodAppMasterSecret;
	}
    
}
