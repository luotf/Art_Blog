package com.luotf.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.luotf.mapper.BlogMapper;
import com.luotf.mapper.BlogerMapper;
import com.luotf.model.Bloger;
import com.luotf.service.BlogerService;
@Service
public class BlogerServiceImpl implements BlogerService {


	@Autowired
	private BlogerMapper blogerMapper;
	
	@Override
	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return blogerMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(Bloger record) {
		// TODO Auto-generated method stub
		return blogerMapper.insert(record);
	}

	@Override
	public int insertSelective(Bloger record) {
		// TODO Auto-generated method stub
		return blogerMapper.insertSelective(record);
	}

	@Override
	public Bloger selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return blogerMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(Bloger record) {
		// TODO Auto-generated method stub
		return blogerMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Bloger record) {
		// TODO Auto-generated method stub
		return blogerMapper.updateByPrimaryKey(record);
	}

	@Override
	public Bloger findUserByLoginName(String name) {
		// TODO Auto-generated method stub
		return blogerMapper.findUserByLoginName(name);
	}

}
