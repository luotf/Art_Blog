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
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/js/plugins/fancybox/jquery.fancybox.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css?v=4.1.0" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
</head>
<body class="gray-bg">
   <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-6">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5> <i class="fa fa-bar-chart"></i> 访问量</h5>
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
                        <div class="echarts" id="echarts-line-chart" ></div>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>柱状图</h5>
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

                        <div class="echarts" id="echarts-bar-chart"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
  
	<!-- 全局js -->
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

	<script src="${pageContext.request.contextPath}/js/plugins/peity/jquery.peity.min.js"></script>

	
	<!-- 自定义js -->
	<script src="${pageContext.request.contextPath}/js/content.js"></script>
	
	<script src="${pageContext.request.contextPath}/js/plugins/sweetalert/sweetalert.min.js"></script>
	
	<script
		src="${pageContext.request.contextPath}/js/plugins/echarts/echarts.min.js"></script>

    <script>
    $(document).ready(function() {
    	
    	 initVisitCountByWeek(7);  //初始化num日访客
    	
    });
    
  //最近的num日访客
	var initVisitCountByWeek=function(num){
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
			url : '../selectVisitListByDate',
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
				if(num>6){
					for(var i=num-1,j=0;i>=0;i--,j++){
						days[j]=Format(days[j],"yyyy/MM/dd");
					}
				}
				initEcharts(days,counts); 
			},
			error : function() {
				swal("近日访客初始化错误", "请重新操作", "error");
			}
		});
	};
    
	var initEcharts=function(days,counts){
    	var lineChart = echarts.init(document.getElementById("echarts-line-chart"));
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
