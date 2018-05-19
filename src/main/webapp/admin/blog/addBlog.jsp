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


<title>H+ 后台主题UI框架 - 写信</title>
<meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
<meta name="description"
	content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

<link rel="shortcut icon" href="favicon.ico">
<link href="${pageContext.request.contextPath}/css/gruvbox-light.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/base.css"
	rel="stylesheet">
 <link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet"> 
<link href="${pageContext.request.contextPath}/css/font-awesome.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/css/plugins/iCheck/custom.css"
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
<link
	href="${pageContext.request.contextPath}/css/plugins/sweetalert/sweetalert.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/plugins/webuploader/webuploader.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/plugins/webuploader/webuploader-demo.css">
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
								href="javascript:void(0);">写博客</a>
							<div class="space-25"></div>
							<h5>博客状态</h5>
							<ul class="folder-list m-b-md" style="padding: 0">
								<li><a href="javascript:void(0);"> <i
										class="fa fa-inbox "></i>发表<span
										class="s-1 label label-info pull-right">0 篇</span></a></li>
								<li><a href="javascript:void(0);"> <i
										class="fa fa-file-text-o "></i>草稿<span
										class="s-2 label label-warning pull-right">0 篇</span></a></li>
								<li><a href="javascript:void(0);"> <i
										class="fa fa-trash-o "></i>垃圾箱<span
										class="s-3 label label-danger pull-right">0 篇</span></a></li>
							</ul>
							<h5>博客分类</h5>
							<ul class="category-list" style="padding: 0">

							</ul>

							<div class="clearfix"></div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="col-sm-9">
				<div class="ibox float-e-margins">
					<div class="mail-box-header">
						<div class="pull-right tooltip-demo">
							<button id="add_draft" type="button" class="btn btn-white btn-sm"
								data-toggle="tooltip" data-placement="top" title="存为草稿">
								<i class="fa fa-pencil"></i> 存为草稿
							</button>
							<button type="button" onclick="" class="btn btn-danger btn-sm"
								data-toggle="tooltip" data-placement="top" title="放弃">
								<i class="fa fa-times"></i> 放弃
							</button>
						</div>
						<h2>写博客</h2>
					</div>
					<div class="mail-box">
						<div class="mail-body">
							<form class="form-horizontal" method="post" id="commentForm">
								<div class="form-group">
									<label class="col-sm-2 control-label">封面：</label>
									<div class="col-sm-10">
										<a class="fancybox picPath" href="#pic" data-toggle="modal"
											onclick="findPicList()"> <img
											class="picPath animated fadeInRight"
											style="width: 190px; height: 115px;" alt="封面" title="点击更换封面"
											src="/upload/background/2018-05-17334750.JPG" />
										</a>
									</div>
								</div>
								<input type="hidden" value="" class="imagePath">
								<div class="form-group">
									<label class="col-sm-2 control-label">标题：</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="title"
											name="title" value="" required="" maxlength="30" aria-required="true">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">摘要：</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="introduction"
											name="introduction" value="" required="" maxlength="100" aria-required="true">
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
										<input type="text" class="form-control" id="keyword"
											required="" aria-required="true" name="keyword" value="" maxlength="30">
										<p class="help-block m-b-none">
											<i class="fa fa-info-circle"></i> 多个关键字之间用“;”分隔
										</p>
									</div>
								</div>
							</form>
						</div>
						<div class="mail-text h-200" style="width:84%;margin:0 auto;">
							<div id="summernote"></div>
							<div class="clearfix"></div>
						</div>
						<div class="mail-body text-right tooltip-demo">

							<button id="prev1" type="button" class="btn btn-sm btn-primary"
								data-placement="top" title="预览" data-toggle="tooltip">
								<i class="fa fa-reply"></i> 预览
							</button>

							<button id="prev2" type="button" style="display:none"
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
							<span aria-hidden="true">&times;</span>
						</button>
						<div class="infos" style="margin:0px;">
							<div class="newsview" style="padding-top:0px;">
								<h3 class="news_title"></h3>
								<div class="news_author">
									<span class="au01">罗廷方</span>
								</div>
								<div class="tags"></div>
								<div class="news_about">
									<strong>简介</strong><span class="news_intr"> </span>
								</div>
								
								<div class="news_infos"></div>
	
							</div>
						</div>
						<div class="modal-footer">
							<span class="add"></span>
							<button type="button" class="btn btn-primary"
								data-dismiss="modal">关闭</button>
						</div>
					</div>
				</div>
			</div>


			<div class="modal inmodal" id="pic" tabindex="-1" aria-hidden="true">
				<div class="modal-dialog" style="width:79.3%;margin-top:-1%;">
					<div class="modal-content animated fadeInUp">
						<button type="button" class="close" style="margin-right:7px"
							data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
						</button>
						<div id="uploader" class="wu-example"
							style="margin:0px 5.6% 0  5.6%;">
							<div class="queueList">
								<div id="dndArea" class="placeholder"
									style="min-height: 110px;padding-top: 0px;background:none">
									<div id="filePicker"></div>
									<p>或将照片拖到这里，单次最多可选300张</p>
								</div>
							</div>
							<div class="statusBar" style="display:none;">
								<div class="progress">
									<span class="text">0%</span> <span class="percentage"></span>
								</div>
								<div class="info"></div>
								<div class="btns">
									<div id="filePicker2"></div>
									<div class="uploadBtn">开始上传</div>
								</div>
							</div>
						</div>
						<div class="modal-body picsList"
							style="height:260px;overflow:scroll; padding: 0px 30px 0px 30px;">


						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

	<!-- 全局js -->
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	
	<script src="${pageContext.request.contextPath}/js/highlight.pack.js"></script>
		<script>hljs.initHighlightingOnLoad();</script> 
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

	<!-- 自定义js -->
	<script src="${pageContext.request.contextPath}/js/content.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/plugins/sweetalert/sweetalert.min.js"></script>

	<!-- Web Uploader -->
	<script type="text/javascript">
        // 添加全局站点信息
        var BASE_URL = '${pageContext.request.contextPath}/js/plugins/webuploader';
    </script>
	<script
		src="${pageContext.request.contextPath}/js/plugins/webuploader/webuploader.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/plugins/webuploader/webuploader-demo2.js"></script>

	<!-- jQuery Validation plugin javascript-->
	<script
		src="${pageContext.request.contextPath}/js/plugins/validate/jquery.validate.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/plugins/validate/messages_zh.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/plugins/validate/form-validate-demo.js"></script>

	<!-- iCheck -->
	<script
		src="${pageContext.request.contextPath}/js/plugins/iCheck/icheck.min.js"></script>
