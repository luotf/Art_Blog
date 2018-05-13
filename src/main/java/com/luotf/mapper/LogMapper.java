package com.luotf.mapper;

import com.luotf.model.Log;

public interface LogMapper {
    int deleteByPrimaryKey(Integer id);
    
    int insert(Log record);

    int insertSelective(Log record);

    Log selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Log record);

    int updateByPrimaryKey(Log record);
}