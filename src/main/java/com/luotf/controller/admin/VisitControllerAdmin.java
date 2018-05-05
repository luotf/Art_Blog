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
import com.luotf.annotation.AccessLimit;
import com.luotf.service.VisitService;



@Controller
@RequestMapping(value = "/admin")
public class VisitControllerAdmin {

	@Resource(name = "visitServiceImpl")
	private VisitService visitService;
	/*
	  * 按照不同时间查询访客的数量
	  */
	 @RequestMapping(value = "/selectVisitListByDate",method = RequestMethod.POST)
	 @ResponseBody
	 @AccessLimit(seconds=1,maxCount=10)
	 public Map selectBlogListByDate(@RequestParam(value="startTime") String startTime,@RequestParam(value="endTime") String endTime) throws Exception{
		 Map map=new HashMap();
		 if(startTime!=""&&startTime!=null){
			 map.put("startTime", startTime);
		 }
		 if(endTime!=""&&endTime!=null){
			 map.put("endTime", endTime);
		 }
		 List<Map> list=visitService.selectVisitListByDate(map);
		 Map returnMap=new HashMap();
		 if(list.size()>0){
			 returnMap.put("status", 200);
		 }else{
			 //500表示：返回值为Null
			 returnMap.put("status", 500);
		 }
		 returnMap.put("list", list);
		 return returnMap;
	 }
	 
	
	
}
