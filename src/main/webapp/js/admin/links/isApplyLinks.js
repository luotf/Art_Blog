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

	initLinksCount();
	selectLinks();

});


var returnAllCount = function() {
	if (globalCount == 2) {
		setTimeout(function() {
			$('#fakeloader').css('display', 'none');
		}, 500);
	}
}

var initLinksCount = function() {
	$.ajax({
		url : '../selectLinksListByStatus',
		type : 'post',
		dataType : 'json',
		success : function(data) {
			var count = 0;
			$(".a-2").html('0条');
			$(".a-3").html('0条');
			for (var i = 0; i < data.list.length; i++) {
				count += data.list[i].count;
				if (data.list[i].status == 1) {
					$(".a-2").html(
						data.list[i].count + '条');
				} else if (data.list[i].status == -1) {
					$(".a-3").html(
						data.list[i].count + '条');
				}
			}
			$(".a-1").html(
				count + '条');
		},
		error : function() {
			swal("初始化友链数目错误", "请重新操作", "error");
		}
	});

	globalCount++;
	returnAllCount();
}

//草稿/发布...按钮绑定查询事件  
$(".share").click(function() {
	var statu = $(this).val();
	var params = $('#allLinks').bootstrapTable('getOptions');
	params.queryParams = function(params) {
		return {
			pageSize : params.limit,
			page : (params.offset) / params.limit + 1,
			name : $(".search .form-control").val(),
			isapply : -1,
		}
	};
	$('#allLinks').bootstrapTable('refresh', params);
});


//初始化表格数据
var selectLinks = function() {
	$('#allLinks').bootstrapTable({
		method : 'post',
		url : "../selectLikeLinksListByPage",
		dataType : "json",
		striped : false, //使表格带有条纹  
		pagination : true, //在表格底部显示分页工具栏  
		pageSize : 10,
		pageNumber : 1,
		sortOrder : "asc",
		sortable : true,
		pageList : [ 10, 20, 30 ],
		idField : "id", //标识哪个字段为id主键  
		showToggle : false, //名片格式  
		cardView : false, //设置为True时显示名片（card）布局  
		showColumns : true, //显示隐藏列    
		showRefresh : true, //显示刷新按钮  
		search : true, //是否显示搜索框
		searchOnEnterKey : true, //设置为 true时，按回车触发搜索方法，否则自动触发搜索方法
		queryParams : queryParams, //参数  
		sidePagination : "server", //服务端处理分页
		searchTimeOut : 500, //设置搜索超时时间
		toolbarAlign : 'left', //工具栏对齐方式
		buttonsAlign : 'right', //按钮对齐方式
		toolbar : '#toolbar', //指定工作栏
		searchAlign : 'right',
		contentType : "application/x-www-form-urlencoded",
		formatLoadingMessage : function() {
			return "请稍等，正在加载中...";
		},
		formatNoMatches : function() { //没有匹配的结果  
			return "无符合条件的记录";
		},
		responseHandler : function(res) {
			return {
				"total" : res.pageInfo.total, //总页数
				"rows" : res.pageInfo.list //数据
			};
		},
		columns : [
			{
				title : '序号',
				align : 'center',
				valign : 'middle',
				width : '5%',
				formatter : function(value, row, index) {
					var index1 = index + 1;
					var id = '<span title="ID:' + row.id + '">' + index1 + '</span>';
					return id;
				}
			},
			{
				title : '名称',
				field : 'name',
				align : 'center',
				width : '10%',
				cellStyle : formatTableUnit,
				formatter : operateOpinionFormatter
			},
			{
				title : '点击数',
				field : 'clicknum',
				align : 'center',
				width : '6%',
			},
			{
				title : '置顶量',
				field : 'sort',
				align : 'center',
				width : '6%',
			},
			{
				title : '状态',
				field : 'status',
				align : 'center',
				width : '8%',
				formatter : function(value, row, index) {
					if (row.isapply == -1) {
						return '<button class="btn-xs btn-warning">未处理</button> ';
					}
				}
			},
			{
				title : '申请时间',
				field : 'addtime',
				align : 'center',
				width : '15%',
				formatter : function(value, row, index) {
					return Format(row.addtime, "yyyy-MM-dd hh:mm:ss");
				}
			},
			{
				title : '操作',
				field : 'id',
				align : 'center',
				width : '18%',
				formatter : function(value, row, index) {
					//通过审核
					var a = '<a  class=" btn-sm btn-info"  title="通过后将在前台展示" onclick="updateLinks(' + row.id + ',\'' + row.name + '\')"><i class="fa fa-check" ></i> 通过审核</a> ';
					//删除
					var b = '<a  class=" btn-sm btn-danger"   onclick="deleteLinks(' + row.id + ',\'' + row.name + '\')"><i class="fa fa-trash-o" ></i> 忽略</a> ';
					return a + b;
				}
			}
		]
	});
	globalCount++;
	returnAllCount();
}

