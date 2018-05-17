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
<meta name="renderer" content="webkit">

<title>博客后台 - 主页</title>

<meta name="keywords" content="">
<meta name="description" content="">


<link rel="shortcut icon" href="favicon.ico">
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/font-awesome.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/animate.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/css/fakeLoader.css"
	rel="stylesheet">
</head>

<body class="fixed-sidebar full-height-layout white-bg"
	style="overflow:hidden;">
	<div id="fakeloader"></div>
	<div id="wrapper">
		<!--左侧导航开始-->
		<nav class="navbar-default navbar-static-side" role="navigation">
			<div class="nav-close">
				<i class="fa fa-times-circle"></i>
			</div>
			<div class="sidebar-collapse">
				<ul class="nav" id="side-menu">
					<li class="nav-header">
						<div class="dropdown profile-element">
							<span><img alt="image" style="width:64px;height:64px;"class="img-circle"
								src="${pageContext.request.contextPath}/images/my.jpeg" /></span>
							<a data-toggle="dropdown" class="dropdown-toggle" href="#"> <span
								class="clear"> <span class="block m-t-xs"><strong
										class="font-bold">Beaut-zihan</strong></span> <span
									class="text-muted text-xs block">超级管理员<b class="caret"></b></span>
							</span>
							</a>
							<ul class="dropdown-menu animated fadeInRight m-t-xs">
								<li><a class="J_menuItem" href="form_avatar.html">修改头像</a>
								</li>
								<li><a class="J_menuItem" href="profile.html">个人资料</a></li>
								<li><a class="J_menuItem" href="contacts.html">联系我们</a></li>
								<li><a class="J_menuItem" href="mailbox.html">信箱</a></li>
								<li class="divider"></li>
								<li><a href="login.html">安全退出</a></li>
							</ul>
						</div>
						<div class="logo-element">H+</div>
					</li>
					<li><a href="${pageContext.request.contextPath}/admin/index_v1.jsp" class="J_menuItem"> <i class="fa fa-home"></i> <span
							class="nav-label">主页</span>
					</a></li>

					<li><a class="J_menuItem"
								href="${pageContext.request.contextPath}/admin/log/log.jsp"><i class="fa fa-hourglass-2"></i>
					<span class="nav-label">操作日志</span></a></li>
					
					<li><a class="J_menuItem" href="${pageContext.request.contextPath}/admin/charts/eCharts.jsp"><i class="fa fa-bar-chart"></i><span
							class="nav-label">统计图表</span></a>
						</li>
					<li><a href="#"><i class="fa fa-book"></i> <span
							class="nav-label">博客模块</span><span class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
								<li><a class="J_menuItem"
								href="${pageContext.request.contextPath}/admin/blog/blogTable.jsp">博客管理</a>
							</li>
								
							<li><a class="J_menuItem"
								href="${pageContext.request.contextPath}/admin/blog/addBlog.jsp">写博客</a>
							</li>
							
							<li><a class="J_menuItem"
								href="${pageContext.request.contextPath}/admin/blog/findBlog.jsp">查询博客</a>
							</li>
							<li><a class="J_menuItem"
								href="${pageContext.request.contextPath}/admin/blog/blogType.jsp">类别</a>
							</li>
							

						</ul></li>
						
						<li><a class="J_menuItem" href="${pageContext.request.contextPath}/admin/resource/resource.jsp"><i class="fa fa-table"></i> <span
							class="nav-label">资源模块</span></a>
						</li>
						<li><a href="#"><i class="fa fa-street-view"></i> <span
							class="nav-label">访客模块</span><span class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							
							<li><a class="J_menuItem" href="${pageContext.request.contextPath}/admin/visit/visit.jsp">访客记录
							</a></li>
							<li><a class="J_menuItem" href="${pageContext.request.contextPath}/admin/visit/visitTable.jsp">访客统计
							</a></li>
							<li><a class="J_menuItem" href="${pageContext.request.contextPath}/admin/visit/black.jsp">黑名单
							</a></li>
						</ul>	
							
							
						</li>
						
					<li><a href="http://changyan.kuaizhan.com/" class="J_menuItem"><i class="fa fa-commenting-o"></i> <span
							class="nav-label">评论模块</span></a>
						</li>
					
					<li><a href="${pageContext.request.contextPath}/admin/pics/pics.jsp" class="J_menuItem"><i class="fa fa-picture-o"></i> <span
							class="nav-label">本地图库</span></a>
						</li>
					<li><a href="#"><i class="fa fa-desktop"></i> <span
							class="nav-label">前台页面 </span></a>

				</ul>
			</div>
		</nav>
		<!--左侧导航结束-->
		<!--右侧部分开始-->
		<div id="page-wrapper" class="white-bg dashbard-1">
			<div class="row border-bottom">
				<nav class="navbar navbar-static-top" role="navigation"
					style="margin-bottom: 0">
					<div class="navbar-header">
						<a class="navbar-minimalize minimalize-styl-2 btn btn-primary "
							href="#"><i class="fa fa-bars"></i> </a>
						<form role="search" class="navbar-form-custom" method="post"
							action="search_results.html">
							<div class="form-group">
								<input type="text" placeholder="请输入您需要查找的内容 …"
									class="form-control" name="top-search" id="top-search">
							</div>
						</form>
					</div>
					<ul class="nav navbar-top-links navbar-right">
						<li class="dropdown"><a class="dropdown-toggle count-info"
							data-toggle="dropdown" href="#"> <i class="fa fa-envelope"></i>
								<span class="label label-warning">16</span>
						</a>
							<ul class="dropdown-menu dropdown-messages">
								<li class="m-t-xs">
									<div class="dropdown-messages-box">
										<a href="profile.html" class="pull-left"> <img alt="image"
											class="img-circle" src="img/a7.jpg">
										</a>
										<div class="media-body">
											<small class="pull-right">46小时前</small> <strong>小四</strong>
											这个在日本投降书上签字的军官，建国后一定是个不小的干部吧？ <br> <small
												class="text-muted">3天前 2014.11.8</small>
										</div>
									</div>
								</li>
								<li class="divider"></li>
								<li>
									<div class="dropdown-messages-box">
										<a href="profile.html" class="pull-left"> <img alt="image"
											class="img-circle" src="img/a4.jpg">
										</a>
										<div class="media-body ">
											<small class="pull-right text-navy">25小时前</small> <strong>国民岳父</strong>
											如何看待“男子不满自己爱犬被称为狗，刺伤路人”？——这人比犬还凶 <br> <small
												class="text-muted">昨天</small>
										</div>
									</div>
								</li>
								<li class="divider"></li>
								<li>
									<div class="text-center link-block">
										<a class="J_menuItem" href="mailbox.html"> <i
											class="fa fa-envelope"></i> <strong> 查看所有消息</strong>
										</a>
									</div>
								</li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle count-info"
							data-toggle="dropdown" href="#"> <i class="fa fa-bell"></i> <span
								class="label label-primary">8</span>
						</a>
							<ul class="dropdown-menu dropdown-alerts">
								<li><a href="mailbox.html">
										<div>
											<i class="fa fa-envelope fa-fw"></i> 您有16条未读消息 <span
												class="pull-right text-muted small">4分钟前</span>
										</div>
								</a></li>
								<li class="divider"></li>
								<li><a href="profile.html">
										<div>
											<i class="fa fa-qq fa-fw"></i> 3条新回复 <span
												class="pull-right text-muted small">12分钟钱</span>
										</div>
								</a></li>
								<li class="divider"></li>
								<li>
									<div class="text-center link-block">
										<a class="J_menuItem" href="notifications.html"> <strong>查看所有
										</strong> <i class="fa fa-angle-right"></i>
										</a>
									</div>
								</li>
							</ul></li>
						
						<li class="dropdown hidden-xs"><a
							class="right-sidebar-toggle" aria-expanded="false"> <i
								class="fa fa-tasks"></i> 主题
						</a></li>
					</ul>
				</nav>
			</div>
			<div class="row content-tabs">
				<button class="roll-nav roll-left J_tabLeft">
					<i class="fa fa-backward"></i>
				</button>
				<nav class="page-tabs J_menuTabs">
					<div class="page-tabs-content">
						<a href="javascript:;" class="active J_menuTab"
							data-id="${pageContext.request.contextPath}/admin/index_v1.jsp">主页</a>
					</div>
				</nav>
				<button class="roll-nav roll-right J_tabRight">
					<i class="fa fa-forward"></i>
				</button>
				<div class="btn-group roll-nav roll-right">
					<button class="dropdown J_tabClose" data-toggle="dropdown">
						关闭操作<span class="caret"></span>

					</button>
					<ul role="menu" class="dropdown-menu dropdown-menu-right">
						<li class="J_tabShowActive"><a>定位当前选项卡</a></li>
						<li class="divider"></li>
						<li class="J_tabCloseAll"><a>关闭全部选项卡</a></li>
						<li class="J_tabCloseOther"><a>关闭其他选项卡</a></li>
					</ul>
				</div>
				<a href="login.html" class="roll-nav roll-right J_tabExit"><i
					class="fa fa fa-sign-out"></i> 退出</a>
			</div>
			<div class="row J_mainContent" id="content-main">
				<iframe class="J_iframe" name="iframe0" width="100%" height="100%"
					src="${pageContext.request.contextPath}/admin/index_v1.jsp"
					frameborder="0"
					data-id="${pageContext.request.contextPath}/admin/index_v1.jsp"
					seamless></iframe>
			</div>
			<div class="footer">
				<div class="pull-right">
					&copy; 2018 <a href="http://www.luotf.com/" target="_blank">luotf
						blog</a>
				</div>
			</div>
		</div>
		<!--右侧部分结束-->
		<!--右侧边栏开始-->
		<div id="right-sidebar">
			<div class="sidebar-container">

				<ul class="nav nav-tabs navs-3">

					<li class="active"><a data-toggle="tab" href="#tab-1"> <i
							class="fa fa-gear"></i> 主题
					</a></li>

				</ul>

				<div class="tab-content">
					<div id="tab-1" class="tab-pane active">
						<div class="sidebar-title">
							<h3>
								<i class="fa fa-comments-o"></i> 主题设置
							</h3>
							<small><i class="fa fa-tim"></i>
								你可以从这里选择和预览主题的布局和样式，这些设置会被保存在本地，下次打开的时候会直接应用这些设置。</small>
						</div>
						<div class="skin-setttings">
							<div class="title">主题设置</div>
							<div class="setings-item">
								<span>收起左侧菜单</span>
								<div class="switch">
									<div class="onoffswitch">
										<input type="checkbox" name="collapsemenu"
											class="onoffswitch-checkbox" id="collapsemenu"> <label
											class="onoffswitch-label" for="collapsemenu"> <span
											class="onoffswitch-inner"></span> <span
											class="onoffswitch-switch"></span>
										</label>
									</div>
								</div>
							</div>
							<div class="setings-item">
								<span>固定顶部</span>

								<div class="switch">
									<div class="onoffswitch">
										<input type="checkbox" name="fixednavbar"
											class="onoffswitch-checkbox" id="fixednavbar"> <label
											class="onoffswitch-label" for="fixednavbar"> <span
											class="onoffswitch-inner"></span> <span
											class="onoffswitch-switch"></span>
										</label>
									</div>
								</div>
							</div>
							<div class="setings-item">
								<span> 固定宽度 </span>

								<div class="switch">
									<div class="onoffswitch">
										<input type="checkbox" name="boxedlayout"
											class="onoffswitch-checkbox" id="boxedlayout"> <label
											class="onoffswitch-label" for="boxedlayout"> <span
											class="onoffswitch-inner"></span> <span
											class="onoffswitch-switch"></span>
										</label>
									</div>
								</div>
							</div>
							<div class="title">皮肤选择</div>
							<div class="setings-item default-skin nb">
								<span class="skin-name "> <a href="#" class="s-skin-0">
										默认皮肤 </a>
								</span>
							</div>
							<div class="setings-item blue-skin nb">
								<span class="skin-name "> <a href="#" class="s-skin-1">
										蓝色主题 </a>
								</span>
							</div>
							<div class="setings-item yellow-skin nb">
								<span class="skin-name "> <a href="#" class="s-skin-3">
										黄色/紫色主题 </a>
								</span>
							</div>
						</div>
					</div>





				</div>

			</div>
		</div>
		<!--右侧边栏结束-->
		<!--mini聊天窗口开始-->

		<!--mini聊天窗口结束-->
	</div>

	<!-- 全局js -->
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/plugins/layer/layer.min.js"></script>

	<!-- 自定义js -->
	<script src="${pageContext.request.contextPath}/js/hplus.js"></script>
	<script src="${pageContext.request.contextPath}/js/contabs.js"></script>

	
<script src="${pageContext.request.contextPath}/js/fakeLoader.min.js"></script>

<script type="text/javascript">


//$(document).ready(function() {
	
	/* setTimeout(function () {
   		$('body').css('opacity','1');
   		$('body').attr("class", "gray-bg") //添加样式
	},100); */
	/* 	
	$("#fakeloader").fakeLoader({
	      timeToHide:300, 
	      zIndex:999, 
	      spinner:"spinner6",//Options: 'spinner1', 'spinner2', 'spinner3', 'spinner4', 'spinner5', 'spinner6', 'spinner7' 
	      bgColor:"#fff", 
}); 
}); */
	</script>
</body>

</html>
