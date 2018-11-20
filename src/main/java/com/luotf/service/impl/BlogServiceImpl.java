package com.luotf.service.impl;

import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.luotf.mapper.BlogMapper;
import com.luotf.mapper.BlogTypeMapper;
import com.luotf.model.Blog;
import com.luotf.model.BlogType;
import com.luotf.service.BlogService;

@Service
public class BlogServiceImpl implements BlogService {

  @Autowired private BlogMapper blogMapper;
  @Autowired private BlogTypeMapper blogTypeMapper;

  public static final AtomicInteger count = new AtomicInteger(0);

  @Override
  public Blog selectBlogById(Integer id) {
    // TODO Auto-generated method stub
    Blog blog = blogMapper.selectBlogById(id);
    if (blog != null) {
      synchronized (blog) {
        count.getAndIncrement();
        blog.setClicknum(blog.getClicknum() + count.get());
        // 十条记录 往数据库写入 一次
        if (count.get() >= 5) {
          blogMapper.updateBlogSelective(blog);
          count.set(0);
        }
      }
    }
    return blog;
  }

  @Override
  public int insertBlog(Blog blog) {
    // TODO Auto-generated method stub
    if (blogMapper.insertBlog(blog) != 0) {
      if (blog.getStatus() == 1) {
        BlogType blogType = blogTypeMapper.selectBlogTypeById(blog.getType().getId());
        blogType.setNum(blogType.getNum() + 1);
        return blogTypeMapper.updateBlogTypeSelective(blogType);
      } else {
        return 1;
      }
    }
    return 0;
  }

  @Override
  public int insertBlogSelective(Blog blog) {
    // TODO Auto-generated method stub
    return blogMapper.insertBlogSelective(blog);
  }

  @Override
  public int deleteBlogById(Integer id) {
    // TODO Auto-generated method stub
    Blog blog = blogMapper.selectBlogById(id);
    if (blogMapper.deleteBlogById(id) != 0) {
      BlogType blogType = blogTypeMapper.selectBlogTypeById(blog.getType().getId());
      blogType.setNum(blogType.getNum() - 1);
      return blogTypeMapper.updateBlogTypeSelective(blogType);
    }
    return 0;
  }

  @Override
  public int updateBlogSelective(Blog blog) {
    // TODO Auto-generated method stub
    Blog oldBlog = blogMapper.selectBlogById(blog.getId());
    if (blog.getType() == null && blog.getStatus() == null) {
      return blogMapper.updateBlogSelective(blog);
    }

    if (blogMapper.updateBlogSelective(blog) != 0) {
      if (blog.getStatus() == 1) {
        if (oldBlog.getStatus() == 1) {
          BlogType oldBlogType = blogTypeMapper.selectBlogTypeById(oldBlog.getType().getId());
          oldBlogType.setNum(oldBlogType.getNum() - 1);
          blogTypeMapper.updateBlogTypeSelective(oldBlogType);
        }
        BlogType blogType = null;
        if (blog.getType() == null) {
          blogType = blogTypeMapper.selectBlogTypeById(oldBlog.getType().getId());
        } else {
          blogType = blogTypeMapper.selectBlogTypeById(blog.getType().getId());
        }
        blogType.setNum(blogType.getNum() + 1);
        return blogTypeMapper.updateBlogTypeSelective(blogType);
      } else {
        if (oldBlog.getStatus() == 1) {
          BlogType oldBlogType = blogTypeMapper.selectBlogTypeById(oldBlog.getType().getId());
          oldBlogType.setNum(oldBlogType.getNum() - 1);
          return blogTypeMapper.updateBlogTypeSelective(oldBlogType);
        }
        return 1;
      }
    } else {
      return 0;
    }
  }

  public List<Blog> selectBlogListByPage(Map<String, Object> map) {

    return blogMapper.selectBlogListByPage(map);
  }

  @Override
  public List<Blog> selectBlogByTypeId(Integer id) {
    // TODO Auto-generated method stub
    return blogMapper.selectBlogByTypeId(id);
  }

  @Override
  public Blog selectPrevBlog(Integer id) {
    // TODO Auto-generated method stub
    return blogMapper.selectPrevBlog(id);
  }

  @Override
  public Blog selectNextBlog(Integer id) {
    // TODO Auto-generated method stub
    return blogMapper.selectNextBlog(id);
  }

  @Override
  public List<?> selectBlogListByDate(Map<String, Object> map) {
    // TODO Auto-generated method stub
    return blogMapper.selectBlogListByDate(map);
  }

  @Override
  public Long selectBlogCount(Map<String, Object> map) {
    // TODO Auto-generated method stub
    return null;
  }

  @Override
  public List<Blog> selectLikeBlogListByPage(Map<String, Object> map) {
    // TODO Auto-generated method stub
    return blogMapper.selectLikeBlogListByPage(map);
  }

  @Override
  public List<Blog> selectGroupLikeBlogListByPage(Map<String, Object> map) {
    // TODO Auto-generated method stub
    return blogMapper.selectGroupLikeBlogListByPage(map);
  }

  @Override
  public List<?> selectBlogListByStatus() {
    // TODO Auto-generated method stub
    return blogMapper.selectBlogListByStatus();
  }

  @Override
  public List<Blog> selectLikeBlogListByPageWithBlobs(Map<String, Object> map) {
    // TODO Auto-generated method stub
    return blogMapper.selectLikeBlogListByPageWithBlobs(map);
  }

  @Override
  public List<?> selectBlogByClick() {
    // TODO Auto-generated method stub
    return blogMapper.selectBlogByClick();
  }
}
