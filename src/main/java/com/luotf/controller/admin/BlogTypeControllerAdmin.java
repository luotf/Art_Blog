package com.luotf.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.luotf.model.BlogType;
import com.luotf.service.BlogTypeService;

@Controller
@RequestMapping(value = "/admin")
public class BlogTypeControllerAdmin {

	@Resource(name = "blogTypeServiceImpl")
	private BlogTypeService blogTypeService;
	
	@RequestMapping(value = "/selectBlogType",method = RequestMethod.POST)
	@ResponseBody
	public List<BlogType> selectBlogType(@RequestParam(value="data",required=false) String data) throws Exception{
		Map map=new HashMap();
		if(data=="all"){
			map=null;
		}
		List<BlogType> typeList= blogTypeService.selectBlogTypeListByPage(map);
		
		return typeList;
	}
}
