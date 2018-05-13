package com.luotf.mapper;

import java.util.List;
import java.util.Map;

import com.luotf.model.Visit;

public interface VisitMapper {
	
    int deleteByPrimaryKey(Integer id);

    int insert(Visit record);

    int insertSelective(Visit record);

    Visit selectByPrimaryKey(Integer id);
    
    Visit selectVisitByIp(String ip);

    Long findVisitTimes(Visit visit);
    
    /**
    * 模糊查询
    * @param map
    * @return
    */
   List<Visit> selectLikeVisitListByPage(Map<String, Object> map);
    
   
   /**
    * 模糊查询  and 分组显示
    * @param map
    * @return
    */
   List<?> selectLikeVisitListGroupByIp(Map<String, Object> map);
   
    /**
 	 *  根据日期月份分组查询
 	 * @return
 	 */
 	List<?>  selectVisitListByDate(Map<String, Object> map);
 	
 	
 	/**
 	 *  根据IP分组查询
 	 * @return
 	 */
 	List<?>  selectVisitListByIp(Map<String, Object> map);
 	
 	
    int updateByPrimaryKeySelective(Visit record);

    int updateByPrimaryKey(Visit record);
}