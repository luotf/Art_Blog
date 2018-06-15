<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="baidu-site-verification" content="Eg9tVrHSEK" />
<title>首页_个人博客 - 一个在Java道路上的技术员个人博客网站</title>
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/images/favicon.ico">
<meta name="keywords" content="个人博客,罗廷方个人博客,罗廷方" />
<meta name="description" content="罗廷方个人博客，是一个在Java道路上的技术员个人博客网站" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
<link href="${pageContext.request.contextPath}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<style type="text/css">
.loader-inner>div {
	background-color: #907f819e
}
</style>
</head>
<body
	style="background:url(${pageContext.request.contextPath}/images/bj.png) repeat top left scroll;z-index:-2">
	<%@ include file="top.jsp"%>
	<article style="opacity:0">
		<div class="pics ">
			<ul>
				<li></li>
				<li></li>
				<li></li>
			</ul>
		</div>


		<div class="leftbox ">
			<div class="tuijian" style="margin: 0px ">
				<h2 class="hometitle ">
					</span>特别推荐
				</h2>
				<ul class="animated ">

				</ul>
			</div>
			<div class="newblogs animated fadeInUp"
				style="display:none;animation-delay:0.3s">
				<h2 class="hometitle">最新文章</h2>
				<ul class="animated ">

				</ul>
				<p class="page" style='display:none'>
				<p>
				<p class="pageMin">
				<p>
			</div>
			
		</div>


		<div class="rightbox">
			<div class="aboutme">
				<h3 class="ab_title ">
					<a href="javascript:void(0)">关于我</a>
				</h3>
				<div class="avatar">
					<img src="${pageContext.request.contextPath}/images/my.jpeg" />
				</div>
				<div class="ab_con ">
					<p>网名：我倾尽一生,囚你无期 | Luotf</p>
					<p>职业：Java开发工程师 | 全栈</p>
					<p>籍贯：四川省—成都市</p>
					<p>邮箱：849673404@qq.com</p>
				</div>
			</div>
			<div class="dj paihang animated fadeInUp"
				style="display:none;animation-delay:0.3s">
				<h3 class="ab_title">
					<a href="javascript:void(0)">点击排行</a>
				</h3>
				<ul class="">

				</ul>
			</div>
			<div class="git links animated fadeInUp"
				style="display:none;animation-delay:0.3s">
				<h3 class="ab_title">
					<a href="javascript:void(0)">开源项目</a>
				</h3>
				<ul class="animated fadeIn">
					<li><a href="https://github.com/luotf" target="_blank">Github</a></li>
					<li><a href="https://gitee.com/luotf" target="_blank">Gitee&nbsp;&nbsp;</a></li>
				</ul>
			</div>
			<div class="weixin animated fadeInUp"
				style="display:none;animation-delay:0.3s">
				<h3 class="ab_title">公众号</h3>
				<ul class="animated fadeIn">
					<img src="${pageContext.request.contextPath}/images/wx.jpg">
				</ul>
			</div>
			<div class="link links animated fadeInUp"
				style="display:none;animation-delay:0.3s">
				<h3 class="ab_title">
					<a href="javascript:void(0)">友情链接</a>
				</h3>
				<ul class="animated fadeIn">

				</ul>
				<div class="msg"
					style="clear: both;text-align: center;margin: 25px 0px 15px;">
					<a href="javascript:void(0)"></a>
				</div>
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
	<%@ include file="fonter.jsp"%>
	<!-- 全局js -->
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/page/index.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/layer/layer.js"></script>
	<script src="${pageContext.request.contextPath}/js/plugins/sweetalert/sweetalert.min.js"></script>
</body>
</html>
