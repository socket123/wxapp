package com.chusu.platform.util.sms.util;

import java.util.*;

public class StringUtil {


        // 截取字符串
    public  static  String[]  split(String str , String splict){

        String[] aa = str.split(splict);

        return aa;
    }



    /**
     * 判断字符串是否为空
     *
     * @param strVal string
     * @return true 为空 false 不为空
     */
    public static boolean isEmpty(String strVal) {
        return strVal == null || trim(strVal).equals("");
    }

    public static String ListToString(List<String> list) {

        String str = "";
        for (String string : list) {
            str += "\"" + string + "\",";
        }
        str = str.substring(0, str.length() - 1);

        return str;
    }

    public static String trimBracket(String strVal) {
        String strTemp = strVal.substring(0, strVal.length() - 1);
        return strTemp.substring(1, strTemp.length());
    }

    /**
     * 去除左右边全、半角空格
     *
     * @param strValue 字符串
     * @return String 去除左右边全、半角空格字符串
     */
    public static String trim(String strValue) {

        if ((strValue != null) && (!strValue.equals(""))) {
            StringBuffer sb = new StringBuffer();
            StringBuffer sb1 = new StringBuffer();
            String strRet = "";
            sb.append(rTrim(strValue));
            // 反转后去掉右空格
            strRet = rTrim(sb.reverse().toString());
            sb1.append(strRet);
            strRet = sb1.reverse().toString();
            return strRet.trim();
        } else {
            return "";
        }
    }

    /**
     * 去除右边全半角空格
     *
     * @param strValue String
     * @return String String
     */
    private static String rTrim(String strValue) {

        if ((strValue != null) && (!strValue.equals(""))) {
            char[] cValue = strValue.toCharArray();
            int nCur = 0;

            for (int i = cValue.length - 1; i > -1; i--) {
                if ((cValue[i] != '\u0020') && (cValue[i] != '\u3000')) {
                    nCur = i;
                    break;
                }
            }

            if ((nCur == 0) && ((cValue[0] == '\u0020') || (cValue[0] == '\u3000'))) {
                return "";
            }

            return strValue.substring(0, nCur + 1);
        } else {
            return "";
        }
    }

    /**
     * תΪString
     *
     * @param str object
     * @return ַ
     */
    public static String toStr(Object str) {
        if (null == str) {
            return null;
        }

        return String.valueOf(str);
    }

    /**
     * 可以设置默认值
     *
     * @param str
     * @param defaultValue
     * @return
     */
    public static String toStr(Object str, String defaultValue) {
        if (null == str) {
            return defaultValue;
        }

        return String.valueOf(str);
    }

    /**
     * ַ תΪint, ת ʧ ܣ 򷵻 Ĭ ֵ
     *
     * @param str          Ҫת ַ
     * @param defaultValue Ĭ ֵ
     * @return
     */
    public static int toInt(Object str, int defaultValue) {
        int value = defaultValue;

        if (null == str) {
            return value;
        }

        try {
            value = Integer.valueOf(String.valueOf(str));
        } catch (NumberFormatException e) {

        }
        return value;

    }

    public static int toInt(Object str) {
        return toInt(str, 0);
    }

    /**
     * 统计元素出现的次数
     *
     * @param templist
     * @returnHashMap<Object, Integer>
     */
    public static Map<String, Integer> frequencyObject(List<String> templist) {
        Map<String, Integer> remap = new HashMap<String, Integer>();
        Set<String> uniqueSet = new HashSet<String>(templist);
        for (Object temp : uniqueSet) {
            remap.put(String.valueOf(temp), Collections.frequency(templist, temp));
        }
        return remap;
    }

    /**
     * 将逗号的字符串组装为map类型的list
     *
     * @param ids
     * @return
     */
    public static List<Map<String, Object>> setHandle(String ids) {
        // 组装IN条件
        List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();

        boolean have = false;

        for (String id : ids.split(",")) {
            if (StringUtil.isEmpty(id)) {
                continue;
            }
            Map<String, Object> itemMap = new HashMap<String, Object>();
            itemMap.put("brandId", id.trim());
            resultList.add(itemMap);
            have = true;
        }

        if (have) {
            return resultList;
        }

        return null;
    }


}
