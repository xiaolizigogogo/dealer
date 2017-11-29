/**
 * @Description: 友盟推送共通方法 
 * @author YX  
 * @date 2017年7月29日上午12:56:19
 */
package com.utonw.dealer.common.push;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @author YX
 * @date 2017年7月29日 上午12:56:19 
 */
public class YMPushUtil {
	
	private static final Logger logger = LoggerFactory.getLogger("YMPushUtil.class");

	private boolean testMode = false;
	
	private PushClient client = new PushClient();
	
	@SuppressWarnings("finally")
	public boolean sendCustomizedCast(String mark, String content, YMPushConfig ymPushConfig) {
		
		logger.info("sendCustomizedCast IN mark:{}, content:{}, andriodAppKey:{}, andriodAppMasterSecret:{}, appKey:{}, appMasterSecret:{}", mark, content, ymPushConfig.getAndriodAppKey(), ymPushConfig.getAndriodAppMasterSecret(), ymPushConfig.getAppKey(), ymPushConfig.getAppMasterSecret());
		
        boolean result = false;
        try {

            AndroidCustomizedcast androidCustomizedcast = new AndroidCustomizedcast(ymPushConfig.getAndriodAppKey(), ymPushConfig.getAndriodAppMasterSecret());
            IOSCustomizedcast iosCustomizedcast = new IOSCustomizedcast(ymPushConfig.getAppKey(), ymPushConfig.getAppMasterSecret());

            //是否为测试模式
            if (this.testMode) {
                iosCustomizedcast.setTestMode();
                androidCustomizedcast.setTestMode();
            } else {
                iosCustomizedcast.setProductionMode();
                androidCustomizedcast.setProductionMode();
            }
            
            /*iosCustomizedcast.setCustomizedField("messageCenter_Skip", "com.UTCar.SystemMessage_advertisement");
            androidCustomizedcast.setAfterOpenAction(AndroidNotification.AfterOpenAction.go_activity);
            androidCustomizedcast.setActivity("com.uton.cardealer.activity.message.headline.HeadLineActivity");*/
            
            //Android
            androidCustomizedcast.setAlias(mark, "subLogin");
            androidCustomizedcast.setSound("default");
            androidCustomizedcast.setDisplayType(AndroidNotification.DisplayType.NOTIFICATION);
            androidCustomizedcast.setTicker("车商APP");
            androidCustomizedcast.setText(content);
            androidCustomizedcast.setCustomField(content);
            androidCustomizedcast.setTitle("车商APP");

            //IOS
            iosCustomizedcast.setAlias(mark, "subLogin");
            iosCustomizedcast.setAlert(content);
            iosCustomizedcast.setBadge(1);
            iosCustomizedcast.setSound("default");

            //Send
            if (client.send(iosCustomizedcast)) {
            	
            	logger.info("ios client");
                result = true;
            }else if (client.send(androidCustomizedcast)) {
            	
            	logger.info("android client");
                result = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }finally{
        	
        	logger.info("sendCustomizedCast OUT result:{}", result);
        	return result;
        }
        
    }
	
    /*public static void main(String[] args) {
		
		YMPushUtil ymPushUtil = new YMPushUtil();
		
		YMPushConfig ymPushConfig = new YMPushConfig();
		ymPushConfig.setAndriodAppKey("58db5668c62dca62f4000253");
		ymPushConfig.setAndriodAppMasterSecret("jihpramjdh3qd1x6i2qm5at1ojxqaows");
		ymPushConfig.setAppKey("585d07cf8f4a9d14c6001223");
		ymPushConfig.setAppMasterSecret("ql8x4zimzo3k3y7aekvo4wilu0dr76rm");
		
		boolean result = ymPushUtil.sendCustomizedCast("88822222222", "123456789测试", ymPushConfig);
		
		System.out.println("result:" + result);
	}*/
}