//传参数到后台
function queryParams(params) {
	return {
		//每页多少条数据
		pageSize : params.limit,
		page : (params.offset) / params.limit + 1,
		name : $(".search .form-control").val(),
		isapply : -1,
	};
}


//设置 字数不超过宽度限制
var operateOpinionFormatter = function(value, row, index) {
	var title = "";
	var linksNameLow = $(".search .form-control").val().toLowerCase();
	var linksName = $(".search .form-control").val();
	var strStartIndex = "";
	var strEndIndex = "";
	if (value.search(linksName) != -1 || value.toLowerCase().search(linksNameLow) != -1) {
		var strs = new Array();
		strs = value.split("");
		strStartIndex = value.indexOf(linksName);
		strEndIndex = strStartIndex + linksName.length - 1;
		if (value.toLowerCase().search(linksNameLow) != -1) {
			strStartIndex = value.toLowerCase().indexOf(linksNameLow);
			strEndIndex = strStartIndex + linksNameLow.length - 1;
		}
		for (var i = 0; i < strs.length; i++) {
			if (i >= strStartIndex && i <= strEndIndex) {
				title += '<span style="color:#000;font-weight:bold;">' + strs[i] + '</span>';
			} else {
				title += '<span >' + strs[i] + '</span>';
			}
		}
	} else {
		title = value;
	}
	return "<a href='" + row.link + "'><span>" + title + "</span></a>";
}

var formatTableUnit = function(value, row, index) {
	return {
		css : {
			"overflow" : 'hidden',
			"text-overflow" : 'ellipsis',
			"white-space" : 'nowrap'
		}
	};
};


var updateLinks = function(id, title) {
	var params = {
		'id' : id,
		isapply : 1,
		prarm : '审核了友链<span class="text-info">#' + title + '#</span>',
	};
	$.ajax({
		url : '../updateLinks',
		type : 'post',
		data : params,
		dataType : 'json',
		success : function(data) {
			if (data.status == 200) {
				initLinksCount();
				$("#modal-form").modal('hide');
				$("#allLinks").bootstrapTable('refresh');
				swal("更新成功", "", "success");
			} else if (data.status == 0) {
				swal("更新失败", "", "error");
			}
		},
		error : function() {
			swal("更新错误", "请重新操作", "error");
		}
	});

}

var deleteLinks = function(id, title) {
	var params = {
		'id' : id,
		prarm : '忽略的友链为<span class="text-info">#' + title + '#</span>'
	};
	swal({
		title : "确定要忽略该友链信息吗",
		text : "忽略后将无法恢复，请谨慎操作！",
		type : "warning",
		showCancelButton : true,
		confirmButtonColor : "#DD6B55",
		confirmButtonText : "确定",
		closeOnConfirm : false
	}, function() {
		$.ajax({
			url : '../deleteLinks',
			type : 'post',
			data : params,
			dataType : 'json',
			success : function(data) {
				if (data.status == 200) {
					$("#allLinks").bootstrapTable('refresh');
					initLinksCount();
					swal("忽略成功！", "", "success");
				} else {
					swal("删除失败", "请重新操作", "error");
				}
			},
			error : function() {
				swal("忽略错误", "请重新操作", "error");
			}
		});
	});
};

//只有验证通过才能执行 添加
$("#addLinks").click(function() {
	if ($("#commentForm").valid()) {
		addLinks();
	}
});

var addLinks = function() {
	var params = {
		name : $("#name").val(),
		link : $("#link").val().replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, "&quot;").replace(/'/g, "&#039;"),
		sort : $("#sort").val().replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, "&quot;").replace(/'/g, "&#039;"),
		isapply : 1,
		prarm : '新增的友链名称为<span class="text-info">#' + $("#name").val().replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, "&quot;").replace(/'/g, "&#039;") + '#</span>',
	};
	$.ajax({
		url : '../addLinks',
		type : 'post',
		data : params,
		dataType : 'json',
		success : function(data) {
			if (data.status == 200) {
				$("#allLinks").bootstrapTable('refresh');
				initLinksCount();
				name:$("#name").val("");
				link:$("#link").val("");
				sort:$("#sort").val("");
				swal("添加成功", "", "success");
			}
		},
		error : function() {
			swal("添加友链错误", "请重新操作", "error");
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