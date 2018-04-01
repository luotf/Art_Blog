package com.luotf.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.luotf.mapper.BlogTypeMapper;
import com.luotf.model.Blog;
import com.luotf.model.BlogType;
import com.luotf.service.BlogTypeService;

@Service
public class BlogTypeServiceImpl implements BlogTypeService {
	@Autowired
	private BlogTypeMapper blogTypeMapper;
	
	/**
 	 * 按不同条件组合 分页查询博客类别
 	 * @param map
 	 * @return
 	 */
 	public List<BlogType> selectBlogTypeListByPage(Map<String, Object> map){
 		
 		return blogTypeMapper.selectBlogTypeListByPage(map);
 	}

}
