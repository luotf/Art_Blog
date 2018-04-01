package com.luotf.mapper;

import com.luotf.model.Comment;

public interface CommentMapper {
   
    int deleteByPrimaryKey(Integer id);

   
    int insert(Comment record);

    
    int insertSelective(Comment record);

    
    Comment selectByPrimaryKey(Integer id);

    
    int updateByPrimaryKeySelective(Comment record);

    
    int updateByPrimaryKey(Comment record);
}