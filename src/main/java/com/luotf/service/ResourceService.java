package com.luotf.service;

import java.util.List;
import java.util.Map;

import com.luotf.model.RResource;

public interface ResourceService {

	    int deleteByPrimaryKey(Integer id);
	    
	    int insert(RResource record);

	    int insertSelective(RResource record);

	    RResource selectByPrimaryKey(Integer id);

	    /**
	     * 模糊查询
	     * @param map
	     * @return
	     */
	    List<RResource> selectLikeResourceListByPage(Map<String, Object> map);
	    
	    int updateByPrimaryKeySelective(RResource record);
	    
	    int updateByPrimaryKey(RResource record);
}
