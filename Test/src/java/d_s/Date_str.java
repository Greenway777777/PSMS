/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package d_s;

import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class Date_str {

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
  
   SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
   Date date = null;
   try {
    date = format.parse(str);
   } catch (ParseException e) {
    e.printStackTrace();
   }
   return date;
}

}
