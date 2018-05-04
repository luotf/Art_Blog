package com.luotf.service;

import com.luotf.model.Visit;

public interface VisitService {

	int deleteByPrimaryKey(Integer id);

    int insert(Visit record);

    int insertSelective(Visit record);

    Visit selectByPrimaryKey(Integer id);

    Visit selectVisitByIp(String ip);
    
    Long findVisitTimes(Visit visit);
    
    int updateByPrimaryKeySelective(Visit record);

    int updateByPrimaryKey(Visit record);
}
