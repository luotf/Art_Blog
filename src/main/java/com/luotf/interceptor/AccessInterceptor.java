package com.luotf.interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.luotf.annotation.AccessLimit;
import com.luotf.model.RequestIp;
import com.luotf.util.UserIpUtil;

public class AccessInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		if (handler instanceof HandlerMethod) {
	        HandlerMethod hm = (HandlerMethod) handler;
	        // 使用注解
	        AccessLimit accessLimit = hm.getMethodAnnotation(AccessLimit.class);
	        if (accessLimit == null) {
	            return true;
	        }
		
		response.setCharacterEncoding("UTF-8"); 
		// 取用户的真实IP
		String ip =UserIpUtil.getIp(request);
		// 取session中的IP对象
		RequestIp re = (RequestIp) request.getSession().getAttribute(ip);
		// 第一次请求
		if (null == re) {
			// 放入到session中
			RequestIp reIp = new RequestIp();
			reIp.setCreateTime(System.currentTimeMillis());
			reIp.setReCount(1);
			request.getSession().setAttribute(ip, reIp);
		} else {
			Long createTime = re.getCreateTime();
			if (null == createTime) {
				  // 时间请求为空
				  //out.write("<script >layer.msg('请求太快，请稍后再试！', {icon: 2});</script>");
			} else {
				if (((System.currentTimeMillis() - createTime) / 1000) > accessLimit.seconds()) {
					//System.out.println("通过请求！"+ ((System.currentTimeMillis() - createTime) / 1000));
					// 当前时间离上一次请求时间大于3秒，可以直接通过,保存这次的请求
					RequestIp reIp = new RequestIp();
					reIp.setCreateTime(System.currentTimeMillis());
					reIp.setReCount(1);
					request.getSession().setAttribute(ip, reIp);
				} else {
					// 小于3秒，并且3秒之内请求了10次，返回提示
					if (re.getReCount() > accessLimit.maxCount()) {
						  //out.write("<script>layer.msg('请求太快，请稍后再试！', {icon: 2});</script>");
						 return false;
					} else {
						// 小于3秒，但请求数小于10次，给对象添加
						re.setCreateTime(System.currentTimeMillis());
						re.setReCount(re.getReCount() + 1);
						request.getSession().setAttribute(ip, re);
					}
				}
			}}
		}
		return true;
	}
}
