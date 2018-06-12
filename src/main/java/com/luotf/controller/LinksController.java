package com.luotf.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.luotf.model.Links;
import com.luotf.model.RResource;
import com.luotf.service.LinksService;



@Controller
public class LinksController {

	@Resource(name = "linksServiceImpl")
	private LinksService linksService;
	 
	 /**
	  * 查询所有已上架的友链
	  * @return 前台
	  * @throws Exception
	  */
	 @RequestMapping(value = "/selectAllLinks",method=RequestMethod.GET)
	 @ResponseBody
	 public Map<String, Object> selectAllLinks() throws Exception{
		 List<Links> linksList=linksService.selectAllLinks();
		 
		 Map<String, Object> returnMap=new HashMap<String, Object>();
		 if(linksList.size()>0){
			 returnMap.put("status", 200);
		 }else{
			 //500表示：返回值为Null
			 returnMap.put("status", 500);
		 }
		 returnMap.put("linksList", linksList);
		 return returnMap;
	 }
	 
	 /**
	  * 按博客id查询资源信息
	  * @param id
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping(value = "/selectLinksById",method = RequestMethod.POST)
	 @ResponseBody
	 public Map<String, Object> selectLinksById(Integer id) throws Exception{
		 Map<String, Object> map=new HashMap<String, Object>();
		 Links links=linksService.selectByPrimaryKey(id);
		 if(links!=null){
			 map.put("status", 200);
		 }else{
			 //500表示：返回值为Null
			 map.put("status", 500);
		 }
		 return map;
	 }
	 
}
