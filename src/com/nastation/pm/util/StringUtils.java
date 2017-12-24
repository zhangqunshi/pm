package com.nastation.pm.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 字串处理类
 *
 * @author Kris zhang.kris@gmail.com
 * @version 2008-12-17
 */
public class StringUtils {

    public static final String DEFAULT_DATE_PATTERN = "yyyy-MM-dd HH:mm:ss";

    /**
     * 采用参数指定的pattern, 把日期转成字符串
     *
     * @param date
     * @param pattern
     * @return
     */
    public static String toString(Date date, String pattern) {
        SimpleDateFormat sdf = new SimpleDateFormat(pattern);
        return sdf.format(new java.util.Date());
    }

    /**
     * 采用默认的pattern, 把日期转成字符串
     *
     * @see StringUtils#DEFAULT_DATE_PATTERN
     * @param date
     * @return
     */
    public static String toString(Date date) {
        return toString(date, DEFAULT_DATE_PATTERN);
    }

    /**
     * 采用参数指定的pattern, 把字符串转成日期
     *
     * @param date
     * @param pattern
     * @return
     * @throws ParseException
     */
    public static Date toDate(String date, String pattern) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat(pattern);
        return sdf.parse(date);
    }

    /**
     * 采用默认的pattern, 把字符串转成日期
     *
     * @see StringUtils#DEFAULT_DATE_PATTERN
     * @param date
     * @return
     * @throws ParseException
     */
    public static Date toDate(String date) throws ParseException {
        return toDate(date, DEFAULT_DATE_PATTERN);
    }

    /**
     * 判断是否为空
     *
     * <pre>
     * Checks if a String is empty (&quot;&quot;) or null.
     *
     * StringUtils.isEmpty(null)      = true
     * StringUtils.isEmpty(&quot;&quot;)        = true
     * StringUtils.isEmpty(&quot; &quot;)       = false
     * StringUtils.isEmpty(&quot;bob&quot;)     = false
     * StringUtils.isEmpty(&quot;  bob  &quot;) = false
     * </pre>
     *
     * @param str
     * @return
     */
    public static boolean isEmpty(String str) {
        if (str == null) {
            return true;
        }
        if (str.length() <= 0) {
            return true;
        }
        return false;
    }

    /**
     * check if the string is not empty.
     *
     * @param str
     * @return
     * @see #isEmpty(String)
     */
    public static boolean isNotEmpty(String str) {
        return !isEmpty(str);
    }

    /**
     * 比较两个字符串是否相等.
     *
     * <pre>
     * Compares two Strings, returning true if they are equal.
     * nulls are handled without exceptions. Two null references are considered to be equal. The comparison is case sensitive.
     *
     * StringUtils.equals(null, null)   = false
     * StringUtils.equals(null, &quot;abc&quot;)  = false
     * StringUtils.equals(&quot;abc&quot;, null)  = false
     * StringUtils.equals(&quot;abc&quot;, &quot;abc&quot;) = true
     * StringUtils.equals(&quot;abc&quot;, &quot;ABC&quot;) = false
     * StringUtils.equals(&quot;abc&quot;, &quot; abc &quot;) = false
     * </pre>
     *
     * @param str1
     * @param str2
     * @return true if the Strings are equal, case sensitive
     */
    public static boolean equals(String str1, String str2) {
        if (str1 == null || str2 == null) {
            return false;
        }
        if (!str1.equals(str2)) {
            return false;
        }
        return true;
    }

    /**
     * 判断一个字符串的长度是否大于指定值
     *
     * <pre>
     * lengthGreaterThan(null, 3) == false
     * lengthGreaterThan(&quot;kris&quot;, -1) == false
     * lengthGreaterThan(&quot;kris&quot;, 3) == true
     * lengthGreaterThan(&quot;kris&quot;, 5) == false
     * lengthGreaterThan(&quot; &quot;, 0) == true
     * lengthGreaterThan(&quot;&quot;, 0) == false
     *
     *
     * </pre>
     *
     * @param str
     * @param size
     * @return
     */
    public static boolean lengthGreaterThan(String str, int size) {
        if (str == null) {
            return false;
        }
        if (size < 0) {
            return false;
        }
        if (str.length() > size) {
            return true;
        }
        return false;
    }

    /**
     * 是否为<b>合法</b>的Email
     *
     * @return
     */
    public static boolean isValidateEmail(String email) {
        if (email == null) {
            return false;
        }
        Pattern p = Pattern.compile("\\w+(\\.\\w+)*@\\w+(\\.\\w+)+");
        Matcher m = p.matcher(email);
        return m.matches();
    }

    /**
     * 是否为<b>不合法</b>的Email
     *
     * @return
     */
    public static boolean isNotValidateEmail(String email) {
        return !isValidateEmail(email);
    }

    /**
     * 判断是否为空
     *
     * <pre>
     * Checks if a String is empty (&quot;&quot;) or null.
     * 与isEmpty()方法的不同在于：
     * StringUtils.isEmpty(&quot; &quot;)       = false
     *
     * StringUtils.isBlank(&quot; &quot;)       = true
     * </pre>
     *
     * @param str
     * @return
     */
    public static boolean isBlank(String str) {
        if (str == null) {
            return true;
        }
        if (str.trim().length() <= 0) {
            return true;
        }
        return false;
    }

    /**
     * @see #isBlank(String)
     * @param str
     * @return
     */
    public static boolean isNotBlank(String str) {
        return !isBlank(str);
    }

    /**
     * 移调日期中的时间
     * <p>
     * 例如：removeTime(2008-12-25 11:28:00.0) 变成 2008-12-25
     */
    public static String removeTime(String str) {
        if (str == null || str.length() < 10) {
            return str;
        }
        return str.substring(0, 10);
    }

    /**
     * 返回当前日期的字符串形式，格式为默认格式。
     *
     * @return
     * @see StringUtils#DEFAULT_DATE_PATTERN
     */
    public static String getCurrDate() {
        return toString(new Date());
    }

    public static String removeNull(String str) {
        if (str == null) {
            return "";
        }
        return str;
    }

    /**
     * 把回车替换成&lt;br&gt;html标签
     *
     * @return
     */
    public static String replaceNewLineToBr(String str) {
        if (str == null) {
            return str;
        }
        return str.replaceAll("\n", "<br />");
    }

    /**
     * 去掉html的>和<
     *
     * @param str
     * @return
     */
    public static String removeHtmlTag(String str) {
        if (str == null) {
            return str;
        }
        Pattern pattern = Pattern.compile("<");
        Matcher matcher = pattern.matcher(str);
        StringBuffer sbr = new StringBuffer();
        while (matcher.find()) {
            matcher.appendReplacement(sbr, "&lt;");
        }
        matcher.appendTail(sbr);

        StringBuffer sbr2 = new StringBuffer();
        Pattern pattern2 = Pattern.compile(">");
        Matcher matcher2 = pattern2.matcher(sbr);
        while (matcher2.find()) {
            matcher2.appendReplacement(sbr2, "&gt;");
        }
        matcher2.appendTail(sbr2);
        return sbr2.toString();
    }

    /**
     * 字符转解析成日期类型
     *
     */
    public static java.util.Date parseDate(String time) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-d");

        Date dt = null;
        try {
            dt = format.parse(time);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        // format.format(dt);

        return dt;
    }

    public static void main(String[] args) {

        // replaceNewLineToBr("hello\\\r\\\n\nkris\r\n"));
    }

}
