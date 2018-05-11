<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>首页_个人博客 - 一个在Java道路上的技术员个人博客网站</title>
<meta name="keywords" content="个人博客,罗廷方个人博客,罗廷方" />
<meta name="description" content="罗廷方个人博客，是一个在Java道路上的技术员个人博客网站" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="${pageContext.request.contextPath}/css/base.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/animate.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/font-awesome.css"
	rel="stylesheet">
</head>
<body>
<%@ include file="top.jsp" %>
<article>
  <div class="pics ">
    <ul >
      
    </ul>
  </div>
  
  
  <div class="leftbox ">
    <div class="tuijian" style="margin: 0px ">
      <h2 class="hometitle "><span><a href="list.jsp">资源分享</a><a href="list.jsp">技术专栏</a><a href="/">面试宝典</a><a href="/">热门标签</a></span>特别推荐</h2>
      <ul class="animated fadeInDown">
        
      </ul>
    </div>
    <div class="newblogs">
      <h2 class="hometitle">最新文章</h2>
      <ul class="animated fadeInDown">
        
      </ul>
    </div>
  </div>
  
  
  <div class="rightbox">
    <div class="aboutme">
      <h2 class="ab_title ">关于我</h2>
      <div class="avatar animated fadeInDown"><img src="${pageContext.request.contextPath}/images/my.jpeg"/></div>
      <div class="ab_con animated fadeInDown">
        <p>网名：我倾尽一生,囚你无期 | Luotf</p>
        <p>职业：Java开发工程师 | 全栈 </p>
        <p>籍贯：四川省—成都市</p>
        <p>邮箱：849673404@qq.com</p>
      </div>
    </div>
    <div class="paihang">
      <h2 class="ab_title"><a href="/">点击排行</a></h2>
      <ul class="animated fadeInDown">
        
      </ul>
      <div class="ad"><img src="${pageContext.request.contextPath}/images/ad300x100.jpg"></div> 
    </div>
    <div class="links">
      <h2 class="ab_title">友情链接</h2>
      <ul class="animated fadeInDown">
        <li><a href="/">XXX Github</a></li>
        <li><a href="/">XXX Gitee&nbsp;&nbsp;</a></li>
        <li><a href="/">优秀个人博客</a></li>
      </ul>
    </div>
    <div class="weixin">
      <h2 class="ab_title">公众号</h2>
      <ul class="animated fadeInDown">
        <img src="${pageContext.request.contextPath}/images/wx.jpg">
      </ul>
    </div>
  </div>
</article>

