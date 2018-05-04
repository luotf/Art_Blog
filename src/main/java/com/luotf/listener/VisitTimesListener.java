package com.luotf.listener;

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
			System.out.println("getCreationTime:"+session.getCreationTime());
			System.out.println("getId:"+session.getId());
			System.out.println("isNew:"+session.isNew());
			if (session.isNew()) {
				log.debug("-------applicationContext--------");
				log.debug("begin- " + applicationContext + " -end");
				log.debug("-----begin-----");
				log.debug(applicationContext.getBean("visitServiceImpl"));
				// 先判断当前ip当天是否已经访问过,如果没有则保存当前访问记录
				visit = new Visit();
				visit.setIp(request.getRemoteAddr());
				visit.setTime(new Date());
				if (visitServiceImpl.findVisitTimes(visit) == 0) {
					visit.setUrl(request.getRequestURL().toString());
					visitServiceImpl.insert(visit);
				}
			}
			// 显示今天的访问次数
			/*visit = null;
			visit= new Visit();
			visit.setTime(new Date());
			Long visitTimes = visitServiceImpl.findVisitTimes(visit);
			session.setAttribute("visitTimes", visitTimes);
			System.out.println("今天的访问次数:"+visitTimes);*/
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
