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
}, 300);

$(document).ready(function() {
	var url = window.location.href;
	var url_param = url.split("=")[1];
	//编辑博客
	var param = {
		id : url_param
	}
	$.ajax({
		url : '../selectBlogById',
		type : 'post',
		data : param,
		dataType : 'json',
		success : function(data) {
			//查询成功
			if (data.status == 200) {
				$("#title").val(data.blog.title);
				$("#introduction").val(data.blog.introduction);
				$("#summernote").code(data.blog.content);
				$("#keyword").val(data.blog.keyword);
				var imgPath = '<img class="picPath animated fadeInRight"  style="width:100%" alt="封面" title="点击更换封面" src="' + data.blog.images + '" />';
				$(".imagePath").val(data.blog.images);
				$(".picPath").html(imgPath)
				//加载编辑页面预览的  时间和浏览量
				$(".newsview").find(".au02").html(Format(data.blog.addtime, "yyyy-MM-dd hh:mm:ss"));
				$(".au03").find('b').html(data.blog.clicknum);

				$("#clicknum").html(data.blog.clicknum);

				var istop = '否';
				if (data.blog.istop == 1) {
					istop = '是';
				}
				var isrecommend = '否';
				if (data.blog.isrecommend == 1) {
					isrecommend = '是';
				}
				$("#istop").html(istop);
				$("#isrecommend").html(isrecommend);
				var typeName = '';
				typeName += '<option style="color:#000;font-weight:bold;" value="' + data.blog.type.id + '">' + data.blog.type.typename + '</option>';
				$(".form-horizontal").find('select[name=typeName]').append(typeName);
			}
		},
		error : function() {
			swal("查询错误", "请重试操作", "error");
		}
	});

	var p = {
		client_id : 'cytzg9rLH',
		topic_source_id : url_param
	};
	$.ajax({
		url : 'http://changyan.sohu.com/api/2/topic/count',
		type : 'get',
		data : p,
		dataType : 'jsonp',
		success : function(pl) {
			$("#commentnum").html(pl.result[url_param].comments);
		},
		error : function() {
			swal("获取评论数错误", "请重试操作", "error");
		}
	});
	//查询出文章类别
	//设置参数，表示查询所有的类别
	var params = {
		"data" : "all"
	};
	$.ajax({
		url : '../selectBlogType',
		type : 'post',
		data : params,
		dataType : 'json',
		success : function(data) {
			var typeName = '';
			for (var i = 0; i < data.length; i++) {
				typeName += '<option value="' + data[i].id + '">' + data[i].typename + '</option>';
			}
			// 初始化数据
			$(".form-horizontal").find('select[name=typeName]').append(typeName);
		},
		error : function() {
			swal("加载类别错误", "请重试操作", "error");
		}
	});
	//初始化富文本
	$('#summernote').summernote({
		height : 400, //初始化默认高度    
		minHeight : null, //最小高度             
		maxHeight : null, //最大高度
		lang : 'zh-CN', //注意这里，若要设置语言，则需要引入该语言配置js
		placeholder : "请在这里写下您的内容",
		onImageUpload : function(files, editor, $editable) {
			sendFile(files[0], editor, $editable);
		}
	});
	globalCount++;
	returnAllCount();
});

var returnAllCount = function() {
	if (globalCount == 1) {
		setTimeout(function() {
			$('#fakeloader').css('display', 'none');
		}, 500);
	}
}

//图片上传  
function sendFile(file, editor, $editable) {
	var filename = false;
	try {
		filename = file['name'];
	} catch (e) {
		filename = false;
	}
	if (!filename) {
		$(".note-alarm").remove();
	}

	//以上防止在图片在编辑器内拖拽引发第二次上传导致的提示错误  
	data = new FormData();
	data.append("file", file);
	data.append("key", filename); //唯一性参数  
	$.ajax({
		data : data,
		type : "POST",
		url : "../uploadBlogImages",
		dataType : "json",
		cache : false,
		contentType : false,
		processData : false,
		success : function(date) {
			if (date == '') {
				swal("上传失败", "请重试操作", "error");
			} else {
				var path = '图片地址  ' + date.path;
				swal("上传成功", path, "success");
			}
			editor.insertImage($editable, date.path);
		},
		error : function() {
			swal("上传错误", "请重试操作", "error");
		}
	});
}


