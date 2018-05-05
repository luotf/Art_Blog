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
</head>

<body class="gray-bg">
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
                        <div class="stat-percent font-bold text-success">98% <i class="fa fa-bolt"></i>
                        </div>
                        <small>已发表</small>
                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <span class="label label-info pull-right">今天</span>
                        <h5>今日发表</h5>
                    </div>
                    <div class="ibox-content">
                        <h1 class="nowBlog no-margins" style="text-align: center;">0</h1>
                        <div class="stat-percent font-bold text-danger">38% <i class="fa fa-level-down"></i>
                        </div>
                        <small>已发表</small>
                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <span class="label label-primary pull-right">今天</span>
                        <h5>今日访客</h5>
                    </div>
                    <div class="ibox-content">
                        <h1 class="nowVisitors no-margins" style="text-align: center;">0</h1>
                        <div class="stat-percent font-bold text-navy">44% <i class="fa fa-level-up"></i>
                        </div>
                        <small>新访客</small>
                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <span class="label label-success pull-right">历史</span>
                        <h5>历史访客</h5>
                    </div>
                    <div class="ibox-content">
                        <h1 class="visitors no-margins" style="text-align: center;">0</h1>
                        <div class="stat-percent font-bold text-info">20% <i class="fa fa-level-up"></i>
                        </div>
                        <small>总访问量</small>
                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <span class="label label-danger pull-right">历史</span>
                        <h5>草稿箱</h5>
                    </div>
                    <div class="ibox-content">
                        <h1 class="draft no-margins" style="text-align: center;">0</h1>
                        <div class="stat-percent font-bold text-info">20% <i class="fa fa-level-up"></i>
                        </div>
                        <small>未发表</small>
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
                        <div class="stat-percent font-bold text-info">20% <i class="fa fa-level-up"></i>
                        </div>
                        <small>已发表</small>
                    </div>
                </div>
            </div>
          
          <div class="col-sm-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <span class="label label-primary pull-right">今天</span>
                        <h5>今日评论</h5>
                    </div>
                    <div class="ibox-content">
                        <h1 class="nowRecommend no-margins" style="text-align: center;">0</h1>
                        <div class="stat-percent font-bold text-navy">44% <i class="fa fa-level-up"></i>
                        </div>
                        <small>新评论</small>
                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <span class="label label-success pull-right">历史</span>
                        <h5>历史评论</h5>
                    </div>
                    <div class="ibox-content">
                        <h1 class="allRecommend no-margins" style="text-align: center;">0</h1>
                        <div class="stat-percent font-bold text-info">20% <i class="fa fa-level-up"></i>
                        </div>
                        <small>总评论数</small>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>访问量</h5>
                        <div class="pull-right">
                            <div class="btn-group">
                                <button type="button" class="btn btn-xs btn-white active">天</button>
                                <button type="button" class="btn btn-xs btn-white">月</button>
                                <button type="button" class="btn btn-xs btn-white">年</button>
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
                                        <h2 class="no-margins">2,346</h2>
                                        <small>订单总数</small>
                                        <div class="stat-percent">48% <i class="fa fa-level-up text-navy"></i>
                                        </div>
                                        <div class="progress progress-mini">
                                            <div style="width: 48%;" class="progress-bar"></div>
                                        </div>
                                    </li>
                                    <li>
                                        <h2 class="no-margins ">4,422</h2>
                                        <small>最近一个月订单</small>
                                        <div class="stat-percent">60% <i class="fa fa-level-down text-navy"></i>
                                        </div>
                                        <div class="progress progress-mini">
                                            <div style="width: 60%;" class="progress-bar"></div>
                                        </div>
                                    </li>
                                    <li>
                                        <h2 class="no-margins ">9,180</h2>
                                        <small>最近一个月销售额</small>
                                        <div class="stat-percent">22% <i class="fa fa-bolt text-navy"></i>
                                        </div>
                                        <div class="progress progress-mini">
                                            <div style="width: 22%;" class="progress-bar"></div>
                                        </div>
                                    </li>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>


        </div>
    </div>

    <!-- 全局js -->
    <script src="${pageContext.request.contextPath}/js/jquery.min.js?v=2.1.4"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/plugins/echarts/echarts-all.js"></script>
	<script src="${pageContext.request.contextPath}/js/plugins/sweetalert/sweetalert.min.js"></script>

    <script>
    var lineChart = echarts.init(document.getElementById("echarts-line-chart"));
    var lineoption = {
        title : {
            text: '网站访问人数'
        },
        tooltip : {
            trigger: 'axis'
        },
        legend: {
            data:['近7日访问人数']
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
                data : ['04/24','04/25','04/26','04/27','04/28','04/29','04/30']
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
                name:'近7日访问人数',
                type:'line',
                data:[11, 11, 15, 13, 6, 13, 10,17],
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
    $(window).resize(lineChart.resize);
    </script>

	<script type="text/javascript">
	$(document).ready(function() {
		initBlogCountByStatus();//初始化已发表/草稿箱博客数目
		initBlogCountByDate();//初始化昨日/今日博客发表数目
		initVisitCount("now");  //初始化今日访客
		initVisitCount("history");  //初始化历史访客
	});
	
	
	var initBlogCountByStatus=function(){
		//初始化博客数目
		$.ajax({
			url : 'selectBlogListByStatus',
			type : 'post',
			dataType : 'json',
			success : function(data) {
				for (var i = 0; i < data.list.length; i++) {
					//草稿
					if (data.list[i].status == -1) {
						$(".draft").html(
								data.list[i].count );
						//已发表
					} else if (data.list[i].status == 1) {
						$(".allBlog").html(data.list[i].count );
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
		var startTime = Format(new Date(date.getTime() -  24*60*60*1000),"yyyy-MM-dd");
		var endTime=Format(date,"yyyy-MM-dd");
		var params={
			startTime:startTime,
			endTime:endTime,
		 };
		$.ajax({
			url : 'selectBlogListByDate',
			type : 'post',
			data:params,
			dataType : 'json',
			success : function(data) {
				if(data.list.length>=1){
					$(".yesBlog").html(data.list[0].count );
				}
				if(data.list.length>=2){
					$(".nowBlog").html(data.list[1].count );
				}
						
			},
			error : function() {
				swal("博客发表数错误", "请重新操作", "error");
			}
		});
	};
	
	//今日访客
	var initVisitCount=function(e){
		 params="";
		var date=null;
		var startTime=null;
		if(e=="now"){
			date=new Date();
			startTime=Format(date,"yyyy-MM-dd");
		}else if(e=="history"){
			startTime="";
		}
		var params={
				startTime:startTime,
				endTime:startTime,
			 };
		$.ajax({
			url : 'selectVisitListByDate',
			type : 'post',
			data:params,
			dataType : 'json',
			success : function(data) {
				if(data.list.length>=1){
					if(e=="now"){
						$(".nowVisitors").html(data.list[0].count );
					}else if(e=="history"){
						var count=0;
						for(var i=0;i<data.list.length;i++){
							count+=data.list[i].count;
						}
						$(".visitors").html(count );
					}
					
				}
			},
			error : function() {
				swal("今日访客数错误", "请重新操作", "error");
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
