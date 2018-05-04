package com.luotf.util;

import com.luotf.model.Visit;

/** 
 * 根据 user agent string 判断用户的平台、浏览器 
 * 参考资料 
 * ************************************************************************************************************************************************** 
 *  
 * 台式机 
 *  
 * Linux Ubuntu 
 * Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.2.2pre) Gecko/20100225 Ubuntu/9.10 (karmic) Namoroka/3.6.2pre 
 * -------------------------------------------------------------------------------------------------------------------------------------------------- 
 * Linux Mandriva 2008.1 
 * Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.0.1) Gecko/2008072403 Mandriva/3.0.1-1mdv2008.1 (2008.1) Firefox/3.0.1 
 * -------------------------------------------------------------------------------------------------------------------------------------------------- 
 * Linux suSE 10.1 
 * Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.0.3) Gecko/20060425 SUSE/1.5.0.3-7 Firefox/1.5.0.31 
 * -------------------------------------------------------------------------------------------------------------------------------------------------- 
 * Windows XP SP3 
 * Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1) Gecko/20090624 Firefox/3.5 (.NET CLR 3.5.30729) 
 * -------------------------------------------------------------------------------------------------------------------------------------------------- 
 * Windows Vista 
 * Mozilla/5.0 (Windows; U; Windows NT 6.1; nl; rv:1.9.2.13) Gecko/20101203 Firefox/3.6.13 
 * Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US; rv:1.9.2.6) Gecko/20100625 Firefox/3.6.6 (.NET CLR 3.5.30729) 
 * -------------------------------------------------------------------------------------------------------------------------------------------------- 
 * windows 2000 
 * Mozilla/5.0 (Windows; U; Windows NT 5.0; en-GB; rv:1.8.1b2) Gecko/20060821 Firefox/2.0b2 
 * -------------------------------------------------------------------------------------------------------------------------------------------------- 
 * Windows 7 
 * Mozilla/5.0 (Windows NT 6.1; WOW64; rv:14.0) Gecko/20100101 Firefox/14.0.1 
 * -------------------------------------------------------------------------------------------------------------------------------------------------- 
 * Windows Server 2008 
 * Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.1.5) Gecko/20091102 Firefox/3.5.5 (.NET CLR 3.5.30729) 
 * -------------------------------------------------------------------------------------------------------------------------------------------------- 
 * iMac OSX 10.7.4 
 * Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:13.0) Gecko/20100101 Firefox/13.0.1 
 * -------------------------------------------------------------------------------------------------------------------------------------------------- 
 * Mac OS X 
 * Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US; rv:1.9.2.9) Gecko/20100824 Firefox/3.6.9 
 * -------------------------------------------------------------------------------------------------------------------------------------------------- 
 *  
 * 手持设备 
 *  
 * iPad 
 * Mozilla/5.0 (iPad; U; CPU OS 3_2 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Version/4.0.4 Mobile/7B334b Safari/531.21.10 
 * -------------------------------------------------------------------------------------------------------------------------------------------------- 
 * iPad 2 
 * Mozilla/5.0 (iPad; CPU OS 5_1 like Mac OS X; en-us) AppleWebKit/534.46 (KHTML, like Gecko) Version/5.1 Mobile/9B176 Safari/7534.48.3 
 * -------------------------------------------------------------------------------------------------------------------------------------------------- 
 * iPhone 4 
 * Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_0 like Mac OS X; en-us) AppleWebKit/532.9 (KHTML, like Gecko) Version/4.0.5 Mobile/8A293 Safari/6531.22.7 
 * -------------------------------------------------------------------------------------------------------------------------------------------------- 
 * iPhone 5 
 * Mozilla/5.0 (iPhone; CPU iPhone OS 5_0 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko) Version/5.1 Mobile/9A334 Safari/7534.48.3 
 * -------------------------------------------------------------------------------------------------------------------------------------------------- 
 * Android 
 * Mozilla/5.0 (Linux; U; Android 2.2; en-us; Nexus One Build/FRF91) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.1 
 * ************************************************************************************************************************************************** 
 * @author Defonds 
 */  
