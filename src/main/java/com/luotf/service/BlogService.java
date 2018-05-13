package com.luotf.service;

import java.util.List;
import java.util.Map;

import com.luotf.model.Blog;

public interface BlogService {

	/**
	 * @author Luotf
	 * @功能 根据id查询博客信息
	 */
	Blog selectBlogById(Integer id);

	/**
	 * @author Luotf
	 * @功能 插入全部博客信息
	 */
	int insertBlog(Blog blog);

	/**
	 * @author Luotf
	 * @功能 插入个别博客信息
	 */
	int insertBlogSelective(Blog blog);

	/**
	 * @author Luotf
	 * @功能 根据id删除博客信息
	 */
	int deleteBlogById(Integer id);

	/**
	 * @author Luotf
	 * @功能 根据blog来更新博客信息
	 */
	int updateBlogSelective(Blog blog);

	/**
	 * 分页查询博客
	 * 
	 * @param map
	 * @return
	 */
	List<Blog> selectBlogListByPage(Map<String, Object> map);

	/**
 	 * 模糊分页查询博客
 	 * @param map
 	 * @return
 	 */

 	List<Blog> selectLikeBlogListByPage(Map<String, Object> map);
 	
 	/**
 	 * 模糊分页组合查询博客
 	 * @param map
 	 * @return
 	 */

 	List<Blog> selectGroupLikeBlogListByPage(Map<String, Object> map);
 	
 	
 	List<Blog> selectLikeBlogListByPageWithBlobs(Map<String, Object> map);
 	
 	List selectBlogByClick();
 	
	List<Blog> selectBlogByTypeId(Integer id);

	/**
	 * 获取上一篇博客
	 * 
	 * @param id
	 * @return
	 */
	Blog selectPrevBlog(Integer id);

	/**
	 * 获取下一篇一篇博客
	 * 
	 * @param id
	 * @return
	 */
	Blog selectNextBlog(Integer id);

	/**
	 * 获取博客信息，根据日期月份分组查询
	 * 
	 * @return
	 */
	List selectBlogListByDate(Map<String, Object> map);

	/**
	 * 根据组合条件获取Blog条数
	 * 
	 * @param map
	 * @return
	 */
	Long selectBlogCount(Map<String, Object> map);


 	/**
 	 *  获取博客信息，根据状态分组查询
 	 * @return
 	 */
	List  selectBlogListByStatus();
}
