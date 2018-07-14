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


<title>日志记录</title>
<meta name="keywords" content="">
<meta name="description" content="">

<link rel="shortcut icon" href="favicon.ico">
<link href="${pageContext.request.contextPath}/css/github-gist.css"
	rel="stylesheet">
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
<link href="${pageContext.request.contextPath}/css/loaders.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/css/plugins/sweetalert/sweetalert.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/fakeLoader.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/css/plugins/datapicker/datepicker3.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/index.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/base.css"
	rel="stylesheet">
<style type="text/css">
.loader-inner>div {
	background-color: #907f819e
}
</style>

</head>

<body class="white-bg" style="opacity:0">
   <div id="fakeloader"></div>
	 <div class="wrapper wrapper-content" >
		<div class="row">
			<div class="col-sm-3">
				<div class="ibox float-e-margins">
					<div class="ibox-content mailbox-content">
						<div class="file-manager">
							<a class="btn btn-block btn-primary compose-mail"
								href="javascript:void(0);">操作日志</a>
							<div class="space-25"></div>
							<h5>用户类别</h5>
							<ul class="folder-list m-b-md" style="padding: 0">
								<li ><a href="javascript:void(0);" onclick="fastToSearch('管理员')">
										<i class="fa fa-user "> </i>  管理员
								</a></li>
								<li ><a href="javascript:void(0);" onclick="fastToSearch('普通用户')">
										<i class="fa fa-user-plus "></i>普通用户
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
							<h5>快捷查询-用户</h5>
							<ul class="folder-list m-b-md" style="padding: 0">
                               
                                <li><a href="javascript:void(0)" onclick="fastToSearch('普通用户')"><i class="fa fa-user-plus"></i>普通用户</a>
                                </li>
                                 <li><a href="javascript:void(0)" onclick="fastToSearch('查看博客')"><i class="fa fa-tag"></i> 查看博客</a>
                                </li>
                                 <li><a href="javascript:void(0)" onclick="fastToSearch('关键字查询博客')"><i class="fa fa-tag"></i> 关键字搜索博客</a>
                                </li>
                                <li><a href="javascript:void(0)" onclick="fastToSearch('关键字查询资源')"><i class="fa fa-tag"></i> 搜索资源</a>
                                </li>
                               
                            </ul>
                            <h5>快捷查询-管理员</h5>
							<ul class="folder-list m-b-md" style="padding: 0">
							 <li><a href="javascript:void(0)" onclick="fastToSearch('管理员')"><i class="fa fa-user"></i> 管理员</a>
                                </li>
                                <li><a href="javascript:void(0)" onclick="fastToSearch('更新博客')"><i class="fa fa-tag"></i> 博客(增/删/改)</a>
                                </li>
                                <li><a href="javascript:void(0)" onclick="fastToSearch('修改博客类别')"><i class="fa fa-tag"></i> 博客类别(增/删/改)</a>
                                </li>
                                <li><a href="javascript:void(0)" onclick="fastToSearch('资源')"><i class="fa fa-tag"></i> 资源(增/删/改)</a>
                                </li>
                                <li><a href="javascript:void(0)" onclick="fastToSearch('黑名单')"><i class="fa fa-tag"></i> 黑名单(增/删)</a>
                                </li>
                            </ul>
							<div class="clearfix"></div>
						</div>
					</div>
					<a class="top" onclick="window.scrollTo(0,0)" style="z-index:999;font-size: 22px;position: fixed;bottom: 5%;right: 0%;"><span><i class="fa fa-arrow-circle-up"></i></span></a>
				</div>
			</div>
		
			<div class="col-sm-9">
				<div class="ibox float-e-margins" style="margin-bottom:0px">
                    <div class="mail-box-header">
                        <h2>日志记录</h2>
                       <div class="mail-tools tooltip-demo m-t-md">
		                   <form  class="pull-right mail-search">
	                        <div class="input-group">
	                            <input type="text" class="form-control input-sm keyword"  placeholder="搜索用户，ip等">
	                            <div class="input-group-btn">
	                                <button type='button' onclick="selectLogByDate(1,null, null);" class="btn btn-sm btn-primary">
	                                  		  搜索
	                                </button>
	                            </div>
	                        </div>
	                    </form>
	                  <button onclick="reset()" class="btn btn-white btn-sm refresh" data-toggle="tooltip" data-placement="top" title="刷新日志列表"><i class="fa fa-refresh"></i> 刷新</button>
                    </div>
                    </div>
                    <div class="mail-box no-padding" style="margin-bottom:0px">
                        <ul class="list-group logList">
                            
                        </ul>
                        <ul class="list-group page">
                            
                        </ul>
                    </div>
                </div>
			</div>
		</div>
	</div>
	
<div class="modal inmodal" id="myModal" tabindex="-1" role="dialog"
					aria-hidden="true">
					<div class="modal-dialog" style="width:702px">
						<div class="modal-content animated fadeInUp">
						<button type="button" class="close" style="margin-right:7px" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
							<div class="infos" style="margin:0px;">
								<div class="newsview" style="padding-top:0px;">
									<h3 class="news_title"></h3>
									<div class="news_author">
										<span class="au01">罗廷方</span><span class="au02"></span><span
											class="au03">共<b></b>人围观
										</span>
									</div>
									<div class="tags">
										
									</div>
									<div class="news_about">
										<strong>简介</strong><span class="news_intr">
									</span>
									</div>
									<div class="news_infos">
										
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
							</div>
						</div>
					</div>
				</div>

	<!-- 全局js -->
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/highlight.pack.js"></script>
		<script>hljs.initHighlightingOnLoad();</script> 
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/layer/layer.js"></script>
	<script src="${pageContext.request.contextPath}/js/fakeLoader.min.js"></script>
	
	<!-- Data picker -->
	<script
		src="${pageContext.request.contextPath}/js/plugins/datapicker/bootstrap-datepicker.js"></script>
	<!-- 自定义js -->
	<script src="${pageContext.request.contextPath}/js/content.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/plugins/sweetalert/sweetalert.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/admin/log/log.js"></script>

</body>

</html>
