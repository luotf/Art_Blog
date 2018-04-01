package com.luotf.controller;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.luotf.model.Blog;
import com.luotf.model.BlogType;
import com.luotf.service.BlogService;



@Controller

public class BlogController {

	@Resource(name = "blogServiceImpl")
	private BlogService blogService;
	
	 @RequestMapping(value = "/add")
	 public String addBlog(ModelAndView mv) throws Exception {
		 Blog blog=new Blog();
		 BlogType type=new BlogType();
		 type.setId(1);
		 blog.setTitle("罗廷方");
		 blog.setAddtime(new Date());
		 blog.setUpdatetime(new Date());
		 blog.setType(type);
		 blogService.insertBlogSelective(blog);
	       //mv.setViewName("redirect:/");
	        return "admin/AdminIndex";
	    }
	
}