//弹出模态框 选择图片
var selectImgPath = function(img) {
	$("#pic").modal('hide');
	var imgPath = '<img class="picPath animated fadeInRight"  style="width:100%" alt="封面" title="点击更换封面" src="' + img.src + '" />';
	$(".picPath").html(imgPath)
	$(".imagePath").val(img.src);
};

//查找服务器图库
var findPicList = function() {
	$.ajax({
		//此处使用的是自己封装的JAVA类
		url : "../getFileList",
		type : "POST",
		success : function(data) {
			if (data.status == 0) {
				swal("服务器图库为空", "请上传", "error");
			} else {
				var pics = '';
				for (var i = 0; i < data.fileList.length; i++) {
					pics += '<a class="fancybox" href="javascript:void(0);"><img onclick="selectImgPath(this)" style="width: 190px; height: 115px;float:left;margin-right:3px;" alt="image" src="' + data.fileList[i] + '" /></a>'
				}
			}
			$(".picsList").html(pics);
		},
		error : function(e) {
			swal("获取图片错误", "请检查接口服务", "error");
		}
	});
};




var prevBlog = function() {
	$(".newsview").find(".news_title").html($("#title").val());
	$(".news_about").find(".news_intr").html($("#introduction").val());

	var keyword = '';
	var inputKeyword = $("#keyword").val();
	$(".newsview").find(".tags").html("");
	if (inputKeyword != '' && inputKeyword != null) {
		if (inputKeyword.search(';') != -1 || inputKeyword.search('；') != -1) {
			if (inputKeyword.search('；') != -1) {
				inputKeyword = inputKeyword.replace(/；/g, ";");
			}
			var strs = new Array();
			strs = inputKeyword.split(";");
			for (var i = 0; i < strs.length && strs[i] != ''; i++) {
				keyword += '<a href="#">' + strs[i] + '</a>';
			}
		} else {
			keyword = '<a href="#">' + inputKeyword + '</a>';
		}
	}
	$(".newsview").find(".tags").append(keyword);
	$(".newsview").find(".news_infos").html($("#summernote").code());
	var topNum = 1;
	$(".news_infos :header").each(function() {
		$(this).attr("id", 'nav1_' + topNum + '');
		topNum++;
	});
	var update = '<a  class="btn btn-white" href="#" onclick="updateBlog(1)">发表</a>';
	$(".modal-footer").find(".update").html(update);
	$('pre').each(function(i, block) {
		hljs.highlightBlock(block);
	});
}


var updateBlog = function(id) {
	var url = window.location.href;
	var url_param = url.split("=")[1];
	var prarm = '将ID为<span class="text-info">' + url_param + '</span>的博客<span class="text-success">发表</span>';
	if (id == -1) {
		prarm = '将ID为<span class="text-info">' + url_param + '</span>的博客放入<span class="text-navy">草稿箱</span>';
	}
	var params = {
		'id' : url_param,
		'title' : $("#title").val().replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, "&quot;").replace(/'/g, "&#039;"),
		'introduction' : $("#introduction").val().replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, "&quot;").replace(/'/g, "&#039;"),
		'type.id' : $("#typeName").val(),
		'images' : $(".imagePath").val(),
		'keyword' : $("#keyword").val().replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, "&quot;").replace(/'/g, "&#039;"),
		'content' : $(".news_infos").html(),
		'status' : id,
		prarm : prarm
	};
	$.ajax({
		url : '../updateBlog',
		type : 'post',
		data : params,
		dataType : 'json',
		success : function(data) {
			if (data.status == 200) {
				$("#myModal").modal('hide');
				var title = "更新成功";
				var text = "博客已在前端展示";
				if (id == -1) {
					title = "放入草稿成功";
					text = "你可以前往草稿箱查看";
				}
				swal({
					title : title,
					text : text,
					type : "success",
					timer : 1500,
				});
				setTimeout(function() {
					window.location.href = "../blog/blogTable.jsp";
				}, 1500);
			} else {
				swal("更新失败", "请重新操作", "error");
			}
		},
		error : function() {
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

//只有验证通过才能执行 添加
$("#add_draft,#add_draft2").click(function() {
	if ($("#commentForm").valid()) {
		updateBlog(-1);
	}
});

//只有验证通过才能执行 预览
$("#prev1").click(function() {
	if ($("#commentForm").valid()) {
		$("#prev2").click();
	}
});