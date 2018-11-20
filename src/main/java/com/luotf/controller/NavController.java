package com.luotf.controller;


import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


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
    
    /** 
     * 初始登陆界面 
     * @param request 
     * @return 
     */  
    @RequestMapping(value="/result")
    public String searchResult(String keyboard,Model model){ 
      if(keyboard != null){
        model.addAttribute("keyword", keyboard);
      }
      return "/page/result";  
    }  
}
