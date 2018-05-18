<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

    <title>H+ 后台主题UI框架 - 登录</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/font-awesome.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/login.css" rel="stylesheet">
	
    <script>
        if (window.top !== window.self) {
            window.top.location = window.location;
        }
    </script>

</head>

<body class="signin">
    <div class="signinpanel">
        <div class="row">
            <div class="col-sm-7">
                <div class="signin-info">
                    <div class="logopanel m-b">
                        <h1>[ luotf.com ]</h1>
                    </div>
                    <div class="m-b"></div>
                    <h4>欢迎进入 <strong>  后台管理网站</strong></h4>
                    <ul class="m-b">
                        <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 权限分配、操作日志</li>
                        <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 访客记录、IP剔除</li>
                        <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 分页数据、动态图表</li>
                        <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 所有操作都异步</li>
                        <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 注：访问者无删除、修改操作</li>
                    </ul>
                     <div class=" tooltip-demo ">
                   	 <strong>还没有账号？ <a href="#" style="color:#3c3a39" data-toggle="tooltip" data-placement="top" title="QQ:849673404">联系站长&raquo;</a><a href="index.jsp" style="color:#3c3a39;margin-left:15px;" >首页&raquo;</a></strong>
                    
                    </div>
                </div>
            </div>
            <div class="col-sm-5">
                <form method="post" action="${pageContext.request.contextPath}/checkLogin">
                    <h3 class="no-margins">登录</h3>
                    <p class="m-t-md">登录访问 luotf 后台管理网站</p>
                    <input type="text" name="username" class="form-control uname" placeholder="用户名" />
                    <input type="password" name="password" class="form-control pword m-b" placeholder="密码" />
                    <a style="color:#101010de" href="javascript:void(0);">忘记密码了？</a>
                     <span style="color:#6722228a;margin-left:20px;" href="javascript:void(0);">${message}</span>
                    <button type="submit" class="btn btn-success btn-block">登录</button>
                </form>
            </div>
        </div>
        <div class="signup-footer">
            <div class="pull-left">
               <strong>&copy; 2018 luotf  blog</strong>
            </div>
        </div>
    </div>
    <div class="gohome" style="display:none"></div>
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/content.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$(".gohome").css("display","none");
});
</script>

</body>

</html>
