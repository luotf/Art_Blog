<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>留言页_个人博客 - 一个在Java道路上的技术员个人博客网站</title>
<meta name="keywords" content="个人博客,罗廷方个人博客,罗廷方" />
<meta name="description" content="罗廷方个人博客，是一个在Java道路上的技术员个人博客网站" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="${pageContext.request.contextPath}/css/base.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/index.css"
	rel="stylesheet">

	<link href="${pageContext.request.contextPath}/css/animate.css" rel="stylesheet">
</head>
<body style="background:url(${pageContext.request.contextPath}/images/bj.png) repeat top left scroll">
	<%@ include file="top.jsp" %>
	<article>
		<div class="leftbox">
			<div class="news_pl">
				<h2>留言</h2>
				<div style="width:90%;margin: 0 auto;">
				<!--PC和WAP自适应版-->
				<div  id="SOHUCS" sid="849673404@qq.com"></div>
				</div>
			</div>
		</div>
		<div class="rightbox  ">
			
			<!-- <div class="paihang">
				<h2 class="ab_title">
					<a href="#">留言排行</a>
				</h2>
				<div class='pl_paihang animated fadeInDown' id="cyHotusers"
					role="cylabs" data-use="hotusers"></div>
				<script type="text/javascript" charset="utf-8"
					src="http://changyan.itc.cn/js/lib/jquery.js"></script>
				<script type="text/javascript" charset="utf-8"
					src="http://changyan.sohu.com/js/changyan.labs.https.js?appid=cytzg9rLH"></script>
			</div> -->

		</div>
	</article>
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript"> 
			(function(){ 
			var appid = 'cytzg9rLH'; 
			var conf = 'prod_230eb23e872ad7a4302e5802e6f91bf9'; 
			var width = window.innerWidth || document.documentElement.clientWidth; 
			if (width < 960) { 
			window.document.write('<script id="changyan_mobile_js" charset="utf-8" type="text/javascript" src="https://changyan.sohu.com/upload/mobile/wap-js/changyan_mobile.js?client_id=' + appid + '&conf=' + conf + '"><\/script>'); } else { var loadJs=function(d,a){var c=document.getElementsByTagName("head")[0]||document.head||document.documentElement;var b=document.createElement("script");b.setAttribute("type","text/javascript");b.setAttribute("charset","UTF-8");b.setAttribute("src",d);if(typeof a==="function"){if(window.attachEvent){b.onreadystatechange=function(){var e=b.readyState;if(e==="loaded"||e==="complete"){b.onreadystatechange=null;a()}}}else{b.onload=a}}c.appendChild(b)};loadJs("https://changyan.sohu.com/upload/changyan.js",function(){window.changyan.api.config({appid:appid,conf:conf})}); } })(); </script>
				
	<script type="text/javascript">
	for(var i=1;i<=7;i++){
		if(i==7){
			$(".7 a").addClass("nav_color");
		}else{
			$('.'+i+' a').removeClass("nav_color");
		}
	}
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
	</script>
</body>
</html>
