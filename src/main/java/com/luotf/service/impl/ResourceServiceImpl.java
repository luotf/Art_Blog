package com.luotf.service.impl;

import java.util.List;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.luotf.mapper.ResourceMapper;
import com.luotf.model.RResource;
import com.luotf.service.ResourceService;

@Service
public class ResourceServiceImpl implements ResourceService {
	@Autowired
	private ResourceMapper resourceMapper;
	
	@Override
	public int deleteByPrimaryKey(Integer id) {
		
		return resourceMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(RResource record) {
		// TODO Auto-generated method stub
		return resourceMapper.insert(record);
	}

	@Override
	public int insertSelective(RResource record) {
		// TODO Auto-generated method stub
		return resourceMapper.insertSelective(record);
	}

	@Override
	public RResource selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return resourceMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<RResource> selectLikeResourceListByPage(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return resourceMapper.selectLikeResourceListByPage(map);
	}

	@Override
	public int updateByPrimaryKeySelective(RResource record) {
		// TODO Auto-generated method stub
		return resourceMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(RResource record) {
		// TODO Auto-generated method stub
		return resourceMapper.updateByPrimaryKey(record);
	}

	@Override
	public List selectResourceListByStatus() {
		// TODO Auto-generated method stub
		return resourceMapper.selectResourceListByStatus();
	}

}
