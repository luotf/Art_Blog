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
<link href="${pageContext.request.contextPath}/css/base.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/index.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/animate.css" rel="stylesheet">
</head>
<body>
	<header>
		<div id="mnav">
			<h2>
				<span class="navicon"></span>
			</h2>
			<ul>
				<li><a href="${pageContext.request.contextPath}/page/index.jsp">网站首页</a></li>
				<li><a href="${pageContext.request.contextPath}/page/list.jsp">技术博客</a></li>
				<li><a href="${pageContext.request.contextPath}/page/list.jsp">面试汇总</a></li>
				<li><a
					href="${pageContext.request.contextPath}/page/project.jsp">项目案例</a></li>
				<li><a
					href="${pageContext.request.contextPath}/page/resource.jsp">资源分享</a></li>
				<li><a href="${pageContext.request.contextPath}/page/about.jsp">关于我</a></li>
				<li><a href="/">留言</a></li>
			</ul>
		</div>
		<nav>
			<ul>
				<li><a href="${pageContext.request.contextPath}/page/index.jsp">网站首页</a></li>
				<li><a href="${pageContext.request.contextPath}/page/list.jsp">技术博客</a></li>
				<li><a href="${pageContext.request.contextPath}/page/list.jsp">面试汇总</a></li>
				<li><a
					href="${pageContext.request.contextPath}/page/project.jsp">项目案例</a></li>
				<li><a
					href="${pageContext.request.contextPath}/page/resource.jsp">资源分享</a></li>
				<li><a href="${pageContext.request.contextPath}/page/about.jsp">关于我</a></li>
				<li><a href="/">留言</a></li>
			</ul>
		</nav>
	</header>
	<article>
		<div class="leftbox">
			<div class="infos">
				<div class="newsview ">
					<h2 class="intitle">
						您现在的位置是：<a href="/">网站首页</a>&nbsp;&gt;&nbsp;<a href="/">技术专栏</a>
					</h2>

					<c:choose>
						<c:when test="${status== '0' || status== '500'}">
			        		出错啦
			        	</c:when>
						<c:otherwise>
							<h3 class="news_title animated fadeInDown">${blog.title}</h3>
							<input class="id" type="hidden" value="${blog.id}">
							<div class="news_author animated fadeInDown">
								<span class="au01 ">罗廷方</span><span class="au02"> <input
									class="addtime" type="hidden" value="${blog.addtime}"></span><span
									class="au03">共<b>${blog.clicknum}</b>人围观
								</span>
							</div>
							<input class="typeId" type="hidden" value="${blog.type.id}">
							<div class="tags animated fadeInDown">
								<input class="tag" type="hidden" value="${blog.keyword}">
							</div>
							<div class="news_about animated fadeInDown">
								<strong>简介</strong>${blog.introduction}</div>
							<div class="news_infos animated fadeInDown">${blog.content}</div>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="ds " style="text-align: center;display:none">
					<div id="cyReward" role="cylabs" data-use="reward"></div>
				</div>
				<div class="share">
					<!-- 分享： -->
				</div>

			</div>
			<div class="nextinfo animated fadeInDown">
				<p>
					上一篇：<span class="pre"></span>
				</p>
				<p>
					下一篇：<span class="next"></span>
				</p>
			</div>
			<div class="otherlink animated fadeInDown">
				<h2>相关文章</h2>
				<ul>

				</ul>
			</div>
			<div class="news_pl">
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
					<a href="/">本栏推荐</a>
				</h2>
				<ul class="like animated fadeInDown">

				</ul>
				<div class="ad animated fadeInDown"></div>
			</div>
			<div class="paihang ">
				<h2 class="ab_title">
					<a href="/">点击排行</a>
				</h2>
				<ul class="click animated fadeInDown">

				</ul>

			</div>

			<div class="paihang">
				<h2 class="ab_title">
					<a href="#">评论排行</a>
				</h2>
				<div class='pl_paihang animated fadeInDown' style="display:none" id="cyHotusers"
					role="cylabs" data-use="hotusers"></div>
				<script type="text/javascript" charset="utf-8"
					src="http://changyan.itc.cn/js/lib/jquery.js"></script>
				<script type="text/javascript" charset="utf-8"
					src="http://changyan.sohu.com/js/changyan.labs.https.js?appid=cytzg9rLH"></script>
			</div>

			<div class="weixin">
				<h2 class="ab_title">公众号</h2>
				<ul class="animated fadeInDown">

				</ul>
			</div>
		</div>
	</article>

	<footer>
		<p>
			Design by <a href="/">XXX个人博客</a> <a href="/">蜀ICP备11002373号-1</a>
		</p>
	</footer>
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
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
			var index ='';
				
			     layer.ready(function(){
			    	index=layer.load(2, {
						  shade: [0.1,'#eee'] //0.1透明度的白色背景
			    	});
			    }); 
				 Format();
				 Tags(); 
			setTimeout(function () {
				$(".ds").css("display","block");
				selectPrevBlog();
				selectNextBlog();
				initBlogByRel();   //初始化相关文章
				initBlogByLike();
				initBlogByClick(); 
				setTimeout(function () {
					$(".pl_paihang").css("display","block");
					layer.close(index);
				},200);    
			 }, 200);
			
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
					id:id
			};
			$.ajax({
	            url:'../selectPrevBlog',    
	            type:'get',
	            data:params,
	            dataType:'json',    
	            success:function (data) {
	              var id=data.blog.id.toString(8)*data.blog.id;
	              var preTitle='<a href="../find/'+id+'.html">'+data.blog.title+'</a>';
	          	  $(".pre").html(preTitle);
	            	}, 
			    error:function(){
			    	layer.msg('出错啦', {icon: 2});
			    }	
	        });
			
		};

		var selectNextBlog=function(){
			var id=$(".id").val();
			var params ={
					id:id
			};
			$.ajax({
	            url:'../selectNextBlog',    
	            type:'get',
	            data:params,
	            dataType:'json',    
	            success:function (data) {
	              var id=data.blog.id.toString(8)*data.blog.id;
	              var nextTitle='<a href="../find/'+id+'.html">'+data.blog.title+'</a>';
	          	  $(".next").html(nextTitle);
	          	 
	            	}, 
			    error:function(){
			    	layer.msg('出错啦', {icon: 2});
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
	            url:'../../admin/selectGroupLikeBlogListByPage',    
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
			    	layer.msg('出错啦', {icon: 2});
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
	            url:'../../admin/selectGroupLikeBlogListByPage',    
	            type:'get',
	            data:params,
	            dataType:'json',    
	            success:function (data) {
	            	var likeBlog='';
	            	var data=data.blogList;
	                for (var i = 0; i < data.length; i++) {
	                	if(data[i].introduction.length>35){
	                		data[i].introduction=data[i].introduction.substring(0,34)+"...";
	                	}
	                	var id=data[i].id.toString(8)*data[i].id;
	                	likeBlog+='<li><b><a href="'+id+'.html">'+data[i].title+'</a></b><p>'+data[i].introduction+'</p></li>';
	                }
	                // 初始化数据
	                $(".paihang").find(".like").html(likeBlog);
	                var ad='<img src="${pageContext.request.contextPath}/images/ad300x100.jpg">';
					$(".ad").html(ad);
					
	            },    
			    error:function(){
			    	layer.msg('出错啦', {icon: 2});
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
	            url:'../../admin/selectGroupLikeBlogListByPage',    
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
	                	clickBlog+='<li><b><a href="'+id+'.html">'+data[i].title+'</a></b><p>'+data[i].introduction+'</p></li>'
	                }
	                // 初始化数据
	                $(".paihang").find(".click").html(clickBlog);
	                var ab='<img src="../../images/wx.jpg">';
	            	$(".weixin").find("ul").html(ab);
	            	
	            },    
			    error:function(){
			    	layer.msg('出错啦', {icon: 2});
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
