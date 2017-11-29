package com.utonw.utonbase.core.erpcommon.utils;

import org.apache.commons.lang.StringUtils;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.concurrent.atomic.AtomicInteger;

/**
 */
public class StringUtil {

    /**
     * 给用户名进行加密的方法，小于等于3个字的名字会加密成“张某某”，多于3个字的名字会加密成“张***”
     *
     * @param userName
     * @return
     */
    public static String encryptUserName(String userName) {
        StringBuilder sb = new StringBuilder();
        //获取姓名长度
        int length = userName.length();
        //第一个字符保留
        sb.append(userName.substring(0, 1));
        if (length >= 1 && length <= 3) {
            for (int i = 0; i < length - 1; i++) {
                sb.append("某");
            }
        } else if (length > 3) {
            for (int i = 0; i < length - 1; i++) {
                sb.append("某");
            }
        }
        return sb.toString();
    }

    /**
     * 某先生
     * 某女士
     * 某某某
     *
     * @param userName
     * @param sex      性别 M->男  FM->女
     * @return
     */
    public static String encryptUserName(String userName, String sex) {
        StringBuilder sb = new StringBuilder();
        //获取姓名长度
        int length = userName.length();
        //第一个字符保留
        sb.append(userName.substring(0, 1));
        if ("M".equals(sex)) {
            sb.append("先生");
        } else if ("FM".equals(sex)) {
            sb.append("女士");
        } else {
            sb.append("某某");
        }
        return sb.toString();
    }

    /**
     * 从异常中获取异常字符串
     *
     * @param e
     * @return
     */
    public static String getExceptionStr(Exception e) {
        StringBuffer errorStr = new StringBuffer(e.toString());
        StackTraceElement[] trace = e.getStackTrace();
        for (int i = 0; i < trace.length; i++) {
            errorStr.append("\r\n" + trace[i]);
        }
        return errorStr.toString();
    }

    private static AtomicInteger count = new AtomicInteger();
    private static int max = 10000;
    private static SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHHmmssSS");

    /**
     * 获取订单号
     *
     * @return
     */
    public static String getOrderNum() {
        if (count.intValue() >= max)
            count.getAndSet(0);
        return sf.format(new Date()) + count.incrementAndGet();
    }

    /**
     * 生成充值流水号，是E开始+ 用户ID+当前的年月日时分秒+6位不重复的随机数
     *
     * @return
     */
    public static String payRecordNo(Integer userId) {
        try {
            String pre = "E";
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
            String dateString = sdf.format(new Date());
            String randomString = String.valueOf(Math.random()).substring(2).substring(0, 6);

            return pre + userId + dateString + randomString;
        } catch (Exception e) {
            System.out.println("生成充值流水号出错====" + e.toString());
        }
        return "";
    }

    /**
     * 自增ID
     *
     * @return int
     */
    public static int increment() {
        if (count.intValue() >= max)
            count.getAndSet(0);
        return count.incrementAndGet();
    }

    /**
     * 富友生成的订单号
     * 最少20位，最长30位
     *
     * @return String
     */
    private static AtomicInteger count2 = new AtomicInteger(1000);
    private static int max2 = 10000;
    private static SimpleDateFormat sf2 = new SimpleDateFormat("yyyyMMddHHmmssSS");

    public static String getOrderId() {
        if (count2.intValue() >= max2) {
            count2.getAndSet(1000);
        }
        String orderId = sf2.format(new Date()) + count2.incrementAndGet();
        return orderId;
    }


    @SuppressWarnings("unchecked")
    public static Object[] splits(String str, String splitsign) {
        int index;
        if (str == null || splitsign == null) {
            return null;
        }
        @SuppressWarnings("rawtypes")
        ArrayList al = new ArrayList();
        while ((index = str.indexOf(splitsign)) != -1) {
            al.add(str.substring(0, index));
            str = str.substring(index + splitsign.length());
        }
        al.add(str);
        return (Object[]) al.toArray(new String[0]);
    }

    /**
     * 手机号码隐藏中间6位
     *
     * @param tel
     * @return
     */
    public static String telparse(String tel) {
        return tel.substring(0, 3) + "******" + tel.substring(9, tel.length());
    }

    /**
     * Bigdeciam 转String 类型
     *
     * @param value 值
     * @param num   保留小数位数
     * @return
     */
    public static String bigDecimalToString(BigDecimal value, int num) {
        return value.setScale(num, BigDecimal.ROUND_DOWN).toString();
    }

    public static boolean isNumeric(String str) {
        if (StringUtils.isEmpty(str)) {
            return false;
        }
        final String number = "0123456789.";
        for (int i = 0; i < str.length(); i++) {
            if (number.indexOf(str.charAt(i)) == -1) {
                return false;
            }
        }
        return true;
    }

    /**
     * 元转分
     *
     * @param money
     * @return
     */
    public static BigDecimal yuanToFen(BigDecimal money) {
        return money.multiply(new BigDecimal(100)).setScale(0, BigDecimal.ROUND_DOWN);
    }

    /**
     * 分转元
     *
     * @param money
     * @return
     */
    public static BigDecimal fenToYuan(BigDecimal money) {
        return money.divide(new BigDecimal(100), 2, BigDecimal.ROUND_DOWN);
    }

    public static void main(String[] args) {
//        AtomicInteger count2 = new AtomicInteger(1000);
//        int max2 = 10000;
//        SimpleDateFormat sf2 = new SimpleDateFormat("yyyyMMddHHmmssSS");
//        for (int i = 1000; i < 1003; i++) {
//            String a = getOrderId();
//            System.out.println(a + "=" + a.length());
//        }
//        String phone2 = "15988888888";
//        System.out.println(phone2.substring(0, 3) + "****" + phone2.substring(7, phone2.length()));

    	String str="adb";
    	System.out.println(getNum(str));
    }
	public static String getNum(String str){
		if(StringUtils.isEmpty(str)){
			return  "";
		}
		str=str.replaceAll("_", "");
		return str.replaceAll("[a-zA-Z]","");
	}

}
