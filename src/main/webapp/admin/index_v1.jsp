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

<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/font-awesome.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/animate.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/css/plugins/sweetalert/sweetalert.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/css/plugins/datapicker/datepicker3.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/css/fakeLoader.css"
	rel="stylesheet">
</head>

<body class="white-bg" style="opacity:0">
	<div id="fakeloader"></div>
	  <div class="wrapper wrapper-content">
		<div class="row">
			<div class="col-sm-3">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<span class="label label-success pull-right">总数</span>
						<h5>博客</h5>
					</div>
					<div class="ibox-content">
						<h1 class="allBlog no-margins" style="text-align: center;">0</h1>
						<div class="allBlogPercent stat-percent font-bold text-navy">
							0%</div>
						<small>已发表</small>
					</div>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<span class="label label-danger pull-right">总数</span>
						<h5>草稿箱</h5>
					</div>
					<div class="ibox-content">
						<h1 class="draft no-margins" style="text-align: center;">0</h1>
						<div class="draftPercent stat-percent font-bold text-warning">
							0%</div>
						<small>未发表</small>
					</div>
				</div>
			</div>

			<div class="col-sm-3">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<span class="label label-warning pull-right">今天</span>
						<h5>今日发表</h5>
					</div>
					<div class="ibox-content">
						<h1 class="nowBlog no-margins" style="text-align: center;">0</h1>
						<div class="nowBlogPercent stat-percent font-bold text-danger">
							0%</div>
						<small>较昨日</small>
					</div>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<span class="label label-info pull-right">今天</span>
						<h5>今日访客</h5>
					</div>
					<div class="ibox-content">
						<h1 class="nowVisitors no-margins" style="text-align: center;">0</h1>
						<div
							class="nowVisitorsPercent stat-percent font-bold text-success">
							0%</div>
						<small>较昨日</small>
					</div>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<span class="label label-success pull-right">总数</span>
						<h5>资源</h5>
					</div>
					<div class="ibox-content">
						<h1 class="resource no-margins" style="text-align: center;">0</h1>
						<div class="resourcePercent stat-percent font-bold text-navy">
							0%</div>
						<small>已发表</small>
					</div>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<span class="label label-danger pull-right">总数</span>
						<h5>垃圾箱</h5>
					</div>
					<div class="ibox-content">
						<h1 class="delete no-margins " style="text-align: center;">0</h1>
						<div class="deletePercent stat-percent font-bold text-warning">
							0%</div>
						<small>已删除</small>
					</div>
				</div>
			</div>

			<div class="col-sm-3">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<span class="label label-warning pull-right">昨天</span>
						<h5>昨日发表</h5>
					</div>
					<div class="ibox-content">
						<h1 class="yesBlog no-margins" style="text-align: center;">0</h1>
						<div class="yesBlogPercent stat-percent font-bold text-danger">
							0%</div>
						<small>较昨日</small>
					</div>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<span class="label label-info pull-right">历史</span>
						<h5>历史访客</h5>
					</div>
					<div class="ibox-content">
						<h1 class="visitors no-margins" style="text-align: center;">0</h1>
						<div class=" stat-percent font-bold text-success">
							100% <i class="fa fa-bolt"></i>
						</div>
						<small>总访问量</small>
					</div>
				</div>
			</div>

		</div>
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5> <i class="fa fa-bar-chart"></i> 访问量</h5>
						<div class="pull-right">
							<div class="btn-group">
								<button type="button" onclick="initVisitCountByWeek(7);"
									class="day btn btn-xs btn-white ">天</button>
								<button type="button" onclick="initVisitCountByMonth(12);"
									class="month btn btn-xs btn-white">月</button>
								<button type="button" class="year btn btn-xs btn-white"
									onclick=" initVisitCountByYear(6);">年</button>
							</div>
						</div>
					</div>
					<div class="ibox-content">
						<div class="row">
							<div class="col-sm-9">
								<div class="flot-chart">
									<div class="flot-chart-content" id="echarts-line-chart"></div>
								</div>
							</div>
							<div class="col-sm-3">
								<ul class="stat-list">
									<li>
										<h3>指定日期查询</h3> <!-- <small>指定日期</small> -->
										<div class="input-daterange input-group" id="datepicker">
											<span class="input-group-addon"><i
												class="fa fa-calendar"></i></span> <input type="text"
												class="input-sm form-control" id="start" /> <span
												class="input-group-addon">到</span> <input type="text"
												class="input-sm form-control" id="end" />
										</div>
									</li>
									<li>
										<h4 style="text-align: center;" class="date"></h4>
									</li>
								</ul>
								<h5 style="text-align: center;">
									近  <span class="num" style="font-size:20px">0</span><span
										class="md"></span>访问人数
								</h5>
								<div class="col-sm-4"
									style="padding-right: 0px;padding-left: 0px;">
									<div class="ibox-content">
										<h2 class="all no-margins" style="text-align: center;">0</h2>
										<span class="label label-success">总数</span>
									</div>
								</div>
								<div class="col-sm-4"
									style="padding-right: 0px;padding-left: 0px;">
									<div class="ibox-content">
										<h2 class="high no-margins" style="text-align: center;">0</h2>
										<span class="label label-primary">最高</span>
									</div>
								</div>
								<div class="col-sm-4"
									style="padding-right: 0px;padding-left: 0px;">
									<div class="ibox-content">
										<h2 class="low no-margins" style="text-align: center;">0</h2>
										<span class="label label-info ">最低</span>
									</div>

								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>


	</div>

	<!-- 全局js -->
	<script
		src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/plugins/echarts/echarts.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script src="${pageContext.request.contextPath}/js/fakeLoader.min.js"></script>
	<!-- Data picker -->
	<script
		src="${pageContext.request.contextPath}/js/plugins/datapicker/bootstrap-datepicker.js"></script>

	<script
		src="${pageContext.request.contextPath}/js/admin/index_v1.js"></script>
	
</body>

</html>

