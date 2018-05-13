package com.luotf.mapper;

import java.util.List;
import java.util.Map;

import com.luotf.model.RResource;

public interface ResourceMapper {
	
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
    
    /**
 	 *  获取资源信息，根据状态分组查询
 	 * @return
 	 */
 	List<?>  selectResourceListByStatus();
    
    int updateByPrimaryKeySelective(RResource record);
    
    int updateByPrimaryKey(RResource record);
}