
var globalCount = 0;
$("#fakeloader").fakeLoader({
	timeToHide : 10000, //Time in milliseconds for fakeLoader disappear
	zIndex : 999, // Default zIndex
	spinner : "spinner6", //Options: 'spinner1', 'spinner2', 'spinner3', 'spinner4', 'spinner5', 'spinner6', 'spinner7' 
	bgColor : "#fff", //Hex, RGB or RGBA colors
});
setTimeout(function() {
	$('body').css('opacity', '1');
	$('body').attr("class", "gray-bg") //添加样式
}, 100);

$(document).ready(function() {

	var date = new Date();
	var start = Format(new Date(date.getTime() - 6 * 24 * 60 * 60 * 1000), "yyyy-MM-dd");
	var end = Format(date, "yyyy-MM-dd");
	$("#startTime").val(start);
	$("#endTime").val(end);
	initVisitCountByDate(start, end); //初始化7日访客

	$("#startBlog").val(start);
	$("#endBlog").val(end);
	initBlogCountByDate(start, end); //初始化7日博客数量

	$("#startUserLogClick").val(start);
	$("#endUserLogClick").val(end);
	initUserLogClickByDate(start, end); //初始化7日访客


	initBlogClickSort(); //初始化博客点击排序

});

var returnAllCount = function() {
	if (globalCount == 4) {
		setTimeout(function() {
			$('#fakeloader').css('display', 'none');
		}, 500);
	}
}

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
}).on('changeDate', function(ev) {
	var end = ev.date.valueOf();
	$('#endTime').val(Format(end, "yyyy-MM-dd"));
	if ($('#startTime').val() != "" && $('#startTime').val() > $('#endTime').val()) {
		swal("指定日期范围出错", "截止日期必须大于起始日期", "error");
	} else if ($('#startTime').val() != "" && $('#endTime').val() != "") {
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
}).on('changeDate', function(ev) {
	var end = ev.date.valueOf();
	$('#endBlog').val(Format(end, "yyyy-MM-dd"));
	if ($('#startBlog').val() != "" && $('#startBlog').val() > $('#endBlog').val()) {
		swal("指定日期范围出错", "截止日期必须大于起始日期", "error");
	} else if ($('#startBlog').val() != "" && $('#endBlog').val() != "") {
		initBlogCountByDate($('#startBlog').val(), $('#endBlog').val());
	}

});


//最近的num日访客
var initVisitCountByDate = function(startTime, endTime) {
	var start = Date.parse(new Date(startTime));
	var end = Date.parse(new Date(endTime));
	var num = Math.abs(parseInt((end - start) / 1000 / 3600 / 24));
	var params = {
		startTime : startTime,
		endTime : endTime,
		format : "day",
	};
	$.ajax({
		url : '../selectVisitListByDate',
		type : 'post',
		data : params,
		dataType : 'json',
		success : function(data) {
			var days = new Array();
			for (var i = num, j = 0; i >= 0; i--, j++) {
				days[j] = Format(new Date(end - i * 24 * 60 * 60 * 1000), "yyyy-MM-dd");
			}
			var counts = Array.apply(null, Array(days.length)).map(function(item, i) {
				return 0;
			});

			for (var j = 0; j < days.length; j++) {
				for (var i = 0; i < data.list.length; i++) {
					var time = Format(data.list[i].time, "yyyy-MM-dd");
					if (days[j] == time) {
						counts[j] = data.list[i].count;
					}
				}
			}
			for (var j = 0; j < days.length; j++) {
				days[j] = Format(days[j], "yyyy/MM/dd");
			}
			initEchartsByVisit(days, counts);
		},
		error : function() {
			swal("近日访客初始化错误", "请重新操作", "error");
		}
	});
};
var initEchartsByVisit = function(days, counts) {
	var lineChart = echarts.init(document.getElementById("echarts-line-visit"));
	var lineoption = {
		title : {
			text : '网站访问人数'
		},
		tooltip : {
			trigger : 'axis'
		},
		legend : {
			data : [ '近' + days.length + '日访问人数' ]
		},
		toolbox : {
			show : true,
			feature : {
				dataZoom : {
					yAxisIndex : 'none'
				},
				dataView : {
					readOnly : false
				},
				magicType : {
					type : [ 'line', 'bar' ]
				},
				restore : {},
				saveAsImage : {}
			}
		},
		grid : {
			x : 40,
			x2 : 40,
			y2 : 24
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
					formatter : '{value}'
				},
			}
		],
		series : [
			{
				name : '近' + days.length + '日访问人数',
				type : 'line',
				data : counts,
				markPoint : {
					data : [
						{
							type : 'max',
							name : '最大值'
						},
						{
							type : 'min',
							name : '最小值'
						}
					]
				},
				markLine : {
					data : [
						{
							type : 'average',
							name : '平均值'
						}
					]
				}
			},
		]
	};
	lineChart.setOption(lineoption);
	globalCount++;
	returnAllCount();
};


