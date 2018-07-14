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


<title>访问数据</title>
<meta name="keywords" content="">
<meta name="description"
	content="">

<link rel="shortcut icon" href="favicon.ico">
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/font-awesome.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/css/plugins/iCheck/custom.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/animate.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/css/plugins/bootstrap-table/bootstrap-table.min.css"
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
					<div class="ibox-content mailbox-content">
						<div class="file-manager">
							<a class="btn btn-block btn-primary compose-mail"
								href="javascript:void(0);">访客统计</a>
							<div class="space-25"></div>
							<h5>访客状态</h5>
							<ul class="folder-list m-b-md" style="padding: 0">
								<li  ><a href="${pageContext.request.contextPath}/admin/visit/visit.jsp">
										<i class="fa fa-inbox "></i>记录数<span
										class="a-1 label label-info pull-right">0 </span>
								</a></li>
								<li  ><a href="${pageContext.request.contextPath}/admin/visit/visitTable.jsp">
										<i class="fa fa-user "></i>用户数<span
										class="a-2 label label-warning pull-right">0 </span>
								</a></li>
								<li ><a href="${pageContext.request.contextPath}/admin/visit/black.jsp">
										<i class="fa fa-lock "></i> 黑名单<span
										class="a-3 label label-danger pull-right">0 </span>
								</a></li>
							</ul>
							<h5>指定日期查询</h5>
							<div style="margin-bottom:20px" class="input-daterange input-group" id="datepicker">
								<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
								<input type="text" class="input-sm form-control" id="start" />
								<span class="input-group-addon">到</span> <input type="text"
									class="input-sm form-control" id="end" />
							</div>
							<button id="reset" onclick="reset()"
								class="btn-sm btn-outline btn-white pull-right"
								style="margin-top:-15px" type="button">重置</button>
							<h5>快捷查询</h5>
							<ul class="folder-list m-b-md" style="padding: 0">
                                <li><a href="javascript:void(0)" onclick="fastToSearch('四川')"><i class="fa fa-tag"></i>四川地区</a></li>
                                <li><a href="javascript:void(0)" onclick="fastToSearch('教育网')"><i class="fa fa-tag"></i>教育网</a></li>
                                <li><a href="javascript:void(0)" onclick="fastToSearch('IE')"><i class="fa fa-tag"></i>IE </a></li>
                                <li><a href="javascript:void(0)" onclick="fastToSearch('Chrome')"><i class="fa fa-tag"></i>Chrome </a></li>
                                <li><a href="javascript:void(0)" onclick="fastToSearch('Windows')"><i class="fa fa-tag"></i>Windows</a></li>
                                <li><a href="javascript:void(0)" onclick="fastToSearch('Android')"><i class="fa fa-tag"></i>Android</a></li>
                                <li><a href="javascript:void(0)" onclick="fastToSearch('iPhone')"><i class="fa fa-tag"></i>iPhone</a></li>
                                <li><a href="javascript:void(0)" onclick="fastToSearch('iPad')"><i class="fa fa-tag"></i>iPad</a></li>
                                <li><a href="javascript:void(0)" onclick="fastToSearch('Mac')"><i class="fa fa-tag"></i>Mac</a></li>
                            </ul>
							
							
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-9">
				<div class="ibox float-e-margins">
					<div class="mail-box-header">
						<h2>访客统计</h2>

						<table id="allVisit" data-mobile-responsive="true">

						</table>
						<input type="hidden" class="ipCity">
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 全局js -->
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>



	<!-- 自定义js -->
	<script src="${pageContext.request.contextPath}/js/content.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script src="${pageContext.request.contextPath}/js/fakeLoader.min.js"></script>
	<!-- iCheck -->
	<script
		src="${pageContext.request.contextPath}/js/plugins/iCheck/icheck.min.js"></script>
	<!-- Data picker -->
	<script
		src="${pageContext.request.contextPath}/js/plugins/datapicker/bootstrap-datepicker.js"></script>

	<!-- Bootstrap table -->
	<script
		src="${pageContext.request.contextPath}/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/admin/visit/visitTable.js"></script>
</body>

</html>
