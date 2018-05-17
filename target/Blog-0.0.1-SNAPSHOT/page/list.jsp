<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>列表页_个人博客 - 一个在Java道路上的技术员个人博客网站</title>
<meta name="keywords" content="个人博客,罗廷方个人博客,罗廷方" />
<meta name="description" content="罗廷方个人博客，是一个在Java道路上的技术员个人博客网站" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/base.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/index.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/animate.css"
	rel="stylesheet">
	
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
<body>
	<%@ include file="top.jsp"%>
	<article>
		<div class="leftbox">
			<div class="newblogs ">
				<h2 class="hometitle">
					<span class="tagTitle"> 
					</span>技术专栏</h2>
				<ul>

				</ul>
				<p class="page" style='display:none'>
				
                <p>
                <p class="pageMin">
				
                <p>
			</div>
		</div>
		<div class="rightbox">
			<div class="search1">
				<form name="searchform" id="searchform" style="width:100%;height: 30px;">
					<input name="keyword" id="keyword" class="input_text"
						value="请输入关键字" style="color: rgb(153, 153, 153);"
						onfocus="if(value=='请输入关键字'){this.style.color='#000';value=''}"
						onblur="if(value==''){this.style.color='#999';value='请输入关键字'}"
						type="text"> <input name="Submit" class="input_submit"
						value="搜索" type="button" onclick="search()"> <input
						type="hidden" class="type_id">
				</form>
			
				<ul class="tag tag-list" style="padding: 0;">
					
				</ul>
			</div>
			

			<div class="paihang ">
				<h2 class="ab_title">
					<a href="/">本栏推荐</a>
				</h2>
				<ul class="like">

				</ul>
				<div class="ad"></div>
			</div>
			<div class="paihang ">
				<h2 class="ab_title">
					<a href="/">点击排行</a>
				</h2>
				<ul class="click">

				</ul>

			</div>

			<div class="weixin">
				<h2 class="ab_title">公众号</h2>
				<ul class="animated fadeInDown">

				</ul>
			</div>
		</div>
	</article>

	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/layer/layer.js"></script>
	<script id="cy_cmt_num"
		src="http://changyan.sohu.com/upload/plugins/plugins.list.count.js?clientId=cytzg9rLH"></script>
	<script>
	var pageNext=1;
	var isEnd=false;
	var width = window.innerWidth || document.documentElement.clientWidth; 
	if (width < 960) {
		var pagenav='<p style="text-align:center;margin:-5px auto 20px;"><a href="javascript:void(0);" onclick="initBlog()"><i class="fa fa-arrow-down"></i> 加载更多</a></p>';
		$(".pageMin").html(pagenav);
		$(".tag").css('display','none');
	}else{
		$(window).scroll(function(){
	        if(isEnd == true){
	           return;
	       } 
	       if ($(document).scrollTop() + 50 >= $(document).height() - $(window).height()) {
	       	isEnd=true;
	       	$('.page').css('display','block');
	       	setTimeout(function () {
	       		initBlogListByPage(pageNext,"none",null);
			},500); 
		   }
	   });
	}
	var initBlog=function(){
		setTimeout(function () {
       		initBlogListByPage(pageNext,"none",null);
		},100);
	}
	
	$(document).ready(function() {
		//初始化类别信息
		initBlogType();
		//初始化技术专栏的信息
		initBlogListByPage(pageNext,"none",null);
		initBlogByLike();
		initBlogByClick();
	});
	
	var initBlogListByPage=function(pageNum,type_id,typename){
		//查询出文章
		//获取关键字，表示查询所有符合的记录
		var params="";
		var prarm="";
		if(type_id=="none"){
			var keyword=$("#keyword").val();
			if(keyword=="请输入关键字"){
				keyword="";
				prarm='none'
			}else{
				prarm='搜索关键字为<span class="text-info">#'+keyword+'#</span>的博客'
			}
			 params ={
					pageSize: 8,
		            page:pageNum,
		            title:keyword,
		            content:keyword,
		            introduction:keyword,
		            keyword:keyword,
		            param:prarm,
		           	status:1  //1 表示已发布
			};
		}else {
			params ={
					pageSize: 8,
		            page:pageNum,
		            'type.id':type_id,
		            param:'搜索类别为<span class="text-info">#'+typename+'#</span>的博客列表',
		           	status:1  //1 表示已发布
			};
		}
		
		$.ajax({
            url:'../page/selectLikeBlogListByPage',    
            type:'get',
            data:params,
            dataType:'json',    
            success:function (data) {
            	var blogList='';
            	var page=data.pageInfo;
            	var data=data.blogList;
            	if(data.length>0){
            		 var parm="";
            		 var arr=new Array();
            		 for (var i = 0; i < data.length; i++) {
            			 arr[i]=data[i].id;
            			 parm+=data[i].id+",";
                      	var id=data[i].id.toString(8)*data[i].id;
                      	var keyword="";
                      	if(data[i].keyword!=""&&data[i].keyword!=null){
                      		if(data[i].keyword.search(';')!=-1){
                      			keyword=data[i].keyword.replace(/;/g,"|");
                      		}else{
                      			keyword=data[i].keyword;
                      		}
                      	}
                      	blogList+='<li style="animation-delay:0.'+i+'s" class="animated fadeInDown"><h3 class="blogtitle"><a href="find/'+id+'.html"  >'+data[i].title+'</a></h3><div class="bloginfo"><span class="blogpic"><a href="find/'+id+'.html" title=""><img src="'+data[i].images+'"  /></a></span><p>'+data[i].introduction+'</p></div><div class="autor"><span class="lm f_l"><a href="javascript:void(0);">'+data[i].type.typename+'</a></span><span style="float:left;padding:0;color: #38485a"><i class="fa fa-tags" style="color: #88827dcc;"></i>&nbsp;'+keyword+'</span><span class="dtime f_l">'+Format(data[i].addtime,"yyyy-MM-dd")+'</span><span class="viewnum f_l">浏览<b>（<a href="javascript:void(0);">'+data[i].clicknum+'</a></b>）</span><span class="pingl f_l">评论（<b><a class='+data[i].id+' href="javascript:void(0);"></a></b>）</span><span class="f_r"><a href="find/'+id+'.html" class="more">阅读原文>></a></span></div></li>'
            		 };
            		
            		 var p={
	           				 client_id:'cytzg9rLH',
	           				 topic_source_id:parm
	           			 };
	                      	$.ajax({
	        	            url:'http://changyan.sohu.com/api/2/topic/count',    
	        	            type:'get',
	        	            data:p,
	        	            dataType:'jsonp',    
	        	            success:function (pl) {
	        	            	for(var i=0;i<arr.length;i++){
	        	            		$('.'+arr[i]).html(pl.result[arr[i]].comments);
	        	            	}
	        	            },
	        			    error:function(){
	        			    	layer.msg('出错啦', {icon: 2});
	        			    }	
	        	        });
            	}else{
            		blogList="无查询结果";
            	}
            	if(page.pageNum>=2){
            		$(".newblogs").find("ul").append(blogList);
            	}else{
            		$(".newblogs").find("ul").html(blogList);
            	} 
            	if(page.total>8){
            		var pagenav='';
            		if(page.pageNum==page.pages){
            			isEnd=true;
            			pagenav='<p style="text-align:center;margin:-5px auto 10px;"><a href="javascript:void(0);" onclick="window.scrollTo(0,0)"><i class="fa fa-arrow-up"></i> 没有更多了</a></p>';
            			if(width<960){
            				$(".pageMin").html(pagenav);
            			}
            		}else{
            			isEnd=false;
            			pageNext=page.pageNum+1;
            			pagenav='<div style="margin:-5px auto 10px;width:10%;"><div class="loader-inner ball-pulse"><div></div><div></div><div></div></div></div>';
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
	
	var pageNav=function(pageNum){
		var type="";
		type=$(".type_id").val();
		$(".type_id").val("");
		if(type==null||type==""){
			type="none";
		}
		var index ='';
		 layer.ready(function(){
		   index=layer.load(2, {
			  shade: [0.1,'#eee'] //0.1透明度的白色背景
		    });
		  }); 
		    
		initBlogListByPage(pageNum,type,null);
		setTimeout(function () {
		 window.scrollTo(0,0);   //滑动到浏览器顶部
		 layer.close(index);
	},200);
			
	}
	
	
	
	var search=function(){
		var index ='';
	     layer.ready(function(){
	    	index=layer.load(2, {
				  shade: [0.1,'#eee'] //0.1透明度的白色背景
	    	});
	    }); 
	     initBlogListByPage(1,"none",null);
		setTimeout(function () {
			layer.close(index);
		},200);
	}
	
	//初始化所有类别信息
	var initBlogType=function(){
		//查询出文章类别
		//设置参数，表示查询所有的类别
		var params ={
				"data":"all"
		};
		$.ajax({
            url:'../admin/selectBlogType',    
            type:'post',
            data:params,
            dataType:'json',    
            success:function (data) {
            	var typeName='';
                for (var i = 0; i < data.length; i++) {
                	var time=i*0.03;
                	typeName+='<li style="animation-delay:'+time+'s" class="animated fadeInDown"><a style="padding: 5px;margin-right: 3px;border: none; background-color: #f1f1f1;" onclick="searchType('+data[i].id+',\''+data[i].typename+'\')" href="javascript:void(0);"> <i class="fa fa-tag"></i>'+data[i].typename+'</a></li>'
                }
                var length='';
                var keyTitle='';
                if(data.length>5){
                	length=5;
                }else{
                	length=data.length;
                }
                for (var i = 0; i < length; i++) {
                	keyTitle+='<a href="javascript:void(0);" onclick="searchType('+data[i].id+',\''+data[i].typename+'\')">'+data[i].typename+'</a>'
                }
                
                // 初始化数据
                $(".tag").html(typeName);
                $(".tagTitle").html(keyTitle);
            },    
		    error:function(){
		    	layer.msg('请求太快，请稍后再试！', {icon: 5});
		    }	
        });
	}
	
	var searchType=function(type_id,typename){
		$(".type_id").val(type_id);
		var index ='';
	     layer.ready(function(){
	    	index=layer.load(2, {
				  shade: [0.1,'#eee'] //0.1透明度的白色背景
	    	});
	    }); 
	     initBlogListByPage(1,type_id,typename);
		setTimeout(function () {
			layer.close(index);
		},200);
		
		
	}
	
	//初始化推荐
	var initBlogByLike=function(){
		var params ={
				 pageSize: 5,
		         page:1,
		         isrecommend:1  //1 表示推荐
		};
		$.ajax({
            url:'../admin/selectGroupLikeBlogListByPage',    
            type:'get',
            data:params,
            dataType:'json',    
            success:function (data) {
            	var likeBlog='';
            	var data=data.blogList;
            	var time='';
                for (var i = 0; i < data.length; i++) {
                	 if(data[i].introduction.length>35){
                		data[i].introduction=data[i].introduction.substring(0,34)+"...";
                	}
                	var id=data[i].id.toString(8)*data[i].id;
                	time=i*0.05;
                	likeBlog+='<li style="animation-delay:'+time+'s" class="animated fadeInDown"><b><a href="find/'+id+'.html">'+data[i].title+'</a></b><p>'+data[i].introduction+'</p></li>';
                }
                // 初始化数据
                $(".paihang").find(".like").html(likeBlog);
                time=time+0.1;
                var ad='<img style="animation-delay:'+time+'s" class="animated fadeInDown" src="${pageContext.request.contextPath}/images/ad300x100.jpg">';
				$(".ad").html(ad);
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
                	var time=i*0.05;
                	clickBlog+='<li style="animation-delay:'+time+'s" class="animated fadeInDown"><b><a href="find/'+id+'.html">'+data[i].title+'</a></b><p>'+data[i].introduction+'</p></li>'
                }
                // 初始化数据
                $(".paihang").find(".click").html(clickBlog);
                var ab='<img src="../images/wx.jpg">';
            	$(".weixin").find("ul").html(ab);
            	
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
<script type="text/javascript">

window.onload = function (){
	var oH2 = document.getElementsByTagName("h2")[0];
	var oUl = document.getElementsByTagName("ul")[0];
	oH2.onclick = function (){
		var style = oUl.style;
		style.display = style.display == "block" ? "none" : "block";
		oH2.className = style.display == "block" ? "open" : "";
	};
};
</script>
</body>

</html>
