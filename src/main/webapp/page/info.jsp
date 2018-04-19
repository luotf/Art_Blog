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
<%-- <link href="${pageContext.request.contextPath}/css/animate.css"
	rel="stylesheet">
 --%>
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
		<div class="leftbox animated fadeInUp">
			<div class="infos">
				<div class="newsview">
					<h2 class="intitle">
						您现在的位置是：<a href="/">网站首页</a>&nbsp;&gt;&nbsp;<a href="/">技术专栏</a>
					</h2>

					<c:choose>
						<c:when test="${status== '0' || status== '500'}">
			        		出错啦
			        	</c:when>
						<c:otherwise>
							<h3 class="news_title">${blog.title}</h3>
							<input class="id" type="hidden" value="${blog.id}">
							<div class="news_author">
								<span class="au01">罗廷方</span><span class="au02"> <input
									class="addtime" type="hidden" value="${blog.addtime}"></span><span
									class="au03">共<b>${blog.clicknum}</b>人围观
								</span>
							</div>
							<input class="typeId" type="hidden" value="${blog.type.id}">
							<div class="tags">
								<input class="tag" type="hidden" value="${blog.keyword}">
							</div>
							<div class="news_about">
								<strong>简介</strong>${blog.introduction}</div>
							<div class="news_infos">${blog.content}</div>
						</c:otherwise>
					</c:choose>
				</div>
				<div style="text-align: center;	">
				<div  id="cyReward" role="cylabs" data-use="reward"></div>
				</div>
				<div class="share">分享：</div>
				
			</div>
			<div class="nextinfo">
				<p>
					上一篇：<span class="pre"></span>
				</p>
				<p>
					下一篇：<span class="next"></span>
				</p>
			</div>
			<div class="otherlink">
				<h2>相关文章</h2>
				<ul>
					
				</ul>
			</div>
			<div class="news_pl">
				<h2>文章评论</h2>
				<div style="width:90%" id="cyEmoji" role="cylabs" data-use="emoji" sid="${blog.id }"></div>
				<!--PC和WAP自适应版-->
				<div style="width:90%" id="SOHUCS" sid="${blog.id }"></div> 
				<script type="text/javascript"> 
				(function(){ 
				var appid = 'cytzg9rLH'; 
				var conf = 'prod_230eb23e872ad7a4302e5802e6f91bf9'; 
				var width = window.innerWidth || document.documentElement.clientWidth; 
				if (width < 960) { 
				window.document.write('<script id="changyan_mobile_js" charset="utf-8" type="text/javascript" src="https://changyan.sohu.com/upload/mobile/wap-js/changyan_mobile.js?client_id=' + appid + '&conf=' + conf + '"><\/script>'); } else { var loadJs=function(d,a){var c=document.getElementsByTagName("head")[0]||document.head||document.documentElement;var b=document.createElement("script");b.setAttribute("type","text/javascript");b.setAttribute("charset","UTF-8");b.setAttribute("src",d);if(typeof a==="function"){if(window.attachEvent){b.onreadystatechange=function(){var e=b.readyState;if(e==="loaded"||e==="complete"){b.onreadystatechange=null;a()}}}else{b.onload=a}}c.appendChild(b)};loadJs("https://changyan.sohu.com/upload/changyan.js",function(){window.changyan.api.config({appid:appid,conf:conf})}); } })(); </script>
								
			</div>
		</div>
		<div class="rightbox animated fadeInUp">
			<div class="search1">
				<form action="/e/search/index.php" method="post" name="searchform"
					id="searchform">
					<input name="keyboard" id="keyboard" class="input_text"
						value="请输入关键字" style="color: rgb(153, 153, 153);"
						onfocus="if(value=='请输入关键字'){this.style.color='#000';value=''}"
						onblur="if(value==''){this.style.color='#999';value='请输入关键字'}"
						type="text"> <input name="show" value="title"
						type="hidden"> <input name="tempid" value="1"
						type="hidden"> <input name="tbname" value="news"
						type="hidden"> <input name="Submit" class="input_submit"
						value="搜索" type="submit">
				</form>
			</div>
			<div class="paihang">
				<h2 class="ab_title">
					<a href="/">本栏推荐</a>
				</h2>
				<ul>
					<li><b><a href="/" target="_blank">住在手机里的朋友</a></b>
						<p>对于刚毕业的学生来说，想学习建网站，掌握一技之长，最简单的入门无学...</p></li>
					<li><b><a href="/" target="_blank">教你怎样用欠费手机拨打电话</a></b>
						<p>对于刚毕业的学生来说，想学习建网站，掌握一技之长，最简单的入门...</p></li>
					<li><b><a href="/" target="_blank">原来以为，一个人的勇敢是，删掉他的手机号码</a></b>
						<p>.先前发表过一篇文章《如果要学习web前端开发，需要学习什么？》</p></li>
					<li><b><a href="/" target="_blank">手机的16个惊人小秘密，据说99.999%的人都不知</a></b>
						<p>对于刚毕业的学生来说，.需要学习什么？》</p></li>
					<li><b><a href="/" target="_blank">你面对的是生活而不是手机</a></b>
						<p>.最简单的入门无非就是学会html和css，先前发表过一篇文章...</p></li>
				</ul>
				<div class="ad">
					<img src="${pageContext.request.contextPath}/images/ad300x100.jpg">
				</div>
			</div>
			<div class="paihang">
				<h2 class="ab_title">
					<a href="/">点击排行</a>
				</h2>
				<ul>
					<li><b><a href="/" target="_blank">住在手机里的朋友</a></b>
						<p>对于刚毕业的学生来说，想学习建网站，掌握一技之长，最简单的入门无学...</p></li>
					<li><b><a href="/" target="_blank">教你怎样用欠费手机拨打电话</a></b>
						<p>对于刚毕业的学生来说，想学习建网站，掌握一技之长，最简单的入门...</p></li>
					<li><b><a href="/" target="_blank">原来以为，一个人的勇敢是，删掉他的手机号码</a></b>
						<p>.先前发表过一篇文章《如果要学习web前端开发，需要学习什么？》</p></li>
					<li><b><a href="/" target="_blank">手机的16个惊人小秘密，据说99.999%的人都不知</a></b>
						<p>对于刚毕业的学生来说，.需要学习什么？》</p></li>
					<li><b><a href="/" target="_blank">你面对的是生活而不是手机</a></b>
						<p>.最简单的入门无非就是学会html和css，先前发表过一篇文章...</p></li>
				</ul>
				
			</div>
			
			<div class="paihang">
				<h2 class="ab_title">
					<a href="#">评论排行</a>
				</h2>
				<div  id="cyHotusers" role="cylabs" data-use="hotusers"></div>
				<script type="text/javascript" charset="utf-8" src="http://changyan.itc.cn/js/lib/jquery.js"></script>
    			<script type="text/javascript" charset="utf-8" src="http://changyan.sohu.com/js/changyan.labs.https.js?appid=cytzg9rLH"></script>
			</div>
			
			<div class="weixin">
				<h2 class="ab_title">打赏</h2>
				<ul>
					<img src="${pageContext.request.contextPath}/images/wx.jpg">
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
	
	
	
	<script type="text/javascript">
	
		$(document).ready(function() {
			Format();
			Tags();
			selectPrevBlog();
			selectNextBlog();
			initBlogByRel();   //初始化相关文章
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
			    	alert("初始化失败");
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
			    	alert("初始化失败");
			    }	
	        });
			
		};
		
		//初始化相关文章
		var initBlogByRel=function(){
			//设置参数
			
			var params ={
					 pageSize: 6,
			         page:1,
			         'type.id':$(".typeId").val(),
			        // sort:"clickNum",   //按点击量排序,默认按时间
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
			    	alert("初始化类别失败");
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