//最近的num日博客发表数
var initBlogCountByDate = function(startTime, endTime) {
	var start = Date.parse(new Date(startTime));
	var end = Date.parse(new Date(endTime));
	var num = Math.abs(parseInt((end - start) / 1000 / 3600 / 24));
	var params = {
		startTime : startTime,
		endTime : endTime,
		status : 1
	};
	$.ajax({
		url : '../selectBlogListByDate',
		type : 'post',
		data : params,
		dataType : 'json',
		success : function(data) {
			var days = new Array();
			for (var i = num, j = 0; i >= 0; i--, j++) {
				days[j] = Format(new Date(end - i * 24 * 60 * 60 * 1000), "yyyy-MM-dd");
			}
			var counts = Array.apply(null, Array(days.length)).map(function(item, i) {
				return 0;
			});
			for (var j = 0; j < days.length; j++) {
				for (var i = 0; i < data.list.length; i++) {
					var time = Format(data.list[i].addTime, "yyyy-MM-dd");
					if (days[j] == time) {
						counts[j] = data.list[i].count;
					}
				}
			}
			for (var j = 0; j < days.length; j++) {
				days[j] = Format(days[j], "yyyy/MM/dd");
			}
			initEchartsByBlog(days, counts);
		},
		error : function() {
			swal("近日博客发表数初始化错误", "请重新操作", "error");
		}
	});
};

var initEchartsByBlog = function(days, counts) {
	var lineChart = echarts.init(document.getElementById("echarts-line-blog"));
	var lineoption = {
		title : {
			text : '博客发表数'
		},
		tooltip : {
			trigger : 'axis'
		},
		legend : {
			data : [ '近' + days.length + '日博客发表数' ]
		},
		toolbox : {
			show : true,
			feature : {
				dataZoom : {
					yAxisIndex : 'none'
				},
				dataView : {
					readOnly : false
				},
				magicType : {
					type : [ 'line', 'bar' ]
				},
				restore : {},
				saveAsImage : {}
			}
		},
		grid : {
			x : 40,
			x2 : 40,
			y2 : 24
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
					formatter : '{value}'
				},
			}
		],
		series : [
			{
				name : '近' + days.length + '日博客发表数',
				type : 'bar',
				data : counts,
				markPoint : {
					data : [
						{
							type : 'max',
							name : '最大值'
						},
						{
							type : 'min',
							name : '最小值'
						}
					]
				},
				markLine : {
					data : [
						{
							type : 'average',
							name : '平均值'
						}
					]
				}
			},
		]
	};
	lineChart.setOption(lineoption);
	globalCount++;
	returnAllCount();
};


