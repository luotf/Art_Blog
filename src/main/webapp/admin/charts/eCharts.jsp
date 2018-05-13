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
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/font-awesome.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/js/plugins/fancybox/jquery.fancybox.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/plugins/datapicker/datepicker3.css"rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/base.css" rel="stylesheet">
<style type="text/css">
	.input-group-addon{
		color: #c23531;
	}
</style>
</head>
<body class="gray-bg">
   <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-6">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5> <i class="fa line-chart"></i> 访问量</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0)">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="javascript:void(0)">选项1</a>
                                </li>
                                <li><a href="javascript:void(0)">选项2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div class="echarts" id="echarts-line-visit" ></div>
	                    <div class="col-sm-8 input-daterange input-group" style="margin: 20px auto 0px;" id="datepicker">
							 <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
							<input type="text" class="input-sm form-control" id="startTime" />
							<span class="input-group-addon">到 </span> <input type="text"
										class="input-sm form-control" id="endTime" />
						</div>
                    </div>
                    
                </div>
            </div>
            
            <div class="col-sm-6">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5> <i class="fa fa-bar-chart"></i> 浏览量排行</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0)">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="javascript:void(0)">选项1</a>
                                </li>
                                <li><a href="javascript:void(0)">选项2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div class="echarts" id="echarts-line-blogClickSort"></div>
                    	<div style="margin:27px 0 0 15px">
                    		<h5>注:  点击可以查看对应博客内容</h5>
                    	</div>
                    	
                    </div>
                </div>
            </div>
            
            
            <div class="col-sm-6">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5> <i class="fa line-chart"></i> 博客浏览量</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0)">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="javascript:void(0)">选项1</a>
                                </li>
                                <li><a href="javascript:void(0)">选项2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div class="echarts" id="echarts-line-blogClick"></div>
                    	<div class="col-sm-8 input-daterange input-group" style="margin: 20px auto 0px;" id="datepicker">
							 <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
							<input type="text" class="input-sm form-control" id="startBlogClick" />
							<span class="input-group-addon">到 </span> 
							<input type="text" class="input-sm form-control" id="endBlogClick" />
						</div>
                    </div>
                </div>
            </div>
            
            <div class="col-sm-6">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5> <i class="fa fa-bar-chart"></i> 发表量</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0)">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="javascript:void(0)">选项1</a>
                                </li>
                                <li><a href="javascript:void(0)">选项2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div class="echarts" id="echarts-line-blog"></div>
                    	<div class="col-sm-8 input-daterange input-group" style="margin: 20px auto 0px;" id="datepicker">
							 <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
							<input type="text" class="input-sm form-control" id="startBlog" />
							<span class="input-group-addon">到 </span> 
							<input type="text" class="input-sm form-control" id="endBlog" />
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
            <a style="display:none" class=" btn-sm btn-info" id="btn" href="#" data-toggle="modal" data-target="#myModal">查看</a>
        </div>
    </div>
  
	<!-- 全局js -->
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

	<script src="${pageContext.request.contextPath}/js/plugins/peity/jquery.peity.min.js"></script>

	<script
		src="${pageContext.request.contextPath}/js/plugins/datapicker/bootstrap-datepicker.js"></script>
	<!-- 自定义js -->
	<script src="${pageContext.request.contextPath}/js/content.js"></script>
	
	<script src="${pageContext.request.contextPath}/js/plugins/sweetalert/sweetalert.min.js"></script>
	
	<script
		src="${pageContext.request.contextPath}/js/plugins/echarts/echarts.min.js"></script>

    <script>
    $(document).ready(function() {
    	var date=new Date();
    	var start=Format(new Date(date.getTime() -  6*24*60*60*1000),"yyyy-MM-dd");
    	var end=Format(date,"yyyy-MM-dd");
    	$("#startTime").val(start);
    	$("#endTime").val(end);
    	initVisitCountByDate(start,end);  //初始化7日访客
    	
    	$("#startBlog").val(start);
    	$("#endBlog").val(end);
    	initBlogCountByDate(start,end);  //初始化7日访客
    	
    	$("#startBlogClick").val(start);
    	$("#endBlogClick").val(end);
    	initBlogClickByDate(start,end);  //初始化7日访客
    	
    	initBlogClickSort();
    });
    
	//访问量时间
	$('#startTime').datepicker({
		keyboardNavigation : false,
		forceParse : false,
		autoclose : true,
		format : 'mm/dd/yyyy',
		todayHighlight : true,
		endDate : new Date(),
	}).on('changeDate', function(ev) {
		var start = ev.date.valueOf();
		$('#startTime').val(Format(start, "yyyy-MM-dd"));
		if ($('#endTime').val() != "" && $('#startTime').val() > $('#endTime').val()) {
			swal("指定日期范围出错", "请重新检查", "error");
		} else if ($('#startTime').val() != "" && $('#endTime').val() != "") {
			initVisitCountByDate($('#startTime').val(), $('#endTime').val());
		}
	});

	$('#endTime').datepicker({
		keyboardNavigation : false,
		forceParse : false,
		autoclose : true,
		format : 'mm/dd/yyyy',
		todayHighlight : true,
		endDate : new Date(),
	}).on('changeDate',function(ev) {
			var end = ev.date.valueOf();
			$('#endTime').val(Format(end, "yyyy-MM-dd"));
			if ($('#startTime').val() != ""&& $('#startTime').val() > $('#endTime').val()) {
				swal("指定日期范围出错", "截止日期必须大于起始日期", "error");
			} else if ($('#startTime').val() != ""&& $('#endTime').val() != "") {
				initVisitCountByDate($('#startTime').val(), $('#endTime').val());
		}

	});
    
	//博客时间
	$('#startBlog').datepicker({
		keyboardNavigation : false,
		forceParse : false,
		autoclose : true,
		format : 'mm/dd/yyyy',
		todayHighlight : true,
		endDate : new Date(),
	}).on('changeDate', function(ev) {
		var start = ev.date.valueOf();
		$('#startBlog').val(Format(start, "yyyy-MM-dd"));
		if ($('#endBlog').val() != "" && $('#startBlog').val() > $('#endBlog').val()) {
			swal("指定日期范围出错", "请重新检查", "error");
		} else if ($('#startBlog').val() != "" && $('#endBlog').val() != "") {
			initBlogCountByDate($('#startBlog').val(), $('#endBlog').val());
		}
	});

	$('#endBlog').datepicker({
		keyboardNavigation : false,
		forceParse : false,
		autoclose : true,
		format : 'mm/dd/yyyy',
		todayHighlight : true,
		endDate : new Date(),
	}).on('changeDate',function(ev) {
			var end = ev.date.valueOf();
			$('#endBlog').val(Format(end, "yyyy-MM-dd"));
			if ($('#startBlog').val() != ""&& $('#startBlog').val() > $('#endBlog').val()) {
				swal("指定日期范围出错", "截止日期必须大于起始日期", "error");
			} else if ($('#startBlog').val() != ""&& $('#endBlog').val() != "") {
				initBlogCountByDate($('#startBlog').val(), $('#endBlog').val());
		}

	});
	
	
    //最近的num日访客
	var initVisitCountByDate=function(startTime,endTime){
		var start=Date.parse(new Date(startTime));
		var end=Date.parse(new Date(endTime));
		var num=Math.abs(parseInt((end - start)/1000/3600/24));
		var params={
			startTime:startTime,
			endTime:endTime,
			format:"day",
		 };
		$.ajax({
			url : '../selectVisitListByDate',
			type : 'post',
			data:params,
			dataType : 'json',
			success : function(data) {
				var days=new Array();
				for(var i=num,j=0;i>=0;i--,j++){
					days[j]=Format(new Date(end -  i*24*60*60*1000),"yyyy-MM-dd");
				}
				var counts=Array.apply(null, Array(days.length)).map(function(item, i) {
				    return 0;
				});
				
				for(var j=0;j<days.length;j++){
					for(var i=0;i<data.list.length;i++){
						var time=Format(data.list[i].time,"yyyy-MM-dd");
						if(days[j]==time){
							counts[j]=data.list[i].count;
						}
					}
				}
					for(var j=0;j<days.length;j++){
						days[j]=Format(days[j],"yyyy/MM/dd");
				}
					initEchartsByVisit(days,counts); 
			},
			error : function() {
				swal("近日访客初始化错误", "请重新操作", "error");
			}
		});
	};
	var initEchartsByVisit=function(days,counts){
    	var lineChart = echarts.init(document.getElementById("echarts-line-visit"));
        var lineoption = {
            title : {
                text: '网站访问人数'
            },
            tooltip : {
                trigger: 'axis'
            },
            legend: {
                data:['近'+days.length+'日访问人数']
            },
            toolbox: {
                show: true,
                feature: {
                    dataZoom: {
                        yAxisIndex: 'none'
                    },
                    dataView: {readOnly: false},
                    magicType: {type: ['line', 'bar']},
                    restore: {},
                    saveAsImage: {}
                }
            },
            grid:{
                x:40,
                x2:40,
                y2:24
            },
            xAxis : [
                {
                    type : 'category',
                    boundaryGap : false,
                    data : days
                }
            ],
            yAxis : [
                {
                    type : 'value',
                    axisLabel : {
                        formatter: '{value}'
                    },
                    
                }
            ],
            series : [
                {
                    name:'近'+days.length+'日访问人数',
                    type:'line',
                    data:counts,
                    markPoint : {
                        data : [
                            {type : 'max', name: '最大值'},
                            {type : 'min', name: '最小值'}
                        ]
                    },
                    markLine : {
                        data : [
                            {type : 'average', name: '平均值'}
                        ]
                    }
                },
            ]
        };
        lineChart.setOption(lineoption);
    };
    
    
  //最近的num日博客发表数
	var initBlogCountByDate=function(startTime,endTime){
		var start=Date.parse(new Date(startTime));
		var end=Date.parse(new Date(endTime));
		var num=Math.abs(parseInt((end - start)/1000/3600/24));
		var params={
			startTime:startTime,
			endTime:endTime,
			status:1
		 };
		$.ajax({
			url : '../selectBlogListByDate',
			type : 'post',
			data:params,
			dataType : 'json',
			success : function(data) {
				var days=new Array();
				for(var i=num,j=0;i>=0;i--,j++){
					days[j]=Format(new Date(end -  i*24*60*60*1000),"yyyy-MM-dd");
				}
				var counts=Array.apply(null, Array(days.length)).map(function(item, i) {
				    return 0;
				});
				for(var j=0;j<days.length;j++){
					for(var i=0;i<data.list.length;i++){
						var time=Format(data.list[i].addTime,"yyyy-MM-dd");
						if(days[j]==time){
							counts[j]=data.list[i].count;
						}
					}
				}
					for(var j=0;j<days.length;j++){
						days[j]=Format(days[j],"yyyy/MM/dd");
				}
					initEchartsByBlog(days,counts); 
			},
			error : function() {
				swal("近日博客发表数初始化错误", "请重新操作", "error");
			}
		});
	};
    
	var initEchartsByBlog=function(days,counts){
    	var lineChart = echarts.init(document.getElementById("echarts-line-blog"));
        var lineoption = {
            title : {
                text: '博客发表数'
            },
            tooltip : {
                trigger: 'axis'
            },
            legend: {
                data:['近'+days.length+'日博客发表数']
            },
            toolbox: {
                show: true,
                feature: {
                    dataZoom: {
                        yAxisIndex: 'none'
                    },
                    dataView: {readOnly: false},
                    magicType: {type: ['line', 'bar']},
                    restore: {},
                    saveAsImage: {}
                }
            },
            grid:{
                x:40,
                x2:40,
                y2:24
            },
            xAxis : [
                {
                    type : 'category',
                    boundaryGap : true,
                    data : days
                }
            ],
            yAxis : [
                {
                    type : 'value',
                    axisLabel : {
                        formatter: '{value}'
                    },
                    
                }
            ],
            series : [
                {
                    name:'近'+days.length+'日博客发表数',
                    type:'bar',
                    data:counts,
                    markPoint : {
                        data : [
                            {type : 'max', name: '最大值'},
                            {type : 'min', name: '最小值'}
                        ]
                    },
                    markLine : {
                        data : [
                            {type : 'average', name: '平均值'}
                        ]
                    }
                },
            ]
        };
        lineChart.setOption(lineoption);
    };
    
    
 	 //访问量时间
	$('#startBlogClick').datepicker({
		keyboardNavigation : false,
		forceParse : false,
		autoclose : true,
		format : 'mm/dd/yyyy',
		todayHighlight : true,
		endDate : new Date(),
	}).on('changeDate', function(ev) {
		var start = ev.date.valueOf();
		$('#startBlogClick').val(Format(start, "yyyy-MM-dd"));
		if ($('#endBlogClick').val() != "" && $('#startBlogClick').val() > $('#endBlogClick').val()) {
			swal("指定日期范围出错", "请重新检查", "error");
		} else if ($('#startBlogClick').val() != "" && $('#endBlogClick').val() != "") {
			initBlogClickByDate($('#startBlogClick').val(), $('#endBlogClick').val());
		}
	});
	$('#endBlogClick').datepicker({
		keyboardNavigation : false,
		forceParse : false,
		autoclose : true,
		format : 'mm/dd/yyyy',
		todayHighlight : true,
		endDate : new Date(),
	}).on('changeDate',function(ev) {
			var end = ev.date.valueOf();
			$('#endBlogClick').val(Format(end, "yyyy-MM-dd"));
			if ($('#startBlogClick').val() != ""&& $('#startBlogClick').val() > $('#endBlogClick').val()) {
				swal("指定日期范围出错", "截止日期必须大于起始日期", "error");
			} else if ($('#startBlogClick').val() != ""&& $('#endBlogClick').val() != "") {
				initBlogClickByDate($('#startBlogClick').val(), $('#endBlogClick').val());
		}

	});
	  
	    //最近num日博客点击数
		var initBlogClickByDate=function(startTime,endTime){
			var start=Date.parse(new Date(startTime));
			var end=Date.parse(new Date(endTime));
			var num=Math.abs(parseInt((end - start)/1000/3600/24));
			var params={
				startTime:startTime,
				endTime:endTime,
				status:1
			 };
			$.ajax({
				url : '../selectBlogListByDate',
				type : 'post',
				data:params,
				dataType : 'json',
				success : function(data) {
					var days=new Array();
					for(var i=num,j=0;i>=0;i--,j++){
						days[j]=Format(new Date(end -  i*24*60*60*1000),"yyyy-MM-dd");
					}
					var counts=Array.apply(null, Array(days.length)).map(function(item, i) {
					    return 0;
					});
					for(var j=0;j<days.length;j++){
						for(var i=0;i<data.list.length;i++){
							var time=Format(data.list[i].addTime,"yyyy-MM-dd");
							if(days[j]==time){
								counts[j]=data.list[i].clickNum;
							}
						}
					}
						for(var j=0;j<days.length;j++){
							days[j]=Format(days[j],"yyyy/MM/dd");
					}
						initEchartsByBlogCount(days,counts); 
				},
				error : function() {
					swal("近日博客发表数初始化错误", "请重新操作", "error");
				}
			});
		};
	    
		var initEchartsByBlogCount=function(days,counts){
	    	var lineChart = echarts.init(document.getElementById("echarts-line-blogClick"));
	        var lineoption = {
	            title : {
	                text: '博客总浏览量'
	            },
	            tooltip : {
	                trigger: 'axis'
	            },
	            legend: {
	                data:['近'+days.length+'日博客浏览量']
	            },
	            toolbox: {
	                show: true,
	                feature: {
	                    dataZoom: {
	                        yAxisIndex: 'none'
	                    },
	                    dataView: {readOnly: false},
	                    magicType: {type: ['line', 'bar']},
	                    restore: {},
	                    saveAsImage: {}
	                }
	            },
	            grid:{
	                x:40,
	                x2:40,
	                y2:24
	            },
	            xAxis : [
	                {
	                    type : 'category',
	                    boundaryGap : false,
	                    data : days
	                }
	            ],
	            yAxis : [
	                {
	                    type : 'value',
	                    axisLabel : {
	                        formatter: '{value}'
	                    },
	                    
	                }
	            ],
	            series : [
	                {
	                    name:'近'+days.length+'日博客浏览量',
	                    type:'line',
	                    data:counts,
	                    markPoint : {
	                        data : [
	                            {type : 'max', name: '最大值'},
	                            {type : 'min', name: '最小值'}
	                        ]
	                    },
	                    markLine : {
	                        data : [
	                            {type : 'average', name: '平均值'}
	                        ]
	                    }
	                },
	            ]
	        };
	        lineChart.setOption(lineoption);
	    };
    
	    
	    
	    //初始化  博客 浏览排行
		var initBlogClickSort=function(){
			$.ajax({
				url : '../selectBlogByClick',
				type : 'post',
				dataType : 'json',
				success : function(data) {
					var idArray=new Array();
					var counts=Array.apply(null, Array(idArray.length)).map(function(item, i) {
					    return 0;
					});
					idArray[0]=new Array();
					idArray[1]=new Array();
					for(var i=0;i<data.list.length;i++){
						idArray[0][i]=data.list[i].id;
						counts[i]=data.list[i].clickNum;
					}
					for(var i=0;i<data.list.length;i++){
						idArray[1][i]=data.list[i].clickNum;
					}
					initEchartsByBlogClickSort(idArray,counts); 
				},
				error : function() {
					swal("初始化历史浏览量排行错误", "请重新操作", "error");
				}
			});
		};
	    
		var initEchartsByBlogClickSort=function(idArray,counts){
			console.log(idArray);
	    	var lineChart = echarts.init(document.getElementById("echarts-line-blogClickSort"));
	        var lineoption = {
	            title : {
	                text: '博客浏览排行'
	            },
	            tooltip : {
	                trigger: 'axis'
	            },
	            legend: {
	                data:['Top'+counts.length+' 博客浏览排行']
	            },
	            toolbox: {
	                show: true,
	                feature: {
	                    dataZoom: {
	                        yAxisIndex: 'none'
	                    },
	                    dataView: {readOnly: false},
	                    magicType: {type: ['line', 'bar']},
	                    restore: {},
	                    saveAsImage: {}
	                }
	            },
	            grid:{
	                x:40,
	                x2:40,
	                y2:24
	            },
	            xAxis : [
	                {
	                    type : 'category',
	                    boundaryGap : true,
	                    data : idArray[1]
	                }
	            ],
	            yAxis : [
	                {
	                    type : 'value',
	                    axisLabel : {
	                        formatter: '{value}'
	                    },
	                    
	                }
	            ],
	            series : [
	                {
	                    name:'Top'+counts.length+' 博客浏览排行',
	                    type:'bar',
	                    data:counts,
	                    markPoint : {
	                        data : [
	                            {type : 'max', name: '最大值'},
	                            {type : 'min', name: '最小值'}
	                        ]
	                    },
	                    markLine : {
	                        data : [
	                            {type : 'average', name: '平均值'}
	                        ]
	                    }
	                },
	            ]
	        };
	        lineChart.setOption(lineoption);
	        lineChart.on('click', function (params) {
	        	var blogId=0;
	        	$('#btn').trigger("click");
	        	for(var i=0;i<counts.length;i++){
	        		if(idArray[1][i]==params.value){
	        			blogId=idArray[0][i];
	        		}
	        	}
	        	selectBlogById(blogId);
	        });
	    };
	    
	  //查看博客内容
		function selectBlogById(blogId){
			var param={
					id:blogId
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
