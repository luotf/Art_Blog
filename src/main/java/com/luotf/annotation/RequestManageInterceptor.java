package com.luotf.annotation;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class RequestManageInterceptor implements HandlerInterceptor {

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
			HttpServletResponse response, Object arg2) throws Exception {
		PrintWriter out = null;// 返回给页面显示
		Map<String, Object> resultMap = new HashMap<String, Object>();
		// 取用户的真实IP
		String ip = request.getHeader("x-forwarded-for");

		if (ip == null || ip.length() == 0 || " unknown ".equalsIgnoreCase(ip)) {
			ip = request.getHeader(" Proxy-Client-IP ");
		}
		if (ip == null || ip.length() == 0 || " unknown ".equalsIgnoreCase(ip)) {
			ip = request.getHeader(" WL-Proxy-Client-IP ");
		}
		if (ip == null || ip.length() == 0 || " unknown ".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
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
				/*
				 * resultMap.put("code", 503); resultMap.put("message",
				 * "请求太快，请稍后再试！"); out = response.getWriter();
				 * out.append(ResultUtil.resultMapToString(resultMap));
				 */
				System.out.println("请求太快，请稍后再试");
			} else {
				if (((System.currentTimeMillis() - createTime) / 1000) > 3) {
					System.out
							.println("通过请求！"
									+ ((System.currentTimeMillis() - createTime) / 1000));
					// 当前时间离上一次请求时间大于3秒，可以直接通过,保存这次的请求
					RequestIp reIp = new RequestIp();
					reIp.setCreateTime(System.currentTimeMillis());
					reIp.setReCount(1);
					request.getSession().setAttribute(ip, reIp);
				} else {
					// 小于3秒，并且3秒之内请求了10次，返回提示
					if (re.getReCount() > 30) {
						// resultMap.put("code", 503);
						// resultMap.put("message", "请求太快，请稍后再试！");
						System.out.println("请求太快，请稍后再试");
						// out = response.getWriter();
						// out.append(ResultUtil.resultMapToString(resultMap));//以json形式返回给页面，也可以直接返回提示信息
						return false;
					} else {
						// 小于3秒，但请求数小于10次，给对象添加
						re.setCreateTime(System.currentTimeMillis());
						re.setReCount(re.getReCount() + 1);
						request.getSession().setAttribute(ip, re);
					}
				}
			}
		}
		return true;
	}
}
