<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>详情页_个人博客 - 一个在Java道路上的技术员个人博客网站</title>
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
    <div class="infos">
      <div class="newsview">
        <h2 class="intitle">您现在的位置是：<a href="/">网站首页</a>&nbsp;&gt;&nbsp;<a href="/">技术专栏</a></h2>
        <h3 class="news_title">作为一个设计师,如果遭到质疑你是否能恪守自己的原则?</h3>
        <div class="news_author"><span class="au01">XXX</span><span class="au02">2018-03-18</span><span class="au03">共<b>309</b>人围观</span></div>
        <div class="tags"><a href="/">中兴</a> <a href="/" target="_blank">咔咔</a> <a href="/" target="_blank">MWC</a> <a href="/" target="_blank">小蚁</a> <a href="/" target="_blank">运动相机</a></div>
        <div class="news_about"><strong>简介</strong>曾经有站长找我求助，他说他不知道该怎么办，自己做出来的网站，不仅没有得到大家的认可，反而让大家给他开了一个评判大会。他自己认为已经是做的最好的，却遭受大家无情的指责是“垃圾”作品。</div>
        <div class="news_infos">
          <p>曾经有站长找我求助，他说他不知道该怎么办，自己做出来的网站，不仅没有得到大家的认可，反而让大家给他开了一个评判大会。他自己认为已经是做的最好的，却遭受大家无情的指责是“垃圾”作品。</p>
          <p> 有的给他提出了意见，有的没有提意见，直接扔了两个字，“垃圾”。这没有谁对谁错，每个人的审美观点都不一样，我们能做的就是尊重别人。我相信他是认真对待网站的，我仔细看了他的设计，布局，颜色搭配都是他精心的设计。美和丑是没有一个评判标准的。我给他讲了一个关于建筑设计师的故事。 </p>
          <p> 300多年前，建筑设计师克里斯托·莱伊恩受命设计了英国温泽市政府大厅，他运用工程力学的知识，依据自己多年的实践经验，巧妙地设计了只用一根柱子支撑的大厅天花板。但是一年以后，在进行工程验收时，市政府权威人士却对此提出了质疑，并要求莱伊恩一定要再多加几根柱子。莱伊恩对自己的设计很自信，因此他非常苦恼：坚持自己的主张吧，他们肯定会另找人修改设计；不坚持吧，又有悖自己为人的准则。 </p>
          <p><img src="${pageContext.request.contextPath}/images/v1.jpg"></p>
          <p>矛盾了很长时间，莱伊恩终于想到了一条妙计，他在大厅里加了四根柱子，但它们并未与天花板连接，只不过是装装样子，糊弄那些刚愎自用的家伙。这个秘密始终没有被发现。直到300多年后市政府准备修缮大厅天花板时，才发现莱伊恩的“弄虚作假”。我们每个人都想得到别人的尊敬，尤其有了一定的社会地位的人，更想得到别人尊重。建筑设计师克里斯托·莱伊恩很明白这一点，当市政府权威人士对他的建筑设计提出疑问时，他并不坚持己见，而是让市政府权威人士感到他对他们很尊重。所以，一个聪明的人，不仅能维护自己的尊严，还能够顾及他人的尊严。</p>
          <p><img src="${pageContext.request.contextPath}/images/v2.jpg"></p>
          <p>莱伊恩的故事，向我们讲述了一个深刻的哲理“恪守着自己的原则，哪怕遭遇到最大的阻力，也要想办法抵达胜利。”</p>
          <p>就拿我自己来说吧，有时候会很矛盾，设计好的作品，不把它分享出来，会觉得待在自己电脑里面实在是没有意义。干脆就发布出去吧。我也害怕收到大家不好的评论，有些评论，可能说者无意，但是对于每一个用心的站长来说，都会受很深的影响，愤怒，恼羞。</p>
          <p>心态很重要，再来看莱伊恩，他当时顶着多大的压力呀。同样作为一个前端设计师，哪怕遭到质疑，我们也要像莱伊恩一样恪守自己的原则。</p>
        </div>
      </div>
      <div class="share">分享：</div>
    </div>
    <div class="nextinfo">
      <p>上一篇：<a href="/" >传微软将把入门级Surface平板价格下调150美元</a></p>
      <p>下一篇：<a href="/">云南之行——大理洱海一日游</a></p>
    </div>
    <div class="otherlink">
      <h2>相关文章</h2>
      <ul>
        <li><a href="/" title="云南之行——丽江古镇玉龙雪山">云南之行——丽江古镇玉龙雪山</a></li>
        <li><a href="/" title="云南之行——大理洱海一日游">云南之行——大理洱海一日游</a></li>
        <li><a href="/" target="_blank">住在手机里的朋友</a></li>
        <li><a href="/" target="_blank">豪雅手机正式发布! 在法国全手工打造的奢侈品</a></li>
        <li><a href="/" target="_blank">教你怎样用欠费手机拨打电话</a></li>
        <li><a href="/" target="_blank">原来以为，一个人的勇敢是，删掉他的手机号码...</a></li>
      </ul>
    </div>
    <div class="news_pl">
      <h2>文章评论</h2>
      <ul>
        
      </ul>
    </div>
  </div>
  <div class="rightbox animated fadeInUp">
    <div class="search">
      <form action="/e/search/index.php" method="post" name="searchform" id="searchform">
        <input name="keyboard" id="keyboard" class="input_text" value="请输入关键字" style="color: rgb(153, 153, 153);" onfocus="if(value=='请输入关键字'){this.style.color='#000';value=''}" onblur="if(value==''){this.style.color='#999';value='请输入关键字'}" type="text">
        <input name="show" value="title" type="hidden">
        <input name="tempid" value="1" type="hidden">
        <input name="tbname" value="news" type="hidden">
        <input name="Submit" class="input_submit" value="搜索" type="submit">
      </form>
    </div>
    <div class="paihang">
      <h2 class="ab_title"><a href="/">本栏推荐</a></h2>
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
        <li><b><a href="/" target="_blank">你面对的是生活而不是手机</a></b>
          <p>.最简单的入门无非就是学会html和css，先前发表过一篇文章...</p>
        </li>
      </ul>
      <div class="ad"><img src="${pageContext.request.contextPath}/images/ad300x100.jpg"></div>
    </div>
    <div class="paihang">
      <h2 class="ab_title"><a href="/">点击排行</a></h2>
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
        <li><b><a href="/" target="_blank">你面对的是生活而不是手机</a></b>
          <p>.最简单的入门无非就是学会html和css，先前发表过一篇文章...</p>
        </li>
      </ul>
      <div class="ad"><img src="${pageContext.request.contextPath}/images/ad01.jpg"></div>
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
  <p>Design by <a href="/">XXX个人博客</a> <a href="/">蜀ICP备11002373号-1</a></p>
</footer>
</body>
</html>
