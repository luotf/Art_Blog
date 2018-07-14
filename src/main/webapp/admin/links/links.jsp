<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>友情链接</title>
<meta name="keywords" content="">
<meta name="description"
	content="">
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/font-awesome.css"
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
<link href="${pageContext.request.contextPath}/css/fakeLoader.css" rel="stylesheet">
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
								href="javascript:void(0);">友链管理</a>
							<div class="space-25"></div>
							<h5>友链状态</h5>
							<ul class="folder-list m-b-md" style="padding: 0">
								<li class="share" value="0"><a href="javascript:void(0);">
										<i class="fa fa-inbox "></i>总共<span
										class="a-1 label label-info pull-right">0 条</span>
								</a></li>
								<li class="share" value="1"><a href="javascript:void(0);">
										<i class="fa fa-file-text-o "></i>已上架<span
										class="a-2 label label-warning pull-right">0 条</span>
								</a></li>
								<li class="share" value="-1"><a href="javascript:void(0);">
										<i class="fa fa-trash-o "></i>下架<span
										class="a-3 label label-danger pull-right">0 条</span>
								</a></li>
							</ul>

							<h5 class="tag-title">增加友链</h5>
							<form role="form" id="commentForm">
								<div class="form-group">
									<div class="input-group m-b">
										<span class="input-group-addon">名称</span> <input type="text"
											id="name" name="name" placeholder="请输入名称" required="" maxlength="5" aria-required="true"
											class="form-control">
									</div>
								</div>
								
								<div class="form-group">
									<div class="input-group m-b">
										<span class="input-group-addon">链接</span> <input type="text"
											id="link" name="link" placeholder="请输入链接"
											class="form-control" required="" maxlength="100" aria-required="true">
									</div>
								</div>
								<div class="form-group">
									<div class="col-md-9" style="padding:0px">
										<div class="input-group m-b">
											<span class="input-group-addon">置顶量</span> <input type="text"
												id="sort" name="sort" placeholder="置顶量"
												class="form-control">
										</div>
									</div>
								</div>
								<button id="addLinks" class="btn btn-white pull-right"
									type="button">提交</button>
							</form>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-9">
				<div class="ibox float-e-margins">
					<div class="mail-box-header">
						<h2>友链信息</h2>

						<table id="allLinks" data-mobile-responsive="true">

						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="modal-form" class="modal fade" aria-hidden="true">
		<div class="modal-dialog" style="width: 25%;">
			<div class="modal-content">
				<div class="modal-body">
					<div class="row">
						<h3 class="m-t-none m-b">修改友链信息</h3>

						<form role="form" class="form-horizontal">
							<div class="input-group m-b">
								<span class="input-group-addon">名称</span> <input type="text"
									id="newName" class="form-control">
							</div>
							<div class="input-group m-b">
								<span class="input-group-addon">链接</span> <input type="text"
									id="newLink" class="form-control">
							</div>
							<div class="input-group m-b">
								<span class="input-group-addon">置顶量</span> <input type="text"
									id="newSort" class="form-control">
							</div>
							<div class="input-group m-b">
								<span class="input-group-addon">点击量</span> <input type="text"
									id="clickNum" disabled placeholder="警用" class="form-control">
							</div>

							<div id="update"></div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>



	<!-- 全局js -->
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<script
		src="${pageContext.request.contextPath}/js/plugins/validate/jquery.validate.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/plugins/validate/messages_zh.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/plugins/validate/form-validate-demo.js"></script>

	<!-- 自定义js -->
	<script src="${pageContext.request.contextPath}/js/content.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/plugins/sweetalert/sweetalert.min.js"></script>

<script src="${pageContext.request.contextPath}/js/fakeLoader.min.js"></script>
	<!-- Bootstrap table -->
	<script
		src="${pageContext.request.contextPath}/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/admin/links/links.js"></script>
</body>
</html>
