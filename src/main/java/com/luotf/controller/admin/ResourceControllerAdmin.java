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
import com.luotf.model.RResource;
import com.luotf.service.ResourceService;
import com.luotf.util.ConstantUtil;



@Controller
@RequestMapping(value = "/admin")
public class ResourceControllerAdmin {

	@Resource(name = "resourceServiceImpl")
	private ResourceService resourceService;
	
	/**
	  * 实现添加资源功能
	  * @param resource
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping(value = "/addResource",method = RequestMethod.POST)
	 @ResponseBody
	 @SystemLog(description = ConstantUtil.RESOURCE_ADD,userType=ConstantUtil.USERTYPE_ADMIN) 
	 public Map<String, Object> addResource(String prarm,RResource resource) throws Exception{
		 Map<String, Object> map=new HashMap<String, Object>();
		 resource.setAddtime(new Date());
		 if(resourceService.insert(resource)!=0){
			 map.put("status", 200);
		}else{
			 //0表示：插入失败
			 map.put("status", 0);
		 }
		 return map;
	 }
	 
	 /**
	  * 更新资源功能
	  * @param resource
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping(value = "/updateResource",method = RequestMethod.POST)
	 @ResponseBody
	 @SystemLog(description = ConstantUtil.RESOURCE_UPDATE,userType=ConstantUtil.USERTYPE_ADMIN) 
	 public Map<String, Object> updateResource(String prarm,RResource resource) throws Exception{
		 Map<String, Object> map=new HashMap<String, Object>();
		 if(resourceService.updateByPrimaryKeySelective(resource)!=0){
			 map.put("status", 200);
		 }else{
			 //0表示：更新失败
			 map.put("status", 0);
		 }
		 return map;
	 }
	 
	 /**
	  * 实现删除资源功能
	  * @param id
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping(value = "/deleteResource",method = RequestMethod.POST)
	 @ResponseBody
	 @SystemLog(description = ConstantUtil.RESOURCE_DELETE,userType=ConstantUtil.USERTYPE_ADMIN) 
	 public Map<String, Object> deleteResource(String prarm, Integer id) throws Exception{
		 Map<String, Object> map=new HashMap<String, Object>();
		 if(resourceService.deleteByPrimaryKey(id)!=0){
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
	 @RequestMapping(value = "/selectResourceById",method = RequestMethod.POST)
	 @ResponseBody
	 public Map<String, Object> selectResourceById(Integer id) throws Exception{
		 Map<String, Object> map=new HashMap<String, Object>();
		 RResource resource=resourceService.selectByPrimaryKey(id);
		 if(resource!=null){
			 map.put("status", 200);
		 }else{
			 //500表示：返回值为Null
			 map.put("status", 500);
		 }
		 map.put("resource", resource);
		 return map;
	 }
	 
	
	 /**
	  * 模糊组合分页查询资源信息
	  * @param id，resource
	  * @return 管理端
	  * @throws Exception
	  */
	 @RequestMapping(value = "/selectLikeResourceListByPage",method=RequestMethod.POST)
	 @ResponseBody
	 public Map<String, Object> selectLikeResourceListByPage(String prarm,RResource resource,@RequestParam(value="page", required=true,defaultValue="1") Integer page,@RequestParam(value="pageSize", required=true,defaultValue="9") Integer pageSize) throws Exception{
		 Map<String, Object> map=new HashMap<String, Object>();
		 if(resource.getTitle()!=null&&resource.getTitle()!=""){
			 map.put("title", resource.getTitle());
		 }
		 if(resource.getContent()!=null&&resource.getContent()!=""){
			 map.put("content", resource.getContent());
		 }
		 if(resource.getStatus()!=null){
			 map.put("status", resource.getStatus());
		 }
		 //分页显示：第1页开始，每页显示9条记录
		 PageHelper.startPage(page, pageSize);
		 List<RResource> resourceList=resourceService.selectLikeResourceListByPage(map);
		 PageInfo<RResource> pageInfo=new PageInfo<RResource>(resourceList);
		 Map<String, Object> returnMap=new HashMap<String, Object>();
		 if(resourceList.size()>0){
			 returnMap.put("status", 200);
		 }else{
			 //500表示：返回值为Null
			 returnMap.put("status", 500);
		 }
		 returnMap.put("resourceList", resourceList);
		 returnMap.put("pageInfo", pageInfo);
		 return returnMap;
	 }
	 
	 
	 
	 /**
	  * 通过状态查询资源信息
	  * @param id
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping(value = "/selectResourceListByStatus",method = RequestMethod.POST)
	 @ResponseBody
	 public Map<String, Object> selectResourceListByStatus() throws Exception{
		 Map<String, Object> map=new HashMap<String, Object>();
		 List<?> list=resourceService.selectResourceListByStatus();
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
