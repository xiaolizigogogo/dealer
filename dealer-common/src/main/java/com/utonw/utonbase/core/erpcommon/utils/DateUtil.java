package com.utonw.utonbase.core.erpcommon.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class DateUtil {

	private static Logger logger = LoggerFactory.getLogger(DateUtil.class);

	private final static SimpleDateFormat MY_DATE_FORMAT = new SimpleDateFormat(
			"yyyy年MM月dd日");

	public static String getNiceDate(Date date) {
		String result = null;
		long currentTime = new Date().getTime() - date.getTime();
		int time = (int) (currentTime / 1000);
		if (time < 60) {
			result = "刚刚";
		} else if (time >= 60 && time < 3600) {
			result = time / 60 + "分钟前";
		} else if (time >= 3600 && time < 86400) {
			result = time / 3600 + "小时前";
		} else if (time >= 86400 && time < 864000) {
			result = time / 86400 + "天前";
		} else {
			result = MY_DATE_FORMAT.format(date);
		}
		return result;
	}

	/**
	 * 按指定的字符串格式将字符串型日期转化为java.util.Date型日期
	 *
	 * @param dateFormatType "yyyy-MM-dd" 或者 "yyyy-MM-dd hh:mm:ss"
	 * @return java.util.Date型日期
	 * @Param dateStr 字符型日期
	 */
	public static Date turnStrDateToJavaUtilDate(String strDate,
	                                             String dateFormatType) {

		Date javaUtilDate = null;
		DateFormat df = new SimpleDateFormat(dateFormatType);
		if (strDate != null && (!"".equals(strDate)) && dateFormatType != null
				&& (!"".equals(dateFormatType))) {

			try {

				javaUtilDate = df.parse(strDate);
			} catch (ParseException e) {
				logger.error(e.getMessage());
			}
		}
		return javaUtilDate;
	}

	/**
	 * <b>根据特定格式得到当前时间字符串<b><br/>
	 *
	 * @param dateFormatType
	 * @return
	 * @author Yung·Fu
	 */
	public static String getCurrentStrDateBySpecifiedFormatType(
			String dateFormatType) {
		if (dateFormatType != null && !"".equals(dateFormatType)) {
			SimpleDateFormat sdf = new SimpleDateFormat(dateFormatType);
			return sdf.format(new Date());
		}
		return "";
	}

	/**
	 * @return eg: 2012091811320043154
	 * @Title: getCurrentDateTime16Str
	 * @Description: 获取时间16位+4位随机数
	 * @Author: FuYung
	 * @Since: 2014年1月6日上午11:37:25
	 */
	public static String getCurrentDateTime16Str() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmssss");
	    /* 生成随机数 */
		int[] array = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
		Random rand = new Random();
		for (int i = 10; i > 1; i--) {
			int index = rand.nextInt(i);
			int tmp = array[index];
			array[index] = array[i - 1];
			array[i - 1] = tmp;
		}
		int result = 0;
		for (int i = 0; i < 4; i++) {
			result = result * 10 + array[i];
		}

		return sdf.format(new Date()) + result;
	}

	/**
	 * @return
	 * @Title: getCurrentDateTime16Str
	 * @Description: 获取时间6位+2位随机数
	 * @Author: FuYung
	 */
	public static String getCurrentDateTime8Str() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd");
        /* 生成随机数 */
		int[] array = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
		Random rand = new Random();
		for (int i = 10; i > 1; i--) {
			int index = rand.nextInt(i);
			int tmp = array[index];
			array[index] = array[i - 1];
			array[i - 1] = tmp;
		}
		int result = 0;
		for (int i = 0; i < 2; i++) {
			result = result * 10 + array[i];
		}

		return sdf.format(new Date()) + result;
	}

	/**
	 * @return
	 * @Title: getCurrentDateTime8
	 * @Description: 获取时间8位
	 * @Author: FuYung
	 */
	public static String getCurrentDateTime8() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        /* 生成随机数 */
		int[] array = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
		Random rand = new Random();
		for (int i = 10; i > 1; i--) {
			int index = rand.nextInt(i);
			int tmp = array[index];
			array[index] = array[i - 1];
			array[i - 1] = tmp;
		}

		return sdf.format(new Date());
	}

	/**
	 * @param javaUtilDate   java.util.Date,传入的java.util.Date型日期
	 * @param dateFormatType "yyyy-MM-dd"或者<br>
	 *                       "yyyy-MM-dd hh:mm:ss EE"或者<br>
	 *                       "yyyy年MM月dd日 hh:mm:ss EE" <br>
	 *                       (年月日 时:分:秒 星期 ，注意MM/mm大小写)
	 * @return String 指定格式的字符串型日期
	 * @Title: turnJavaUtilDateToStrDate
	 * @Description: 将java.util.Date型日期转化指定格式的字符串型日期
	 * @Author: FuYung
	 * @Since: 2014年1月6日上午11:33:53
	 */
	public static String turnJavaUtilDateToStrDate(Date javaUtilDate,
	                                               String dateFormatType) {
		String strDate = "";
		if (javaUtilDate != null) {
			SimpleDateFormat sdf = new SimpleDateFormat(dateFormatType);
			strDate = sdf.format(javaUtilDate);
		}
		return strDate;
	}

	/**
	 * 辅助方法，用于比较两个字符串格式的日期的前后顺序
	 *
	 * @param dateStr1 日期1的字符串
	 * @param dateStr2 日期2的字符串
	 * @param fmt      日期1和日期2的各种，默认为"yyyy-MM-dd hh:mm"
	 * @return 1代表日期1在日期2之前，-1代表日期1在日期2之后，0代表日期1和日期2相等
	 */
	public static int compareDate(String dateStr1, String dateStr2, String fmt) {
		if (null == fmt || "".equals(fmt.trim())) {
			fmt = "yyyy-MM-dd hh:mm:ss";
		}
		// 先将日期字符串转换成日期格式，
		SimpleDateFormat formatDate = new SimpleDateFormat(fmt);
		try {
			Date date1 = formatDate.parse(dateStr1);
			Date date2 = formatDate.parse(dateStr2);
			return compareDate(date1, date2);
		} catch (ParseException e) {
			logger.error(e.getMessage());
			return 0;
		}
	}

	/**
	 * 比较两个日期的前后顺序
	 *
	 * @param date1 日期1
	 * @param date2 日期2
	 * @return 1代表日期1在日期2之后，-1代表日期1在日期2之前，0代表日期1和日期2相等
	 */
	public static int compareDate(Date date1, Date date2) {
		try {
			if (date1.getTime() > date2.getTime()) {
				return 1;
			} else if (date1.getTime() < date2.getTime()) {
				return -1;
			} else {
				return 0;
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return 0;
	}

	/**
	 * @param createTime 单位为秒
	 * @return 返回java.util.Date（Sat Jan 04 14:50:17 CST 2014）
	 * @Title: formatTimeReturnDate
	 * @Description: 将微信中时间转换成标准格式的时间（yyyy-MM-dd HH:mm:ss）
	 * @Author: FuYung
	 * @Since: 2014年1月9日上午10:23:29
	 */
	public static Date formatTimeReturnDate(String createTime) {
		// 将微信传入的CreateTime转换成long类型，再乘以1000
		long msgCreateTime = Long.parseLong(createTime) * 1000L;
		return new Date(msgCreateTime);
	}

	public static Date turnDateFormatType(Date date, String formatType) {
		String str = turnJavaUtilDateToStrDate(date, formatType);
		return turnStrDateToJavaUtilDate(str, formatType);
	}

	/**
	 * 获得间隔日期（主要是间隔N周、间隔N天）
	 *
	 * @param specifiedStrDate 指定日期
	 * @param dateForamtType   指定日期格式
	 * @param intervalNum      间隔数（周或者天）
	 * @param calenderParam    指定修改日期格式的属性
	 *                         Calendar.WEEK_OF_MONTH（周）或者Calendar.DAY_OF_MONTH（天）
	 * @return
	 */
	public static String getIntervalStrDate(String specifiedStrDate,
	                                        String dateForamtType, int intervalNum, int
			                                        calenderParam) {
		if (specifiedStrDate == null) {
			return null;
		}
		if (specifiedStrDate.trim().equals("")) {
			return null;
		}

		DateFormat df = new SimpleDateFormat(dateForamtType);

		Calendar cal = Calendar.getInstance();
		cal.setTime(DateUtil.turnStrDateToJavaUtilDate(specifiedStrDate,
				dateForamtType));
		cal.add(calenderParam, intervalNum);
		return df.format(cal.getTime());
	}

	/**
	 * 指定日期与当前日期比较是否在指定intervalNum时间内
	 *
	 * @param dateForamtType 指定日期格式
	 * @param intervalNum    间隔数（周或者天）
	 * @param calenderParam  指定修改日期格式的属性
	 *                       Calendar.WEEK_OF_MONTH（周）或者Calendar.DAY_OF_MONTH（天）
	 */
	public static int JudgeIsWithinIntervalNum(Date date, int intervalNum,
	                                           String dateForamtType, int calenderParam) {

		DateFormat df = new SimpleDateFormat(dateForamtType);
		String specifiedStrDate = df.format(date);
		String intervalStrDate = getIntervalStrDate(specifiedStrDate,
				dateForamtType, intervalNum, calenderParam);
		Date currentDate = new Date();
		String currentDateStr = df.format(currentDate);

		int a = compareDate(intervalStrDate, currentDateStr, dateForamtType);
		return a;
	}

	/**
	 * 取得两个时间段的时间间隔
	 *
	 * @param t1 时间1
	 * @param t2 时间2
	 * @return t2 与t1的间隔天数
	 * @throws ParseException 如果输入的日期格式不是0000-00-00 格式抛出异常
	 * @author color
	 */
	public static int getBetweenDays(String t1, String t2)
			throws ParseException {
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		int betweenDays = 0;
		Date d1 = format.parse(t1);
		Date d2 = format.parse(t2);
		Calendar c1 = Calendar.getInstance();
		Calendar c2 = Calendar.getInstance();
		c1.setTime(d1);
		c2.setTime(d2);
		// 保证第二个时间一定大于第一个时间
		// if(c1.after(c2)) {
		// c1.setTime(d2);
		// c2.setTime(d1);
		// }
		int betweenYears = c2.get(Calendar.YEAR) - c1.get(Calendar.YEAR);
		betweenDays = c2.get(Calendar.DAY_OF_YEAR)
				- c1.get(Calendar.DAY_OF_YEAR);
		for (int i = 0; i < betweenYears; i++) {
			c1.set(Calendar.YEAR, (c1.get(Calendar.YEAR) + 1));
			betweenDays += c1.getMaximum(Calendar.DAY_OF_YEAR);
		}
		return betweenDays;
	}

	public static long getBetweenMinute(String begin, String end)
			throws ParseException {
		int hour = 0;
		int minute = 0;
		long total_minute = 0;
		StringBuffer sb = new StringBuffer();

		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			Date begin_date = df.parse(begin);
			Date end_date = df.parse(end);

			total_minute = (end_date.getTime() - begin_date.getTime())
					/ (1000 * 60);

			hour = (int) total_minute / 60;
			minute = (int) total_minute % 60;

		} catch (ParseException e) {
			System.out.println("传入的时间格式不符合规定");
		}

		sb.append("工作时间为：").append(hour).append("小时").append(minute)
				.append("分钟");

		System.out.println(sb);
		return hour * 60 + minute;
	}

	/**
	 * 将日期类型的对象转换成字符串格式
	 *
	 * @param date 需要转换的日期对象
	 * @param fmt  转换格式，例如"yyyy年MM月dd日 HH时mm分ss秒 E"；默认是"yyyy年MM月dd日"
	 * @return 转换后的字符串格式日期
	 */
	public static String parseDate2String(Date date, String fmt) {
		if (null == fmt || "".equals(fmt.trim())) {
			fmt = "yyyy年MM月dd日";
		}
		DateFormat df = new SimpleDateFormat(fmt);
		return df.format(date);
	}

	/**
	 * 将日期类型的对象转换成字符串格式，月份减一
	 *
	 * @param date 需要转换的日期对象
	 * @param fmt  转换格式，例如"yyyy年MM月dd日 HH时mm分ss秒 E"；默认是"yyyy年MM月dd日"
	 * @return 转换后的字符串格式日期
	 */
	public static String parseDate2String2(Date date, String fmt) {
		if (null == fmt || "".equals(fmt.trim())) {
			fmt = "yyyy年MM月dd日";
		}
		DateFormat df = new SimpleDateFormat(fmt);
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.MONTH, -1);
		return df.format(calendar.getTime());
	}

	/**
	 * 将日期字符串转换成Date类型
	 *
	 * @param dateStr 需要转换的日期字符串
	 * @param fmt     转换格式，例如"yyyy年MM月dd日 HH时mm分ss秒 E"；默认是"yyyy-MM-dd"
	 * @return
	 */
	public static Date parseString2Date(String dateStr, String fmt) {
		if (null == fmt || "".equals(fmt.trim())) {
			fmt = "yyyy-MM-dd";
		}
		SimpleDateFormat df = new SimpleDateFormat(fmt);
		Date date = null;
		try {
			date = df.parse(dateStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}

	/**
	 * 获取上个月
	 *
	 * @param date
	 * @return
	 * @author szy
	 */
	public static Date getLastDate(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.MONTH, -1);
		return cal.getTime();
	}

	/**
	 * 获取当前时间的上个月
	 *
	 * @return
	 * @author szy
	 */
	public static Date getMonthDate() {
		return parseString2Date(DateUtil.parseDate2String(
				DateUtil.getLastDate(new Date()), "yyyy-MM"), "yyyy-MM");
	}

	/**
	 * 功能描述：取得指定月份的第一天
	 *
	 * @param strdate String 字符型日期
	 * @return String yyyy-MM-dd 格式
	 */
	public static String getMonthBegin(String strdate) {
		Date date = parseString2Date(strdate, "yyyy-MM");
		return parseDate2String(date, "yyyy-MM") + "-01";
	}

	/**
	 * 功能描述：取得指定月份的最后一天
	 *
	 * @param strdate String 字符型日期
	 * @return String 日期字符串 yyyy-MM-dd格式
	 */
	public static String getMonthEnd(String strdate) {
		Date date = parseString2Date(getMonthBegin(strdate), "yyyy-MM-dd");
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.MONTH, 1);
		calendar.add(Calendar.DAY_OF_YEAR, -1);
		return parseDate2String(calendar.getTime(), "yyyy-MM-dd");
	}

	/**
	 * 日期加一
	 *
	 * @param strdate
	 * @return
	 */
	public static String parseAdd1Date(String strdate) {
		Date date = parseString2Date(getMonthBegin(strdate), "yyyy-MM-dd");
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.MINUTE, 1); // 日期分钟加1,Calendar.DATE(天),Calendar.HOUR(小时)
		return parseDate2String(calendar.getTime(), "yyyy-MM-dd");
	}

	/**
	 * 日期加法
	 *
	 * @param date 原始日期
	 * @param type 加的类型 Calendar.MONTH Calendar.YEAR
	 * @param num  加的数目
	 * @return
	 */
	public static Date parseAddDate(Date date, int type, int num) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(type, num); // 日期分钟加1,Calendar.DATE(天),Calendar.HOUR(小时)
		return calendar.getTime();
	}

	/**
	 * 是否同月
	 *
	 * @param a
	 * @param b
	 * @return
	 */
	public static boolean isSameMonth(Date a, Date b) {
		Boolean result = false;
		String dateA = turnJavaUtilDateToStrDate(a, "yyyy-MM-dd HH:mm:ss");
		String dateB = turnJavaUtilDateToStrDate(b, "yyyy-MM-dd HH:mm:ss");
		if (dateA.substring(0, 7).equals(dateB.substring(0, 7))) {
			result = true;
		}
		return result;
	}

	public static Date getRandomDateBetween(Date a, Date b) {
		try {
			SimpleDateFormat format = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			if (a.getTime() >= b.getTime()) {
				return null;
			}
			long date = random(a.getTime(), b.getTime());
			Date r = new Date(date);
			int hours = r.getHours();
			if (hours > 21 || hours < 8) {
				return null;
			}
			return new Date(date);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}

	private static long random(long begin, long end) {
		long rtnn = begin + (long) (Math.random() * (end - begin));
		if (rtnn == begin || rtnn == end) {
			return random(begin, end);
		}
		return rtnn;
	}


	/**
	 * String date转为Timestamp 字符串
	 *
	 * @param date String date
	 * @return 字符串
	 */
	public static String turnDateToTimeStamp(String date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			return String.valueOf(sdf.parse(date).getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return "";
	}

	/**
	 * java.util.date转为yyyyMMdd字符串
	 *
	 * @param date
	 * @return
	 */
	public static String turnDateToYMDString(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		return String.valueOf(sdf.format(date));
	}

	/**
	 * java.util.date转为Timestamp 字符串
	 *
	 * @param date String date
	 * @return 字符串
	 */
	public static String turnDateToTimeStamp(Date date) {
		return String.valueOf(date.getTime());
	}

	/**
	 * 计算两个日期之间相差的天数
	 *
	 * @param smdate 较小的时间
	 * @param bdate  较大的时间
	 * @return 相差天数
	 */
	public static int daysBetween(Date smdate, Date bdate) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			smdate = sdf.parse(sdf.format(smdate));
			bdate = sdf.parse(sdf.format(bdate));
			Calendar cal = Calendar.getInstance();
			cal.setTime(smdate);
			long time1 = cal.getTimeInMillis();
			cal.setTime(bdate);
			long time2 = cal.getTimeInMillis();
			long between_days = (time2 - time1) / (1000 * 3600 * 24);

			return Integer.parseInt(String.valueOf(between_days));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return 0;
	}

	/**
	 * 计算与15号的差的天数(车易宝计算方法，由陈总提供)
	 * 15日前借款：用15-借款日=息差的天数
	 * 15号后的借款:借款日-16号=息差的天数
	 * @param bdate  较大的时间
	 * @return 相差天数
	 */
	public static int daysBetween15CYB(Date bdate) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		int interestday = 0;
		try {
			bdate = sdf.parse(sdf.format(bdate));
			Calendar cal = Calendar.getInstance();
			cal.setTime(bdate);
			int day = cal.get(Calendar.DAY_OF_MONTH);
			if(day<=15){
				interestday = 15-day;
			}else if(day>= 16){
				interestday = 16 - day;
			}
			return interestday;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return 0;
	}

	/**
	 * 字符串的日期格式的计算
	 */
	public static int daysBetween(String smdate, String bdate) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		try {
			cal.setTime(sdf.parse(smdate));
			long time1 = cal.getTimeInMillis();
			cal.setTime(sdf.parse(bdate));
			long time2 = cal.getTimeInMillis();
			long between_days = (time2 - time1) / (1000 * 3600 * 24);

			return Integer.parseInt(String.valueOf(between_days));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return 0;
	}


	/**
	 * 得到 data之后的day天
	 *
	 * @param dt
	 * @return
	 */
	public static String getDataAddDays(Date dt, Integer day) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar rightNow = Calendar.getInstance();
		rightNow.setTime(dt);
		rightNow.add(Calendar.DAY_OF_YEAR, day);
		Date dt1 = rightNow.getTime();
		String reStr = sdf.format(dt1);
		return reStr;
	}

	public static Calendar getDateOfLastMonth(Calendar date) {
		Calendar lastDate = (Calendar) date.clone();
		lastDate.add(Calendar.MONTH, -1);
		return lastDate;
	}

	public static Calendar getDateOfNextMonth(Calendar date) {
		Calendar lastDate = (Calendar) date.clone();
		lastDate.add(Calendar.MONTH, 1);
		return lastDate;
	}

	public static Calendar getDateOfNextNMonth(Calendar date,int n) {
		Calendar lastDate = (Calendar) date.clone();
		lastDate.add(Calendar.MONTH, n);
		return lastDate;
	}
	/**
	 * 设置日期
	 *
	 * @param dt
	 * @param day
	 * @return
	 */
	public static String setDateDay(Date dt, Integer day, Integer hh, Integer mm, Integer ss) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar ca = Calendar.getInstance();
		ca.setTime(dt);
		int year = ca.get(Calendar.YEAR);
		int month = ca.get(Calendar.MONTH);
		ca.set(year, month, day, hh, mm, ss);
		Date dt1 = ca.getTime();
		String reStr = sdf.format(dt1);
		return reStr;
	}

	public static void main(String[] args) throws ParseException {

		System.out.println(DateUtil.getCurrentStrDateBySpecifiedFormatType
				("yyyy年MM月dd日HH:mm:ss"));
//       String dateStr = DateUtil.setDateDay(new Date(),6);
//        System.out.println(dateStr);


//        System.out.println(turnJavaUtilDateToStrDate(
//                parseAddDate(
//                        turnStrDateToJavaUtilDate("2014-02-28", "yyyy-MM-dd"),
//                        Calendar.DATE, 2), "yyyy-MM-dd"));
//        System.out.println(turnJavaUtilDateToStrDate(new Date(), "yyyyMMdd"));
//        System.out.println(getBetweenMinute("2015-09-09 10:08:00",
//                "2015-09-09 10:09:01"));
//        System.out.println(turnJavaUtilDateToStrDate(
//                parseAddDate(turnDateFormatType(new Date(), "yyyyMMdd"),
//                        Calendar.DATE, -1), "yyyyMMdd"));
//        System.out.println(turnJavaUtilDateToStrDate(new Date(), "yyyyMMdd"));
		// System.out.println(turnJavaUtilDateToStrDate(parseAddDate(turnStrDateToJavaUtilDate
		// ("2014-02-28",
		// "yyyy-MM-dd"), Calendar.DATE, 2),"yyyy-MM-dd"));
		// System.out.println(turnJavaUtilDateToStrDate(new Date(),
		// "yyyyMMdd"));
		// System.out.println(getBetweenDays("2014-09-09","2015-09-09"));
		// System.out.println(turnJavaUtilDateToStrDate(parseAddDate(turnDateFormatType(new
		// Date(), "yyyyMMdd"), Calendar.DATE, -1),"yyyyMMdd"));
		// System.out.println(turnJavaUtilDateToStrDate(new Date(),"yyyyMMdd"));
		// System.out.println(turnJavaUtilDateToStrDate(parseAddDate(new
		// Date(),Calendar.DATE,1),"yyyyMMdd"));

//        System.out.println(parseDate2String(DateUtil.parseAddDate(
//                DateUtil.turnStrDateToJavaUtilDate("2015-3-18", "yyyy-MM-dd"),
//                Calendar.DATE, 1), "yyyyMMdd"));
//        System.out.println(DateUtil.turnJavaUtilDateToStrDate(DateUtil
//                .parseAddDate(DateUtil.turnStrDateToJavaUtilDate("2015-3-18",
//                        "yyyy-MM-dd"), Calendar.DATE, 1), "yyyyMMdd"));
//        System.out.println(DateUtil.parseDate2String(new Date(),
//                "yyyyMMdd HH:mm:ss"));

	}


	public void serch() {
		String s = "the instruction set of the Java virtual machine distinguishes its operand types using instructions intended to operate on values of specific types";
		String[] words = s.split(" ");
		Map<String, Integer> m = new HashMap<>();
		for (String word : words) {
			m.put(word, 0);// 每个单词作为key
		}

		Set<String> set = m.keySet();
		for (String word : words) {// 遍历数组中的每个单词
			for (String k : set) {// 遍历map中的每个单词
				if (word.equals(k)) { // 循环嵌套判断数组中的单词与map中的单词是否相等
					int i = m.get(k);// 遍历出单词的个数，然后累加
					i++;
					m.put(word, i);
				}
			}
		}
		System.out.println(m);
	}


}
