package com.luotf.controller;

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
public class ResourceController {

	@Resource(name = "resourceServiceImpl")
	private ResourceService resourceService;
	 
	 /**
	  * 模糊组合分页查询资源信息
	  * @param id，resource
	  * @return 前台
	  * @throws Exception
	  */
	 @RequestMapping(value = "/selectLikeResourceListByPage",method=RequestMethod.GET)
	 @ResponseBody
	 @SystemLog(description = ConstantUtil.RESOURCE_FINDKEY,userType=ConstantUtil.USERTYPE_USER) 
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
	 
}
