<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="baidu-site-verification" content="Eg9tVrHSEK" />
<title>首页_个人博客 - 一个在Java道路上的技术员个人博客网站</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.ico"> 
<meta name="keywords" content="个人博客,罗廷方个人博客,罗廷方" />
<meta name="description" content="罗廷方个人博客，是一个在Java道路上的技术员个人博客网站" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="${pageContext.request.contextPath}/css/base.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/animate.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/font-awesome.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/loaders.css"
	rel="stylesheet">
<style type="text/css">
	.loader-inner > div{
		background-color: #907f819e
	}
</style>
</head>

<body style="background:url(${pageContext.request.contextPath}/images/bj.png) repeat top left scroll;z-index:-1">
<%@ include file="top.jsp" %>
<article style="opacity:0">
  <div class="pics ">
    <ul >
      <li></li>
      <li></li>
      <li></li>
    </ul>
  </div>
  
  
  <div class="leftbox ">
    <div class="tuijian" style="margin: 0px ">
      <h2 class="hometitle "></span>特别推荐</h2>
      <ul class="animated ">
        
      </ul>
    </div>
    <div class="newblogs animated fadeInUp" style="display:none;animation-delay:0.3s">
      <h2 class="hometitle">最新文章</h2>
      <ul class="animated ">
        
      </ul>
      <p class="page" style='display:none'>
				
      <p>
      <p class="pageMin">
				
      <p>
    </div>
    <a class="top animated fadeIn" onclick="window.scrollTo(0,0)" style="display:none;z-index:0;font-size: 24px;position: fixed;bottom: 12%;right: 30%;color:#fff"><span style="padding: 6.5px 12px;background-color: #fff;color: #999;"><i class="fa fa-angle-up"></i></span></a>
  </div>
  
  
  <div class="rightbox">
    <div class="aboutme">
      <h3 class="ab_title "><a href="javascript:void(0)">关于我</a></h3>
      <div class="avatar"><img src="${pageContext.request.contextPath}/images/my.jpeg"/></div>
      <div class="ab_con ">
        <p>网名：我倾尽一生,囚你无期 | Luotf</p>
        <p>职业：Java开发工程师 | 全栈 </p>
        <p>籍贯：四川省—成都市</p>
        <p>邮箱：849673404@qq.com</p>
      </div>
    </div>
    <div class="dj paihang animated fadeInUp" style="display:none;animation-delay:0.3s">
      <h3 class="ab_title"><a href="javascript:void(0)">点击排行</a></h3>
      <ul class="">
        
      </ul>
      <div class="ad"></div> 
    </div>
    <div class="git links animated fadeInUp" style="display:none;animation-delay:0.3s">
      <h3 class="ab_title"><a href="javascript:void(0)">开源项目</a></h3>
      <ul class="animated fadeIn">
        <li ><a href="https://github.com/luotf" target= "_blank">Github</a></li>
        <li ><a href="https://gitee.com/luotf" target= "_blank">Gitee&nbsp;&nbsp;</a></li>
      </ul>
    </div>
    <div class="weixin animated fadeInUp" style="display:none;animation-delay:0.3s">
      <h3 class="ab_title">公众号</h3>
      <ul class="animated fadeIn">
        <img src="${pageContext.request.contextPath}/images/wx.jpg" >
      </ul>
    </div>
    <div class="link links animated fadeInUp" style="display:none;animation-delay:0.3s">
      <h3 class="ab_title"><a href="javascript:void(0)">友情链接</a></h3>
      <ul class="animated fadeIn">
        <li style="float:left;margin: 0 1% 10px 0;padding:3px;"><a href="javascript:void(0)">优秀客</a></li>
        <li style="float:left;margin: 0 1% 10px 0;padding:3px;"><a href="javascript:void(0)">优秀个</a></li>
        <li style="float:left;margin: 0 1% 10px 0;padding:3px;"><a href="javascript:void(0)">优个</a></li>
        <li style="float:left;margin: 0 1% 10px 0;padding:3px;"><a href="javascript:void(0)">优秀个</a></li>
        <li style="float:left;margin: 0 1% 10px 0;padding:3px;"><a href="javascript:void(0)">优个</a></li>
        <li style="float:left;margin: 0 1% 10px 0;padding:3px;"><a href="javascript:void(0)">优秀个</a></li>
        <li style="float:left;margin: 0 1% 10px 0;padding:3px;"><a href="javascript:void(0)">优个</a></li>
        <li style="float:left;margin: 0 1% 10px 0;padding:3px;"><a href="javascript:void(0)">优博客</a></li>
        <li style="float:left;margin: 0 1% 10px 0;padding:3px;"><a href="javascript:void(0)">优秀个</a></li>
        <li style="float:left;margin: 0 1% 10px 0;padding:3px;"><a href="javascript:void(0)">个博客</a></li>
        <li style="float:left;margin: 0 1% 10px 0;padding:3px;"><a href="javascript:void(0)">优秀个</a></li>
        <li style="float:left;margin: 0 1% 10px 0;padding:3px;"><a href="javascript:void(0)">个博客</a></li>
      </ul>
    </div>
    
  </div>
