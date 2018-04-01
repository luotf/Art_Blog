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


<title>H+ 后台主题UI框架 - 写信</title>
<meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
<meta name="description"
	content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

<link rel="shortcut icon" href="favicon.ico">
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

</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="row">
			<div class="col-sm-3">
				<div class="ibox float-e-margins">
					<div class="ibox-content mailbox-content">
						<div class="file-manager">
							<a class="btn btn-block btn-primary compose-mail"
								href="mail_compose.html">写博客</a>
							<div class="space-25"></div>
							<h5>文件夹</h5>
							<ul class="folder-list m-b-md" style="padding: 0">
								<li><a href="mailbox.html"> <i class="fa fa-inbox "></i>
										正文 <span class="label label-info pull-right">14 篇</span>
								</a></li>
								<li><a href="mailbox.html"> <i
										class="fa fa-file-text-o"></i> 草稿 <span
										class="label label-warning pull-right">2 篇</span>
								</a></li>
								<li><a href="mailbox.html"> <i class="fa fa-trash-o"></i>
										垃圾箱 <span class="label label-danger pull-right">1 篇</span>
								</a></li>
							</ul>
							<h5>分类</h5>
							<ul class="category-list" style="padding: 0">
								<li><a href="mail_compose.html#"> <i
										class="fa fa-circle text-navy"></i> 技术博客 <span
										class="label label-info pull-right">14 篇</span>
								</a></li>
								<li><a href="mail_compose.html#"> <i
										class="fa fa-circle text-danger"></i> 基础总结 <span
										class="label label-info pull-right">14 篇</span>
								</a></li>
								<li><a href="mail_compose.html#"> <i
										class="fa fa-circle text-primary"></i> 面试 <span
										class="label label-info pull-right">14 篇</span>
								</a></li>
								<li><a href="mail_compose.html#"> <i
										class="fa fa-circle text-info"></i> 项目案例 <span
										class="label label-info pull-right">14 篇</span>
								</a></li>
							</ul>

							<h5 class="tag-title">标签</h5>
							<ul class="tag-list" style="padding: 0">
								<li><a href="mail_compose.html"> <i class="fa fa-tag"></i>
										I/O
								</a></li>
								<li><a href="mail_compose.html"> <i class="fa fa-tag"></i>MySQL
								</a></li>
								<li><a href="mail_compose.html"> <i class="fa fa-tag"></i>Struts2
								</a></li>
								<li><a href="mail_compose.html"> <i class="fa fa-tag"></i>
										Spring
								</a></li>
								<li><a href="mail_compose.html"> <i class="fa fa-tag"></i>
										Hibernate
								</a></li>
								<li><a href="mail_compose.html"> <i class="fa fa-tag"></i>
										Mybatis
								</a></li>
								<li><a href="mail_compose.html"> <i class="fa fa-tag"></i>
										SpringMVC
								</a></li>
								<li><a href="mail_compose.html"> <i class="fa fa-tag"></i>
										基础框架
								</a></li>
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
							<a href="mailbox.html" class="btn btn-white btn-sm"
								data-toggle="tooltip" data-placement="top" title="存为草稿"><i
								class="fa fa-pencil"></i> 存为草稿</a> <a href="mailbox.html"
								class="btn btn-danger btn-sm" data-toggle="tooltip"
								data-placement="top" title="放弃"><i class="fa fa-times"></i>
								放弃</a>
						</div>
						<h2>写博客</h2>
					</div>
					<div class="mail-box">
						<div class="mail-body">
							<form class="form-horizontal" method="get">
								<div class="form-group">
									<label class="col-sm-2 control-label">标题：</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" value="">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">摘要：</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" value="">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">类别：</label>
									<div class="col-sm-10">
										<select class="form-control m-b" name="account">
											<option>选项 1</option>
											<option>选项 2</option>
											<option>选项 3</option>
											<option>选项 4</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">关键字：</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" value=""> <span
											class="help-block m-b-none" style="color:red">多个关键字之间用“
											; ”分隔</span>
									</div>
								</div>
							</form>
						</div>
						<div class="mail-text h-200">
							<div id="summernote"></div>
							<div class="clearfix"></div>
						</div>
						<div class="mail-body text-right tooltip-demo">
							<button id="" type="button" onclick="al()"
								class="btn btn-sm btn-primary" data-toggle="tooltip"
								data-placement="top" title="Send">
								<i class="fa fa-reply"></i> 发布
							</button>
							<button id="" type="button" onclick="al()"
								class="btn btn-white btn-sm" data-toggle="tooltip"
								data-placement="top" title="Discard email">
								<i class="fa fa-times"></i> 放弃</a>
								<button id="" type="button" onclick="al()"
									class="btn btn-white btn-sm" data-toggle="tooltip"
									data-placement="top" title="Move to draft folder">
									<i class="fa fa-pencil"></i> 存为草稿</a>
						</div>
						<div class="clearfix"></div>
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


	<!-- iCheck -->
	<script
		src="${pageContext.request.contextPath}/js/plugins/iCheck/icheck.min.js"></script>

	<!-- SUMMERNOTE -->
	<script
		src="${pageContext.request.contextPath}/js/plugins/summernote/summernote.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/plugins/summernote/summernote-zh-CN.js"></script>
	<script>
        
	$(document).ready(function() {  
		
	    $('#summernote').summernote({
					height: 300,//初始化默认高度    
					minHeight: null, //最小高度             
					maxHeight: null, //最大高度
					//focus: true,//是否定位
					lang:'zh-CN',//注意这里，若要设置语言，则需要引入该语言配置js
					placeholder:"请在这里写下您的内容",
					//下面重写上传图片方法
					
						onImageUpload: function(files, editor, $editable) {  
							sendFile(files[0],editor,$editable);  
					    
					}
				});
			});
			
		//图片上传  
		function sendFile(file, editor, $editable){  
			//alert("上传成功！");   
		    var filename = false;  
		    try{  
		    filename = file['name'];  
		    } catch(e){  
		        filename = false;  
		    }  
		    if(!filename){  
		        $(".note-alarm").remove();  
		    }  
		      
		    //以上防止在图片在编辑器内拖拽引发第二次上传导致的提示错误  
		    data = new FormData();  
		    data.append("file", file);  
		    data.append("key",filename); //唯一性参数  
		    
		    $.ajax({  
		    data: data,  
		    type: "POST",  
		    url: "uploadImages",  
		    cache: false,  
		    contentType: false,  
		    processData: false,  
		    success: function(url) { 
		    	alert(url);
		        if(url=='200'){  
		            alert("上传失败！");  
		            return;  
		        }else{  
		            alert("上传成功！");   
		        }  
		        //alert(url);  
		    editor.insertImage($editable, url);  
		    //setTimeout(function(){$(".note-alarm").remove();},3000);  
		    },  
		    error:function(){  
		        alert("上传失败！");  
		        return;  
		        //setTimeout(function(){$(".note-alarm").remove();},3000);  
		        }  
		  });  
		 }  

            var al=function(){
                var str= $('#summernote').code(); 
            alert(str);
            }
    </script>



</body>

</html>
