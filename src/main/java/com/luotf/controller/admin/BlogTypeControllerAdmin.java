package com.luotf.controller.admin;

import java.util.Date;
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

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.luotf.model.Blog;
import com.luotf.model.BlogType;
import com.luotf.service.BlogTypeService;
import com.luotf.util.subString;

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
		Map map = new HashMap();
		if (data == "all") {
			map = null;
		}
		List<BlogType> typeList = blogTypeService.selectBlogTypeListByPage(map);

		return typeList;
	}

	@RequestMapping(value = "/selectBlogTypeById", method = RequestMethod.POST)
	@ResponseBody
	public Map selectBlogType(Integer id) throws Exception {
		Map map = new HashMap();
		BlogType blogType = blogTypeService.selectBlogTypeById(id);
		if (blogType != null) {
			map.put("status", 200);
		} else {
			map.put("status", 0);
		}
		map.put("blogType", blogType);
		return map;
	}

	@RequestMapping(value = "/addBlogType", method = RequestMethod.POST)
	@ResponseBody
	public Map addBlogType(BlogType blogType) throws Exception {
		Map map = new HashMap();
		if (blogTypeService.selectBlogTypeByName(blogType.getTypename())!=null) {
			// 已经存在该类别
			map.put("status", 2);
		} else {
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
	public Map selectLikeBlogListByPage(
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
	public Map updateBlogType(BlogType blogType) throws Exception {
		Map map = new HashMap();
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
