package com.luotf.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.luotf.annotation.AccessLimit;
import com.luotf.annotation.SystemLog;
import com.luotf.model.Blog;
import com.luotf.service.BlogService;
import com.luotf.util.BlogIdSafeUtil;
import com.luotf.util.ConstantUtil;



@Controller
@RequestMapping(value = "/page")
public class BlogController {

	@Resource(name = "blogServiceImpl")
	private BlogService blogService;
	
	
	 @RequestMapping(value = "/find/{id}.html")
	 @SystemLog(description = ConstantUtil.BLOG_SELECT,userType=ConstantUtil.USERTYPE_USER) 
	 public String selectBlogById(@PathVariable Integer id,Model model) throws Exception {
		 int sId=BlogIdSafeUtil.BlogIdToSafe(id);
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
	        return "page/info";
	    }
	 
	 /**
	  * 查询后一篇博客信息
	  * @param id
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping(value = "/selectNextBlog")
	 @ResponseBody
	 public Map<String, Object> selectNextBlog(Integer id) throws Exception{
		 Map<String, Object> map=new HashMap<String, Object>();
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
	 public Map<String, Object> selectPrevBlog(Integer id) throws Exception{
		 Map<String, Object> map=new HashMap<String, Object>();
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
	  * 模糊组合分页查询博客信息(含content)
	  * @param id
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping(value = "/selectLikeBlogListByPage")
	 @ResponseBody
	 @AccessLimit(seconds=1,maxCount=13)
	 @SystemLog(description = ConstantUtil.BLOG_FINDKEY,userType=ConstantUtil.USERTYPE_USER) 
	 public Map<String, Object> selectLikeBlogListByPage(String param,Blog blog,@RequestParam(value="sort", required=true,defaultValue="addTime") String sort,@RequestParam(value="page", required=true,defaultValue="1") Integer page,@RequestParam(value="pageSize", required=true,defaultValue="10") Integer pageSize) throws Exception{
		 Map<String, Object> map=new HashMap<String, Object>();
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
		 List<Blog> blogList=blogService.selectLikeBlogListByPageWithBlobs(map);
		 PageInfo<Blog> pageInfo=new PageInfo<Blog>(blogList);
		 Map<String, Object> returnMap=new HashMap<String, Object>();
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
	 @AccessLimit(seconds=1,maxCount=15)
	 public Map<String, Object> selectGroupLikeBlogListByPage(Blog blog,@RequestParam(value="sort", required=true,defaultValue="addTime") String sort,@RequestParam(value="page", required=true,defaultValue="1") Integer page,@RequestParam(value="pageSize", required=true,defaultValue="10") Integer pageSize) throws Exception{
		 Map<String, Object> map=new HashMap<String, Object>();
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
		 Map<String, Object> returnMap=new HashMap<String, Object>();
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
	 
	 
	 
}
