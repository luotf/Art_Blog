package com.luotf.util;

public class BlogIdSafeUtil {
	
	public static Integer BlogIdToSafe(Integer id){
		int bId=0;
		for(int i=1;i<=id;i++){
			if((Integer.parseInt(Integer.toOctalString(i))*i)==id){
				bId=i;
				break;
			}
		}
		return bId;
	}
}
