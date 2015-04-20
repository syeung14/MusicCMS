package org.gwu.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtils {

	private static final int MILLISECOND_RATE = 1000;
	private static final SimpleDateFormat sdfZh = new SimpleDateFormat("yyyy-MM-dd");
	private static final SimpleDateFormat sdfEn = new SimpleDateFormat("MM-dd-yyyy");

	public static String format(Date date) {
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return format.format(date);
	}

	public static String seqformat(Date date) {
		DateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		return format.format(date);
	}

	public static String shortFormat(Date date) {
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return format.format(date);
	}

	public static String dateformat(Date date) {
		DateFormat format = new SimpleDateFormat("yyyyMMdd");
		return format.format(date);
	}

	public static String getCurrentYYMM() {
		Date date = new Date();
		DateFormat format = new SimpleDateFormat("yyyyMMdd");
		return format.format(date).substring(0, 6);
	}

	private static void clearMillisecond(Calendar calendar) {
		long time = calendar.getTimeInMillis() / MILLISECOND_RATE;
		calendar.setTimeInMillis(time * MILLISECOND_RATE);
	}

	public static Calendar getNewCalendar(int year, int month, int day) {
		Calendar calendar = Calendar.getInstance();
		calendar.set(year, month - 1, day);
		return calendar;
	}

	public static Calendar getFirstDayOfMonth(Calendar date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date.getTime());
		calendar.set(Calendar.DATE, 1);
		return calendar;
	}

	public static Date format2Date(String str) {
		try {
			return sdfZh.parse(str);
		} catch (ParseException e) {
			return new Date();
		}
	}

	public static Long getBeforMonthStartDate(Long time, Integer beforMonth) {
		Date date = new Date(time);
		date.setMonth(date.getMonth() - beforMonth);
		date.setHours(0);
		date.setMinutes(0);
		date.setSeconds(0);
		return date.getTime();
	}

	public static Long getBeforTodayStartDate(Integer beforMonth) {
		return getBeforMonthStartDate(System.currentTimeMillis(), beforMonth);
	}

	public static Long getTodayStartDate() {
		return getStartDate(System.currentTimeMillis());
	}

	public static Long getTodayEndDate() {
		return getEndDate(System.currentTimeMillis());
	}

	public static Long getStartDate(Long date) {
		if (date == null || date == 0)
			return getTodayStartDate();
		Date d = new Date(date);
		d.setHours(0);
		d.setMinutes(0);
		d.setSeconds(0);
		return d.getTime();
	}

	public static Long getEndDate(Long date) {
		if (date == null || date == 0)
			return getTodayEndDate();
		Date d = new Date(date);
		d.setHours(23);
		d.setMinutes(59);
		d.setSeconds(59);
		return d.getTime();
	}

	public static String zh2EnDate(String zhDate) {
		if (zhDate == null)
			return null;
		try {
			Date date = sdfZh.parse(zhDate);
			return sdfEn.format(date);
		} catch (ParseException e) {
			return sdfEn.format(format2Date(zhDate));
		}
	}

	public static String en2ZHDate(String enDate) {
		if (enDate == null)
			return null;
		try {
			Date date = sdfEn.parse(enDate);
			return sdfZh.format(date);
		} catch (ParseException e) {
			return sdfZh.format(format2Date(enDate));
		}
	}

	public static String long2EnDate(Long number) {
		return sdfEn.format(new Date(number));
	}
}
