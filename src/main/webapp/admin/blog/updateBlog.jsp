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
								href="mail_compose.html">修改博客</a>
							<div class="space-25"></div>
							<h5>数据信息</h5>
							<ul class="folder-list m-b-md" style="padding: 0">
								
								<li><a href="mailbox.html"> <i
										class="fa fa-eye"></i> 浏览量 <span
										class="label label-info pull-right">278 </span>
								</a></li>
								<li><a href="mailbox.html"> <i
										class="fa fa-commenting-o"></i> 评论量 <span
										class="label label-success pull-right">15 </span>
								</a></li>
								<li><a href="mailbox.html"> <i class="fa fa-thumbs-o-up"></i>
										点赞量 <span class="label label-primary pull-right">1 </span>
								</a></li>
								<li><a href="mailbox.html"> <i class="fa fa-level-up"></i>
										&nbsp;置顶<span class="label label-danger pull-right">否</span>
								</a></li>
								<li><a href="mailbox.html"> <i class="fa fa-hand-pointer-o"></i>
										推荐 <span class="label label-warning pull-right">是</span>
								</a></li>
							</ul>
							
							<h5 class="tag-title">标签</h5>
							
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-9">
				<div class="ibox float-e-margins">
					<div class="mail-box-header">
						<div class="pull-right tooltip-demo">
							<button class="btn btn-white btn-sm" type="button" onclick="updateBlog(-1)"
								data-toggle="tooltip" data-placement="top" title="存为草稿"><i
								class="fa fa-pencil"></i> 存为草稿</button> <button type="button" onclick="javascript:history.back(-1);"
								class="btn btn-danger btn-sm" data-toggle="tooltip"
								data-placement="top" title="返回"><i class="fa fa-times"></i>
								返回</button>
						</div>
						<h2>修改博客</h2>
					</div>
					<div class="mail-box">
						<div class="mail-body">
							<form class="form-horizontal" method="post">
								<div class="form-group">
									<label class="col-sm-2 control-label">标题：</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="title" name="title" value="">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">摘要：</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="introduction" name="introduction" value="">
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
										<input type="text" class="form-control" id="keyword" name="keyword" value=""> <span
											class="help-block m-b-none" style="color:red">多个关键字之间用“
											; ”分隔</span>
									</div>
								</div>
							</form>
						</div>
						<div class="mail-text h-200" style="width:82.5%;margin:0 auto;">
							<div id="summernote" ></div>
							<div class="clearfix"></div>
						</div>
						<div class="mail-body text-right tooltip-demo">
							<button id="" type="button" onclick="updateBlog(1)"
								class="btn btn-sm btn-primary" data-toggle="tooltip"
								data-placement="top" title="Send">
								<i class="fa fa-reply"></i> 发布
							</button>
					
								<button id="" type="button" onclick="updateBlog(-1)"
									class="btn btn-white btn-sm" data-toggle="tooltip"
									data-placement="top" title="Move to draft folder">
									<i class="fa fa-pencil"></i> 存为草稿
								</button>
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
		
		//获取传过来的url
		var url = window.location.href;
		//alert(url);
		var url_param = url.split("=")[1];
		   //编辑博客
			var param={
					id:url_param
			}
			$.ajax({
	            url:'../selectBlogById',    
	            type:'post',
	            data:param,
	            dataType:'json',    
	            success:function (data) {
	            	//查询成功
	            	if(data.status==200){
	            	  $("#title").val(data.blog.title);
	            	  $("#introduction").val(data.blog.introduction);
	            	  $("#summernote").code(data.blog.content);
	            	  $("#keyword").val(data.blog.keyword);
	            	  var typeName='';
	            	  typeName += '<option style="color:#000;font-weight:bold;" value="' + data.blog.type.id + '">' + data.blog.type.typename + '</option>';
	            	  $(".form-horizontal").find('select[name=typeName]').append(typeName);
	            	}
	            },    
			    error:function(){
			    	alert("查询失败");
			    }	
	        });
	
		
		//查询出文章类别
			//设置参数，表示查询所有的类别
			var params ={
    				"data":"all"
    		};
			$.ajax({
                url:'../selectBlogType',    
                type:'post',
                data:params,
                dataType:'json',    
                success:function (data) {
                	var typeName = '';
                    for (var i = 0; i < data.length; i++) {
                    	typeName += '<option value="' + data[i].id + '">' + data[i].typename + '</option>';
                    }
                    // 初始化数据
                    $(".form-horizontal").find('select[name=typeName]').append(typeName);
                },    
    		    error:function(){
    		    	alert("加载失败");
    		    }	
            });
		
		//初始化富文本
	    $('#summernote').summernote({
					height: 300,//初始化默认高度    
					minHeight: null, //最小高度             
					maxHeight: null, //最大高度
					focus: true,//是否定位
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
		    data:data, 
		    type: "POST",  
		    url: "../uploadImages",
		    dataType:"json",
		    cache: false,  
		    contentType: false,  
		    processData: false,  
		    success: function(date) { 
		        if(date==''){  
		            alert("返回结果为null");  
		            return;  
		        }else{  
		            alert("上传成功！");  
		            return; 
		        }  
		    editor.insertImage($editable, date.path);  
		    //setTimeout(function(){$(".note-alarm").remove();},3000);  
		    },  
		    error:function(){  
		        alert("上传失败！");  
		        return;  
		        //setTimeout(function(){$(".note-alarm").remove();},3000);  
		        }  
		  });  
		 }  

        var updateBlog=function(id){
        	var url = window.location.href;
    		//alert(url);
    		var url_param = url.split("=")[1];
          var params ={
        		    'id':url_param,
        			'title':$("#title").val(),
        			'introduction':$("#introduction").val(),
        			'type.id':$("#typeName").val(),
        			'keyword':$("#keyword").val(),
        			'content':$("#summernote").code(),
        			'status':id
        	};
            $.ajax({
                   url:'../updateBlog',    
                   type:'post',
                   data:params,
                   dataType:'json',    
                   success:function (data) { 
                    if(data.status==200){
                    	alert("更新成功");
                    	 return; 
                    }else{
                    	alert("更新失败");
                    	 return; 
                    }	
                    },    
        		    error:function(){
        		    	alert("更新错误");
        		    	 return; 
        		    }	
                }); 
            	
            }
    </script>



</body>

</html>
