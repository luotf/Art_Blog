package com.luotf.service;

import java.util.List;
import java.util.Map;

import com.luotf.model.BlogType;

public interface BlogTypeService {
	
	/**
 	 * 按不同条件组合 分页查询博客类别
 	 * @param map
 	 * @return
 	 */
 	List<BlogType> selectBlogTypeListByPage(Map<String, Object> map);
}
