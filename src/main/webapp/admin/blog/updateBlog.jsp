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
</head>

<body class="gray-bg">
	<div id="fakeloader"></div>
	 <div class="wrapper wrapper-content" style="display:none">
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
											name="title" value="">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">摘要：</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="introduction" required="" aria-required="true"
											name="introduction" value="">
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
											name="keyword" value=""> <p class="help-block m-b-none"><i class="fa fa-info-circle"></i> 多个关键字之间用“;”分隔</p>
									</div>
								</div>
							
							</form>
						</div>
						<div class="mail-text h-200" style="width:82.5%;margin:0 auto;">
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

	<!-- 全局js -->
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
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
	<script>
        
	$(document).ready(function() { 
		$("#fakeloader").fakeLoader({
	        timeToHide:800, //Time in milliseconds for fakeLoader disappear
	        zIndex:999, // Default zIndex
	        spinner:"spinner6",//Options: 'spinner1', 'spinner2', 'spinner3', 'spinner4', 'spinner5', 'spinner6', 'spinner7' 
	        bgColor:"#fff", //Hex, RGB or RGBA colors
	        //imagePath:"yourPath/customizedImage.gif" //If you want can you insert your custom image
	    }); 
		var url = window.location.href;
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
	            	  var imgPath='<img class="picPath animated fadeInRight"  style="width:100%" alt="封面" title="点击更换封面" src="'+data.blog.images+'" />';
	  				  $(".picPath").html(imgPath)
	            	  //加载编辑页面预览的  时间和浏览量
	            	  $(".newsview").find(".au02").html(Format(data.blog.addtime,"yyyy-MM-dd hh:mm:ss"));
	           	  	  $(".au03").find('b').html(data.blog.clicknum);
	            	  
	            	  $("#clicknum").html(data.blog.clicknum);
	            	 
	            	  var istop='否';
	            	  if(data.blog.istop==1){
	            		  istop='是';
	            	  }
	            	  var isrecommend='否';
	            	  if(data.blog.isrecommend==1){
	            		  isrecommend='是';
	            	  }
	            	  $("#istop").html(istop);
	            	  $("#isrecommend").html(isrecommend);
	            	  var typeName='';
	            	  typeName += '<option style="color:#000;font-weight:bold;" value="' + data.blog.type.id + '">' + data.blog.type.typename + '</option>';
	            	  $(".form-horizontal").find('select[name=typeName]').append(typeName);
	            	}
	            },    
			    error:function(){
			    	swal("查询错误", "请重试操作", "error");
			    }	
	        });
	
			var p={
      				 client_id:'cytzg9rLH',
      				 topic_source_id:url_param
      			 };
                $.ajax({
   	            url:'http://changyan.sohu.com/api/2/topic/count',    
   	            type:'get',
   	            data:p,
   	            dataType:'jsonp',    
   	            success:function (pl) {
   	             $("#commentnum").html(pl.result[url_param].comments);
   	            },
   			    error:function(){
   			    	swal("获取评论数错误", "请重试操作", "error");
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
    		    	swal("加载类别错误", "请重试操作", "error");
    		    }	
            });
			//初始化富文本
		    $('#summernote').summernote({
						height: 300,//初始化默认高度    
						minHeight: null, //最小高度             
						maxHeight: null, //最大高度
						lang:'zh-CN',//注意这里，若要设置语言，则需要引入该语言配置js
						placeholder:"请在这里写下您的内容",
						onImageUpload: function(files, editor, $editable) {  
								sendFile(files[0],editor,$editable);  
						}
					});
		    setTimeout(function () {
	       		$('.wrapper').css('display','block');
			},900);
		});
				
			//图片上传  
			function sendFile(file, editor, $editable){  
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
			        	swal("上传失败", "请重试操作", "error");
			        }else{
			        	var path='图片地址  '+date.path;
			        	swal("上传成功",path, "success");   
			        }  
			    editor.insertImage($editable, date.path);  
			    },  
			    error:function(){  
			    	swal("上传错误", "请重试操作", "error");
			        }  
			  });  
			 }  
			
			
			//弹出模态框 选择图片
			var selectImgPath=function(img){
				$("#pic").modal('hide');
				var imgPath='<img class="picPath animated fadeInRight"  style="width:100%" alt="封面" title="点击更换封面" src="'+img.src+'" />';
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
			
			
			
			
		var prevBlog=function(){
			  $(".newsview").find(".news_title").html($("#title").val());
	      	  $(".news_about").find(".news_intr").html($("#introduction").val());
	      	  
	      	  var keyword='' ;
	      	  var inputKeyword=$("#keyword").val();
	      	  $(".newsview").find(".tags").html("");
	      	  if(inputKeyword!=''&&inputKeyword!=null){
	      		if (inputKeyword.search(';') != -1||inputKeyword.search('；') != -1) {
					if(inputKeyword.search('；') != -1){
						inputKeyword=inputKeyword.replace(/；/g,";");
					}
					var strs = new Array();
					strs = inputKeyword.split(";");
	                  for (var i = 0; i < strs.length&&strs[i]!=''; i++) {
	              	   keyword +='<a href="#">'+strs[i]+'</a>';
	                }
	      	    }else{
	      	    	keyword ='<a href="#">'+inputKeyword+'</a>';
	      	    }
	      	  } 
	      	  $(".newsview").find(".tags").append(keyword);
	      	  $(".newsview").find(".news_infos").html($("#summernote").code());
	      	  var update='<a  class="btn btn-white" href="#" onclick="updateBlog(1)">发表</a>';
	      	  $(".modal-footer").find(".update").html(update);
			}
		
		
        var updateBlog=function(id){
        	var url = window.location.href;
    		var url_param = url.split("=")[1];
    		var prarm='将ID为<span class="text-info">'+url_param+'</span>的博客<span class="text-success">发表</span>';
			if(id==-1){
				prarm='将ID为<span class="text-info">'+url_param+'</span>的博客放入<span class="text-navy">草稿箱</span>';
			}
          var params ={
        		    'id':url_param,
        			'title':$("#title").val(),
        			'introduction':$("#introduction").val(),
        			'type.id':$("#typeName").val(),
        			'images':$(".imagePath").val(),
        			'keyword':$("#keyword").val(),
        			'content':$("#summernote").code(),
        			'status':id,
        			 prarm:prarm
        	};
            $.ajax({
                   url:'../updateBlog',    
                   type:'post',
                   data:params,
                   dataType:'json',    
                   success:function (data) { 
                    if(data.status==200){
                    	$("#myModal").modal('hide');
                    	 var title="更新成功";
                    	 var text="博客已在前端展示";
                    	 if(id==-1){
                    	    title="放入草稿成功";
                    		text="你可以前往草稿箱查看";
                    	 }
                    	swal({ 
        		    		title:title,
        		    		text:text,
        		    		type:"success",
        		    		timer: 1500,
        		    	 });
            			 setTimeout(function(){
            				window.location.href ="../blog/blogTable.jsp";
						},1500); 
                    }else{
                    	swal("更新失败", "请重新操作", "error");
                    }	
                    },    
        		    error:function(){
        		    	swal("更新错误", "请重新操作", "error");
        		    }	
                }); 
            	
            }
        
      //格式化时间
    	function Format(datetime, fmt) {
    	    if (parseInt(datetime) == datetime) {
    	        if (datetime.length == 10) {
    	            datetime = parseInt(datetime) * 1000;
    	        } else if (datetime.length == 13) {
    	            datetime = parseInt(datetime);
    	        }
    	    }
    	    datetime = new Date(datetime);
    	    var o = {
    	        "M+": datetime.getMonth() + 1,                 //月份   
    	        "d+": datetime.getDate(),                    //日   
    	        "h+": datetime.getHours(),                   //小时   
    	        "m+": datetime.getMinutes(),                 //分   
    	        "s+": datetime.getSeconds(),                 //秒   
    	        "q+": Math.floor((datetime.getMonth() + 3) / 3), //季度   
    	        "S": datetime.getMilliseconds()             //毫秒   
    	    };
    	    if (/(y+)/.test(fmt))
    	        fmt = fmt.replace(RegExp.$1, (datetime.getFullYear() + "").substr(4 - RegExp.$1.length));
    	    for (var k in o)
    	        if (new RegExp("(" + k + ")").test(fmt))
    	            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    	    return fmt;
    	}
      
    	//只有验证通过才能执行 添加
		$("#add_draft,#add_draft2").click(function(){
		    if($("#commentForm").valid()){
		    	updateBlog(-1);
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
