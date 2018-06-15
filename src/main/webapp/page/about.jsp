<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>关于我_个人博客 - 一个在Java道路上的技术员个人博客网站</title>
<meta name="keywords" content="个人博客,罗廷方个人博客,罗廷方" />
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/images/favicon.ico">
<meta name="description" content="罗廷方个人博客，是一个在Java道路上的技术员个人博客网站" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="${pageContext.request.contextPath}/css/base.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/index.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/animate.css"
	rel="stylesheet">

</head>
<body
	style="background:url(${pageContext.request.contextPath}/images/bj.png) repeat top left scroll">
	<%@ include file="top.jsp"%>
	<article>
		<div class="leftbox">
			<div class="infos">
				<div class="newsview">
					<h2 class="intitle">
						您现在的位置是：<a href="index.jsp">网站首页</a>&nbsp;&gt;&nbsp;<a
							href="about.jsp">关于我</a>
					</h2>
					<div class="news_infos m20 animated fadeIn">
						<h3 style="color: #000;font-size: 15px;">关于站长</h3>
						<br>
						<p>罗廷方，男，一个95后站长，四川人。</p>
						<p>15年09月至18年4月一直潜心研究Java，一边读书一边学习Java，目前大三。</p>
						<br>
						<h3 style="color: #000;font-size: 15px;">为什么要做这个网站</h3>
						<br>
						<p>（1）如果学过某个知识的话，写成Blog，在未来某个时刻其实可以很轻易的找到这份笔记，然后查看一下之前所学，温故而知新。</p>
						<p>（2）写文章或者Blog和看书是截然不同的。写文章的话，首先不仅要看懂书本上的内容，还要整理成自己的语言描述出来，其实能够在某种程度上加深自己对知识的理解。</p>
						<p>（3）持续写Blog的话，其实在未来的时候可以翻看自己的成长记录。</p>
						<p>（4）持续写Blog能够看到自己一点一点的进步。人生毕竟是一场马拉松，而不是一场百米冲刺。</p>
						<br>
						<h3 style="color: #000;font-size: 15px;">关于我的博客</h3>
						<br>
						<p>域名：www.luotf.com</p>
						<p>服务器：阿里云服务器</p>
						<p>备案号：蜀ICP备18001827号-1</p>
						<p>程序：Java</p>
						<a target= "_blank" href="http://www.luotf.com/find/13015.html"><span style="color: #12aae8;font-size: 13px;">查看更多</span></a>
					</div>
				</div>
			</div>
		</div>
		<div class="rightbox ">
			<div class="aboutme m20">
				<h2 class="ab_title">关于我</h2>
				<div class="avatar animated fadeIn">
					<img src="${pageContext.request.contextPath}/images/my.jpeg">
				</div>
				<div class="ab_con animated fadeIn">
					<p>网名：我倾尽一生,囚你无期 | Luotf</p>
					<p>职业：Java开发工程师 | 全栈</p>
					<p>籍贯：四川省—成都市</p>
					<p>邮箱：849673404@qq.com</p>
				</div>
			</div>
			<div class="weixin animated fadeIn">
				<h2 class="ab_title">公众号</h2>
				<ul>
					<img src="${pageContext.request.contextPath}/images/wx.jpg">
				</ul>
			</div>
		</div>
	</article>
	<%@ include file="fonter.jsp"%>
	<script>
		for (var i = 1; i <= 7; i++) {
			if (i == 6) {
				$(".a6 a").addClass("nav_color");
			} else {
				$('.a' + i + ' a').removeClass("nav_color");
			}
		}
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
