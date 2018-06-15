<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.ico"> 
<link href="${pageContext.request.contextPath}/css/font-awesome.css"
	rel="stylesheet">
<style>
 .nav_color{
 	color:#f8ac59;
 }
 *{
 	cursor:url('${pageContext.request.contextPath}/images/ani/a.cur'),auto;
 	
 }
 a {  
    cursor:url('${pageContext.request.contextPath}/images/ani/b.cur'),auto;
    } 
</style>
<script>
	/* if (document.location.host != "www.luotf.com") {
	location.href = location.href.replace(document.location.host,'www.luotf.com');
	} */
	
</script>

</head>
<header>
  <div id="mnav">
    <h2><span class="navicon"></span></h2>
    <ul>
      <li><a href="${pageContext.request.contextPath}/index"><i class="fa fa-home"></i> 网站首页</a></li>
      <li><a href="${pageContext.request.contextPath}/list"><i class="fa fa-code"></i> 技术博客</a></li>
      <li><a href="${pageContext.request.contextPath}/summary"><i class="fa fa-folder-o"></i> 知识总结</a></li>
      <li><a href="${pageContext.request.contextPath}/resource"><i class="fa fa-share-alt"></i> 资源分享</a></li>
      <li><a href="${pageContext.request.contextPath}/find/13015.html"><i class="fa fa-tv"></i> 网站介绍</a></li>
      <li><a href="${pageContext.request.contextPath}/about"><i class="fa fa-heart-o"></i> 关于我</a></li>
      <li><a href="${pageContext.request.contextPath}/message"><i class="fa fa-commenting-o"></i> 留言</a></li>
      <li><a href="${pageContext.request.contextPath}/admin/"><i class="fa fa-sign-in"></i> 登录</a></li>
    </ul>
  </div>
  <nav id="nav">
    <ul>
      <li class="a1"><a class="" href="${pageContext.request.contextPath}/index"><i class="fa fa-home "></i> 网站首页</a></li>
      <li class="a2"><a class="" href="${pageContext.request.contextPath}/list"><i class="fa fa-code"></i> 技术博客</a></li>
      <li class="a3"><a class="" href="${pageContext.request.contextPath}/summary"><i class="fa fa-folder-o"></i> 知识总结</a></li>
      <li class="a4"><a class="" href="${pageContext.request.contextPath}/resource"><i class="fa fa-share-alt"></i> 资源分享</a></li>
      <li class="a5"><a class="" href="${pageContext.request.contextPath}/find/13015.html"><i class="fa fa-tv"></i> 网站介绍</a></li>
      <li class="a6"><a class="" href="${pageContext.request.contextPath}/about"><i class="fa fa-heart-o"></i> 关于我</a></li>
      <li class="a7"><a class="" href="${pageContext.request.contextPath}/message"><i class="fa fa-commenting-o"></i> 留言</a></li>
      <li class="a8"><a class="" href="${pageContext.request.contextPath}/admin/"><i class="fa fa-sign-in"></i> 登录</a></li>
    </ul>
  </nav>
  <script type="text/javascript" color="255,140,0" opacity='0.7' zIndex="-1" count="99" src="//cdn.bootcss.com/canvas-nest.js/1.0.1/canvas-nest.min.js"></script>
 	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
  <script>
  $(window).scroll(function(){
		if($(document).scrollTop()>70){
			$("nav").addClass("animated fadeOutUp");
			$("nav").removeClass("fadeInDown");
		}
		if($(document).scrollTop()==0){
			$("nav").addClass("animated fadeInDown");
			$("nav").removeClass("fadeOutUp");
		 }
	});
	</script>
	
	<script type="text/javascript">
	/*鼠标特效 */
	  /*这个方法用来随机一个十六进制颜色代码，让每一次点击浮动文字的杨色不同*/
	  function co(){
	        var colorElements = "0,1,2,3,4,5,6,7,8,9,a,b,c,d,e,f";
	    var colorArray = colorElements.split(",");
	    var color ="#";
	    for(var i =0;i<6;i++){
	    color+=colorArray[Math.floor(Math.random()*16)];
	    }
	    return color;
	};
	var a_idx = 0;
	jQuery(document).ready(function($) {
	$("body").click(function(e) {
	    /*这个数组中的每一个字符是你要浮动显示的词或句子，每次点击鼠标后按顺序出现*/
	    var a = new Array("Hello基佬","你再点", "你继续点", "你有本事接着点", "有种你还点", "快别他妈点了", "好好看文章不行吗");
	    var $i = $("<span/>").text(a[a_idx]);
	    a_idx = (a_idx + 1) % a.length;
	    var x = e.pageX,
	    y = e.pageY;
	    $i.css({
	        "z-index": 999999,
	        "top": y - 20,
	        "left": x,
	        "position": "absolute",
	        "font-weight": "bold",
	        "color": co()
	    });
	    $("body").append($i);
	    $i.animate({
	        "top": y - 180,
	        "opacity": 0
	    },
	    1500,
	    function() {
	        $i.remove();
	    });
	});
	});
	</script>
</header>

