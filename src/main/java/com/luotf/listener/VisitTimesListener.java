package com.luotf.listener;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Date;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.luotf.model.Visit;
import com.luotf.service.VisitService;
import com.luotf.util.AddressUtil;
import com.luotf.util.UserAgentUtil;

public class VisitTimesListener implements ServletRequestListener {
	private Log log = LogFactory.getLog(getClass());
	private ApplicationContext applicationContext = null;

	@Override
	public void requestDestroyed(ServletRequestEvent arg0) {

	}

	@Override
	public void requestInitialized(ServletRequestEvent arg0) {
		HttpServletRequest request = (HttpServletRequest) arg0
				.getServletRequest();
		HttpSession session = request.getSession();
		ServletContext servletContext = session.getServletContext();
		Visit visit = null;
		VisitService visitServiceImpl = null;
		applicationContext = WebApplicationContextUtils
				.getWebApplicationContext(servletContext);
		try {
			visitServiceImpl = (VisitService) applicationContext
					.getBean("visitServiceImpl");
			if (session.isNew()) {
				log.debug("-------applicationContext--------");
				log.debug("begin- " + applicationContext + " -end");
				log.debug("-----begin-----");
				log.debug(applicationContext.getBean("visitServiceImpl"));
				// 先判断当前ip当天是否已经访问过,如果没有则保存当前访问记录
				visit = new Visit();
				visit.setIp(getIp(request));
				visit.setTime(new Date());
				String userAgent = request.getHeader("user-agent");
				visit.setUserAgent(userAgent);
				synchronized (this) {
					if (visitServiceImpl.findVisitTimes(visit) == 0) {
						visit.setPlatformType(UserAgentUtil.getUserAgent(
								userAgent).getPlatformType());
						visit.setBrowserType(UserAgentUtil.getUserAgent(
								userAgent).getBrowserType());
						visit.setUrl(request.getRequestURL().toString());
						visit.setCity(new AddressUtil().getAddresses("ip="
								+ visit.getIp(), "utf-8"));
						visitServiceImpl.insert(visit);
					}
				  }
				}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	// 获取IP
	public String getIp(HttpServletRequest httpRequest) {
		String ipAddress = httpRequest.getHeader("x-forwarded-for");
		if (ipAddress == null || ipAddress.length() == 0
				|| "unknown".equalsIgnoreCase(ipAddress)) {
			ipAddress = httpRequest.getHeader("Proxy-Client-IP");
		}
		if (ipAddress == null || ipAddress.length() == 0
				|| "unknown".equalsIgnoreCase(ipAddress)) {
			ipAddress = httpRequest.getHeader("WL-Proxy-Client-IP");
		}
		if(null == ipAddress || 0 == ipAddress.length() || "unknown".equalsIgnoreCase(ipAddress)) {
			ipAddress = httpRequest.getHeader("X-Real-IP");
	    }
		if (ipAddress == null || ipAddress.length() == 0
				|| "unknown".equalsIgnoreCase(ipAddress)) {
			ipAddress = httpRequest.getRemoteAddr();
			if (ipAddress.equals("127.0.0.1")
					|| ipAddress.equals("0:0:0:0:0:0:0:1")) {
				// 根据网卡取本机配置的IP
				InetAddress inet = null;
				try {
					inet = InetAddress.getLocalHost();
				} catch (UnknownHostException e) {
					e.printStackTrace();
				}
				ipAddress = inet.getHostAddress();
			}
		}
		// 对于通过多个代理的情况，第一个IP为客户端真实IP,多个IP按照','分割
		if (ipAddress != null && ipAddress.length() > 15) { // "***.***.***.***".length()
															// = 15
			if (ipAddress.indexOf(",") > 0) {
				ipAddress = ipAddress.substring(0, ipAddress.indexOf(","));
			}
		}
		return ipAddress;
	}

	/*public String getLocalIp() throws UnknownHostException {
		InetAddress ia = InetAddress.getLocalHost();
		return ia.getHostAddress();
	}*/
}