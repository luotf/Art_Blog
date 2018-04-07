package com.luotf.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.luotf.mapper.BlogMapper;
import com.luotf.model.Blog;
import com.luotf.service.BlogService;

@Service
public class BlogServiceImpl implements BlogService{

	@Autowired
	private BlogMapper blogMapper;
	
	@Override
	public Blog selectBlogById(Integer id) {
		// TODO Auto-generated method stub
		return blogMapper.selectBlogById(id);
	}

	@Override
	public int insertBlog(Blog blog) {
		// TODO Auto-generated method stub
		return blogMapper.insertBlog(blog);
	}

	@Override
	public int insertBlogSelective(Blog blog) {
		// TODO Auto-generated method stub
		return blogMapper.insertBlogSelective(blog);
	}

	@Override
	public int deleteBlogById(Integer id) {
		// TODO Auto-generated method stub
		return blogMapper.deleteBlogById(id);
	}

	@Override
	public int updateBlogSelective(Blog blog) {
		// TODO Auto-generated method stub
		return blogMapper.updateBlogSelective(blog);
	}

	public List<Blog> selectBlogListByPage(Map<String, Object> map){
		
		return blogMapper.selectBlogListByPage(map);
	}

	@Override
	public List<Blog> selectBlogByTypeId(Integer id) {
		// TODO Auto-generated method stub
		return blogMapper.selectBlogByTypeId(id);
	}

	@Override
	public Blog selectPrevBlog(Integer id) {
		// TODO Auto-generated method stub
		return blogMapper.selectPrevBlog(id);
	}

	@Override
	public Blog selectNextBlog(Integer id) {
		// TODO Auto-generated method stub
		return blogMapper.selectNextBlog(id);
	}

	@Override
	public List selectBlogListByDate() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Long selectBlogCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Blog> selectLikeBlogListByPage(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return blogMapper.selectLikeBlogListByPage(map);
	}

	@Override
	public List<Blog> selectGroupLikeBlogListByPage(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return blogMapper.selectGroupLikeBlogListByPage(map);
	}
	
}
