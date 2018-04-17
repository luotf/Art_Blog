package com.luotf.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.luotf.model.Blog;
import com.luotf.model.BlogType;
import com.luotf.service.BlogService;



@Controller
@RequestMapping(value = "/page")
public class BlogController {

	@Resource(name = "blogServiceImpl")
	private BlogService blogService;
	
	
	
	 @RequestMapping(value = "/find/{id}")
	 public String selectBlogById(@PathVariable Integer id,Model model) throws Exception {
		 //Map map=new HashMap();
		if(id==null||id<=0){
			//0表示查询 错误
			model.addAttribute("status", 0);
		}else{
			Blog blog=blogService.selectBlogById(id);
			
			if(blog==null){
				//查询的博客不存在
				model.addAttribute("status", 500);
			}else{
				model.addAttribute("status", 200);
			}
			model.addAttribute("blog", blog);
		}
	        return "info";
	    }
	 
	
	 
	
}