//访问量时间
$('#startUserLogClick').datepicker({
	keyboardNavigation : false,
	forceParse : false,
	autoclose : true,
	format : 'mm/dd/yyyy',
	todayHighlight : true,
	endDate : new Date(),
}).on('changeDate', function(ev) {
	var start = ev.date.valueOf();
	$('#startUserLogClick').val(Format(start, "yyyy-MM-dd"));
	if ($('#endUserLogClick').val() != "" && $('#startUserLogClick').val() > $('#endUserLogClick').val()) {
		swal("指定日期范围出错", "请重新检查", "error");
	} else if ($('#startUserLogClick').val() != "" && $('#endUserLogClick').val() != "") {
		initUserLogClickByDate($('#startUserLogClick').val(), $('#endUserLogClick').val());
	}
});
$('#endUserLogClick').datepicker({
	keyboardNavigation : false,
	forceParse : false,
	autoclose : true,
	format : 'mm/dd/yyyy',
	todayHighlight : true,
	endDate : new Date(),
}).on('changeDate', function(ev) {
	var end = ev.date.valueOf();
	$('#endUserLogClick').val(Format(end, "yyyy-MM-dd"));
	if ($('#startUserLogClick').val() != "" && $('#startUserLogClick').val() > $('#endUserLogClick').val()) {
		swal("指定日期范围出错", "截止日期必须大于起始日期", "error");
	} else if ($('#startUserLogClick').val() != "" && $('#endUserLogClick').val() != "") {
		initUserLogClickByDate($('#startUserLogClick').val(), $('#endUserLogClick').val());
	}

});

//最近num日博客点击数
var initUserLogClickByDate = function(startTime, endTime) {
	var start = Date.parse(new Date(startTime));
	var end = Date.parse(new Date(endTime));
	var num = Math.abs(parseInt((end - start) / 1000 / 3600 / 24));
	var params = {
		startTime : startTime,
		endTime : endTime,
		userType : '普通用户'
	};
	$.ajax({
		url : '../selectUserLogByDate',
		type : 'post',
		data : params,
		dataType : 'json',
		success : function(data) {
			var days = new Array();
			for (var i = num, j = 0; i >= 0; i--, j++) {
				days[j] = Format(new Date(end - i * 24 * 60 * 60 * 1000), "yyyy-MM-dd");
			}
			var counts = Array.apply(null, Array(days.length)).map(function(item, i) {
				return 0;
			});
			for (var j = 0; j < days.length; j++) {
				for (var i = 0; i < data.list.length; i++) {
					var time = Format(data.list[i].addTime, "yyyy-MM-dd");
					if (days[j] == time) {
						counts[j] = data.list[i].count;
					}
				}
			}
			for (var j = 0; j < days.length; j++) {
				days[j] = Format(days[j], "yyyy/MM/dd");
			}
			initEchartsByUserLogCount(days, counts);
		},
		error : function() {
			swal("近日博客发表数初始化错误", "请重新操作", "error");
		}
	});
};

var initEchartsByUserLogCount = function(days, counts) {
	var lineChart = echarts.init(document.getElementById("echarts-line-userLogClick"));
	var lineoption = {
		title : {
			text : '操作记录'
		},
		tooltip : {
			trigger : 'axis'
		},
		legend : {
			data : [ '近' + days.length + '日用户操作量' ]
		},
		toolbox : {
			show : true,
			feature : {
				dataZoom : {
					yAxisIndex : 'none'
				},
				dataView : {
					readOnly : false
				},
				magicType : {
					type : [ 'line', 'bar' ]
				},
				restore : {},
				saveAsImage : {}
			}
		},
		grid : {
			x : 40,
			x2 : 40,
			y2 : 24
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
					formatter : '{value}'
				},
			}
		],
		series : [
			{
				name : '近' + days.length + '日用户操作量',
				type : 'line',
				data : counts,
				markPoint : {
					data : [
						{
							type : 'max',
							name : '最大值'
						},
						{
							type : 'min',
							name : '最小值'
						}
					]
				},
				markLine : {
					data : [
						{
							type : 'average',
							name : '平均值'
						}
					]
				}
			},
		]
	};
	lineChart.setOption(lineoption);
	globalCount++;
	returnAllCount();
};



