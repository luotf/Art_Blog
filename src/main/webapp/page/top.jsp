<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<link rel="shortcut icon"
  href="${pageContext.request.contextPath}/images/favicon.ico">
 <link href="${pageContext.request.contextPath}/css/font-awesome.css"
  rel="stylesheet">
 <link href="${pageContext.request.contextPath}/css/base.css" rel="stylesheet">
 <link href="${pageContext.request.contextPath}/css/index.css"
  rel="stylesheet"> 
 <link href="${pageContext.request.contextPath}/css/m.css" rel="stylesheet">
 <script
    src="https://hm.baidu.com/hm.js?f655f558c510211e38805f6b586e6b15"></script>
<script
    src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js"></script>
<script src="${pageContext.request.contextPath}/js/comm.js"></script>
<style>
* {
  cursor: url('${pageContext.request.contextPath}/images/ani/a.cur'), auto;
}

a {
  cursor: url('${pageContext.request.contextPath}/images/ani/b.cur'), auto;
}
</style>
</head>
<header id="header">
  <div class="navbox">
    <h2 id="mnavh">
      <span class="navicon"></span>
    </h2>
    <div class="logo">
      <a href="/">山有木兮 | <font class="font16">只要还有明天，今天就永远是起跑线</font></a>
    </div>
    <nav>
      <ul id="starlist">
        <li><a href="${pageContext.request.contextPath}/index" title="首页" >网站首页</a></li>
        <li><a href="${pageContext.request.contextPath}/list">技术博客</a></li>
        <li class="menu"><a href="${pageContext.request.contextPath}/result?keyboard=type_1">技术专栏</a>
          <ul class="sub">
            <li></li>
          </ul> <span></span></li>
        <li><a href="${pageContext.request.contextPath}/resource">资源分享</a></li>
        <li><a href="${pageContext.request.contextPath}/find/13015.html">网站介绍</a></li>
        <li><a href="${pageContext.request.contextPath}/about">关于我</a></li>
        <li><a href="${pageContext.request.contextPath}/message">留言</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/">登录</a></li>
      </ul>
    </nav>
     <div class="searchico"></div>
  </div>
</header>

<div class="searchbox">
  <div class="search">
    <form action="${pageContext.request.contextPath}/result" name="searchform" method="post"
      id="searchform">
      <input name="keyboard" id="keyboard" class="input_text"
        value="请输入关键字词" style="color: rgb(153, 153, 153);"
        onfocus="if(value=='请输入关键字词'){this.style.color='#000';value=''}"
        onblur="if(value==''){this.style.color='#999';value='请输入关键字词'}"
        type="text"> <input name="Submit" class="input_submit"
        value="搜索" type="submit">
    </form>
  </div>
  <div class="searchclose"></div>
</div>
<script type="text/javascript" color="255,140,0" opacity='0.7'
  zIndex="-1" count="99"
  src="//cdn.bootcss.com/canvas-nest.js/1.0.1/canvas-nest.min.js"></script>
<script type="text/javascript">
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "https://hm.baidu.com/hm.js?f655f558c510211e38805f6b586e6b15";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();

//初始化所有类别信息
  var initAllBlogType = function() {
    //查询出文章类别
    //设置参数，表示查询所有的类别
    var params = {
      "data" : "all"
    };
    $.ajax({
      url : '${pageContext.request.contextPath}/selectBlogType',
      type : 'post',
      data : params,
      dataType : 'json',
      success : function(data) {
        var typeName = '';
        for (var i = 0; i < data.length; i++) {
          typeName += "<li><a href='${pageContext.request.contextPath}/result?keyboard=type_"+data[i].id +"'>"+ data[i].typename + "</a></li>";
          //typeName += '<a onclick="searchType(' + data[i].id + ',\'' + data[i].typename + '\')" href="javascript:void(0);">' + data[i].typename + '</a> '
        }
        $(".sub").html(typeName);
      },
      error : function() {
        layer.msg('请求太快，请稍后再试！', {
          icon : 5
        });
      }
    });
  }
    /*鼠标特效 */
    /*这个方法用来随机一个十六进制颜色代码，让每一次点击浮动文字的杨色不同*/
    function co() {
      var colorElements = "0,1,2,3,4,5,6,7,8,9,a,b,c,d,e,f";
      var colorArray = colorElements.split(",");
      var color = "#";
      for (var i = 0; i < 6; i++) {
        color += colorArray[Math.floor(Math.random() * 16)];
      }
      return color;
    }
    var a_idx = 0;
   
    jQuery(document).ready(function($) {
      initAllBlogType();
      $("body").click(function(e) {
        /*这个数组中的每一个字符是你要浮动显示的词或句子，每次点击鼠标后按顺序出现*/
        var a = new Array("Hello基佬", "你再点", "你继续点", "你有本事接着点", "有种你还点", "快别他妈点了", "好好看文章不行吗");
        var $i = $("<span/>").text(a[a_idx]);
        a_idx = (a_idx + 1) % a.length;
        var x = e.pageX,
          y = e.pageY;
        $i.css({
          "z-index" : 999999,
          "top" : y - 20,
          "left" : x,
          "position" : "absolute",
          "font-weight" : "bold",
          "color" : co()
        });
        $("body").append($i);
        $i.animate({
          "top" : y - 180,
          "opacity" : 0
        },
          1500,
          function() {
            $i.remove();
          });
      });
    });
  </script>
</header>