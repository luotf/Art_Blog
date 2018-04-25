package com.luotf.controller.admin;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
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

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
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
						 map.put("name",fileBaseName);
						 map.put("path",fileNames);
						 map.put("status",200);
					 }
				 }
			 }
		 }
		 return map;
	 }
	 
	 /**
	  * 实现添加博客功能
	  * @param blog
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping(value = "/addBlog",method = RequestMethod.POST)
	 @ResponseBody
	 public Map addBlog(Blog blog) throws Exception{
		 Map map=new HashMap();
		 //设置博客封面
		 if(blog.getContent()!=null&&blog.getContent()!=""){
			 blog.setImages(subString.subImages(blog.getContent()));
		 }
		 //将中文的分号转换成英文的分号
		 if(blog.getKeyword()!=null&&blog.getKeyword()!=""){
			 blog.setKeyword(subString.subKeyword(blog.getKeyword()));
		 }
		 blog.setAddtime(new Date());
		 if(blogService.insertBlog(blog)!=0){
			 map.put("status", 200);
		}else{
			 //0表示：插入失败
			 map.put("status", 0);
		 }
		 return map;
	 }
	 
	 
	 /**
	  * 实现删除博客功能
	  * @param blog
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping(value = "/deleteBlog",method = RequestMethod.POST)
	 @ResponseBody
	 public Map deleteBlog(Integer id) throws Exception{
		 Map map=new HashMap();
		 if(blogService.deleteBlogById(id)!=0){
			 map.put("status", 200);
		 }else{
			 //0表示：删除失败
			 map.put("status", 0);
		 }
		 return map;
	 }
	 
	 
	 /**
	  * 更新博客功能
	  * @param blog
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping(value = "/updateBlog",method = RequestMethod.POST)
	 @ResponseBody
	 public Map updateBlog(Blog blog) throws Exception{
		 Map map=new HashMap();
		//设置博客封面
		 if(blog.getContent()!=null&&blog.getContent()!=""){
			 blog.setImages(subString.subImages(blog.getContent()));
		 }
		 //将中文的分号转换成英文的分号
		 if(blog.getKeyword()!=null&&blog.getKeyword()!=""){
			 blog.setKeyword(subString.subKeyword(blog.getKeyword()));
		 }
		 //blog.setUpdatetime(new Date());
		 
		 if(blogService.updateBlogSelective(blog)!=0){
			 map.put("status", 200);
		 }else{
			 //0表示：更新失败
			 map.put("status", 0);
		 }
		 return map;
	 }
	 
	 /**
	  * 按博客id查询博客信息
	  * @param blog
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping(value = "/selectBlogById",method = RequestMethod.POST)
	 @ResponseBody
	 public Map selectBlogById(Integer id) throws Exception{
		 Map map=new HashMap();
		 Blog blog=blogService.selectBlogById(id);
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
	  * 通过类别typeId查询博客信息
	  * @param id
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping(value = "/selectBlogByTypeId",method = RequestMethod.POST)
	 @ResponseBody
	 public Map selectBlogByTypeId(Integer id) throws Exception{
		 Map map=new HashMap();
		 List<Blog> blogList=blogService.selectBlogByTypeId(id);
		 if(blogList.size()>0){
			 map.put("status", 200);
		 }else{
			 //500表示：返回值为Null
			 map.put("status", 500);
		 }
		 map.put("blogList", blogList);
		 return map;
	 }
	 
	 /**
	  * 多条件模糊分页查询博客信息(or)
	  * @param id
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping(value = "/selectLikeBlogListByPage",method = RequestMethod.POST)
	 @ResponseBody
	 public Map selectLikeBlogListByPage(Blog blog,@RequestParam(value="page", required=true,defaultValue="1") Integer page,@RequestParam(value="pageSize", required=true,defaultValue="10") Integer pageSize) throws Exception{
		 Map map=new HashMap();
		 
		 if(blog.getTitle()!=null&&blog.getTitle()!=""){
			 map.put("title", blog.getTitle());
		 }
		 if(blog.getIntroduction()!=null&&blog.getIntroduction()!=""){
			 map.put("introduction", blog.getIntroduction());
		 }
		 if(blog.getKeyword()!=null&&blog.getKeyword()!=""){
			 map.put("keyword", blog.getKeyword());
		 }
		 if(blog.getContent()!=null&&blog.getContent()!=""){
			 map.put("content", blog.getContent());
		 }
		 if(blog.getIstop()!=null){
			 map.put("isTop", blog.getIstop());
		 }
		 if(blog.getType()!=null){
			 map.put("type_id", blog.getType().getId());
		 }
		 if(blog.getStatus()!=null){
			 map.put("status", blog.getStatus());
		 }
		 if(blog.getIsrecommend()!=null){
			 map.put("isRecommend", blog.getIsrecommend());
		 }
		 if(blog.getAddtime()!=null){
			 map.put("addTime", blog.getAddtime());
		 }
		 //分页显示：第1页开始，每页显示10条记录
		 PageHelper.startPage(page, pageSize);
		 List<Blog> blogList=blogService.selectLikeBlogListByPage(map);
		 PageInfo<Blog> pageInfo=new PageInfo<Blog>(blogList);
		 Map returnMap=new HashMap();
		 if(blogList.size()>0){
			 returnMap.put("status", 200);
			 
		 }else{
			 //500表示：返回值为Null
			 returnMap.put("status", 500);
		 }
		 returnMap.put("blogList", blogList);
		 returnMap.put("pageInfo", pageInfo);
		 return returnMap;
	 }
	 
	 
	 /**
	  * 模糊组合分页查询博客信息(and)
	  * @param id
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping(value = "/selectGroupLikeBlogListByPage")
	 @ResponseBody
	 public Map selectGroupLikeBlogListByPage(Blog blog,@RequestParam(value="sort", required=true,defaultValue="addTime") String sort,@RequestParam(value="page", required=true,defaultValue="1") Integer page,@RequestParam(value="pageSize", required=true,defaultValue="10") Integer pageSize) throws Exception{
		 Map map=new HashMap();
		// if(sort)
		 map.put("sort", sort);
		 if(blog.getTitle()!=null&&blog.getTitle()!=""){
			 map.put("title", blog.getTitle());
		 }
		 if(blog.getIntroduction()!=null&&blog.getIntroduction()!=""){
			 map.put("introduction", blog.getIntroduction());
		 }
		 if(blog.getKeyword()!=null&&blog.getKeyword()!=""){
			 map.put("keyword", blog.getKeyword());
		 }
		 if(blog.getContent()!=null&&blog.getContent()!=""){
			 map.put("content", blog.getContent());
		 }
		 if(blog.getIstop()!=null){
			 map.put("isTop", blog.getIstop());
		 }
		 if(blog.getType()!=null){
			 map.put("type_id", blog.getType().getId());
		 }
		 if(blog.getStatus()!=null){
			 map.put("status", blog.getStatus());
		 }
		 if(blog.getIsrecommend()!=null){
			 map.put("isRecommend", blog.getIsrecommend());
		 }
		 if(blog.getAddtime()!=null){
			 map.put("addTime", blog.getAddtime());
		 }
		 //分页显示：第1页开始，每页显示10条记录
		 PageHelper.startPage(page, pageSize);
		 List<Blog> blogList=blogService.selectGroupLikeBlogListByPage(map);
		 PageInfo<Blog> pageInfo=new PageInfo<Blog>(blogList);
		 //System.out.println("type_id:"+blog.getType().getId());
		 Map returnMap=new HashMap();
		 if(blogList.size()>0){
			 returnMap.put("status", 200);
		 }else{
			 //500表示：返回值为Null
			 returnMap.put("status", 500);
		 }
		 returnMap.put("blogList", blogList);
		 returnMap.put("pageInfo", pageInfo);
		 return returnMap;
	 }
	 
	 /**
	  * 按照不同条件分页查询博客信息
	  * @param id
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping(value = "/selectBlogListByPage",method = RequestMethod.POST)
	 @ResponseBody
	 public Map selectBlogListByPage(Blog blog,@RequestParam(value="page", required=true,defaultValue="1") Integer page,@RequestParam(value="pageSize", required=true,defaultValue="10") Integer pageSize) throws Exception{
		 Map map=new HashMap();
		 
		 if(blog.getTitle()!=null&&blog.getTitle()!=""){
			 map.put("title", blog.getTitle());
		 }
		 if(blog.getIntroduction()!=null&&blog.getIntroduction()!=""){
			 map.put("introduction", blog.getIntroduction());
		 }
		 if(blog.getKeyword()!=null&&blog.getKeyword()!=""){
			 map.put("keyword", blog.getKeyword());
		 }
		 if(blog.getContent()!=null&&blog.getContent()!=""){
			 map.put("content", blog.getContent());
		 }
		 if(blog.getIstop()!=null){
			 map.put("isTop", blog.getIstop());
		 }
		 if(blog.getType()!=null){
			 map.put("type_id", blog.getType().getId());
		 }
		 if(blog.getStatus()!=null){
			 map.put("status", blog.getStatus());
		 }
		 if(blog.getIsrecommend()!=null){
			 map.put("isRecommend", blog.getIsrecommend());
		 }
		 if(blog.getAddtime()!=null){
			 map.put("addTime", blog.getAddtime());
		 }
		 //分页显示：第1页开始，每页显示10条记录
		 PageHelper.startPage(page, pageSize);
		 List<Blog> blogList=blogService.selectBlogListByPage(map);
		 PageInfo<Blog> pageInfo=new PageInfo<Blog>(blogList);
		 	/*System.out.println("总记录数："+pageInfo.getTotal());
	    	System.out.println("总页数："+pageInfo.getPages());
	    	System.out.println("当前页："+pageInfo.getPageNum());
	    	System.out.println("每页的数量："+pageInfo.getPageSize());
	    	System.out.println("当前页数量："+pageInfo.getSize());*/
		 Map returnMap=new HashMap();
		 
		 if(blogList.size()>0){
			 returnMap.put("status", 200);
			 
		 }else{
			 //500表示：返回值为Null
			 returnMap.put("status", 500);
		 }
		 returnMap.put("blogList", blogList);
		 returnMap.put("pageInfo", pageInfo);
		 return returnMap;
	 }
	 
	 
	 /**
	  * 按照不同条件查询博客的数量
	  * @param id
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping(value = "/selectBlogCount",method = RequestMethod.POST)
	 @ResponseBody
	 public Map selectBlogCount(Blog blog) throws Exception{
		 Map map=new HashMap();
		 if(blog.getKeyword()!=null&&blog.getKeyword()!=""){
			 map.put("keyword", blog.getKeyword());
		 }
		 if(blog.getType()!=null){
			 map.put("type_id", blog.getType().getId());
		 }
		 if(blog.getStatus()!=null){
			 map.put("status", blog.getStatus());
		 }
		 if(blog.getIsrecommend()!=null){
			 map.put("isRecommend", blog.getIsrecommend());
		 }
		 if(blog.getAddtime()!=null){
			 map.put("addTime", blog.getAddtime());
		 }
		 Long count=blogService.selectBlogCount(map);
		 Map returnMap=new HashMap();
		 if(count>0){
			 returnMap.put("status", 200);
		 }else{
			 //500表示：返回值为Null
			 returnMap.put("status", 500);
		 }
		 returnMap.put("count", count);
		 return returnMap;
	 }
	 
	 
	 
	 
	 
	 /**
	  * 查询前一篇博客信息
	  * @param id
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping(value = "/selectPrevBlog",method = RequestMethod.POST)
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
	 
	 /**
	  * 查询后一篇博客信息
	  * @param id
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping(value = "/selectNextBlog",method = RequestMethod.POST)
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
	  * 通过类别typeId查询博客信息
	  * @param id
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping(value = "/selectBlogListByStatus",method = RequestMethod.POST)
	 @ResponseBody
	 public Map selectBlogListByStatus() throws Exception{
		 Map map=new HashMap();
		 List list=blogService.selectBlogListByStatus();
		 if(list.size()>0){
			 map.put("status", 200);
		 }else{
			 //500表示：返回值为Null
			map.put("status", 500);
		 }
		 map.put("list", list);
		 return map;
	 }
}
