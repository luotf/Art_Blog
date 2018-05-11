<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>H+ 后台主题UI框架 - 404 页面</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <link rel="shortcut icon" href="favicon.ico"> 
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/font-awesome.css" rel="stylesheet">

    <link href="${pageContext.request.contextPath}/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">

</head>

<body class="gray-bg">


    <div class="middle-box text-center animated fadeInDown" >
        <h1>404</h1>
        <h3 class="font-bold">抱歉，你的Ip地址已被剔除~</h3>
        <div class="error-desc">
        	申请访问~请填写理由并提交
            <form class="form-inline m-t" role="form">
                <div class="form-group">
                    <input type="email" class="form-control" placeholder="请输入您的理由 …">
                </div>
                <button type="submit" class="btn btn-primary">提交</button>
            </form>
        </div>
    </div>
    <!-- 全局js -->
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

</body>

</html>
