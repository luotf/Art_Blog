package com.luotf.util;

import com.luotf.model.Blog;

public class subString {
	
	/**
	 * 返回富文本中的第一个图片路径作为 博客封面
	 * @param content
	 * @return
	 */
	public static String subImages(String content) {
		
		String str = content;
		String strStart = "src=";
		//String strEnd = "\">";
		/* 找出指定的2个字符在 该字符串里面的 位置 */
		int strStartIndex = str.indexOf(strStart);
		int strEndIndex = content.length();
		String s="";
		String[] result=new String[]{"",""};
		/* 开始截取 */
		/*System.out.println("strStartIndex:"+strStartIndex);
		System.out.println("strEndIndex:"+strEndIndex);*/
		if(strStartIndex>0){
			s = str.substring(strStartIndex, strEndIndex).substring(
					strStart.length());
			result = s.split("\"");
		}
		return result[1];
	}
	
	/**
	 * 返回分割后的关键字
	 * @param keyword
	 * @return
	 */
	public static String subKeyword(String keyword) {
		String str = keyword.replace("；", ";");
		return str;
	}
}
