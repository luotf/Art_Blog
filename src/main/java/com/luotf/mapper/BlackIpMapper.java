package com.luotf.mapper;

import java.util.List;
import java.util.Map;

import com.luotf.model.BlackIp;

public interface BlackIpMapper {
	
    int deleteByPrimaryKey(Integer id);

    int insert(BlackIp record);

    int insertSelective(BlackIp record);

    BlackIp selectByPrimaryKey(Integer id);

    BlackIp selectBlackIpByIp(String ip);
    
    int updateByPrimaryKeySelective(BlackIp record);

    int updateByPrimaryKey(BlackIp record);
    
    /**
     * 模糊查询
     * @param map
     * @return
     */
    List<BlackIp> selectLikeBlackIpListByPage(Map<String, Object> map);
    
    Long selectAllBlackIpCount();
}