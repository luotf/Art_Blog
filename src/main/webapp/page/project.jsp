<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>项目案例_个人博客 - 一个在Java道路上的技术员个人博客网站</title>
<meta name="keywords" content="个人博客,罗廷方个人博客,罗廷方" />
<meta name="description" content="罗廷方个人博客，是一个在Java道路上的技术员个人博客网站" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="${pageContext.request.contextPath}/css/base.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/animate.css" rel="stylesheet">

<!--[if lt IE 9]>
<script src="${pageContext.request.contextPath}/js/modernizr.js"></script>
<![endif]-->
<script>
window.onload = function ()
{
	var oH2 = document.getElementsByTagName("h2")[0];
	var oUl = document.getElementsByTagName("ul")[0];
	oH2.onclick = function ()
	{
		var style = oUl.style;
		style.display = style.display == "block" ? "none" : "block";
		oH2.className = style.display == "block" ? "open" : ""
	}
}
</script>
</head>
<body>
<header>
  <div id="mnav">
    <h2><span class="navicon"></span></h2>
    <ul>
    <li><a href="${pageContext.request.contextPath}/page/index.jsp">网站首页</a></li>
      <li><a href="${pageContext.request.contextPath}/page/list.jsp">技术博客</a></li>
      <li><a href="${pageContext.request.contextPath}/page/list.jsp">面试汇总</a></li>
      <li><a href="${pageContext.request.contextPath}/page/project.jsp">项目案例</a></li>
      <li><a href="${pageContext.request.contextPath}/page/resource.jsp">资源分享</a></li>
      <li><a href="${pageContext.request.contextPath}/page/about.jsp">关于我</a></li>
      <li><a href="/">留言</a></li>
    </ul>
  </div>
  <nav>
    <ul>
      <li><a href="${pageContext.request.contextPath}/page/index.jsp">网站首页</a></li>
      <li><a href="${pageContext.request.contextPath}/page/list.jsp">技术博客</a></li>
      <li><a href="${pageContext.request.contextPath}/page/list.jsp">面试汇总</a></li>
      <li><a href="${pageContext.request.contextPath}/page/project.jsp">项目案例</a></li>
      <li><a href="${pageContext.request.contextPath}/page/resource.jsp">资源分享</a></li>
      <li><a href="${pageContext.request.contextPath}/page/about.jsp">关于我</a></li>
      <li><a href="/">留言</a></li>
    </ul>
  </nav>
</header>
<article>
  
  <div class="leftbox animated fadeInUp">
    <div class="tuijian ">
      <h2 class="hometitle"><span><a href="list.jsp">资源分享</a><a href="list.jsp">技术专栏</a><a href="/">面试宝典</a><a href="/">热门标签</a></span>项目案例</h2>
      <ul>
        <li>
          <div class="tpic"><img src="${pageContext.request.contextPath}/images/b01.png"></div>
          <b>6条网页设计配色原则,让你秒变配色高手</b><span>网页设计好不好看,颜色是毋庸置疑要排首位的,所以关于颜色的搭配技巧以及原则,对于每一个要学习web前端设计的新手来说,这都是一个重要的学习过程.在本教程中我们将与你分享...</span><a href="project_detail.jsp" class="readmore">查看详情</a></li>
        <li>
          <div class="tpic"><img src="${pageContext.request.contextPath}/images/b02.jpg"></div>
          <b>作为一个设计师,如果遭到质疑你是否能恪守自己的原则</b><span>就拿我自己来说吧，有时候会很矛盾，设计好的作品，不把它分享出来，会觉得待在自己电脑里面实在是没有意义...</span><a href="project_detail.html" class="readmore">查看详情</a></li>
        <li>
          <div class="tpic"><img src="${pageContext.request.contextPath}/images/b03.jpg"></div>
          <b>愿有人陪你一起颠沛流离</b><span>有一天晚上我收到朋友的邮件，他问我怎样可以最快地摆脱寂寞，我想了想不知道应该怎么回答他，因为我从来没有摆脱过这个问题，我只能去习惯它，就像习惯身体的一部分...</span><a href="project_detail.html" class="readmore">查看详情</a></li>
        
      </ul>
    </div>
    
    <div class="news_pl">
      <h2>文章评论</h2>
      <ul>
        
      </ul>
    </div>

  </div>
  <div class="rightbox animated fadeInUp">
    
    <div class="paihang">
      <h2 class="ab_title"><a href="/">热门推荐</a></h2>
      <ul>
        <li><b><a href="/" target="_blank">住在手机里的朋友</a></b>
          <p>对于刚毕业的学生来说，想学习建网站，掌握一技之长，最简单的入门无学...</p>
        </li>
        <li><b><a href="/" target="_blank">教你怎样用欠费手机拨打电话</a></b>
          <p>对于刚毕业的学生来说，想学习建网站，掌握一技之长，最简单的入门...</p>
        </li>
        <li><b><a href="/" target="_blank">原来以为，一个人的勇敢是，删掉他的手机号码</a></b>
          <p>.先前发表过一篇文章《如果要学习web前端开发，需要学习什么？》</p>
        </li>
        <li><b><a href="/" target="_blank">手机的16个惊人小秘密，据说99.999%的人都不知</a></b>
          <p>对于刚毕业的学生来说，.需要学习什么？》</p>
        </li>
        <li><b><a href="/" target="_blank">教你怎样用欠费手机拨打电话</a></b>
          <p>对于刚毕业的学生来说，想学习建网站，掌握一技之长，最简单的入门...</p>
        </li>
      </ul>
     
    </div>
    
  </div>
</article>
<footer>
  <p>Design by <a href="/">XXX个人博客</a> <a href="/">蜀ICP备11002373号-1</a></p>
</footer>
</body>
</html>