<%@ include file="fonter.jsp" %>
<!-- 全局js -->
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/layer/layer.js"></script>
<script>
window.onload = function (){
	var oH2 = document.getElementsByTagName("h2")[0];
	var oUl = document.getElementsByTagName("ul")[0];
	oH2.onclick = function ()
	{
		var style = oUl.style;
		style.display = style.display == "block" ? "none" : "block";
		oH2.className = style.display == "block" ? "open" : ""
	}
}
	$(document).ready(function() {
		initBlogByTop();              //初始化置顶的3篇文章
		initBlogByLike();             //初始化特别推荐6篇文章
		initBlogByNew();   			  //初始化最新5篇文章
		initBlogByClick();   			//初始化点击排行5篇文章
	});
	
	var initBlogByTop=function(){
		//设置参数
		var params ={
				 pageSize: 3,
		         page:1,
		         istop:1  //1 表示置顶
		};
		$.ajax({
            url:'../admin/selectGroupLikeBlogListByPage',    
            type:'get',
            data:params,
            dataType:'json',    
            success:function (data) {
            	var topBlog='';
            	var data=data.blogList;
                for (var i = 0; i < data.length; i++) {
                	var id=data[i].id.toString(8)*data[i].id;
                	topBlog+='<li><a href="find/'+id+'.html" onclick=""><img style="width:415px;height:155px;" src="'+data[i].images+'"></a><span>'+data[i].title+'</span></li>'
                }
                // 初始化数据
                $(".pics").find("ul").html(topBlog);
            },    
		    error:function(){
		    	layer.msg('请求太快，请稍后再试！', {icon: 5});
		    }	
        });
	};
	
	//初始化推荐
	var initBlogByLike=function(){
		//设置参数
		var params ={
				 pageSize: 6,
		         page:1,
		         isrecommend:1  //1 表示置顶
		};
		$.ajax({
            url:'../admin/selectGroupLikeBlogListByPage',    
            type:'get',
            data:params,
            dataType:'json',    
            success:function (data) {
            	var likeBlog='';
            	var data=data.blogList;
                for (var i = 0; i < data.length; i++) {
                	var id=data[i].id.toString(8)*data[i].id;
                	likeBlog+='<li><div class="tpic"><img src="'+data[i].images+'"></div><b>'+data[i].title+'</b><span>'+data[i].introduction+'</span><a href="find/'+id+'.html" class="readmore">阅读原文</a></li>'
                }
                // 初始化数据
                $(".tuijian").find("ul").html(likeBlog);
            },    
		    error:function(){
		    	layer.msg('请求太快，请稍后再试！', {icon: 5});
		    }	
        });
	};
	
	//初始化最新文章
	var initBlogByNew=function(){
		//设置参数
		var params ={
				 pageSize: 5,
		         page:1,
		};
		$.ajax({
            url:'../admin/selectGroupLikeBlogListByPage',    
            type:'get',
            data:params,
            dataType:'json',    
            success:function (data) {
            	var newBlog='';
            	var data=data.blogList;
            	
                for (var i = 0; i < data.length; i++) {
                	var id=data[i].id.toString(8)*data[i].id;
                	var keyword="";
                  	if(data[i].keyword!=""&&data[i].keyword!=null){
                  		if(data[i].keyword.search(';')!=-1){
                  			keyword=data[i].keyword.replace(/;/g,"|");
                  		}else{
                  			keyword=data[i].keyword;
                  		}
                  	}
                	
                	newBlog+='<li><h3 class="blogtitle"><a href="find/'+id+'.html"  >'+data[i].title+'</a></h3><div class="bloginfo"><span class="blogpic"><a href="find/'+id+'.html" title=""><img src="'+data[i].images+'"  /></a></span><p>'+data[i].introduction+'</p></div><div class="autor"><span style="float:left;padding:0;color: #38485a"><i class="fa fa-user" style="color: #88827dcc;"></i>&nbsp;罗廷方</span><span class="lm f_l"><a href="javascript:void(0);">'+keyword+'</a></span><span class="dtime f_l">'+Format(data[i].addtime,"yyyy-MM-dd")+'</span><span class="viewnum f_l">浏览<b>（<a href="javascript:void(0);">'+data[i].clicknum+'</a></b>）</span><span class="pingl f_l">评论（<b><a href="javascript:void(0);">'+data[i].commentnum+'</a></b>）</span><span class="f_r"><a href="find/'+id+'.html" class="more">阅读原文>></a></span></div></li>'
                }
                // 初始化数据
                $(".newblogs").find("ul").html(newBlog);
            },    
		    error:function(){
		    	layer.msg('请求太快，请稍后再试！', {icon: 5});
		    }	
        });
	};
	
	//初始化点击排行
	var initBlogByClick=function(){
		//设置参数
		var params ={
				 pageSize: 5,
		         page:1,
		         sort:"clickNum",   //按点击量排序,默认按时间
		};
		$.ajax({
            url:'../admin/selectGroupLikeBlogListByPage',    
            type:'get',
            data:params,
            dataType:'json',    
            success:function (data) {
            	var clickBlog='';
            	var data=data.blogList;
            	 
                for (var i = 0; i < data.length; i++) {
                	
                	if(data[i].introduction.length>35){
                		data[i].introduction=data[i].introduction.substring(0,34)+"...";
                	}
                	var id=data[i].id.toString(8)*data[i].id;
                	clickBlog+='<li><b><a href="find/'+id+'.html">'+data[i].title+'</a></b><p>'+data[i].introduction+'</p></li>'
                }
                // 初始化数据
                $(".paihang").find("ul").html(clickBlog);
            },    
		    error:function(){
		    	layer.msg('请求太快，请稍后再试！', {icon: 5});
		    }	
        });
	};
	
	 	
          //格式化时间
        	function Format(datetime, fmt) {
        	    if (parseInt(datetime) == datetime) {
        	        if (datetime.length == 10) {
        	            datetime = parseInt(datetime) * 1000;
        	        }else if (datetime.length == 13) {
        	            datetime = parseInt(datetime);
        	        }
        	    }
        	    datetime = new Date(datetime);
        	    var o = {
        	        "M+": datetime.getMonth() + 1,                 //月份   
        	        "d+": datetime.getDate(),                    //日   
        	        "h+": datetime.getHours(),                   //小时   
        	        "m+": datetime.getMinutes(),                 //分   
        	        "s+": datetime.getSeconds(),                 //秒   
        	        "q+": Math.floor((datetime.getMonth() + 3) / 3), //季度   
        	        "S": datetime.getMilliseconds()             //毫秒   
        	    };
        	    if (/(y+)/.test(fmt))
        	        fmt = fmt.replace(RegExp.$1, (datetime.getFullYear() + "").substr(4 - RegExp.$1.length));
        	    for (var k in o)
        	        if (new RegExp("(" + k + ")").test(fmt))
        	            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        	    return fmt;
        	}   	
        
    </script>





</body>
</html>
