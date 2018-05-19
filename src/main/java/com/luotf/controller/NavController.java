package com.luotf.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.luotf.service.BlogerService;
import com.luotf.util.CipherUtil;



@Controller
public class NavController {
	
	 /** 
     * 初始登陆界面 
     * @param request 
     * @return 
     */  
    @RequestMapping("/{nav}")
    public String returnToJsp(@PathVariable String nav){  
    	String result="page/"+nav;
    	return result;  
    }  
    
}