public class UserAgentUtil {  
  
     
    public static Visit getUserAgent(String userAgent) {  
       
        if (userAgent.contains("Windows")) {//主流应用靠前  
        	if (userAgent.contains("Windows NT 10.0")) {//Windows 10
                return judgeBrowser(userAgent, "Windows 10");//判断浏览器  
            } else if (userAgent.contains("Windows NT 6.2")) {//Windows 8  
                return judgeBrowser(userAgent, "Windows 8");//判断浏览器  
            } else if (userAgent.contains("Windows NT 6.1")) {//Windows 7  
                return judgeBrowser(userAgent, "Windows 7" );  
            } else if (userAgent.contains("Windows NT 6.0")) {//Windows Vista  
                return judgeBrowser(userAgent, "Windows Vista");  
            } else if (userAgent.contains("Windows NT 5.2")) {//Windows XP x64 Edition  
                return judgeBrowser(userAgent, "Windows XP");  
            } else if (userAgent.contains("Windows NT 5.1")) {//Windows XP  
                return judgeBrowser(userAgent, "Windows XP");  
            } else if (userAgent.contains("Windows NT 5.01")) {//Windows 2000, Service Pack 1 (SP1)  
                return judgeBrowser(userAgent, "Windows 2000");  
            } else if (userAgent.contains("Windows NT 5.0")) {//Windows 2000  
                return judgeBrowser(userAgent, "Windows 2000");  
            } else if (userAgent.contains("Windows NT 4.0")) {//Microsoft Windows NT 4.0  
                return judgeBrowser(userAgent, "Windows NT 4.0");  
            } else if (userAgent.contains("Windows 98; Win 9x 4.90")) {//Windows Millennium Edition (Windows Me)  
                return judgeBrowser(userAgent, "Windows ME");  
            } else if (userAgent.contains("Windows 98")) {//Windows 98  
                return judgeBrowser(userAgent, "Windows 98");  
            } else if (userAgent.contains("Windows 95")) {//Windows 95  
                return judgeBrowser(userAgent, "Windows 95");  
            } else if (userAgent.contains("Windows CE")) {//Windows CE  
                return judgeBrowser(userAgent, "Windows CE");  
            }   
        } else if (userAgent.contains("Mac OS X")) {  
            if(userAgent.contains("iPhone")){
            	return judgeBrowser(userAgent, "iPhone");
              }
            else if (userAgent.contains("iPad")) {  
                return judgeBrowser(userAgent, "iPad");//判断浏览器  
            }
        }else if(userAgent.contains("Android")){
        	return judgeBrowser(userAgent, "Android");//判断浏览器  
        }
        return judgeBrowser(userAgent, "其他"); 
    }  
      
    private static Visit judgeBrowser(String userAgent, String platformType) {  
        if (userAgent.contains("Chrome")) {  
            return new Visit("Chrome", platformType);  
        } else if (userAgent.contains("Firefox")) {  
            return new Visit("Firefox",platformType);  
        }else if (userAgent.contains("QQBrowser")) {//Internet Explorer 6  
            return new Visit("QQ Browser", platformType);
        }else if (userAgent.contains("360")) {//Internet Explorer 6  
            return new Visit("360", platformType);
        } else if (userAgent.contains("MSIE")) {
            if (userAgent.contains("MSIE 10.0")) {//Internet Explorer 10  
                return new Visit("IE 10", platformType);  
            } else if (userAgent.contains("MSIE 9.0")) {//Internet Explorer 9  
                return new Visit("IE 9", platformType);  
            } else if (userAgent.contains("MSIE 8.0")) {//Internet Explorer 8  
                return new Visit("IE 8", platformType);  
            } else if (userAgent.contains("MSIE 7.0")) {//Internet Explorer 7  
                return new Visit("IE 7", platformType);  
            } else if (userAgent.contains("MSIE 6.0")) {//Internet Explorer 6  
                return new Visit("IE 6", platformType);
            }  
        } else {//暂时支持以上三个主流.其它浏览器,待续...  
            return new Visit("其他", platformType);  
        }
		return new Visit("其他", platformType);  
    }  
}  