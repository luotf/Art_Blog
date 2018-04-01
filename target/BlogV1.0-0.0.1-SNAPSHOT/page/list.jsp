<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>列表页_个人博客 - 一个在Java道路上的技术员个人博客网站</title>
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
    <div class="newblogs">
      <h2 class="hometitle"><span><a href="">心得笔记</a><a href="">Java</a><a href="">问题汇总</a><a href="">Mysql</a></span>技术专栏</h2>
      <ul>
        <li>
          <h3 class="blogtitle"><a href="/" target="_blank" >6条网页设计配色原则,让你秒变配色高手</a></h3>
          <div class="bloginfo"><span class="blogpic"><a href="/" title=""><img src="${pageContext.request.contextPath}/images/t01.jpg"  /></a></span>
            <p>网页设计好不好看,颜色是毋庸置疑要排首位的,所以关于颜色的搭配技巧以及原则,对于每一个要学习web前端设计的新手来说,这都是一个重要的学习过程.在本教程中我们将与你分享...</p>
          </div>
          <div class="autor"><span class="lm f_l"><a href="/">XXX个人博客</a></span><span class="dtime f_l">2014-02-19</span><span class="viewnum f_l">浏览（<a href="/">459</a>）</span><span class="pingl f_l">评论（<a href="/">30</a>）</span><span class="f_r"><a href="/" class="more">阅读原文>></a></span></div>
        </li>
        <li>
          <h3 class="blogtitle"><a href="/" target="_blank" >作为一个设计师,如果遭到质疑你是否能恪守自己的原则</a></h3>
          <div class="bloginfo"><span class="blogpic"><a href="/" title=""><img src="${pageContext.request.contextPath}/images/b01.png"  /></a></span>
            <p>网页设计好不好看,颜色是毋庸置疑要排首位的,所以关于颜色的搭配技巧以及原则,对于每一个要学习web前端设计的新手来说,这都是一个重要的学习过程.在本教程中我们将与你分享...</p>
          </div>
          <div class="autor"><span class="lm f_l"><a href="/">XXX个人博客</a></span><span class="dtime f_l">2014-02-19</span><span class="viewnum f_l">浏览（<a href="/">459</a>）</span><span class="pingl f_l">评论（<a href="/">30</a>）</span><span class="f_r"><a href="/" class="more">阅读原文>></a></span></div>
        </li>
        <li>
          <h3 class="blogtitle"><a href="/" target="_blank" >Come on,行动起来吧!我们和时间来一场赛跑!</a></h3>
          <div class="bloginfo"><span class="blogpic"><a href="/" title=""><img src="${pageContext.request.contextPath}/images/b06.jpg"  /></a></span>
            <p>"时间过得那么飞快,使我的小心眼儿里不只是着急,还有悲伤.有一天,我放学回家,看到太阳快落山了,就下决心说:"我要比太阳更快地回家."我狂奔回去,站在庭院前喘气的时候,看到太阳还露着半边脸,我高兴地跳跃起来,那一天我跑赢了太阳.以后我就时常做那样的游戏,有时和太阳赛跑...</p>
          </div>
          <div class="autor"><span class="lm f_l"><a href="/">XXX个人博客</a></span><span class="dtime f_l">2014-02-19</span><span class="viewnum f_l">浏览（<a href="/">459</a>）</span><span class="pingl f_l">评论（<a href="/">30</a>）</span><span class="f_r"><a href="/" class="more">阅读原文>></a></span></div>
        </li>
        <li>
          <h3 class="blogtitle"><a href="/" target="_blank" >或许换一个活法,能让你走出阴霾</a></h3>
          <div class="bloginfo"><span class="blogpic"><a href="/" title=""><img src="${pageContext.request.contextPath}/images/b06.jpg"  /></a></span>
            <p>前段时间回成都,去见了几年未见的老友.一起吃了饭,还带我家宝宝去玩.我问她为什么这么久都还没有打算要孩子,她说,她有一段时间患上了忧郁症,很长的时间才走出来,我听她这么说,我都很惊讶!想问问她原因,可见她欲言又止的神情,我便不再主动问她.就听着她慢慢的说.其实主要的原因还是源自于工作和家庭,工作压力大,每天的程序代码,上级不停的催,她甚至连续好几个通宵的熬夜...</p>
          </div>
          <div class="autor"><span class="lm f_l"><a href="/">XXX个人博客</a></span><span class="dtime f_l">2014-02-19</span><span class="viewnum f_l">浏览（<a href="/">459</a>）</span><span class="pingl f_l">评论（<a href="/">30</a>）</span><span class="f_r"><a href="/" class="more">阅读原文>></a></span></div>
        </li>
        <li>
          <h3 class="blogtitle"><a href="/" target="_blank" >即便是坑，我也想要拉你入伙！</a></h3>
          <div class="bloginfo"><span class="blogpic"><a href="/" title=""><img src="${pageContext.request.contextPath}/images/b07.jpg"  /></a></span>
            <p>对于刚毕业的学生来说，想学习建网站，掌握一技之长，最简单的入门无非就是学会html和css，先前发表过一篇文章《如果要学习web前端开发，需要学习什么？》，如果你还不知道如何着手，请仔细阅读....7天的时间，入门是没有问题的，当然，如果你用心的话！...</p>
          </div>
          <div class="autor"><span class="lm f_l"><a href="/">XXX个人博客</a></span><span class="dtime f_l">2014-02-19</span><span class="viewnum f_l">浏览（<a href="/">459</a>）</span><span class="pingl f_l">评论（<a href="/">30</a>）</span><span class="f_r"><a href="/" class="more">阅读原文>></a></span></div>
        </li>
        <li>
          <h3 class="blogtitle"><a href="/" target="_blank" >6条网页设计配色原则,让你秒变配色高手</a></h3>
          <div class="bloginfo"><span class="blogpic"><a href="/" title=""><img src="${pageContext.request.contextPath}/images/t01.jpg"  /></a></span>
            <p>网页设计好不好看,颜色是毋庸置疑要排首位的,所以关于颜色的搭配技巧以及原则,对于每一个要学习web前端设计的新手来说,这都是一个重要的学习过程.在本教程中我们将与你分享...</p>
          </div>
          <div class="autor"><span class="lm f_l"><a href="/">XXX个人博客</a></span><span class="dtime f_l">2014-02-19</span><span class="viewnum f_l">浏览（<a href="/">459</a>）</span><span class="pingl f_l">评论（<a href="/">30</a>）</span><span class="f_r"><a href="/" class="more">阅读原文>></a></span></div>
        </li>
        <li>
          <h3 class="blogtitle"><a href="/" target="_blank" >作为一个设计师,如果遭到质疑你是否能恪守自己的原则</a></h3>
          <div class="bloginfo"><span class="blogpic"><a href="/" title=""><img src="${pageContext.request.contextPath}/images/b01.png"  /></a></span>
            <p>网页设计好不好看,颜色是毋庸置疑要排首位的,所以关于颜色的搭配技巧以及原则,对于每一个要学习web前端设计的新手来说,这都是一个重要的学习过程.在本教程中我们将与你分享...</p>
          </div>
          <div class="autor"><span class="lm f_l"><a href="/">XXX个人博客</a></span><span class="dtime f_l">2014-02-19</span><span class="viewnum f_l">浏览（<a href="/">459</a>）</span><span class="pingl f_l">评论（<a href="/">30</a>）</span><span class="f_r"><a href="/" class="more">阅读原文>></a></span></div>
        </li>
        <li>
          <h3 class="blogtitle"><a href="/" target="_blank" >Come on,行动起来吧!我们和时间来一场赛跑!</a></h3>
          <div class="bloginfo"><span class="blogpic"><a href="/" title=""><img src="${pageContext.request.contextPath}/images/b06.jpg"  /></a></span>
            <p>"时间过得那么飞快,使我的小心眼儿里不只是着急,还有悲伤.有一天,我放学回家,看到太阳快落山了,就下决心说:"我要比太阳更快地回家."我狂奔回去,站在庭院前喘气的时候,看到太阳还露着半边脸,我高兴地跳跃起来,那一天我跑赢了太阳.以后我就时常做那样的游戏,有时和太阳赛跑...</p>
          </div>
          <div class="autor"><span class="lm f_l"><a href="/">XXX个人博客</a></span><span class="dtime f_l">2014-02-19</span><span class="viewnum f_l">浏览（<a href="/">459</a>）</span><span class="pingl f_l">评论（<a href="/">30</a>）</span><span class="f_r"><a href="/" class="more">阅读原文>></a></span></div>
        </li>
        <li>
          <h3 class="blogtitle"><a href="/" target="_blank" >或许换一个活法,能让你走出阴霾</a></h3>
          <div class="bloginfo"><!--<span class="blogpic"><a href="/" title=""><img src="${pageContext.request.contextPath}/images/b06.jpg"  /></a></span>-->
            <p>前段时间回成都,去见了几年未见的老友.一起吃了饭,还带我家宝宝去玩.我问她为什么这么久都还没有打算要孩子,她说,她有一段时间患上了忧郁症,很长的时间才走出来,我听她这么说,我都很惊讶!想问问她原因,可见她欲言又止的神情,我便不再主动问她.就听着她慢慢的说.其实主要的原因还是源自于工作和家庭,工作压力大,每天的程序代码,上级不停的催,她甚至连续好几个通宵的熬夜...</p>
          </div>
          <div class="autor"><span class="lm f_l"><a href="/">XXX个人博客</a></span><span class="dtime f_l">2014-02-19</span><span class="viewnum f_l">浏览（<a href="/">459</a>）</span><span class="pingl f_l">评论（<a href="/">30</a>）</span><span class="f_r"><a href="/" class="more">阅读原文>></a></span></div>
        </li>
        <li>
          <h3 class="blogtitle"><a href="/" target="_blank" >即便是坑，我也想要拉你入伙！</a></h3>
          <div class="bloginfo"><span class="blogpic"><a href="/" title=""><img src="${pageContext.request.contextPath}/images/b07.jpg"  /></a></span>
            <p>对于刚毕业的学生来说，想学习建网站，掌握一技之长，最简单的入门无非就是学会html和css，先前发表过一篇文章《如果要学习web前端开发，需要学习什么？》，如果你还不知道如何着手，请仔细阅读....7天的时间，入门是没有问题的，当然，如果你用心的话！...</p>
          </div>
          <div class="autor"><span class="lm f_l"><a href="/">XXX个人博客</a></span><span class="dtime f_l">2014-02-19</span><span class="viewnum f_l">浏览（<a href="/">459</a>）</span><span class="pingl f_l">评论（<a href="/">30</a>）</span><span class="f_r"><a href="/" class="more">阅读原文>></a></span></div>
        </li>
      </ul>
      <div class="pagelist"><a title="Total record">&nbsp;<b>142</b> </a>&nbsp;&nbsp;<a href="index.html">首页</a>&nbsp;<a href="/jstt/index.html">上一页</a>&nbsp;<a href="/jstt/index.html">1</a>&nbsp;<b>2</b>&nbsp;<a href="/jstt/index_3.html">3</a>&nbsp;<a href="/jstt/index_4.html">4</a>&nbsp;<a href="/jstt/index_5.html">5</a>&nbsp;<a href="/jstt/index_6.html">6</a>&nbsp;<a href="/jstt/index_3.html">下一页</a>&nbsp;<a href="/jstt/index_6.html">尾页</a></div>
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
      <h2 class="ab_title"><a href="">点击排行</a></h2>
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
