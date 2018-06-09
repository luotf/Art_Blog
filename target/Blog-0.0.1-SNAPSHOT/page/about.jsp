<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>关于我_个人博客 - 一个在Java道路上的技术员个人博客网站</title>
<meta name="keywords" content="个人博客,罗廷方个人博客,罗廷方" />
<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.ico"> 
<meta name="description" content="罗廷方个人博客，是一个在Java道路上的技术员个人博客网站" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="${pageContext.request.contextPath}/css/base.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/animate.css" rel="stylesheet">

</head>
<body style="background:url(${pageContext.request.contextPath}/images/bj.png) repeat top left scroll">
<%@ include file="top.jsp" %>
<article>
  <div class="leftbox">
    <div class="infos">
      <div class="newsview">
        <h2 class="intitle">您现在的位置是：<a href="index.jsp">网站首页</a>&nbsp;&gt;&nbsp;<a href="about.jsp">关于我</a></h2>
        <div class="news_infos m20 animated fadeIn">
          <p>文艺程序员写代码追求让别人看懂，普通程序员追求让自己看懂，2B程序员则追求让编译器能看懂；半年后看自己当初写的代码，文艺程序员不知道是自 己 写的但很容易看懂，普通程序员知道是自己写的但是不太容易看懂，2B程序员埋头看了半天后拍着桌子吼到：“这是哪个SB写的程序！”</p>
          <p>假如生活欺骗了你，找50个程序员问问为什么编程；假如生活让你想死，找50个程序员问问Bug改完了没有；假如你觉得生活拮据，找50个程序员问问工资涨了没有；假如你觉得活着无聊，找50个程序员问问他们一天都干了什么！</p>
          <p> 两程序员聊天，程序员甲抱怨：“做程序员太辛苦了，我想换行……我该怎么办？”程序员乙：“敲一下回车。”</p>
<p>我是一个苦b的程序员，今晚加班到快通宵了，困得快睁不开眼了，女上司很关心，问我要不要吃宵夜。我没好气地说，宵夜就算了，能让我睡一觉就行了。女上司红着脸说了句讨厌啊，然后坐在我身边不动，好像距离我很近，搞得我很紧张，难道她发现我的程序出了bug？</p>          
<p>一女同学在食堂吃饭时，一程序猿凑到旁边，“同学，我能和你说话不，我已经一个月没和女生说话了。</p>
<p>有两个程序员钓鱼，其中一个钓到一条美人鱼，这个美人鱼上半身是美女，下半身是鱼，于是这个程序员就把她放了，另一个问他：Why，他回答说：没有API。 </p>
<p>晚上下班的时候。
老婆给当程序员的老公打电话：“下班顺路买一斤包子带回来，如果看到卖西瓜的，就买一个。”
当晚，程序员老公手捧一个包子进了家门……
老婆怒道：“你怎么就买了一个包子？！”
老公答曰：“因为看到了卖西瓜的。</p>
<p> 人生就是一个得与失的过程，而我却是一个幸运者，得到的永远比失去的多。</p>
	</div>
      </div>
    </div>
    
  </div>
  <div class="rightbox ">
    <div class="aboutme m20">
      <h2 class="ab_title">关于我</h2>
      <div class="avatar animated fadeIn"> <img src="${pageContext.request.contextPath}/images/my.jpeg"> </div>
      <div class="ab_con animated fadeIn">
        <p>网名：我倾尽一生,囚你无期 | Luotf</p>
        <p>职业：Java开发工程师 | 全栈 </p>
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
<%@ include file="fonter.jsp" %>
<script>
for(var i=1;i<=7;i++){
	if(i==6){
		$(".6 a").addClass("nav_color");
	}else{
		$('.'+i+' a').removeClass("nav_color");
	}
}
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
</body>
</html>