<script src="${pageContext.request.contextPath}/js/fakeLoader.min.js"></script>
	

	<!-- SUMMERNOTE -->
	<script
		src="${pageContext.request.contextPath}/js/plugins/summernote/summernote.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/plugins/summernote/summernote-zh-CN.js"></script>
	<script>
		var globalCount=0;
		$("#fakeloader").fakeLoader({
	        timeToHide:10000, //Time in milliseconds for fakeLoader disappear
	        zIndex:999, // Default zIndex
	        spinner:"spinner6",//Options: 'spinner1', 'spinner2', 'spinner3', 'spinner4', 'spinner5', 'spinner6', 'spinner7' 
	        bgColor:"#fff", //Hex, RGB or RGBA colors
	    }); 
		setTimeout(function () {
	   		$('body').css('opacity','1');
	   		$('body').attr("class", "gray-bg") //添加样式
		},100);
		
		$(document).ready(function() {
			initBlogCountBystatus();	
			initBlogType();			
							//初始化富文本
			$('#summernote').summernote({
				height : 400,//初始化默认高度    
				minHeight : null, //最小高度             
				maxHeight : null, //最大高度
				lang : 'zh-CN',//注意这里，若要设置语言，则需要引入该语言配置js
				placeholder : "请在这里写下您的内容",
				onImageUpload : function(files, editor,$editable) {
				sendFile(files[0], editor,$editable);
				}
			});
		});

		var returnAllCount=function(){
			if(globalCount==2){
				setTimeout(function () {
					$('#fakeloader').css('display','none');
				},500);
			}
		}
		
		var initBlogType=function(){
			//查询出文章类别
			//设置参数，表示查询所有的类别
			var params = {
				"data" : "all"
			};
			$.ajax({
				url : '../selectBlogType',
				type : 'post',
				data : params,
				dataType : 'json',
				success : function(data) {
					$(".form-horizontal").find(
					'select[name=typeName]')
					.html("");
					var typeName = '';
					var typeNameAndNum = '';
					var circle = new Array("text-navy",
									"text-danger",
									" text-info",
									"text-primary",
									"text-warning");
					var label = new Array(
									"label-primary",
									"label-danger",
									" label-info",
									"label-success",
									"label-warning");
					for (var i = 0; i < data.length; i++) {
						typeName += '<option value="' + data[i].id + '">'
										+ data[i].typename
										+ '</option>';
						typeNameAndNum += '<li><a href="javascript:void(0);"> <i class="fa fa-circle '
										+ circle[i % 5]
										+ '"></i> '
										+ data[i].typename
										+ '<span class="label '
										+ label[i % 5]
										+ ' pull-right">'
										+ data[i].num
										+ ' 篇</span></a></li>'
							}
							// 初始化数据
					$(".form-horizontal").find(
									'select[name=typeName]')
									.append(typeName);
					$(".category-list").html(
									typeNameAndNum);
				},
				error : function() {
					swal("初始化类别错误", "请重新操作", "error");
				}
			});
			globalCount++;
			returnAllCount();
		}
		
		
		var initBlogCountBystatus=function(){
			//初始化博客数目
			$.ajax({
				url : '../selectBlogListByStatus',
				type : 'post',
				dataType : 'json',
				success : function(data) {
					for (var i = 0; i < data.list.length; i++) {
						if (data.list[i].status == -1) {
							$(".s-2").html(
									data.list[i].count + '篇');
						} else if (data.list[i].status == 1) {
							$(".s-1").html(
									data.list[i].count + '篇');
						} else if (data.list[i].status == 2) {
							$(".s-3").html(
									data.list[i].count + '篇');
						}
					}
				},
				error : function() {
					swal("初始化博客状态错误", "请重新操作", "error");
				}
			});
			globalCount++;
			returnAllCount();
		};
		
		//图片上传  
		function sendFile(file, editor, $editable) {
			var filename = false;
			try {
				filename = file['name'];
			} catch (e) {
				filename = false;
			}
			if (!filename) {
				$(".note-alarm").remove();
			}

			//以上防止在图片在编辑器内拖拽引发第二次上传导致的提示错误  
			data = new FormData();
			data.append("file", file);
			data.append("key", filename); //唯一性参数  

			$.ajax({
				data : data,
				type : "POST",
				url : "../uploadBlogImages",
				dataType : "json",
				cache : false,
				contentType : false,
				processData : false,
				success : function(date) {
					if (date == '') {
						swal("上传失败", "请重试操作", "error");
					} else {
						var path = '图片地址  ' + date.path;
						swal("上传成功", path, "success");
					}
					editor.insertImage($editable, date.path);
				},
				error : function() {
					swal("上传错误", "请重试操作", "error");
				}
			});
		}

		//弹出模态框 选择图片
		var selectImgPath=function(img){
			$("#pic").modal('hide');
			var imgPath='<img class="picPath animated fadeInRight"  style="width: 190px; height: 115px;" alt="封面" title="点击更换封面" src="'+img.src+'" />';
			$(".picPath").html(imgPath)
			$(".imagePath").val(img.src);
		};
		
		//查找服务器图库
		var findPicList=function(){
			 $.ajax({
	                //此处使用的是自己封装的JAVA类
	                url: "../getFileList",
	                type: "POST",
	                success: function (data) {
	                    if (data.status==0) {
	                    	swal("服务器图库为空", "请上传", "error");
	                    } else {
	                     var pics='';
	                    for(var i=0;i<data.fileList.length;i++){
	                    	pics+='<a class="fancybox" href="javascript:void(0);"><img onclick="selectImgPath(this)" style="width: 190px; height: 115px;float:left;margin-right:3px;" alt="image" src="'+data.fileList[i]+'" /></a>'
	                    	}
	                    }
						$(".picsList").html(pics);
	                },
	                error: function (e) {
	                	swal("获取图片错误", "请检查接口服务", "error");
	                }
	            });
		};
		
		
		var prevBlog = function() {
			$(".newsview").find(".news_title").html($("#title").val());
			$(".news_about").find(".news_intr").html($("#introduction").val());
			var keyword = '';
			var inputKeyword = $("#keyword").val();
			$(".newsview").find(".tags").html("");
			if (inputKeyword != '' && inputKeyword != null) {
				if (inputKeyword.search(';') != -1||inputKeyword.search('；') != -1) {
					if(inputKeyword.search('；') != -1){
						inputKeyword=inputKeyword.replace(/；/g,";");
					}
					var strs = new Array();
					strs = inputKeyword.split(";");
					for (var i = 0; i < strs.length && strs[i] != ''; i++) {
						keyword += '<a href="javascript:void(0);">' + strs[i] + '</a>';
					}
				} else {
					keyword = '<a href="javascript:void(0);">' + inputKeyword + '</a>';
				}
			}
			$(".newsview").find(".tags").append(keyword);
			$(".newsview").find(".news_infos").html($("#summernote").code());
			var add = '<a  class="btn btn-white" href="javascript:void(0);" onclick="addBlog(1)">发表</a>';
			$(".modal-footer").find(".add").html(add);
			$('pre').each(function(i,block){
     		    hljs.highlightBlock(block);
     		});
			
		};

		var addBlog = function(id) {
			var prarm='新增了一篇博客';
			if(id==-1){
				prarm='将博客放入<span class="text-navy">草稿箱</span>';
			}
			var params = {
				'title' : $("#title").val(),
				'introduction' : $("#introduction").val(),
				'type.id' : $("#typeName").val(),
				'keyword' : $("#keyword").val(),
				'content' : $("#summernote").code(),
				'images':$(".imagePath").val(),
				 prarm:prarm,
				'status' : id
			};
			$.ajax({
				url : "../addBlog",
				type : "POST",
				data : params,
				dataType : 'json',
				success : function(data) {
					if (data.status == 200) {
						initBlogCountBystatus();	
						initBlogType();	
						$("#myModal").modal('hide');
						if(id==1){
						 swal("发布成功", "博客已在前端展示", "success");
						}else if(id==-1){
						 swal("放入草稿成功", "你可以前往草稿箱查看", "success");
						}
						$("#title").val("");
						$("#introduction").val("");
						$("#keyword").val("");
						$("#summernote").code("");
					} else {
						if(id==1){
							swal("发布失败", "请重新操作", "error");
						}else if(id==-1){
							swal("放入草稿失败", "请重新操作", "error");
						}
					}
				},
				error : function() {
					if(id==1){
						swal("发布错误", "请重新操作", "error");
					}else if(id==-1){
						swal("放入草稿错误", "请重新操作", "error");
					}
				}
			});
		};
		
		//只有验证通过才能执行 添加
		$("#add_draft,#add_draft2").click(function(){
		    if($("#commentForm").valid()){
		    	addBlog(-1);
		     }
		});
		
		//只有验证通过才能执行 预览
		$("#prev1").click(function(){
			    if($("#commentForm").valid()){
			    	$("#prev2").click();
			     }
			});
		
	</script>

</body>

</html>
