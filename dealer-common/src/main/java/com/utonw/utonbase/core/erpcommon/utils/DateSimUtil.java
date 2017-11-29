package com.utonw.utonbase.core.erpcommon.utils;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateSimUtil {

    /**
     *  计算 指定日期 加上天数
     * @param today 日期 ，num  天数
     * @return str
     */
    public  static  String  getAddDate(String today,String  num){
        String  sss ="";
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // 日期格式
            Date date = dateFormat.parse(today); // 指定日期
            Long longNum = Long.parseLong(num);
            Date newDate = addDate(date,longNum); // 指定日期加上天数
          //  System.out.println(dateFormat.format(date));// 输出格式化后的日期
           // System.out.println(dateFormat.format(newDate));
            sss =  DateToStr(newDate);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return  sss;
    }

    public static Date addDate(Date date,long day) throws ParseException {
        long time = date.getTime(); // 得到指定日期的毫秒数
        day = day*24*60*60*1000; // 要加上的天数转换成毫秒数
        time+=day; // 相加得到新的毫秒数
        return new Date(time); // 将毫秒数转换成日期
    }

    /**
     * 日期转换成字符串
     * @param date
     * @return str
     */
    public static String DateToStr(Date date) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String str = format.format(date);
        return str;
    }

    /**
     * 字符串转换成日期
     * @param str
     * @return date
     */
    public static Date StrToDate(String str) {

        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = null;
        try {
            date = format.parse(str);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return date;
    }

}
