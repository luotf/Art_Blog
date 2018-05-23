<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>详情页_个人博客 - 一个在Java道路上的技术员个人博客网站</title>
<meta name="keywords" content="个人博客,罗廷方个人博客,罗廷方" />
<meta name="description" content="罗廷方个人博客，是一个在Java道路上的技术员个人博客网站" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="${pageContext.request.contextPath}/css/gruvbox-light.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/base.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/index.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/animate.css" rel="stylesheet">
</head>
<body style="background:url(${pageContext.request.contextPath}/images/bg.jpg) no-repeat center fixed">
	<%@ include file="top.jsp" %>
	<article>
		<div class="leftbox">
			<div class="infos">
				<div class="newsview ">
					<h2 class="intitle">
						您现在的位置是：<a href="/">网站首页</a>&nbsp;&gt;&nbsp;<a href="/">技术专栏</a>
					</h2>
					<c:choose>
						<c:when test="${status== '0' || status== '500'}">
			        		<h1 style="font-size:110px;text-align:center;margin:20px;">404</h1>
			        		<h3 style="text-align:center;" class="font-bold">抱歉，你所访问的页面不存在~</h3>
			        	</c:when>
						<c:otherwise>
							<h3 class="news_title animated fadeIn">${blog.title}</h3>
							<input class="id" type="hidden" value="${blog.id}">
							<div class="news_author animated fadeIn">
								<span class="au01 ">罗廷方</span><span class="au02"> <input
									class="addtime" type="hidden" value="${blog.addtime}"></span><span
									class="au03">共<b>${blog.clicknum}</b>人围观
								</span>
							</div>
							<input class="typeId" type="hidden" value="${blog.type.id}">
							<div class="tags animated fadeIn">
								<input class="tag" type="hidden" value="${blog.keyword}">
							</div>
							<div class="news_about animated fadeIn">
								<strong>简介</strong>${blog.introduction}</div>
							<div class="news_infos animated fadeIn">${blog.content}</div>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="ds" style="text-align: center;opacity:0">
					<div id="cyReward" role="cylabs" data-use="reward"></div>
				</div>
				<div class="share">
					<!-- 分享： -->
				</div>

			</div>
			<div class="nextinfo animated fadeIn">
				<p>
					上一篇：<span class="pre"></span>
				</p>
				<p>
					下一篇：<span class="next"></span>
				</p>
			</div>
			<div class="otherlink animated fadeIn">
				<h2>相关文章</h2>
				<ul>

				</ul>
			</div>
			<div class="news_pl animated fadeIn">
				<h2>文章评论</h2>
				<div style="width:90%;margin: 0 auto;">
				<div  id="cyEmoji" role="cylabs" data-use="emoji"
					sid="${blog.id }"></div>
				<!--PC和WAP自适应版-->
				<div  id="SOHUCS" sid="${blog.id }"></div>
				</div>

			</div>
		</div>
		<div class="rightbox  ">
			
			<div class="paihang ">
				<h2 class="ab_title">
					<a href="javascript:void(0)">本栏推荐</a>
				</h2>
				<ul class="like ">

				</ul>
				<div class="ad "></div>
			</div>
			<div class="paihang ">
				<h2 class="ab_title">
					<a href="javascript:void(0)">点击排行</a>
				</h2>
				<ul class="click">

				</ul>

			</div>

			<div class="paihang">
				<h2 class="ab_title">
					<a href="#">评论排行</a>
				</h2>
				<div class='pl_paihang animated fadeIn' style="display:none" id="cyHotusers"
					role="cylabs" data-use="hotusers"></div>
				<script type="text/javascript" charset="utf-8"
					src="http://changyan.itc.cn/js/lib/jquery.js"></script>
				<script type="text/javascript" charset="utf-8"
					src="http://changyan.sohu.com/js/changyan.labs.https.js?appid=cytzg9rLH"></script>
			</div>

			<div class="weixin">
				<h2 class="ab_title">公众号</h2>
				<ul class="animated fadeIn">

				</ul>
			</div>
		</div>
	</article>

	<%@ include file="fonter.jsp" %>
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/highlight.pack.js"></script>
		<script>hljs.initHighlightingOnLoad();</script> 
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/layer/layer.js"></script>
	<script type="text/javascript"> 
			(function(){ 
			var appid = 'cytzg9rLH'; 
			var conf = 'prod_230eb23e872ad7a4302e5802e6f91bf9'; 
			var width = window.innerWidth || document.documentElement.clientWidth; 
			if (width < 960) { 
			window.document.write('<script id="changyan_mobile_js" charset="utf-8" type="text/javascript" src="https://changyan.sohu.com/upload/mobile/wap-js/changyan_mobile.js?client_id=' + appid + '&conf=' + conf + '"><\/script>'); } else { var loadJs=function(d,a){var c=document.getElementsByTagName("head")[0]||document.head||document.documentElement;var b=document.createElement("script");b.setAttribute("type","text/javascript");b.setAttribute("charset","UTF-8");b.setAttribute("src",d);if(typeof a==="function"){if(window.attachEvent){b.onreadystatechange=function(){var e=b.readyState;if(e==="loaded"||e==="complete"){b.onreadystatechange=null;a()}}}else{b.onload=a}}c.appendChild(b)};loadJs("https://changyan.sohu.com/upload/changyan.js",function(){window.changyan.api.config({appid:appid,conf:conf})}); } })(); </script>
				
	<script type="text/javascript">
	  
		$(document).ready(function() {
			Format();
		    Tags();
		    initBlogByLike();
			initBlogByClick();
			selectPrevBlog();
			selectNextBlog();
			initBlogByRel();   //初始化相关文章
			
			setTimeout(function () {
			$(".ds").css("opacity","1");
		 }, 1000);
			
			setTimeout(function () {
				$(".pl_paihang").css("display","block");
			},200); 
			
		});

		//加载完成后
		window.onload = function() {
			var oH2 = document.getElementsByTagName("h2")[0];
			var oUl = document.getElementsByTagName("ul")[0];
			oH2.onclick = function() {
				var style = oUl.style;
				style.display = style.display == "block" ? "none" : "block";
				oH2.className = style.display == "block" ? "open" : ""
			}
		}

		var Tags=function() {
			var tag = $(".tag").val();
			var keyword = "";
			$(".newsview").find(".tags").html("");
			if (tag != '' && tag != null) {
				if (tag.search(';') != -1) {
					var strs = new Array();
					strs = tag.split(";");
					for (var i = 0; i < strs.length && strs[i] != ''; i++) {
						keyword += '<a href="#">' + strs[i] + '</a>';
					}
				} else {
					keyword = '<a href="#">' + tag + '</a>';
				}
			}
			$(".newsview").find(".tags").append(keyword);
		}

		var selectPrevBlog=function(){
			var id=$(".id").val();
			var params ={
					id:id-1
			};
			$.ajax({
	            url:'../selectPrevBlog',    
	            type:'get',
	            data:params,
	            dataType:'json',    
	            success:function (data) {
	            	var preTitle="";
		            	if(data.status==200){
		            	  var id=data.blog.id.toString(8)*data.blog.id;
		  	              preTitle='<a href="../find/'+id+'.html">'+data.blog.title+'</a>';
		            	}else{
		            	  preTitle='<span>无</span>';
		            	}
		            	$(".pre").html(preTitle);
	            	}, 
			    error:function(){
			    	layer.msg('加载的太快啦', {icon: 2});
			    }	
	        });
			
		};

		var selectNextBlog=function(){
			var vid=$(".id").val();
			var id=parseInt(vid)+1;
			var params ={
					id:id
			};
			$.ajax({
	            url:'../selectNextBlog',    
	            type:'get',
	            data:params,
	            dataType:'json',    
	            success:function (data) {
	            	var nextTitle='';
	            	if(data.status==200){
			            var sid=data.blog.id.toString(8)*data.blog.id;
			            nextTitle='<a href="../find/'+sid+'.html">'+data.blog.title+'</a>';
	            	}else{
	            		nextTitle='<span>无</span>';
	            	}
	            	    $(".next").html(nextTitle);
	            	}, 
			    error:function(){
			    	layer.msg('加载的太快啦', {icon: 2});
			    }	
	        });
			
		};
		
		//初始化相关文章
		var initBlogByRel=function(){
			var params ={
					 pageSize: 6,
			         page:1,
			         'type.id':$(".typeId").val(),
			};
			$.ajax({
	            url:'../selectGroupLikeBlogListByPage',    
	            type:'get',
	            data:params,
	            dataType:'json',    
	            success:function (data) {
	            	var relBlog='';
	            	var data=data.blogList;
	                for (var i = 0; i < data.length; i++) {
	                	if(data[i].title.length>20){
	                		data[i].title=data[i].title.substring(0,19)+"...";
	                	}
	                	var id=data[i].id.toString(8)*data[i].id;
	                	relBlog+='<li><a href="'+id+'.html" title="'+data[i].title+'">'+data[i].title+'</a></li>'
	                }
	                // 初始化数据
	                $(".otherlink").find("ul").html(relBlog);
	            },    
			    error:function(){
			    	layer.msg('加载的太快啦', {icon: 2});
			    }	
	        });
		};
		
		//初始化推荐
		var initBlogByLike=function(){
			//设置参数
			var params ={
					 pageSize: 5,
			         page:1,
			         isrecommend:1  //1 表示推荐
			};
			$.ajax({
	            url:'../selectGroupLikeBlogListByPage',    
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
	                	likeBlog+='<li style="animation-delay:'+time+'s" class="animated fadeIn"><b><a href="'+id+'.html">'+data[i].title+'</a></b><p>'+data[i].introduction+'</p></li>';
	                }
	                // 初始化数据
	                $(".paihang").find(".like").html(likeBlog);
	                time=time+0.1;
	                var ad='<img style="animation-delay:'+time+'s" class="animated fadeIn" src="${pageContext.request.contextPath}/images/ad300x100.jpg">';
					$(".ad").html(ad);
					
	            },    
			    error:function(){
			    	layer.msg('加载的太快啦', {icon: 2});
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
	            url:'../selectGroupLikeBlogListByPage',    
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
	                	time=i*0.05;
	                	var id=data[i].id.toString(8)*data[i].id;
	                	clickBlog+='<li style="animation-delay:'+time+'s" class="animated fadeIn"><b><a href="'+id+'.html">'+data[i].title+'</a></b><p>'+data[i].introduction+'</p></li>'
	                }
	                // 初始化数据
	                time=time+0.1;
	                $(".paihang").find(".click").html(clickBlog);
	                var ab='<img style="animation-delay:'+time+'s" class="animated fadeIn" src="../../images/wx.jpg">';
	            	$(".weixin").find("ul").html(ab);
	            	
	            },    
			    error:function(){
			    	layer.msg('加载的太快啦', {icon: 2});
			    }	
	        });
		};
		
		
		//格式化时间
		var Format=function() {
			var datetime=$(".addtime").val();
			var month = new Array();
			month["Jan"] = '01';
			month["Feb"] = '02';
			month["Mar"] = '03';
			month["Apr"] = '04';
			month["May"] = '05';
			month["Jan"] = '06';
			month["Jul"] = '07';
			month["Aug"] = '08';
			month["Sep"] = '09';
			month["Oct"] = 10;
			month["Nov"] = 11;
			month["Dec"] = 12;
			var arr = new Array();
			arr = datetime.split(" ");
			var fmt = arr[5] + '-' + month[arr[1]] + '-' + arr[2];
			$(".au02").html(fmt);
		}
	</script>
</body>
</html>
