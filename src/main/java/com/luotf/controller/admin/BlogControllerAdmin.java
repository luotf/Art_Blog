package com.luotf.controller.admin;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.luotf.model.Blog;
import com.luotf.model.BlogType;
import com.luotf.service.BlogService;
import com.luotf.util.subString;

@Controller
@RequestMapping(value = "/admin")
public class BlogControllerAdmin {

	@Resource(name = "blogServiceImpl")
	private BlogService blogService;
	
	/**
	 * 整合summernote实现图片上传
	 * @param request
	 * @return
	 * @throws Exception
	 */
	 @RequestMapping(value = "/uploadImages",method = RequestMethod.POST)
	 @ResponseBody
	 public Map uploadImage(HttpServletRequest request) throws Exception {
		 CommonsMultipartResolver multipartResolver=new CommonsMultipartResolver(request.getSession().getServletContext());
		 Map map=new HashMap();
		 if(multipartResolver.isMultipart(request)){
			 MultipartHttpServletRequest mreq=(MultipartHttpServletRequest) request;
			 Iterator<String> fileNamesIter=mreq.getFileNames();
			 while(fileNamesIter.hasNext()){
				 MultipartFile file=mreq.getFile(fileNamesIter.next());
				 if(file!=null){
					 String myFileName=file.getOriginalFilename();
					 //System.out.println("myFileName:"+myFileName);
					 if(myFileName.trim()!=""){
						 String fileName=file.getOriginalFilename();
						 String fileBaseName=fileName.substring(0,fileName.lastIndexOf("."));
						 String fileExt=fileName.substring(fileName.lastIndexOf(".")+1).toUpperCase();
						 SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
						 String newFileName=df.format(new Date());
						 String fileNames=newFileName+new Random().nextInt(1000)+"."+fileExt;
						 String filePath=request.getSession().getServletContext().getRealPath("/")+"\\upload\\"+newFileName+"\\"+fileNames;
						 File localFile=new File(filePath);
						 if(!localFile.exists()){
							 localFile.mkdirs();
						 }
						 file.transferTo(localFile);
						 fileNames="http://localhost:8080/BlogV1.0/upload/"+newFileName+"/"+fileNames;
						 //System.out.println("上传成功");
						 map.put("name",fileBaseName);
						 map.put("path",fileNames);
					 }
				 }
			 }
		 }
		 return map;
	 }
	 
	 @RequestMapping(value = "/addBlog",method = RequestMethod.POST)
	 @ResponseBody
	 public Map addBlog(Blog blog) throws Exception{
		 Map map=new HashMap();
		 //设置博客封面
		 blog.setImages(subString.subImages(blog.getContent()));
		 blog.setUpdatetime(new Date());
		 if(blogService.insertBlog(blog)!=0){
			 map.put("status", 200);
		}
		 return map;
	 }
	 
}
