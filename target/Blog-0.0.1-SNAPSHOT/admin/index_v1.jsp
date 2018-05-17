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
<meta name="renderer" content="webkit">

<title>博客后台 - 主页</title>

<meta name="keywords" content="">
<meta name="description" content="">

<link rel="shortcut icon" href="favicon.ico">
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/font-awesome.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/animate.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/css/plugins/sweetalert/sweetalert.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/css/plugins/datapicker/datepicker3.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/css/fakeLoader.css"
	rel="stylesheet">
</head>

<body class="white-bg" style="opacity:0">
 <div id="fakeloader"></div>
	<div class="wrapper wrapper-content">
		<div class="row">
			<div class="col-sm-3">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<span class="label label-success pull-right">总数</span>
						<h5>博客</h5>
					</div>
					<div class="ibox-content">
						<h1 class="allBlog no-margins" style="text-align: center;">0</h1>
						<div class="allBlogPercent stat-percent font-bold text-navy">
							0%</div>
						<small>已发表</small>
					</div>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<span class="label label-danger pull-right">总数</span>
						<h5>草稿箱</h5>
					</div>
					<div class="ibox-content">
						<h1 class="draft no-margins" style="text-align: center;">0</h1>
						<div class="draftPercent stat-percent font-bold text-warning">
							0%</div>
						<small>未发表</small>
					</div>
				</div>
			</div>

			<div class="col-sm-3">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<span class="label label-warning pull-right">今天</span>
						<h5>今日发表</h5>
					</div>
					<div class="ibox-content">
						<h1 class="nowBlog no-margins" style="text-align: center;">0</h1>
						<div class="nowBlogPercent stat-percent font-bold text-danger">
							0%</div>
						<small>较昨日</small>
					</div>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<span class="label label-info pull-right">今天</span>
						<h5>今日访客</h5>
					</div>
					<div class="ibox-content">
						<h1 class="nowVisitors no-margins" style="text-align: center;">0</h1>
						<div
							class="nowVisitorsPercent stat-percent font-bold text-success">
							0%</div>
						<small>较昨日</small>
					</div>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<span class="label label-success pull-right">总数</span>
						<h5>资源</h5>
					</div>
					<div class="ibox-content">
						<h1 class="resource no-margins" style="text-align: center;">0</h1>
						<div class="resourcePercent stat-percent font-bold text-navy">
							0%</div>
						<small>已发表</small>
					</div>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<span class="label label-danger pull-right">总数</span>
						<h5>垃圾箱</h5>
					</div>
					<div class="ibox-content">
						<h1 class="delete no-margins " style="text-align: center;">0</h1>
						<div class="deletePercent stat-percent font-bold text-warning">
							0%</div>
						<small>已删除</small>
					</div>
				</div>
			</div>

			<div class="col-sm-3">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<span class="label label-warning pull-right">昨天</span>
						<h5>昨日发表</h5>
					</div>
					<div class="ibox-content">
						<h1 class="yesBlog no-margins" style="text-align: center;">0</h1>
						<div class="yesBlogPercent stat-percent font-bold text-danger">
							0%</div>
						<small>较昨日</small>
					</div>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<span class="label label-info pull-right">历史</span>
						<h5>历史访客</h5>
					</div>
					<div class="ibox-content">
						<h1 class="visitors no-margins" style="text-align: center;">0</h1>
						<div class=" stat-percent font-bold text-success">
							100% <i class="fa fa-bolt"></i>
						</div>
						<small>总访问量</small>
					</div>
				</div>
			</div>

		</div>
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5> <i class="fa fa-bar-chart"></i> 访问量</h5>
						<div class="pull-right">
							<div class="btn-group">
								<button type="button" onclick="initVisitCountByWeek(7);"
									class="day btn btn-xs btn-white ">天</button>
								<button type="button" onclick="initVisitCountByMonth(12);"
									class="month btn btn-xs btn-white">月</button>
								<button type="button" class="year btn btn-xs btn-white"
									onclick=" initVisitCountByYear(6);">年</button>
							</div>
						</div>
					</div>
					<div class="ibox-content">
						<div class="row">
							<div class="col-sm-9">
								<div class="flot-chart">
									<div class="flot-chart-content" id="echarts-line-chart"></div>
								</div>
							</div>
							<div class="col-sm-3">
								<ul class="stat-list">
									<li>
										<h3>指定日期查询</h3> <!-- <small>指定日期</small> -->
										<div class="input-daterange input-group" id="datepicker">
											<span class="input-group-addon"><i
												class="fa fa-calendar"></i></span> <input type="text"
												class="input-sm form-control" id="start" /> <span
												class="input-group-addon">到</span> <input type="text"
												class="input-sm form-control" id="end" />
										</div>
									</li>
									<li>
										<h4 style="text-align: center;" class="date"></h4>
									</li>
								</ul>
								<h5 style="text-align: center;">
									近  <span class="num" style="font-size:20px">0</span><span
										class="md"></span>访问人数
								</h5>
								<div class="col-sm-4"
									style="padding-right: 0px;padding-left: 0px;">
									<div class="ibox-content">
										<h2 class="all no-margins" style="text-align: center;">0</h2>
										<span class="label label-success">总数</span>
									</div>
								</div>
								<div class="col-sm-4"
									style="padding-right: 0px;padding-left: 0px;">
									<div class="ibox-content">
										<h2 class="high no-margins" style="text-align: center;">0</h2>
										<span class="label label-primary">最高</span>
									</div>
								</div>
								<div class="col-sm-4"
									style="padding-right: 0px;padding-left: 0px;">
									<div class="ibox-content">
										<h2 class="low no-margins" style="text-align: center;">0</h2>
										<span class="label label-info ">最低</span>
									</div>

								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>


	</div>
	</div>

	<!-- 全局js -->
	<script
		src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/plugins/echarts/echarts.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script src="${pageContext.request.contextPath}/js/fakeLoader.min.js"></script>
	<!-- Data picker -->
	<script
		src="${pageContext.request.contextPath}/js/plugins/datapicker/bootstrap-datepicker.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			$("#fakeloader").fakeLoader({
		        timeToHide:10000, 
		        zIndex:999, 
		        spinner:"spinner6",//Options: 'spinner1', 'spinner2', 'spinner3', 'spinner4', 'spinner5', 'spinner6', 'spinner7' 
		        bgColor:"#fff", 
		    }); 
			setTimeout(function () {
	       		$('body').css('opacity','1');
	       		$('body').attr("class", "gray-bg") //添加样式
			},100);
			
		$("#end").val(Format(new Date(),"yyyy-MM-dd"));
		$("#start").val(Format(new Date().getTime() -  6*24*60*60*1000,"yyyy-MM-dd"));
		var days=new Array();
		var counts=new Array(5,5,5,5,5,5,5);
		var date=new Date();
		for(var i=6,j=0;i>=0;i--,j++){
			days[j]=Format(new Date(date.getTime() -  i*24*60*60*1000),"yyyy-MM-dd");
		}
		
		initEcharts(days,counts);
		initBlogCountByStatus();//初始化已发表/草稿箱博客数目
		initResourceCountByStatus();//初始化已发表资源数目
		initBlogCountByDate();//初始化昨日/今日博客发表数目
		initVisitCount("now");  //初始化今日访客
		initVisitCount("history");  //初始化历史访客
		initVisitCountByWeek(7);  //初始化num日访客
		
			$("#fakeloader").fakeLoader({
			      timeToHide:300, 
			      zIndex:999, 
			      spinner:"spinner6",//Options: 'spinner1', 'spinner2', 'spinner3', 'spinner4', 'spinner5', 'spinner6', 'spinner7' 
			      bgColor:"#fff", 
		}); 
	});
		$('#start').datepicker({
            keyboardNavigation: false,
            forceParse: false,
            autoclose: true,
            format: 'mm/dd/yyyy',
            todayHighlight: true,    
            endDate: new Date(),
        }).on('changeDate',function(ev){
        	var start=ev.date.valueOf();
        	$('#start').val(Format(start,"yyyy-MM-dd"));
        	if($('#end').val()!=""&&$('#start').val()>$('#end').val()){
        		swal("指定日期范围出错", "请重新检查", "error");
        	}else if($('#start').val()!=""&&$('#end').val()!=""){
        		initVisitCountByRange($('#start').val(),$('#end').val());
        	}
        });
	
		$('#end').datepicker({
            keyboardNavigation: false,
            forceParse: false,
            autoclose: true,
            format: 'mm/dd/yyyy',
            todayHighlight: true,    
            endDate: new Date(),
        }).on('changeDate',function(ev){
        	var end=ev.date.valueOf();
        	$('#end').val(Format(end,"yyyy-MM-dd"));
        	if($('#start').val()!=""&&$('#start').val()>$('#end').val()){
        		swal("指定日期范围出错", "请重新检查", "error");
        	}else if($('#start').val()!=""&&$('#end').val()!=""){
        		initVisitCountByRange($('#start').val(),$('#end').val());
        	}
        	
        })
	
	var initEcharts=function(days,counts){
		var md="日";
		if(days[days.length-1]==Format(new Date(),"yyyy-MM")||days[days.length-1]==Format(new Date(),"yyyy/MM")){
			md="月";
		}else if(days[days.length-1]==Format(new Date(),"yyyy")){
			md="年";
		}
    	var lineChart = echarts.init(document.getElementById("echarts-line-chart"));
        var lineoption = {
            title : {
                text: '网站访问人数'
            },
            tooltip : {
                trigger: 'axis'
            },
            legend: {
                data:['近'+days.length+''+md+'访问人数']
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
                    name:'近'+days.length+''+md+'访问人数',
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
        	var min = counts[0];
        	var max = counts[0];
        	var all=0;
        	for(var i=0;i<counts.length;i++){
        		all+=counts[i];
        	}
        	for (var i = 1; i < counts.length; i++){ 
	        	if (counts[i] < min){ 
	        		min = counts[i];
	        	} 
        	}
        	for (var i = 1; i < counts.length; i++){ 
	        	if (counts[i] > max){ 
	        		max = counts[i]; 
	        	} 
        	}
        $(".date").html('<span class="label label-danger ">'+days[0]+"——"+days[days.length-1]+'</span>');
        $(".num").html(days.length);
        $(".md").html(md);
        $(".high").html(max);
        $(".low").html(min);
        $(".all").html(all);
    };
    
    var initResourceCountByStatus=function(){
		//初始化资源数目
		$.ajax({
			url : 'selectResourceListByStatus',
			type : 'post',
			dataType : 'json',
			success : function(data) {
				for (var i = 0; i < data.list.length; i++) {
					//已发表
					 if (data.list[i].status == 1) {
						$(".resource").html(data.list[i].count );
					} 
				}
			},
			error : function() {
				swal("博客总数错误", "请重新操作", "error");
			}
		});
	};
    
	var initBlogCountByStatus=function(){
		//初始化博客数目
		$.ajax({
			url : 'selectBlogListByStatus',
			type : 'post',
			dataType : 'json',
			success : function(data) {
				var allCount=0;
				for (var i = 0; i < data.list.length; i++) {
					allCount+=data.list[i].count;
				}
				for (var i = 0; i < data.list.length; i++) {
					//草稿
					if (data.list[i].status == -1) {
						$(".draft").html(data.list[i].count );
						var draftPercent=Math.round(data.list[i].count / allCount * 100) / 1.00 + '%<i class="fa fa-bolt"></i>';
						$(".draftPercent").html(draftPercent);
						//已发表
					} else if (data.list[i].status == 1) {
						$(".allBlog").html(data.list[i].count );
						var allBlogPercent=Math.round(data.list[i].count / allCount * 100) / 1.00 + '%<i class="fa fa-bolt"></i>';
						$(".allBlogPercent").html(allBlogPercent);
						//垃圾箱
					} else if(data.list[i].status == 2){
						$(".delete").html(data.list[i].count );
						var deletePercent=Math.round(data.list[i].count / allCount * 100) / 1.00 + '%<i class="fa fa-bolt"></i>';
						$(".deletePercent").html(deletePercent);
					}
				}
				
			},
			error : function() {
				swal("博客总数错误", "请重新操作", "error");
			}
		});
	};
	
	var initBlogCountByDate=function(){
		var date=new Date();
		var startTime = Format(new Date(date.getTime() -  2*24*60*60*1000),"yyyy-MM-dd");
		var startTimePre = Format(new Date(date.getTime() -  24*60*60*1000),"yyyy-MM-dd");
		var endTime=Format(date,"yyyy-MM-dd");
		var params={
			startTime:startTime,
			endTime:endTime,
			status:"1"
		 };
		$.ajax({
			url : 'selectBlogListByDate',
			type : 'post',
			data:params,
			dataType : 'json',
			success : function(data) {
				var now=0;
				var yes=0;
				var yes2=0;
				for(var i=0;i<data.list.length;i++){
					var time=Format(data.list[i].addTime,"yyyy-MM-dd");
					if(time==startTimePre){
						yes=data.list[i].count;
						$(".yesBlog").html(data.list[i].count );
					}
					if(time==endTime){
						now=data.list[i].count;
						$(".nowBlog").html(data.list[i].count );
					}
					if(time==startTime){
						yes2=data.list[i].count;
					}
				}
				
				var nowBlogPercent=level(now,yes);
				$(".nowBlogPercent").html(nowBlogPercent);
				
				var yesBlogPercent=level(yes,yes2);
				$(".yesBlogPercent").html(yesBlogPercent);
				
			},
			error : function() {
				swal("博客发表数错误", "请重新操作", "error");
			}
		});
	};
	
	//根据今天/昨天 计算出 增长率/下降率
	var level=function(now,yes){
		var pm=now - yes;
		var level='<i class="fa fa-level-up"></i>';
		if(pm<0){
			pm=-pm;
			level='<i class="fa fa-level-down"></i>';
		}
		if(yes==0){
			return Math.round( pm  * 100) / 1.00 + '%'+level;
		}
		return Math.round( pm / yes * 100) / 1.00 + '%'+level;
	}
	
	//今日访客
	var initVisitCount=function(e){
		 params="";
		var date=null;
		var startTime=null;
		var endTime=null;
		if(e=="now"){
			date=new Date();
			startTime=Format(new Date(date.getTime() -  24*60*60*1000),"yyyy-MM-dd");
			nowTime=Format(date,"yyyy-MM-dd");
		}else if(e=="history"){
			startTime="";
			endTime="";
		}
		var params={
				startTime:startTime,
				endTime:nowTime,
				format:"day",
			 };
		$.ajax({
			url : 'selectVisitListByDate',
			type : 'post',
			data:params,
			dataType : 'json',
			success : function(data) {
				if(e=="now"){
					var now=0;
					var yes=0;
					for(var i=0;i<data.list.length;i++){
						var time=Format(data.list[i].time,"yyyy-MM-dd");
						if(time==nowTime){
							now=data.list[i].count;
							$(".nowVisitors").html(data.list[i].count );
						}
						if(time==startTime){
							yes=data.list[i].count;
						}
					}
					var nowVisitorsPercent=level(now,yes);
					$(".nowVisitorsPercent").html(nowVisitorsPercent);
				}else if(e=="history"){
					var count=0;
					for(var i=0;i<data.list.length;i++){
						count+=data.list[i].count;
					}
					$(".visitors").html(count );
				}
			},
			error : function() {
				swal("今日访客数错误", "请重新操作", "error");
			}
		});
	};
	
	//最近的num日访客
	var initVisitCountByWeek=function(num){
		$(".year").removeClass("active");
		$(".month").removeClass("active");
		$(".day").addClass("active");
		var date=new Date();
		var startTime="";
		var endTime="";
			startTime = Format(new Date(date.getTime() -  (num-1)*24*60*60*1000),"yyyy-MM-dd");
			endTime=Format(date,"yyyy-MM-dd");
		var params={
			startTime:startTime,
			endTime:endTime,
			format:"day",
		 };
		$.ajax({
			url : 'selectVisitListByDate',
			type : 'post',
			data:params,
			dataType : 'json',
			success : function(data) {
				var days=new Array();
				for(var i=num-1,j=0;i>=0;i--,j++){
					days[j]=Format(new Date(date.getTime() -  i*24*60*60*1000),"yyyy-MM-dd");
				}
				//快速初始化一个 大小为days的数组 并初始化全为0
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
				if(num>10){
					for(var i=num-1,j=0;i>=0;i--,j++){
						days[j]=Format(days[j],"MM/dd");
					}
				}
				initEcharts(days,counts); 
			},
			error : function() {
				swal("近日访客初始化错误", "请重新操作", "error");
			}
		});
	};
	
	//指定日期初始化访客人数
	var initVisitCountByRange=function(startTime,endTime){
		var start=Date.parse(new Date(startTime));
		var end=Date.parse(new Date(endTime));
		var num=Math.abs(parseInt((end - start)/1000/3600/24));
		 var params={
			startTime:startTime,
			endTime:endTime,
			format:"day",
		 };
		$.ajax({
			url : 'selectVisitListByDate',
			type : 'post',
			data:params,
			dataType : 'json',
			success : function(data) {
				var days=new Array();
				for(var i=num,j=0;i>=0;i--,j++){
					days[j]=Format(new Date(end -  i*24*60*60*1000),"yyyy-MM-dd");
				}
				//快速初始化一个 大小为days的数组 并初始化全为0
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
				if(num>10){
					for(var j=0;j<days.length;j++){
						days[j]=Format(days[j],"MM/dd");
					}
				}
				initEcharts(days,counts); 
			},
			error : function() {
				swal("指定日期访客初始化错误", "请重新操作", "error");
			}
		}); 
	};
	
	var initVisitCountByMonth=function(num){
		$(".year").removeClass("active");
		$(".day").removeClass("active");
		$(".month").addClass("active");
		var arr=new Array();
		arr=dataMonth(num);
		var startTime=arr[0];
		var endTime=arr[arr.length-1];
		var params={
			startTime:startTime,
			endTime:endTime,
			format:"month",
		 };
		$.ajax({
			url : 'selectVisitListByDate',
			type : 'post',
			data:params,
			dataType : 'json',
			success : function(data) {
				var counts=Array.apply(null, Array(arr.length)).map(function(item, i) {
				    return 0;
				});
				for(var j=0;j<arr.length;j++){
					for(var i=0;i<data.list.length;i++){
						var time=Format(data.list[i].time,"yyyy-MM");
						if(arr[j]==time){
							counts[j]=data.list[i].count;
						}
					}
				}
				if(num>10){
					for(var j=0;j<arr.length;j++){
						arr[j]=Format(arr[j],"yyyy/MM");
					}
				}
				initEcharts(arr,counts); 
			},
			error : function() {
				swal("近日访客初始化错误", "请重新操作", "error");
			}
		});
	};
	
	var initVisitCountByYear=function(num){
		$(".month").removeClass("active");
		$(".day").removeClass("active");
		$(".year").addClass("active");
		var arr=new Array();
		arr=dataYear(num);
		console.log(arr);
		var startTime=arr[0];
		var endTime=arr[arr.length-1];
		var params={
			startTime:startTime,
			endTime:endTime,
			format:"year",
		 };
		$.ajax({
			url : 'selectVisitListByDate',
			type : 'post',
			data:params,
			dataType : 'json',
			success : function(data) {
				var counts=Array.apply(null, Array(arr.length)).map(function(item, i) {
				    return 0;
				});
				for(var j=0;j<arr.length;j++){
					for(var i=0;i<data.list.length;i++){
						var time=Format(data.list[i].time,"yyyy");
						if(arr[j]==time){
							counts[j]=data.list[i].count;
						}
					}
				}
					
				initEcharts(arr,counts); 
			},
			error : function() {
				swal("近日访客初始化错误", "请重新操作", "error");
			}
		});
	};
	
	
	//获取前num个月的日期
	var dataMonth=function(num){  
        //创建现在的时间  
        var data=new Date();  
        //获取年  
        var year=data.getFullYear();  
        //获取月  
        var mon=data.getMonth()+2;  
        var arry=new Array();  
        for(var i=num-1;i>=0;i--){  
            mon=mon-1;  
            if(mon<=0){  
                year=year-1;  
                mon=mon+12;  
            }  
            if(mon<10){  
                mon="0"+mon;  
            }  
            arry[i]=year+"-"+mon;  
        }  
        return arry;  
    }
	
	//获取前num年的日期
	var dataYear=function(num){  
        //创建现在的时间  
        var data=new Date();  
        //获取年  
        var year=data.getFullYear()+1;  
        var arry=new Array();  
        for(var i=num-1;i>=0;i--){  
        	year=year-1; 
            arry[i]=year;  
        }  
        return arry;  
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
