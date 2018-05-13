package com.luotf.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.luotf.model.BlackIp;
import com.luotf.service.BlackIpService;
import com.luotf.util.UserIpUtil;

public class IpFilter implements Filter {
	private ApplicationContext applicationContext = null;
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		// TODO Auto-generated method stub
		 HttpServletRequest request = (HttpServletRequest) arg0;
		 HttpServletResponse response = (HttpServletResponse) arg1;
		 //获取到用户的IP
		 String ip=UserIpUtil.getIp(request);
		 HttpSession session = request.getSession();
		 ServletContext servletContext = session.getServletContext();
			BlackIp blackIp = null;
			BlackIpService blackIpServiceImpl = null;
			applicationContext = WebApplicationContextUtils
					.getWebApplicationContext(servletContext);
			blackIpServiceImpl = (BlackIpService) applicationContext
						.getBean("blackIpServiceImpl");
			blackIp=blackIpServiceImpl.selectBlackIpByIp(ip);
			if(blackIp==null){
				arg2.doFilter(request, response);
	            return;
			}else{
				request.getRequestDispatcher("/error/error.jsp").forward(request, response);
			}
	}
	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
