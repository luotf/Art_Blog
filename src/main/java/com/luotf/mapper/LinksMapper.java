package com.luotf.mapper;

import java.util.List;
import java.util.Map;

import com.luotf.model.Links;

public interface LinksMapper {
   
    int deleteByPrimaryKey(Integer id);

    int insert(Links record);

    int insertSelective(Links record);
    
    Links selectByPrimaryKey(Integer id);
    
    /**
     * 模糊查询
     * @param map
     * @return
     */
    List<Links> selectLikeLinksListByPage(Map<String, Object> map);
    
    List<Links> selectAllLinks();
    
    int selectNoApplyLinksCount();
    
    /**
 	 *  获取友链信息，根据状态分组查询
 	 * @return
 	 */
 	List<?>  selectLinksListByStatus();
    
    int updateByPrimaryKeySelective(Links record);

    int updateByPrimaryKey(Links record);
}