//初始化  博客 浏览排行
var initBlogClickSort = function() {
	$.ajax({
		url : '../selectBlogByClick',
		type : 'post',
		dataType : 'json',
		success : function(data) {
			var idArray = new Array();
			var counts = Array.apply(null, Array(idArray.length)).map(function(item, i) {
				return 0;
			});
			idArray[0] = new Array();
			idArray[1] = new Array();
			for (var i = 0; i < data.list.length; i++) {
				idArray[0][i] = data.list[i].id;
				counts[i] = data.list[i].clickNum;
			}
			for (var i = 0; i < data.list.length; i++) {
				idArray[1][i] = data.list[i].clickNum;
			}
			initEchartsByBlogClickSort(idArray, counts);
		},
		error : function() {
			swal("初始化历史浏览量排行错误", "请重新操作", "error");
		}
	});

};

var initEchartsByBlogClickSort = function(idArray, counts) {
	var lineChart = echarts.init(document.getElementById("echarts-line-blogClickSort"));
	var lineoption = {
		title : {
			text : '博客浏览排行'
		},
		tooltip : {
			trigger : 'axis'
		},
		legend : {
			data : [ 'Top' + counts.length + ' 博客浏览排行' ]
		},
		toolbox : {
			show : true,
			feature : {
				dataZoom : {
					yAxisIndex : 'none'
				},
				dataView : {
					readOnly : false
				},
				magicType : {
					type : [ 'line', 'bar' ]
				},
				restore : {},
				saveAsImage : {}
			}
		},
		grid : {
			x : 40,
			x2 : 40,
			y2 : 24
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
					formatter : '{value}'
				},
			}
		],
		series : [
			{
				name : 'Top' + counts.length + ' 博客浏览排行',
				type : 'bar',
				data : counts,
				markPoint : {
					data : [
						{
							type : 'max',
							name : '最大值'
						},
						{
							type : 'min',
							name : '最小值'
						}
					]
				},
				markLine : {
					data : [
						{
							type : 'average',
							name : '平均值'
						}
					]
				}
			},
		]
	};
	lineChart.setOption(lineoption);
	globalCount++;
	returnAllCount();
	lineChart.on('click', function(params) {
		var blogId = 0;
		$('#btn').trigger("click");
		for (var i = 0; i < counts.length; i++) {
			if (idArray[1][i] == params.value) {
				blogId = idArray[0][i];
			}
		}
		selectBlogById(blogId);
	});
};

//查看博客内容
function selectBlogById(blogId) {
	var param = {
		id : blogId
	}
	$.ajax({
		url : '../selectBlogById',
		type : 'post',
		data : param,
		dataType : 'json',
		success : function(data) {
			//查询成功
			if (data.status == 200) {
				$(".newsview").find(".news_title").html(data.blog.title);
				$(".newsview").find(".au02").html(Format(data.blog.addtime, "yyyy-MM-dd hh:mm:ss"));
				$(".au03").find('b').html(data.blog.clicknum);
				$(".news_about").find(".news_intr").html(data.blog.introduction);
				var keyword = '';
				$(".newsview").find(".tags").html("");
				if (data.blog.keyword != '' && data.blog.keyword != null) {
					if (data.blog.keyword.search(';') != -1) {
						var strs = new Array();
						strs = data.blog.keyword.split(";");
						for (var i = 0; i < strs.length && strs[i] != ''; i++) {
							keyword += '<a href="#">' + strs[i] + '</a>';
						}
					} else {
						keyword = '<a href="#">' + data.blog.keyword + '</a>';
					}
				}
				$(".newsview").find(".tags").append(keyword);
				$(".newsview").find(".news_infos").html(data.blog.content);
			}
			$('pre').each(function(i, block) {
				hljs.highlightBlock(block);
			});
		},
		error : function() {
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
		"S" : datetime.getMilliseconds() //毫秒   
	};
	if (/(y+)/.test(fmt))
		fmt = fmt.replace(RegExp.$1, (datetime.getFullYear() + "").substr(4 - RegExp.$1.length));
	for (var k in o)
		if (new RegExp("(" + k + ")").test(fmt))
			fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
	return fmt;
}