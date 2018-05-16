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
<link href="${pageContext.request.contextPath}/css/index.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/base.css"
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
								href="mail_compose.html">博客查询</a>
							<div class="space-25"></div>
							<h5 class="tag-title">搜索</h5>
							<form role="form" class="form-inline">
								<div class="form-group">
									<input type="text" onkeyup="findBlogByKey()"
										placeholder="请输入关键字" id="blogname" class="form-control"
										style="width:76%;">
									<button id="findBlog" onclick="findBlogByKey()"
										class="btn btn-white pull-right" type="button">搜索</button>
								</div>
							</form>

							<h5>博客列表</h5>
							<div class="paihang">
								<ul class="category-list">

								</ul>
								<div  style="padding-top: 0px;">
									<div class="pageNav "></div>
									<p style="margin:15px auto;text-align:center">
										<span class="allTotal">共<b></b>条记录
										</span>&nbsp;&nbsp; <span class="cPage">第<b></b>页
										</span>&nbsp;&nbsp; <span class="allPage">共<b></b>页
										</span>
									</p>
								</div>

							</div>

							<div class="clearfix"></div>

						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-9">
				<div class="ibox float-e-margins ">
					<div class="mail-box-header">
						<h2>博客详情</h2>
						<div class="infos" style="margin:0px auto;width: 91.2%;">
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
					</div>
				</div>
			</div>
		</div>
	</div>




	<!-- 全局js -->
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<script src="${pageContext.request.contextPath}/js/fakeLoader.min.js"></script>

	<!-- 自定义js -->
	<script src="${pageContext.request.contextPath}/js/content.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/plugins/sweetalert/sweetalert.min.js"></script>

	<!-- iCheck -->
	<script
		src="${pageContext.request.contextPath}/js/plugins/iCheck/icheck.min.js"></script>

	<!-- jQuery Validation plugin javascript-->
	<script
		src="${pageContext.request.contextPath}/js/plugins/validate/jquery.validate.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/plugins/validate/messages_zh.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/plugins/validate/form-validate-demo.js"></script>

	<!-- Bootstrap table -->
	<script
		src="${pageContext.request.contextPath}/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
	

	<script>
	  
	$(document).ready(function() {
		$("#fakeloader").fakeLoader({
	        timeToHide:1000, //Time in milliseconds for fakeLoader disappear
	        zIndex:999, // Default zIndex
	        spinner:"spinner6",//Options: 'spinner1', 'spinner2', 'spinner3', 'spinner4', 'spinner5', 'spinner6', 'spinner7' 
	        bgColor:"#fff", //Hex, RGB or RGBA colors
	    }); 
		setTimeout(function () {
       		$('body').css('opacity','1');
       		$('body').attr("class", "gray-bg") //添加样式
		},100);
		
		//参数1表示当前页为1
		initBlog(1);
		
	});
	var initBlog=function(pageNum){
		//查询出文章
		//获取关键字，表示查询所有符合的记录
		var params ={
				pageSize: 9,
	            page:pageNum,
	            title:$(".form-control").val(),
	            keyword:$(".form-control").val(),
	           	status:1  //1 表示已发布
		};
		$.ajax({
            url:'../selectGroupLikeBlogListByPage',    
            type:'post',
            data:params,
            dataType:'json',    
            success:function (data) {
            	var blogList='';
            	var page=data.pageInfo;
            	var data=data.blogList;
            	var circle = new Array("text-navy","text-danger"," text-info","text-primary","text-warning");
            	for (var i = 0; i < data.length; i++) {
            		blogList+='<li class="animated fadeInDown" style="margin: 0 0 5px 0;animation-delay:0.'+i+'s""><a href="javascript:void(0);" style="padding: 0;" onclick="findBlogById('+data[i].id+')"> <i class="fa '+circle[i%5]+' fa-circle "></i> '+data[i].title+'</a></li>';
            	}
            	if(page.pageNum>=2){
             		$(".category-list").append(blogList);
             	}else{
             		$(".category-list").html(blogList);
             		findBlogById(data[0].id);
             		$(".allTotal").find("b").html(page.total);
             		$(".allPage").find("b").html(page.pages);
             	} 
             var nextPage=page.pageNum+1;
			 var more='<p style="text-align:center"><a onclick="pageNav('+nextPage+','+page.pages+')"><i class="fa fa-arrow-down"></i> 加载更多</a></p>';
			 if(page.pageNum==page.pages){
     			more='<p style="text-align:center"><a href="javascript:void(0);" onclick="window.scrollTo(0,0)"><i class="fa fa-arrow-up"></i> 没有更多了</a></p>';
     		}
			 $(".pageNav").html(more);
             $(".cPage").find("b").html(page.pageNum);
           },    
		    error:function(){
		    	swal("您的请求太快", "请重新操作", "error");
		    }	
        });
	};

	var pageNav=function(pageNum,allPage){
		if(pageNum<=0){
			swal("查询失败", "当前为第1页", "error");
		}else if(pageNum>allPage){
			swal("查询失败", "当前为最后一页", "error");
		}else{
			initBlog(pageNum);
		}
	}
	
	
	var findBlogByKey=function(){
		initBlog(1);
	}
	
	
	var findBlogById=function(id){
		var params ={
				id:id
		};
		$.ajax({
            url:'../selectBlogById',    
            type:'post',
            data:params,
            dataType:'json',    
            success:function (data) {
              //初始化右边详情内容
              $(".newsview").find(".news_title").html(data.blog.title);
          	  $(".newsview").find(".au02").html(Format(data.blog.addtime,"yyyy-MM-dd hh:mm:ss"));
          	  $(".au03").find('b').html(data.blog.clicknum);
          	  $(".news_about").find(".news_intr").html(data.blog.introduction);
          	  var keyword='' ;
          	  $(".newsview").find(".tags").html("");
          	  if(data.blog.keyword!=''&&data.blog.keyword!=null){
          		  if(data.blog.keyword.search(';')!=-1){
          			 var strs= new Array();
          		     strs=data.blog.keyword.split(";");
                       for (var i = 0; i < strs.length&&strs[i]!=''; i++) {
                  	   keyword +='<a href="#">'+strs[i]+'</a>';
                    }
          	    }else{
          	    	keyword ='<a href="#">'+data.blog.keyword+'</a>';
          	    }
          	  } 
          	  	$(".newsview").find(".tags").append(keyword);
          	  	$(".newsview").find(".news_infos").html(data.blog.content);
            	}, 
		    error:function(){
		    	swal("初始化内容失败", "请重新操作", "error");
		    }	
        });
		
	};
	 	
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
          	
          
          
    </script>


</body>

</html>
