<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>资源页_个人博客 - 一个在Java道路上的技术员个人博客网站</title>
 <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.ico"> 
<meta name="keywords" content="个人博客,罗廷方个人博客,罗廷方" />
<meta name="description" content="罗廷方个人博客，是一个在Java道路上的技术员个人博客网站" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%-- <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet"> --%>
    <link href="${pageContext.request.contextPath}/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/loaders.css"
	rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/font-awesome.css"
	rel="stylesheet">
	<style type="text/css">
	.loader-inner > div{
		background-color: #907f819e
	}
</style>
</head>
<body style="background:url(${pageContext.request.contextPath}/images/bj.png) repeat top left scroll">
<%@ include file="top.jsp" %>
  <article>
    <div class="lbox">
      <div class="newblogs notice">
      <h2 class="hometitle">
	      <span class="tagTitle">
	      	<a href="javascript:void(0);">学习视频</a>
	      	<a href="javascript:void(0);">项目源码</a>
	      	<a href="javascript:void(0);">笔记</a>
	      	<a href="javascript:void(0);">开发工具</a>
	      </span>
	     资源分享
	     </h2>
       
        <ul>
      
        </ul>
        <div class="pagelist ">
      
            </div>
            <div class="pageMin ">
      
            </div>
      </div>
    </div>

    <div class="rbox ">
      <div class="search1 whitebg">
        <form name="searchform" id="searchform" style="width:100%;height: 30px;">
        <input name="keyword" id="keyword"  class="input_text"
						value="请输入关键字" style="width:70%;color: rgb(153, 153, 153);"
						onfocus="if(value=='请输入关键字'){this.style.color='#000';value=''}"
						onblur="if(value==''){this.style.color='#999';value='请输入关键字'}"
						type="text">
          <input  class="input_submit" value="搜索" type="button" onclick="selectResource()">
        </form>
      </div>
     		<div class="tuijian2 whitebg" >
		      <h2 class="cloud_hometitle">推荐文章</h2>
		      <ul class="tjpic animated fadeInDown" >
		        <i><img src="images/t03.jpg"></i>
		      </ul>
		      <ul class="sidenews">
		       
		      </ul>
		    </div>
    </div>
  </article>

    <!-- 全局js -->
  <%--   <script src="${pageContext.request.contextPath}/js/jquery.min.js?v=2.1.4"></script> --%>
	<script src="${pageContext.request.contextPath}/js/page/resource.js"></script>
	<script src="${pageContext.request.contextPath}/js/layer/layer.js"></script>
   
</body>
</html>
