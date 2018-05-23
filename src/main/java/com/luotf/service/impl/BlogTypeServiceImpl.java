package com.luotf.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.luotf.mapper.BlogMapper;
import com.luotf.mapper.BlogTypeMapper;
import com.luotf.model.BlogType;
import com.luotf.service.BlogTypeService;

@Service
public class BlogTypeServiceImpl implements BlogTypeService {
	@Autowired
	private BlogTypeMapper blogTypeMapper;
	@Autowired
	private BlogMapper blogMapper;
	
	/**
 	 * 按不同条件组合 分页查询博客类别
 	 * @param map
 	 * @return
 	 */
 	public List<BlogType> selectBlogTypeListByPage(Map<String, Object> map){
 		
 		return blogTypeMapper.selectBlogTypeListByPage(map);
 	}

	@Override
	public int insertBlogType(BlogType record) {
		// TODO Auto-generated method stub
		return blogTypeMapper.insertBlogTypeSelective(record);
	}

	@Override
	public BlogType selectBlogTypeById(Integer id) {
		// TODO Auto-generated method stub
		return blogTypeMapper.selectBlogTypeById(id);
	}

	@Override
	public int updateBlogTypeSelective(BlogType record) {
		if(blogTypeMapper.updateBlogTypeSelective(record)!=0){
			return blogMapper.refreshCache();
		}
		return 0;
	}

	@Override
	public BlogType selectBlogTypeByName(String typename) {
		// TODO Auto-generated method stub
		return blogTypeMapper.selectBlogTypeByName(typename);
	}

	@Override
	public int deleteBlogTypeById(Integer id) {
		if(blogTypeMapper.deleteBlogTypeById(id)!=0){
			return blogMapper.refreshCache();
		}
		return 0;
	}
}
