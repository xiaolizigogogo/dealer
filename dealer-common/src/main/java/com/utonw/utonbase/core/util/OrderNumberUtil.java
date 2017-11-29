package com.utonw.utonbase.core.util;


import org.dozer.DozerBeanMapper;

import java.util.Date;

/**
 * 订单号生成共通方法
 */
public class OrderNumberUtil {

	private static DozerBeanMapper instance;

	/**
	  * 作者:懒羊羊
	  * 方法名:generateSixNumber
	  * 描述:生成6位随机数
	  * 创建时间:2015年11月14日下午10:04:48
	  * 返回类型:int
	  */
	public static int generateSixNumber(){
	int sixNumber = (int)((Math.random()*9+1)*100000);
		return sixNumber;
	}

/**
  * 作者:懒羊羊
  * 方法名:timeStamp
  * 描述:生成当前时间戳
  * 创建时间:2015年11月14日下午10:15:45
  * 返回类型:Long
  */
	public static Long timeStamp(){
		Long timeStamp = (new Date()).getTime();
		return timeStamp;
	}

/**
  * 作者:懒羊羊
  * 方法名:timeStampEight
  * 描述:获取时间戳后六位
  * 创建时间:2015年11月14日下午10:24:39
  * 返回类型:Integer
  */
	public static String timeStampEight(){
		String timeStamp = timeStamp().toString();
		String timeStampEight = timeStamp.substring(7, timeStamp.length());
		return timeStampEight;
	}

/**
  * 作者:懒羊羊
  * 方法名:MD5EncryptString
  * 描述:六位随机数加时间戳后六位进行MD5加密
  * 创建时间:2015年11月14日下午10:39:53
  * 返回类型:String
  */
	public static String MD5EncryptString(){
		String sixNumber = String.valueOf(generateSixNumber());
		String MD5EncryptString = HashUtil.md5(sixNumber + timeStampEight());
		return MD5EncryptString;
	}

}
