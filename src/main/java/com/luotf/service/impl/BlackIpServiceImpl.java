package com.luotf.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.luotf.mapper.BlackIpMapper;
import com.luotf.model.BlackIp;
import com.luotf.service.BlackIpService;

@Service
public class BlackIpServiceImpl implements BlackIpService {
	
	@Autowired
	private BlackIpMapper blackIpMapper;
	
	@Override
	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return blackIpMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(BlackIp record) {
		// TODO Auto-generated method stub
		return blackIpMapper.insert(record);
	}

	@Override
	public int insertSelective(BlackIp record) {
		// TODO Auto-generated method stub
		return blackIpMapper.insertSelective(record);
	}

	@Override
	public BlackIp selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return blackIpMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(BlackIp record) {
		// TODO Auto-generated method stub
		return blackIpMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(BlackIp record) {
		// TODO Auto-generated method stub
		return blackIpMapper.updateByPrimaryKey(record);
	}

	@Override
	public BlackIp selectBlackIpByIp(String ip) {
		// TODO Auto-generated method stub
		return blackIpMapper.selectBlackIpByIp(ip);
	}

	@Override
	public Long selectAllBlackIpCount() {
		// TODO Auto-generated method stub
		return blackIpMapper.selectAllBlackIpCount();
	}

	@Override
	public List<BlackIp> selectLikeBlackIpListByPage(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return blackIpMapper.selectLikeBlackIpListByPage(map);
	}

}