</article>

<%@ include file="fonter.jsp" %>
<!-- 全局js -->
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/layer/layer.js"></script>
<script>

var globalCount=0;
for(var i=1;i<=7;i++){
	if(i==1){
		$(".1 a").addClass("nav_color");
	}else{
		$('.'+i+' a').removeClass("nav_color");
	}
}
var pageNext=1;
var count=1;
var isEnd=false;
var width = window.innerWidth || document.documentElement.clientWidth; 
if (width < 660) {
	var pagenav='<p style="text-align:center;margin:-5px auto 20px;"><a href="javascript:void(0);" onclick="initBlogByClickMore()"><i class="fa fa-arrow-down"></i> 加载更多</a></p>';
	$(".pageMin").html(pagenav);
	$(".top").css("display","none");
}
$(window).scroll(function(){
	if(isEnd == true){
           return;
     } 
	if($(document).scrollTop()>110&&count==1){
			$(".dj").css("display","block");
			initBlogByClick();   			//初始化点击排行5篇文章
			count++;
	}
	if($(document).scrollTop()>400&&count==2){
		$(".newblogs").css("display","block");
		initBlogByNew(1);   			  //初始化最新5篇文章
		count++;
    }
	if($(document).scrollTop()>870&&count==3){
		$(".git").css("display","block");
		count++;
    }
	if($(document).scrollTop()>1070&&count==4){
		$(".weixin").css("display","block");
		count++;
    }
	if($(document).scrollTop()>1250&&count==5){
		$(".link").css("display","block");
		initAllLinks();   			  //初始化所有已上架友链
		count++;
    }
	if($(document).scrollTop()>1300&&width>700){
		$(".top").css("display","block");
	}else{
		$(".top").css("display","none");
	}
	if ($(document).scrollTop() + 50 >= $(document).height() - $(window).height()&&width>700) {
	       	isEnd=true;
	       	$('.page').css('display','block');
	       	setTimeout(function () {
	       		initBlogByNew(pageNext);
			},500); 
		   }
});



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
	});
	
	var initBlogByClickMore=function(){
		setTimeout(function () {
			initBlogByNew(pageNext);
		},200);
	}
	
	var returnAllCount=function(){
		if(globalCount==2){
			setTimeout(function () {
				$('article').css('opacity','1');
			},200);
		}
	}
	
	var initBlogByTop=function(){
		//设置参数
		var params ={
				 pageSize: 3,
		         page:1,
		         istop:1,  //1 表示置顶
		         status:1
		};
		$.ajax({
            url:'${pageContext.request.contextPath}/selectGroupLikeBlogListByPage',    
            type:'get',
            data:params,
            dataType:'json',    
            success:function (data) {
            	var topBlog='';
            	var data=data.blogList;
                for (var i = 0; i < data.length; i++) {
                	var id=data[i].id.toString(8)*data[i].id;
                	topBlog+='<li class="animated fadeIn"><a href="${pageContext.request.contextPath}/find/'+id+'.html" onclick=""><img style="width:415px;height:155px;" src="'+data[i].images+'"></a><span>'+data[i].title+'</span></li>'
                }
                // 初始化数据
                $(".pics").find("ul").html(topBlog);
                globalCount++;
				 returnAllCount();
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
		         isrecommend:1,  //1 表示推荐
		         status:1
		};
		$.ajax({
            url:'${pageContext.request.contextPath}/selectGroupLikeBlogListByPage',    
            type:'get',
            data:params,
            dataType:'json',    
            success:function (data) {
            	var likeBlog='';
            	var data=data.blogList;
                for (var i = 0; i < data.length; i++) {
                	var id=data[i].id.toString(8)*data[i].id;
                	var time=i*0.05;
                	likeBlog+='<li style="animation-delay:0.'+i+'s" class="animated fadeIn"><a href="${pageContext.request.contextPath}/find/'+id+'.html" ><div class="tpic"><img src="'+data[i].images+'"></div><b>'+data[i].title+'</b><span>'+data[i].introduction+'</span><a href="find/'+id+'.html" class="readmore">阅读原文</a></a></li>'
                }
                // 初始化数据
                $(".tuijian").find("ul").html(likeBlog);
                globalCount++;
				 returnAllCount();
            },    
		    error:function(){
		    	layer.msg('请求太快，请稍后再试！', {icon: 5});
		    }	
        });
	};
	
	//初始化最新文章
	var initBlogByNew=function(page){
		//设置参数
		var params ={
				 pageSize: 5,
		         page:page,
		         status:1
		};
		$.ajax({
            url:'${pageContext.request.contextPath}/selectGroupLikeBlogListByPage',    
            type:'get',
            data:params,
            dataType:'json',    
            success:function (dataAll) {
            	var newBlog='';
            	var data=dataAll.blogList;
            	var page=dataAll.pageInfo;
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
                	var time=i*0.05;
                	newBlog+='<li style="animation-delay:0.'+i+'s" class="animated fadeInDown"><h3 class="blogtitle"><a href="${pageContext.request.contextPath}/find/'+id+'.html"  >'+data[i].title+'</a></h3><div class="bloginfo"><span class="blogpic"><a href="page/find/'+id+'.html" title=""><img src="'+data[i].images+'"  /></a></span><p>'+data[i].introduction+'</p></div><div class="autor"><span style="float:left;padding:0;color: #38485a"><i class="fa fa-user" style="color: #88827dcc;"></i>&nbsp;罗廷方</span><span class="lm f_l"><a href="javascript:void(0);">'+keyword+'</a></span><span class="dtime f_l">'+Format(data[i].addtime,"yyyy-MM-dd")+'</span><span class="viewnum f_l">浏览<b>（<a href="javascript:void(0);">'+data[i].clicknum+'</a></b>）</span><span class="pingl f_l">评论（<b><a href="javascript:void(0);">'+data[i].commentnum+'</a></b>）</span><span class="f_r"><a href="find/'+id+'.html" class="more">阅读原文>></a></span></div></li>'
                }
                // 初始化数据
                if(page.pageNum>=2){
            		$(".newblogs").find("ul").append(newBlog);
            	}else{
            		$(".newblogs").find("ul").html(newBlog);
            	} 
                if(page.total>5){
            		var pagenav='';
            		if(page.pageNum==page.pages){
            			isEnd=true;
            			pagenav='<p style="text-align:center;margin:-5px auto 10px;"><a href="javascript:void(0);" onclick="window.scrollTo(0,0)"><i class="fa fa-arrow-up"></i> 没有更多了</a></p>';
            			if(width<660){
            				$(".pageMin").html(pagenav);
            			}
            		}else{
            			isEnd=false;
            			pageNext=page.pageNum+1;
            			pagenav='<div style="margin:-5px auto 10px;text-align:center;"><div class="loader-inner ball-pulse"><div></div><div></div><div></div></div></div>';
            		}
            		$(".page").html(pagenav);
            	}else{
            		$(".page").html("");
            	}
               
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
		         status:1,
		};
		$.ajax({
            url:'${pageContext.request.contextPath}/selectGroupLikeBlogListByPage',    
            type:'get',
            data:params,
            dataType:'json',    
            success:function (data) {
            	var clickBlog='';
            	var data=data.blogList;
            	 var time='';
                for (var i = 0; i < data.length; i++) {
                	if(data[i].introduction.length>35){
                		data[i].introduction=data[i].introduction.substring(0,34)+"...";
                	}
                	var id=data[i].id.toString(8)*data[i].id;
                	time=i*0.05;
                	clickBlog+='<li style="animation-delay:0.'+i+'s" class="animated fadeIn"><b><a href="${pageContext.request.contextPath}/find/'+id+'.html">'+data[i].title+'</a></b><p>'+data[i].introduction+'</p></li>'
                }
                // 初始化数据
                $(".paihang").find("ul").html(clickBlog);
                time=time+0.25;
                var ad='<img style="animation-delay:'+time+'s" class="animated fadeInDown" src="${pageContext.request.contextPath}/images/ad300x100.jpg">';
				$(".ad").html(ad);
            },    
		    error:function(){
		    	layer.msg('请求太快，请稍后再试！', {icon: 5});
		    }	
        });
	};
	
	var initAllLinks=function(){
		
		$.ajax({
            url:'${pageContext.request.contextPath}/selectAllLinks',    
            type:'get',
            data:"",
            dataType:'json',    
            success:function (data) {
            	var linksAll='';
            	var data=data.linksList;
            	 var time='';
                for (var i = 0; i < data.length; i++) {
                	time=i*0.05;
                	linksAll+='<li style="animation-delay:0.'+i+'s;float:left;margin: 0 1% 10px 0;padding:3px;" class="animated fadeIn"><a href="'+data[i].link+'" target= "_blank" onclick="clickNum('+ data[i].id + ')">'+data[i].name+'</a></li>';
                }
                // 初始化数据
                $(".link").find("ul").html(linksAll);
            },    
		    error:function(){
		    	layer.msg('请求太快，请稍后再试！', {icon: 5});
		    }	
        });
	}
	
	//更新链接点击次数
	var clickNum=function(id){
		var params ={
				id:id,
		};
		$.ajax({
            url:'${pageContext.request.contextPath}/selectLinksById',    
            type:'post',
            data:params,
            dataType:'json',    
            success:function (data) {
            },    
		    error:function(){
		    }	
        });
	}
	
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
