package com.utonw.utonbase.support;


import com.utonw.utonbase.core.util.DateUtil;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 时间格式化扩展
 * 
 * @author
 * @since 2017年6月30日 下午7:40:00
 */
@SuppressWarnings("serial")
public class DateFormat extends SimpleDateFormat {

	public Date parse(String source) throws ParseException {
		return DateUtil.stringToDate(source);
	}
}
