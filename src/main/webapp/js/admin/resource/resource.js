//判断页面ajax请求加载成功的次数
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

	initResourceCount();
	selectResource();

});


var returnAllCount = function() {
	if (globalCount == 2) {
		setTimeout(function() {
			$('#fakeloader').css('display', 'none');
		}, 500);
	}
}

var initResourceCount = function() {
	$.ajax({
		url : '../selectResourceListByStatus',
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
			swal("初始化资源数目错误", "请重新操作", "error");
		}
	});

	globalCount++;
	returnAllCount();
}

//草稿/发布...按钮绑定查询事件  
$(".share").click(function() {
	var statu = $(this).val();
	var params = $('#allResource').bootstrapTable('getOptions');
	params.queryParams = function(params) {
		return {
			pageSize : params.limit,
			page : (params.offset) / params.limit + 1,
			title : $(".search .form-control").val(),
			status : statu,
		}
	};
	$('#allResource').bootstrapTable('refresh', params);
});


//初始化表格数据
var selectResource = function() {
	$('#allResource').bootstrapTable({
		method : 'post',
		url : "../selectLikeResourceListByPage",
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
				field : 'title',
				align : 'center',
				width : '10%',
				cellStyle : formatTableUnit,
				formatter : operateOpinionFormatter
			},
			{
				title : '内容',
				field : 'content',
				align : 'center',
				width : '15%',
				cellStyle : formatTableUnit,
				formatter : operateOpinionFormatterContent
			},

			{
				title : '状态',
				field : 'status',
				align : 'center',
				width : '5%',
				formatter : function(value, row, index) {
					if (row.status == -1) {
						return '<button class="btn-xs btn-warning">下架</button> ';
					} else if (row.status == 1) {
						return '<button class="btn-xs btn-info" >上架</button> ';
					}

				}
			},
			{
				title : '发表时间',
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
				width : '15%',
				formatter : function(value, row, index) {
					//编辑
					var a = '<a  class=" btn-sm btn-info" data-toggle="modal" data-target="#modal-form" onclick="selectResourceById(' + row.id + ')"><i class="fa fa-edit" ></i> 编辑</a> ';
					//删除
					var b = '<a  class=" btn-sm btn-danger"   onclick="deleteResource(' + row.id + ',\'' + row.title + '\')"><i class="fa fa-trash-o" ></i> 删除</a> ';
					//下架
					var c = '<a  class=" btn-sm btn-danger"  title="下架后前台将无法展示" onclick="updateResource(' + row.id + ',\'' + row.title + '\',-1)"><i class="fa fa-hand-o-down" ></i> 下架</a> ';
					//上架
					var d = '<a  class=" btn-sm btn-primary"  title="上架后将在前台展示" onclick="updateResource(' + row.id + ',\'' + row.title + '\',1)"><i class="fa fa-hand-o-up" ></i> 上架</a> ';
					if (row.status == -1) {
						return d + b;
					} else if (row.status == 1) {
						return a + c;
					}
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
		title : $(".search .form-control").val(),
		content : $(".search .form-control").val(),
		status : 1,
	};
}


var selectResourceById = function(id) {
	var params = {
		id : id
	};
	$.ajax({
		url : '../selectResourceById',
		type : 'post',
		data : params,
		dataType : 'json',
		success : function(data) {
			if (data.status == 200) {
				$("#newTitle").val(data.resource.title);
				$("#newContent").val(data.resource.content);
				$("#newLink").val(data.resource.link);
				$("#newPassword").val(data.resource.password);
				var updateButton = ' <button class="btn btn-sm btn-primary pull-right m-t-n-xs" onclick="updateResource(' + data.resource.id + ',\'' + data.resource.title + '\',null)" type="button"><strong>提交</strong></button>'
				$("#update").html(updateButton);
			} else if (data.status == 0) {
				swal("查询失败", "不存在该类别信息", "error");
			}
		},
		error : function() {
			swal("查询错误", "请重新操作", "error");
		}
	});

};

//设置 字数不超过宽度限制
var operateOpinionFormatter = function(value, row, index) {
	var title = "";
	var resoureNameLow = $(".search .form-control").val().toLowerCase();
	var resoureName = $(".search .form-control").val();
	var strStartIndex = "";
	var strEndIndex = "";
	if (value.search(resoureName) != -1 || value.toLowerCase().search(resoureNameLow) != -1) {
		var strs = new Array();
		strs = value.split("");
		strStartIndex = value.indexOf(resoureName);
		strEndIndex = strStartIndex + resoureName.length - 1;
		if (value.toLowerCase().search(resoureNameLow) != -1) {
			strStartIndex = value.toLowerCase().indexOf(resoureNameLow);
			strEndIndex = strStartIndex + resoureNameLow.length - 1;
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
	if (value.length > 15) {
		var num = strEndIndex - strStartIndex;
		var index = strStartIndex - 4;
		if (index < 0) {
			index = 0;
		}
		if (resoureName == "") {
			return "<a href='" + row.link + "'><span  title='密码:" + row.password + "'>" + title.substring(0, 150) + "..." + "</span></a>";
		} else {
			return "<a href='" + row.link + "'><span  title='密码:" + row.password + "'>" + title.substring(15 * index, (15 * index) + (num + 1) * 51 + (9 - num) * 15) + "..." + "</span></a>";
		}
	} else {
		return "<a href='" + row.link + "'><span  title='密码:" + row.password + "'>" + title.substring(0, title.length) + "</span></a>";
	}
}

//设置 字数不超过宽度限制
var operateOpinionFormatterContent = function(value, row, index) {
	var title = "";
	var resoureNameLow = $(".search .form-control").val().toLowerCase();
	var resoureName = $(".search .form-control").val();
	var strStartIndex = "";
	var strEndIndex = "";
	if (value.search(resoureName) != -1 || value.toLowerCase().search(resoureNameLow) != -1) {
		var strs = new Array();
		strs = value.split("");
		strStartIndex = value.indexOf(resoureName);
		strEndIndex = strStartIndex + resoureName.length - 1;
		if (value.toLowerCase().search(resoureNameLow) != -1) {
			strStartIndex = value.toLowerCase().indexOf(resoureNameLow);
			strEndIndex = strStartIndex + resoureNameLow.length - 1;
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
	if (value.length > 15) {
		var num = strEndIndex - strStartIndex;
		var index = strStartIndex - 4;
		if (index < 0) {
			index = 0;
		}
		if (resoureName == "") {
			return "<span title='" + value + "'>" + title.substring(0, 150) + "..." + "</span>";
		} else {
			return "<span title='" + value + "'>" + title.substring(15 * index, (15 * index) + (num + 1) * 51 + (9 - num) * 15) + "..." + "</span>";
		}
	} else {
		return "<span  title='" + value + "'>" + title.substring(0, title.length) + "</span>";
	}
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



var updateResource = function(id, title, status) {
	var params = {
		'id' : id,
		'title' : $("#newTitle").val(),
		'content' : $("#newContent").val().replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, "&quot;").replace(/'/g, "&#039;"),
		'link' : $("#newLink").val().replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, "&quot;").replace(/'/g, "&#039;"),
		'password' : $("#newPassword").val(),
		prarm : '更新了资源<span class="text-info">#' + $("#newTitle").val().replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, "&quot;").replace(/'/g, "&#039;") + '#</span>',
	};
	if (status != null && status != "") {
		var p = '将资源<span class="text-info">#' + title + '#</span>上架';
		if (status == -1) {
			p = '将资源<span class="text-info">#' + title + '#</span>下架';
		}
		params = {
			'id' : id,
			'status' : status,
			prarm : p,
		};
	}
	$.ajax({
		url : '../updateResource',
		type : 'post',
		data : params,
		dataType : 'json',
		success : function(data) {
			if (data.status == 200) {
				initResourceCount();
				$("#modal-form").modal('hide');
				$("#allResource").bootstrapTable('refresh');
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

var deleteResource = function(id, title) {
	var params = {
		'id' : id,
		prarm : '删除的资源为<span class="text-info">#' + title + '#</span>'
	};
	swal({
		title : "确定要删除该资源吗",
		text : "删除后将无法恢复，请谨慎操作！",
		type : "warning",
		showCancelButton : true,
		confirmButtonColor : "#DD6B55",
		confirmButtonText : "删除",
		closeOnConfirm : false
	}, function() {

		$.ajax({
			url : '../deleteResource',
			type : 'post',
			data : params,
			dataType : 'json',
			success : function(data) {
				if (data.status == 200) {
					$("#allResource").bootstrapTable('refresh');
					initResourceCount();
					swal("删除成功！", "", "success");
				} else {
					swal("删除失败", "请重新操作", "error");
				}
			},
			error : function() {
				swal("删除错误", "请重新操作", "error");
			}
		});
	});


};

//只有验证通过才能执行 添加
$("#addResource").click(function() {
	if ($("#commentForm").valid()) {
		addResource();
	}
});

var addResource = function() {
	var params = {
		title : $("#title").val(),
		content : $("#content").val().replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, "&quot;").replace(/'/g, "&#039;"),
		link : $("#link").val().replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, "&quot;").replace(/'/g, "&#039;"),
		password : $("#password").val(),
		prarm : '新增的资源名称为<span class="text-info">#' + $("#title").val().replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, "&quot;").replace(/'/g, "&#039;") + '#</span>',
	};
	$.ajax({
		url : '../addResource',
		type : 'post',
		data : params,
		dataType : 'json',
		success : function(data) {
			if (data.status == 200) {
				$("#allResource").bootstrapTable('refresh');
				initResourceCount();
				$("#title").val("");
				$("#content").val("");
				$("#link").val("");
				$("#password").val("");
				swal("添加成功", "", "success");
			}
		},
		error : function() {
			swal("添加资源错误", "请重新操作", "error");
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