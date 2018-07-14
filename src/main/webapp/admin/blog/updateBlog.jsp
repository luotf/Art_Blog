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


<title>更新博客</title>
<meta name="keywords" content="">
<meta name="description"
	content="">

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
<link
	href="${pageContext.request.contextPath}/css/fakeLoader.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/css/plugins/summernote/summernote.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/css/plugins/summernote/summernote-bs3.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/animate.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/index.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/base.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/css/plugins/sweetalert/sweetalert.css"
	rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/plugins/webuploader/webuploader.css">
    <link rel="stylesheet"href="${pageContext.request.contextPath}/css/plugins/webuploader/webuploader-demo.css">
<style>
.news_infos span{
 	font-size:13px;
 }

</style>

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
								href="javascript:void(0);">修改博客</a>
							<div class="space-25"></div>
							<h5>数据信息</h5>
							<ul class="folder-list m-b-md" style="padding: 0">
								<li><a href="javascript:void(0);"> <i class="fa fa-eye"></i>
										浏览量 <span class="label label-info pull-right" id="clicknum"></span>
								</a></li>
								<li><a href="javascript:void(0);"> <i
										class="fa fa-commenting-o"></i> 评论量 <span
										class="label label-success pull-right" id="commentnum"></span>
								</a></li>
								<li><a href="javascript:void(0);"> <i class="fa fa-level-up"></i>
										&nbsp;置顶<span class="label label-danger pull-right" id="istop"></span>
								</a></li>
								<li><a href="javascript:void(0);"> <i
										class="fa fa-hand-pointer-o"></i> 博主推荐 <span
										class="label label-warning pull-right" id="isrecommend"></span>
								</a></li>
							</ul>

							<h5 class="tag-title">封面</h5>
							    <a class="fancybox picPath" href="#pic" data-toggle="modal" onclick="findPicList()">
								
								</a>
							
							
								<!-- <div class="images" style="width:100%">
								
								</div> -->
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-9">
				<div class="ibox float-e-margins">
					<div class="mail-box-header">
						<div class="pull-right tooltip-demo">
							<button id="add_draft" type="button" 
								class="btn btn-white btn-sm" data-toggle="tooltip"
								data-placement="top" title="存为草稿">
								<i class="fa fa-pencil"></i> 存为草稿
							</button>
							<button type="button" onclick="javascript:history.back(-1);"
								class="btn btn-danger btn-sm" data-toggle="tooltip"
								data-placement="top" title="返回">
								<i class="fa fa-times"></i> 返回
							</button>
						</div>
						<h2>修改博客</h2>
					</div>
					<div class="mail-box">
						<div class="mail-body">
							<form class="form-horizontal" method="post" id="commentForm">
								<input type="hidden" value="" class="imagePath">
								<div class="form-group">
									<label class="col-sm-2 control-label">标题：</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="title" required="" aria-required="true"
											name="title" value="" maxlength="50">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">摘要：</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="introduction" required="" aria-required="true"
											name="introduction" value="" maxlength="150">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">类别：</label>
									<div class="col-sm-10">
										<select class="form-control m-b" id="typeName" name="typeName">


										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">关键字：</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="keyword" required="" aria-required="true"
											name="keyword" value="" maxlength="30"> <p class="help-block m-b-none"><i class="fa fa-info-circle"></i> 多个关键字之间用“;”分隔</p>
									</div>
								</div>
							
							</form>
						</div>
						<div class="mail-text h-200" style="width:84%;margin:0 auto;">
							<div id="summernote"></div>
							<div class="clearfix"></div>
						</div>
						<div class="mail-body text-right tooltip-demo">
							<button id="prev1" type="button" 
								class="btn btn-sm btn-primary"
								 data-placement="top" title="预览">
								<i class="fa fa-reply"></i> 预览
							</button>
							<button id="prev2"  type="button" style="display:none"
							onclick="prevBlog()" data-target="#myModal" data-toggle="modal">
							</button>
							<button id="add_draft2" type="button" 
								class="btn btn-white btn-sm" data-toggle="tooltip"
								data-placement="top" title="存为草稿">
								<i class="fa fa-pencil"></i> 存为草稿
							</button>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>

			<div class="modal inmodal" id="myModal" tabindex="-1" role="dialog"
				aria-hidden="true">
				<div class="modal-dialog" style="width:702px">
					<div class="modal-content animated fadeInUp">
						<button type="button" class="close" style="margin-right:7px"
							data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<div class="infos" style="margin:0px;">
							<div class="newsview" style="padding-top:0px;">
								<h3 class="news_title"></h3>
								<div class="news_author">
									<span class="au01">罗廷方</span><span class="au02"></span><span
										class="au03">共<b></b>人围观
									</span>
								</div>
								<div class="tags"></div>
								<div class="news_about">
									<strong>简介</strong><span class="news_intr"> </span>
								</div>
								<div class="news_infos"></div>
							</div>
						</div>
						<div class="modal-footer">
							<span class="update"></span>
							<button type="button" class="btn btn-primary"
								data-dismiss="modal">关闭</button>
						</div>
					</div>
				</div>
			</div>
			
			
			<div class="modal inmodal" id="pic" tabindex="-1" 
				aria-hidden="true">
				<div class="modal-dialog" style="width:79.3%;margin-top:-1%;">
					<div class="modal-content animated fadeInUp">
						<button type="button" class="close" style="margin-right:7px"
							data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
						</button> 
								<div id="uploader" class="wu-example" style="margin:0px 5.6% 0  5.6%;">
                                <div class="queueList">
                                    <div id="dndArea" class="placeholder" style="min-height: 110px;padding-top: 0px;background:none">
                                        <div id="filePicker"></div>
                                        <p>或将照片拖到这里，单次最多可选300张</p>
                                    </div>
                                </div>
                                <div class="statusBar" style="display:none;">
                                    <div class="progress">
                                        <span class="text">0%</span>
                                        <span class="percentage"></span>
                                    </div>
                                    <div class="info"></div>
                                    <div class="btns">
                                        <div id="filePicker2"></div>
                                        <div class="uploadBtn">开始上传</div>
                                    </div>
                                </div>
						</div>
						<div class="modal-body picsList" style="height:260px;overflow:scroll; padding: 0px 30px 0px 30px;">
							
							
						</div>
					</div>
				</div>
			</div>


		</div>
	</div>
