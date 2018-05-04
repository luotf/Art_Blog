package com.luotf.service;

import java.util.List;
import java.util.Map;

import com.luotf.model.Visit;

public interface VisitService {

	int deleteByPrimaryKey(Integer id);

    int insert(Visit record);

    int insertSelective(Visit record);

    Visit selectByPrimaryKey(Integer id);

    Visit selectVisitByIp(String ip);
    
    Long findVisitTimes(Visit visit);
    
    /**
   	 *  根据日期月份分组查询
   	 * @return
   	 */
   	List  selectVisitListByDate(Map<String, Object> map);
    
    int updateByPrimaryKeySelective(Visit record);

    int updateByPrimaryKey(Visit record);
}
