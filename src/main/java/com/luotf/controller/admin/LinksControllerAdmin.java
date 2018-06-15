package com.luotf.controller.admin;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.luotf.annotation.SystemLog;
import com.luotf.model.Links;
import com.luotf.service.LinksService;
import com.luotf.util.ConstantUtil;



@Controller
@RequestMapping(value = "/admin")
public class LinksControllerAdmin {

	@Resource(name = "linksServiceImpl")
	private LinksService linksService;
	
	/**
	  * 实现添加友链功能
	  * @param resource
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping(value = "/addLinks",method = RequestMethod.POST)
	 @ResponseBody
	 @SystemLog(description = ConstantUtil.LINKS_ADD,userType=ConstantUtil.USERTYPE_ADMIN) 
	 public Map<String, Object> addLinks(String prarm,Links links) throws Exception{
		 Map<String, Object> map=new HashMap<String, Object>();
		 links.setAddtime(new Date());
		 if(linksService.insert(links)!=0){
			 map.put("status", 200);
		}else{
			 //0表示：插入失败
			 map.put("status", 0);
		 }
		 return map;
	 }
	 
	 /**
	  * 更新友链功能
	  * @param resource
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping(value = "/updateLinks",method = RequestMethod.POST)
	 @ResponseBody
	 @SystemLog(description = ConstantUtil.LINKS_UPDATE,userType=ConstantUtil.USERTYPE_ADMIN) 
	 public Map<String, Object> updateLinks(String prarm,Links links) throws Exception{
		 Map<String, Object> map=new HashMap<String, Object>();
		 if(linksService.updateByPrimaryKeySelective(links)!=0){
			 map.put("status", 200);
		 }else{
			 //0表示：更新失败
			 map.put("status", 0);
		 }
		 return map;
	 }
	 
	 /**
	  * 实现删除友链功能
	  * @param id
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping(value = "/deleteLinks",method = RequestMethod.POST)
	 @ResponseBody
	 @SystemLog(description = ConstantUtil.LINKS_DELETE,userType=ConstantUtil.USERTYPE_ADMIN) 
	 public Map<String, Object> deleteLinks(String prarm, Integer id) throws Exception{
		 Map<String, Object> map=new HashMap<String, Object>();
		 if(linksService.deleteByPrimaryKey(id)!=0){
			 map.put("status", 200);
		 }else{
			 //0表示：删除失败
			 map.put("status", 0);
		 }
		 return map;
	 }
	 
	 /**
	  * 按博客id查询资源信息
	  * @param id
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping(value = "/selectLinksByIdAdmin",method = RequestMethod.POST)
	 @ResponseBody
	 public Map<String, Object> selectLinksById(Integer id) throws Exception{
		 Map<String, Object> map=new HashMap<String, Object>();
		 Links links=linksService.selectByPrimaryKeyAdmin(id);
		 if(links!=null){
			 map.put("status", 200);
		 }else{
			 //500表示：返回值为Null
			 map.put("status", 500);
		 }
		 map.put("links", links);
		 return map;
	 }
	 
	 
	 
	 /**
	  * 查询未处理的连接数
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping(value = "/selectNoApplyLinksCount",method = RequestMethod.POST)
	 @ResponseBody
	 public Map<String, Object> selectNoApplyLinksCount() throws Exception{
		 Map<String, Object> map=new HashMap<String, Object>();
		 int count=linksService.selectNoApplyLinksCount();
		 if(count!=0){
			 map.put("status", 200);
		 }else{
			 //500表示：返回值为Null
			 map.put("status", 500);
		 }
		 map.put("count", count);
		 return map;
	 }
	 
	 
	 /**
	  * 模糊组合分页查询友链信息
	  * @param id，resource
	  * @return 管理端
	  * @throws Exception
	  */
	 @RequestMapping(value = "/selectLikeLinksListByPage",method=RequestMethod.POST)
	 @ResponseBody
	 public Map<String, Object> selectLikeLinksListByPage(String prarm,Links links,@RequestParam(value="page", required=true,defaultValue="1") Integer page,@RequestParam(value="pageSize", required=true,defaultValue="9") Integer pageSize) throws Exception{
		 Map<String, Object> map=new HashMap<String, Object>();
		 if(links.getName()!=null&&links.getName()!=""){
			 map.put("name", links.getName());
		 }
		 if(links.getStatus()!=null){
			 map.put("status", links.getStatus());
		 }
		 if(links.getIsapply()!=null){
			 map.put("isapply", links.getIsapply());
		 }
		 //分页显示：第1页开始，每页显示9条记录
		 PageHelper.startPage(page, pageSize);
		 List<Links> linksList=linksService.selectLikeLinksListByPage(map);
		 PageInfo<Links> pageInfo=new PageInfo<Links>(linksList);
		 Map<String, Object> returnMap=new HashMap<String, Object>();
		 if(linksList.size()>0){
			 returnMap.put("status", 200);
		 }else{
			 //500表示：返回值为Null
			 returnMap.put("status", 500);
		 }
		 returnMap.put("linksList", linksList);
		 returnMap.put("pageInfo", pageInfo);
		 return returnMap;
	 }
	 
	 
	 
	 /**
	  * 通过状态查询友链信息
	  * @param id
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping(value = "/selectLinksListByStatus",method = RequestMethod.POST)
	 @ResponseBody
	 public Map<String, Object> selectLinksListByStatus() throws Exception{
		 Map<String, Object> map=new HashMap<String, Object>();
		 List<?> list=linksService.selectLinksListByStatus();
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