</body>
	<!-- 全局js -->
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/highlight.pack.js"></script>
		<script>hljs.initHighlightingOnLoad();</script> 
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>


	<!-- 自定义js -->
	<script src="${pageContext.request.contextPath}/js/content.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/plugins/sweetalert/sweetalert.min.js"></script>

	<!-- iCheck -->
	<script
		src="${pageContext.request.contextPath}/js/plugins/iCheck/icheck.min.js"></script>

	<!-- jQuery Validation plugin javascript-->
    <script src="${pageContext.request.contextPath}/js/plugins/validate/jquery.validate.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/plugins/validate/messages_zh.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/plugins/validate/form-validate-demo.js"></script>
 <script src="${pageContext.request.contextPath}/js/fakeLoader.min.js"></script>
 	<!-- Web Uploader -->
    <script type="text/javascript">
        // 添加全局站点信息
        var BASE_URL = '${pageContext.request.contextPath}/js/plugins/webuploader';
    </script>
    <script src="${pageContext.request.contextPath}/js/plugins/webuploader/webuploader.min.js"></script>
   <script src="${pageContext.request.contextPath}/js/plugins/webuploader/webuploader-demo2.js"></script>

	<!-- SUMMERNOTE -->
	<script
		src="${pageContext.request.contextPath}/js/plugins/summernote/summernote.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/plugins/summernote/summernote-zh-CN.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/admin/blog/updateBlog.js"></script>

</body>

</html>
