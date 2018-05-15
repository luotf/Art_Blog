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
<link href="${pageContext.request.contextPath}/css/loaders.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/css/plugins/sweetalert/sweetalert.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/css/fakeLoader.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/css/plugins/datapicker/datepicker3.css"
	rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/base.css" rel="stylesheet">
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
	                  <button onclick="reset()" class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="刷新日志列表"><i class="fa fa-refresh"></i> 刷新</button>
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

</body>
	<!-- 全局js -->
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
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

	<script type="text/javascript">
	var pageNext=1;
	var isEnd=false;
	$(document).ready(function() {
		$("#fakeloader").fakeLoader({
	        timeToHide:1200, //Time in milliseconds for fakeLoader disappear
	        zIndex:999, // Default zIndex
	        spinner:"spinner6",//Options: 'spinner1', 'spinner2', 'spinner3', 'spinner4', 'spinner5', 'spinner6', 'spinner7' 
	        bgColor:"#fff", //Hex, RGB or RGBA colors
	        //imagePath:"yourPath/customizedImage.gif" //If you want can you insert your custom image
	    }); 
		selectLogByDate(pageNext,null,null);
		setTimeout(function () {
       		$('.wrapper').css('display','block');
		},1200);
	});
	
	$(window).scroll(function(){
        if(isEnd == true){
           return;
       } 
       if ($(document).scrollTop() + 0 >= $(document).height() - $(window).height()) {
       	isEnd=true;
       	setTimeout(function () {
       		selectLogByDate(pageNext,null,null);
		},500); 
       	
	   }
   });
	
	var reset = function() {
		var index ='';
		 layer.ready(function(){
		   index=layer.load(2, {
			  shade: [0.1,'#eee'] //0.1透明度的白色背景
		    });
		  }); 
		$('#start').val("");
		$('#end').val("");
		$('.keyword').val("");
		selectLogByDate(1,null, null);
		setTimeout(function () {
			layer.close(index);
		},500); 
	};
	
	var fastToSearch=function(fastKey){
		$(".keyword").val(fastKey);
		selectLogByDate(1,null,null);
	}
	
	//指定日期查询事件
	var selectLogByDate = function(pageNum,startTime, endTime) {
		var keyword=$(".keyword").val();
		var params ={
				startTime : startTime,
				endTime : endTime,
				pageSize: 9,
	            page:pageNum,
	            ip:keyword,
	            userType:keyword,
	            description:keyword
				};
			$.ajax({
                   url:'../selectLogListByDate',    
                   type:'post',
                   data:params,
                   dataType:'json',    
                   success:function (data) {
                    if(data.status==200){
                    	var page=data.pageInfo;
                    	var data=data.logList;
                    	var logList='';
                    	var now=new Date().getTime();
                    	var dateToAddTime='';
                    	var minutes=1000*60;
                    	var time='';
                    	//var logList=new Array();
                    	for(var i=0;i<data.length;i++){
                    		//计算现在时间与日志时间的差值
                    		dateToAddTime=now-data[i].addTime;
                    		time=parseInt(dateToAddTime/minutes);
                    		if(time<60){
                    			if(time==0){
                    			  time='<span class="label label-danger"> 刚刚</span>';
                    			}else{
                    			  time='<span class="label label-info">'+time+'分钟前</span>';
                    			}
                    		}else if(time>=60){
                    			time='<span class="label label-primary">'+parseInt(time/60)+'小时前</span>';
                    			if(time>=24){
                    				time='<span class="label label-success">'+parseInt(time/24)+'天前</span>';
                    				if(time>=30){
                    					time='<span class="label label-warning">'+parseInt(time/30)+'个月前</span>';
                    				}
                    			}
                    		}
                    		if(data[i].userType=="管理员"){
                    			data[i].userType="管理员"+'&nbsp;&nbsp;&nbsp;&nbsp;';
                    		}
                    		if(data[i].description=="查看博客"){
                    			data[i].param='查看的博客ID为：<a class="text-info" title="点击查看对应博客"  data-toggle="modal" data-target="#myModal" onclick="selectBlogByVid('+data[i].param+')">'+data[i].param+'</a>';
                    		}
                    		logList+='<li style="animation-delay:0.'+i+'s" class="list-group-item  animated fadeInDown"><p style="margin: 4px 0px;">'+time+'<strong>&nbsp;&nbsp;<i class="fa fa-user"> '+data[i].userType+'</i>&nbsp;</strong><a class="text-info" href="#">@'+data[i].ip+'</a>  &nbsp;<strong><small class="text-muted"><i class="fa fa-tag"> </i> </small>'+data[i].description+'</strong>：'+data[i].param+'<span title="'+Format(data[i].addTime,"yyyy/MM/dd hh:mm:ss")+'" class="pull-right"><i class="fa fa-clock-o"> '+Format(data[i].addTime,"MM/dd  hh:mm:ss")+'</i></span></p></li>'
                    	}
                    	 if(page.pageNum>=2){
                    		$(".logList").append(logList);
                    	}else{
                    		$(".logList").html(logList);
                    	} 
                    	if(page.total>9){
                    		if(page.pageNum==page.pages){
                    			isEnd=true;
                    			var pagenav='<li class="list-group-item"><p style="text-align:center"><a href="javascript:void(0);" onclick="window.scrollTo(0,0)"><i class="fa fa-arrow-up"></i> 没有更多了</a></p></li>';
                    		}else{
                    			isEnd=false;
                    			pageNext=page.pageNum+1;
                    			var pagenav='<div style="margin:10px auto;width:10%;"><div class="loader-inner ball-pulse"><div style="background-color:#ed5565;"></div><div style="background-color:#ed5565;"></div><div style="background-color:#ed5565;"></div></div></div>';
                    		}
                    		$(".page").html(pagenav);
                    	}else{
                    		$(".page").html("");
                    	}
                    }else if(data.status==500){
                    		swal("查询失败", "不存在该日志信息", "error");
                    		$('#start').val("");
                    		$('#end').val("");
                       }	
                    },    
        		    error:function(){
        		    	swal("查询错误", "请重新操作", "error");
        		    	$('#start').val("");
                		$('#end').val("");
        		    }	
                }); 
	};

	var pageNav=function(page){
		selectLogByDate(page,$('#start').val(),$('#end').val());
	}
	
	$('#start').datepicker({
		keyboardNavigation : false,
		forceParse : false,
		autoclose : true,
		format : 'mm/dd/yyyy',
		todayHighlight : true,
		endDate : new Date(),
	}).on('changeDate', function(ev) {
		var start = ev.date.valueOf();
		$('#start').val(Format(start, "yyyy-MM-dd"));
		if ($('#end').val() != "" && $('#start').val() > $('#end').val()) {
			swal("指定日期范围出错", "请重新检查", "error");
		} else if ($('#start').val() != "" && $('#end').val() != "") {
			selectLogByDate(1,$('#start').val(), $('#end').val());
		}
	});

	$('#end').datepicker({
		keyboardNavigation : false,
		forceParse : false,
		autoclose : true,
		format : 'mm/dd/yyyy',
		todayHighlight : true,
		endDate : new Date(),
	})
			.on(
					'changeDate',
					function(ev) {
						var end = ev.date.valueOf();
						$('#end').val(Format(end, "yyyy-MM-dd"));
						if ($('#start').val() != ""
								&& $('#start').val() > $('#end').val()) {
							swal("指定日期范围出错", "请重新检查", "error");
						} else if ($('#start').val() != ""
								&& $('#end').val() != "") {
							selectLogByDate(1,$('#start').val(), $('#end')
									.val());
						}

					});
	
		var selectBlogByVid=function(vid){
			var id;
			for(var i=1;i<=vid;i++){
				if(i*i.toString(8)==vid){
					id=i;
					break;
				}
			}
			var param={
					id:id
			}
			$.ajax({
	            url:'../selectBlogById',    
	            type:'post',
	            data:param,
	            dataType:'json',    
	            success:function (data) {
	            	//查询成功
	            	if(data.status==200){
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
	            	}
	            },    
			    error:function(){
			    	swal("查询错误", "请重新操作", "error");
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
			"M+" : datetime.getMonth() + 1, //月份   
			"d+" : datetime.getDate(), //日   
			"h+" : datetime.getHours(), //小时   
			"m+" : datetime.getMinutes(), //分   
			"s+" : datetime.getSeconds(), //秒   
			"q+" : Math.floor((datetime.getMonth() + 3) / 3), //季度   
			"S" : datetime.getMilliseconds()
		//毫秒   
		};
		if (/(y+)/.test(fmt))
			fmt = fmt.replace(RegExp.$1, (datetime.getFullYear() + "")
					.substr(4 - RegExp.$1.length));
		for ( var k in o)
			if (new RegExp("(" + k + ")").test(fmt))
				fmt = fmt.replace(RegExp.$1,
						(RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k])
								.substr(("" + o[k]).length)));
		return fmt;
	}
	
	</script>

</body>

</html>
