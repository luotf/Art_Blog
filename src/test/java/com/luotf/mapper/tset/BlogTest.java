package com.luotf.mapper.tset;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.generator.logging.Log;
import org.mybatis.generator.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.luotf.mapper.BlogMapper;
import com.luotf.mapper.BlogTypeMapper;
import com.luotf.model.Blog;
import com.luotf.model.BlogType;
import com.luotf.service.BlogService;

@RunWith(SpringJUnit4ClassRunner.class) // 表示继承了SpringJUnit4ClassRunner类 
@ContextConfiguration(locations = {"classpath:spring/applicationContext-*.xml" }) 
public class BlogTest{
	private Log log = LogFactory.getLog(BlogTest.class);
	
	
	@Autowired
	private BlogService blogService;
	@Autowired
	private BlogTypeMapper blogTypeMapper;
	@Autowired
	private BlogMapper blogMapper;
	
    @Test
    public void selectByExample()  {
    	//意思是从第1页开始，每页显示3条记录
    	
    	Map map=new HashMap();
    	map.put("title", "罗");
    //	map.put("addTime", "2018-03-28");
    	//map.put(key, value)
    	PageHelper.startPage(1, 3);
    	List<Blog> blogList=blogService.selectBlogListByPage(map);
    	//分页的信息
    	PageInfo<Blog> p=new PageInfo<Blog>(blogList);
    	for(Blog b:blogList){
    		System.out.println(b);
    	}
    	System.out.println("总记录数："+p.getTotal());
    	System.out.println("总页数："+p.getPages());
    	System.out.println("当前页："+p.getPageNum());
    	System.out.println("每页的数量："+p.getPageSize());
    	System.out.println("当前页数量："+p.getSize());
    	
    	
    	List<Map> list=blogMapper.selectBlogListByDate();
    	for(Map map1:list){
    		System.out.println(map1);
    	}
    	
    	
    }
    @Test
    public void subString() {  
    	Map map=new HashMap();
    	//map.put("typeName", "数");
    	List<BlogType> typeList=blogTypeMapper.selectBlogTypeListByPage(map);
        for(BlogType type:typeList){
        	System.out.println(type);
        }
    	/*BlogType type=blogTypeMapper.selectBlogTypeById(3);
    	System.out.println(type);*/
    }  
    @Test
    public void deleteBlog() throws Exception{
		 Map map=new HashMap();
		 List list=blogService.selectBlogListByStatus();
		 
		System.out.println(list);
	 }

}