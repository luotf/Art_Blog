<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>列表页_个人博客 - 一个在Java道路上的技术员个人博客网站</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.ico"> 
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
<body style="background:url(${pageContext.request.contextPath}/images/bj.png) repeat top left scroll">
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
					<input name="keyword" id="keyword"  class="input_text"
						value="请输入关键字" style="width:70%;color: rgb(153, 153, 153);"
						onfocus="if(value=='请输入关键字'){this.style.color='#000';value=''}"
						onblur="if(value==''){this.style.color='#999';value='请输入关键字'}"
						type="text"> <input name="Submit" class="input_submit"
						value="搜索" type="button" onclick="search()"> <input
						type="hidden" class="type_id">
				</form>
			
				<ul class="tag tag-list" style="padding: 0;">
					
				</ul>
			</div>
			<div class="cloud animated fadeInUp">
		      <h2 class="cloud_hometitle">标签云</h2>
		      <ul>
		        
		      </ul>
   			 </div>
			<div class="tuijian2  animated fadeInUp" >
		      <h2 class="cloud_hometitle">推荐文章</h2>
		      <ul class="tjpic animated fadeInDown" >
		        <i><img src="images/t03.jpg"></i>
		      </ul>
		      <ul class="sidenews">
		       
		      </ul>
		    </div>
			
			<div class="dj dianji paihang animated fadeInUp" style="display:none;animation-delay:0.3s">
				<h2 class="cloud_hometitle">点击排行</h2>
				<ul class="click" style="padding: 0px;">

				</ul>

			</div>
			<div class="guanzhu gd animated fadeIn" style="display:none" id="follow-us">
		      <h2 class="cloud_hometitle">来波关注</h2>
		      <ul>
		        <li class="qq"><a href="javascript:void(0)" target="_blank"><span>QQ号</span>849673404</a></li>
		        <li class="email"><a href="javascript:void(0)" target="_blank"><span>邮箱帐号</span>849673404@qq.com</a></li>
		        <li class="wxgzh"><a href="javascript:void(0)" target="_blank"><span>微信号</span>luo849673404</a></li>
		        <li class="wx" style="border:none"><img src="${pageContext.request.contextPath}/images/wx.jpg"></li>
		      </ul>
    	  </div>
		</div>
		<a href="#" class="top cd-top animated ">Top</a>
	</article>
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/page/list.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/layer/layer.js"></script>
	<script id="cy_cmt_num"
		src="http://changyan.sohu.com/upload/plugins/plugins.list.count.js?clientId=cytzg9rLH"></script>
</body>
</html>
