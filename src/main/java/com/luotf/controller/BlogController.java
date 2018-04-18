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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.luotf.model.Blog;
import com.luotf.model.BlogType;
import com.luotf.service.BlogService;
import com.luotf.util.BlogIdSafe;



@Controller
@RequestMapping(value = "/page")
public class BlogController {

	@Resource(name = "blogServiceImpl")
	private BlogService blogService;
	
	
	
	 @RequestMapping(value = "/find/{id}.html")
	 public String selectBlogById(@PathVariable Integer id,Model model) throws Exception {
		 int sId=BlogIdSafe.BlogIdToSafe(id);
		// System.out.println("sid:"+ BlogIdSafe.BlogIdToSafe(id));
		 if(id==null||id<=0){
			//0表示查询 错误
			model.addAttribute("status", 0);
		}else{
			Blog blog=blogService.selectBlogById(sId);
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
	 
	 /**
	  * 查询后一篇博客信息
	  * @param id
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping(value = "/selectNextBlog")
	 @ResponseBody
	 public Map selectNextBlog(Integer id) throws Exception{
		 Map map=new HashMap();
		 Blog blog=blogService.selectNextBlog(id);
		 if(blog!=null){
			 map.put("status", 200);
		 }else{
			 //500表示：返回值为Null
			 map.put("status", 500);
		 }
		 map.put("blog", blog);
		 return map;
	 }
	 
	 /**
	  * 查询前一篇博客信息
	  * @param id
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping(value = "/selectPrevBlog")
	 @ResponseBody
	 public Map selectPrevBlog(Integer id) throws Exception{
		 Map map=new HashMap();
		 Blog blog=blogService.selectPrevBlog(id);
		 if(blog!=null){
			 map.put("status", 200);
			 
		 }else{
			 //500表示：返回值为Null
			 map.put("status", 500);
		 }
		 map.put("blog", blog);
		 return map;
	 }
	
}
