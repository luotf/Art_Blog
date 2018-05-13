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
import com.luotf.model.BlogType;
import com.luotf.service.BlogTypeService;
import com.luotf.util.ConstantUtil;

@Controller
@RequestMapping(value = "/admin")
public class BlogTypeControllerAdmin {

	@Resource(name = "blogTypeServiceImpl")
	private BlogTypeService blogTypeService;

	@RequestMapping(value = "/selectBlogType", method = RequestMethod.POST)
	@ResponseBody
	public List<BlogType> selectBlogType(
			@RequestParam(value = "data", required = false) String data)
			throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		if (data == "all") {
			map = null;
		}
		List<BlogType> typeList = blogTypeService.selectBlogTypeListByPage(map);

		return typeList;
	}

	@RequestMapping(value = "/selectBlogTypeById", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectBlogType(Integer id) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		BlogType blogType = blogTypeService.selectBlogTypeById(id);
		if (blogType != null) {
			map.put("status", 200);
		} else {
			map.put("status", 0);
		}
		map.put("blogType", blogType);
		return map;
	}

	@RequestMapping(value = "/deleteBlogType", method = RequestMethod.POST)
	@ResponseBody
	@SystemLog(description = ConstantUtil.BLOGTYPE_DELETE,userType=ConstantUtil.USERTYPE_ADMIN) 
	public Map<String, Object> deleteBlogType(String prarm,BlogType blogType) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		//查询该类别下是否有博客
		if (blogTypeService.selectBlogTypeById(blogType.getId()).getNum()!=0) {
			// 该类别下有博客  不能删除
			map.put("status", 2);
		} else {
			if ((blogTypeService.deleteBlogTypeById(blogType.getId())!=0)) {
				map.put("status", 200);
			} else {
				map.put("status", 0);
			}
		}
		return map;
	}

	@RequestMapping(value = "/addBlogType", method = RequestMethod.POST)
	@ResponseBody
	@SystemLog(description = ConstantUtil.BLOGTYPE_ADD,userType=ConstantUtil.USERTYPE_ADMIN) 
	public Map<String, Object> addBlogType(String prarm,BlogType blogType) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		if (blogTypeService.selectBlogTypeByName(blogType.getTypename())!=null) {
			// 已经存在该类别
			map.put("status", 2);
		} else {
			blogType.setAddTime(new Date());
			if ((blogTypeService.insertBlogType(blogType)) != 0) {
				map.put("status", 200);
			} else {
				map.put("status", 0);
			}
		}
		return map;
	}
	
	
	/**
	 * 按照不同条件分页查询博客类别信息
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/selectBlogTypeListByPage", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectLikeBlogListByPage(
			BlogType blogType,
			@RequestParam(value = "page", required = true, defaultValue = "1") Integer page,
			@RequestParam(value = "pageSize", required = true, defaultValue = "10") Integer pageSize)
			throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		if (blogType.getTypename() != null && blogType.getTypename() != "") {
			map.put("typeName", blogType.getTypename());
		}
		if (blogType.getAddTime() != null) {
			map.put("addTime", blogType.getAddTime());
		}
		// 分页显示：第1页开始，每页显示10条记录
		PageHelper.startPage(page, pageSize);
		List<BlogType> blogTypeList = blogTypeService
				.selectBlogTypeListByPage(map);
		PageInfo<BlogType> pageInfo = new PageInfo<BlogType>(blogTypeList);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		if (blogTypeList.size() > 0) {
			returnMap.put("status", 200);
		} else {
			// 500表示：返回值为Null
			returnMap.put("status", 500);
		}
		returnMap.put("blogTypeList", blogTypeList);
		returnMap.put("pageInfo", pageInfo);
		return returnMap;
	}

	/**
	 * 更新博客类别功能
	 * 
	 * @param blog
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/updateBlogType", method = RequestMethod.POST)
	@ResponseBody
	@SystemLog(description = ConstantUtil.BLOGTYPE_UPDATE,userType=ConstantUtil.USERTYPE_ADMIN) 
	public Map<String, Object> updateBlogType(String prarm,BlogType blogType) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		if (blogTypeService.selectBlogTypeByName(blogType.getTypename())!=null) {
			// 已经存在该类别
			map.put("status", 2);
		} else {
			if (blogTypeService.updateBlogTypeSelective(blogType) != 0) {
				map.put("status", 200);
			} else {
				// 0表示：更新失败
				map.put("status", 0);
			}
		}
		return map;
		
	}
}
