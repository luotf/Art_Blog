<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>关于我_个人博客 - 一个在Java道路上的技术员个人博客网站</title>
<meta name="keywords" content="个人博客,罗廷方个人博客,罗廷方" />
<meta name="description" content="罗廷方个人博客，是一个在Java道路上的技术员个人博客网站" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="${pageContext.request.contextPath}/css/base.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/animate.css" rel="stylesheet">

</head>
<body>
<%@ include file="top.jsp" %>
<article>
  <div class="leftbox">
    <div class="infos">
      <div class="newsview">
        <h2 class="intitle">您现在的位置是：<a href="index.jsp">网站首页</a>&nbsp;&gt;&nbsp;<a href="about.jsp">关于我</a></h2>
        <div class="news_infos m20 animated fadeInDown">
          <p>XXX，男，一个90后草根男站长！09年入行。从搬砖一样的生活方式换成了现在有“单”而居的日子。当然这个单不是单身的单，跟我的职业相比，爱情脱单并不是问题！虽然极尽苛刻的征婚条件但也远不及客户千奇百怪的要求。告别了朝九晚五，躲过了风吹日晒，虽然不再有阶梯式的工资，但是偶尔可以给自己放放假，挽着老公，一起轻装旅行。</p>
          <p> 人生就是一个得与失的过程，而我却是一个幸运者，得到的永远比失去的多。生活的压力迫使我放弃了轻松的前台接待，放弃了体面的编辑，换来虽有些蓬头垢面的工作，但是我仍然很享受那些熬得只剩下黑眼圈的日子，因为我在学习使用Photoshop、Flash、Dreamweaver、ASP、PHP、JSP...中激发了兴趣，然后越走越远....</p>
          <p> 喜欢一句话“冥冥中该来则来，无处可逃”。</p>
        </div>
      </div>
    </div>
    
  </div>
  <div class="rightbox ">
    <div class="aboutme m20">
      <h2 class="ab_title">关于我</h2>
      <div class="avatar animated fadeInDown"> <img src="${pageContext.request.contextPath}/images/my.jpeg"> </div>
      <div class="ab_con animated fadeInDown">
        <p>网名：我倾尽一生,囚你无期 | Luotf</p>
        <p>职业：Java开发工程师 | 全栈 </p>
        <p>籍贯：四川省—成都市</p>
        <p>邮箱：849673404@qq.com</p>
      </div>
    </div>
    <div class="weixin animated fadeInDown">
      <h2 class="ab_title">公众号</h2>
      <ul>
        <img src="${pageContext.request.contextPath}/images/wx.jpg">
      </ul>
    </div>
  </div>
</article>
<%@ include file="fonter.jsp" %>
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
</body>
</html>
