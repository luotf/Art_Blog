package com.luotf.controller.admin;

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
import com.luotf.model.Log;
import com.luotf.service.LogService;



@Controller
@RequestMapping(value = "/admin")
public class LogControllerAdmin {

	@Resource(name = "logServiceImpl")
	private LogService logService;
	
	
	 @RequestMapping(value = "/selectUserLogByDate",method = RequestMethod.POST)
	 @ResponseBody
	 @AccessLimit(seconds=1,maxCount=10)
	 public Map<String, Object> selectBlogListByDate(Log log,@RequestParam(value="startTime") String startTime,@RequestParam(value="endTime") String endTime) throws Exception{
		 Map<String, Object> map=new HashMap<String, Object>();
		 if(log.getUserType()!=""&&log.getUserType()!=null){
			 map.put("userType", log.getUserType());
		 }
		 if(startTime!=""&&startTime!=null){
			 map.put("startTime", startTime);
		 }
		 if(endTime!=""&&endTime!=null){
			 map.put("endTime", endTime);
		 }
		 List<?> list=logService.selectUserLogByDate(map);
		 Map<String, Object> returnMap=new HashMap<String, Object>();
		 if(list.size()>0){
			 returnMap.put("status", 200);
		 }else{
			 //500表示：返回值为Null
			 returnMap.put("status", 500);
		 }
		 returnMap.put("list", list);
		 return returnMap;
	 }
	
	 
	 /**
	  * 模糊组合分页查询访客信息
	  * @param id，resource
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping(value = "/selectLogListByDate")
	 @ResponseBody
	 @AccessLimit(seconds=1,maxCount=10)
	 public Map<String,Object> selectLogListByDate(Log log,@RequestParam(value="startTime") String startTime,@RequestParam(value="endTime") String endTime,@RequestParam(value="page", required=true,defaultValue="1") Integer page,@RequestParam(value="pageSize", required=true,defaultValue="9") Integer pageSize) throws Exception{
		 Map<String,Object> map=new HashMap<String,Object>();
		 if(startTime!=""&&startTime!=null){
			 map.put("startTime", startTime);
		 }
		 if(endTime!=""&&endTime!=null){
			 map.put("endTime", endTime);
		 }
		 if(log.getIp()!=null&&log.getIp()!=""){
			 map.put("ip", log.getIp());
		 }
		 if(log.getUserType()!=null&&log.getUserType()!=""){
			 map.put("userType", log.getUserType());
		 }
		 if(log.getDescription()!=null&&log.getDescription()!=""){
			 map.put("description", log.getDescription());
		 }
		 
		 //分页显示：第1页开始，每页显示9条记录
		 PageHelper.startPage(page, pageSize);
		 List<Log> logList=logService.selectLogListByDate(map);
		 PageInfo<Log> pageInfo=new PageInfo<Log>(logList);
		 Map<String,Object>  returnMap=new HashMap<String,Object> ();
		 if(logList.size()>0){
			 returnMap.put("status", 200);
		 }else{
			 //500表示：返回值为Null
			 returnMap.put("status", 500);
		 }
		 returnMap.put("logList", logList);
		 returnMap.put("pageInfo", pageInfo);
		 return returnMap;
	 }
	 
	 
	 
	 /**
	  * 更新日志功能
	  * @param visit
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping(value = "/updateLog",method = RequestMethod.POST)
	 @ResponseBody
	 public Map updateVisit(Log log) throws Exception{
		 Map map=new HashMap();
		 if(logService.updateByPrimaryKeySelective(log)!=0){
			 map.put("status", 200);
		 }else{
			 //0表示：更新失败
			 map.put("status", 0);
		 }
		 return map;
	 }
}
