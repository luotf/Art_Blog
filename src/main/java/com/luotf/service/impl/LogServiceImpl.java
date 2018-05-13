package com.luotf.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.luotf.mapper.LogMapper;
import com.luotf.model.Log;
import com.luotf.service.LogService;

@Service
public class LogServiceImpl implements LogService {

	@Autowired
	private LogMapper logMapper;
	
	@Override
	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return logMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(Log record) {
		// TODO Auto-generated method stub
		return logMapper.insert(record);
	}

	@Override
	public int insertSelective(Log record) {
		// TODO Auto-generated method stub
		return logMapper.insert(record);
	}

	@Override
	public Log selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return logMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(Log record) {
		// TODO Auto-generated method stub
		return logMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Log record) {
		// TODO Auto-generated method stub
		return logMapper.updateByPrimaryKey(record);
	}

}
