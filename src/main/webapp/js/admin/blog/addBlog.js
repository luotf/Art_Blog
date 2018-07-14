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
	initBlogCountBystatus();
	initBlogType();
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
});

var returnAllCount = function() {
	if (globalCount == 2) {
		setTimeout(function() {
			$('#fakeloader').css('display', 'none');
		}, 500);
	}
}

var initBlogType = function() {
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
			$(".form-horizontal").find(
				'select[name=typeName]')
				.html("");
			var typeName = '';
			var typeNameAndNum = '';
			var circle = new Array("text-navy",
				"text-danger",
				" text-info",
				"text-primary",
				"text-warning");
			var label = new Array(
				"label-primary",
				"label-danger",
				" label-info",
				"label-success",
				"label-warning");
			for (var i = 0; i < data.length; i++) {
				typeName += '<option value="' + data[i].id + '">'
					+ data[i].typename
					+ '</option>';
				typeNameAndNum += '<li><a href="javascript:void(0);"> <i class="fa fa-circle '
					+ circle[i % 5]
					+ '"></i> '
					+ data[i].typename
					+ '<span class="label '
					+ label[i % 5]
					+ ' pull-right">'
					+ data[i].num
					+ ' 篇</span></a></li>'
			}
			// 初始化数据
			$(".form-horizontal").find(
				'select[name=typeName]')
				.append(typeName);
			$(".category-list").html(
				typeNameAndNum);
		},
		error : function() {
			swal("初始化类别错误", "请重新操作", "error");
		}
	});
	globalCount++;
	returnAllCount();
}


var initBlogCountBystatus = function() {
	//初始化博客数目
	$.ajax({
		url : '../selectBlogListByStatus',
		type : 'post',
		dataType : 'json',
		success : function(data) {
			for (var i = 0; i < data.list.length; i++) {
				if (data.list[i].status == -1) {
					$(".s-2").html(
						data.list[i].count + '篇');
				} else if (data.list[i].status == 1) {
					$(".s-1").html(
						data.list[i].count + '篇');
				} else if (data.list[i].status == 2) {
					$(".s-3").html(
						data.list[i].count + '篇');
				}
			}
		},
		error : function() {
			swal("初始化博客状态错误", "请重新操作", "error");
		}
	});
	globalCount++;
	returnAllCount();
};

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
	var imgPath = '<img class="picPath animated fadeInRight"  style="width: 190px; height: 115px;" alt="封面" title="点击更换封面" src="' + img.src + '" />';
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
				keyword += '<a href="javascript:void(0);">' + strs[i] + '</a>';
			}
		} else {
			keyword = '<a href="javascript:void(0);">' + inputKeyword + '</a>';
		}
	}
	$(".newsview").find(".tags").append(keyword);
	$(".newsview").find(".news_infos").html($("#summernote").code());
	var topNum = 1;
	$(".news_infos :header").each(function() {
		$(this).attr("id", 'nav1_' + topNum + '');
		topNum++;
	});
	var add = '<a  class="btn btn-white" href="javascript:void(0);" onclick="addBlog(1)">发表</a>';
	$(".modal-footer").find(".add").html(add);
	$('pre').each(function(i, block) {
		hljs.highlightBlock(block);
	});

};

var addBlog = function(id) {
	var prarm = '新增了一篇博客';
	if (id == -1) {
		prarm = '将博客放入<span class="text-navy">草稿箱</span>';
	}
	var params = {
		'title' : $("#title").val().replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, "&quot;").replace(/'/g, "&#039;"),
		'introduction' : $("#introduction").val().replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, "&quot;").replace(/'/g, "&#039;"),
		'type.id' : $("#typeName").val(),
		'keyword' : $("#keyword").val().replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, "&quot;").replace(/'/g, "&#039;"),
		'content' : $(".news_infos").html(),
		'images' : $(".imagePath").val(),
		prarm : prarm,
		'status' : id
	};
	$.ajax({
		url : "../addBlog",
		type : "POST",
		data : params,
		dataType : 'json',
		success : function(data) {
			if (data.status == 200) {
				initBlogCountBystatus();
				initBlogType();
				$("#myModal").modal('hide');
				if (id == 1) {
					swal("发布成功", "博客已在前端展示", "success");
				} else if (id == -1) {
					swal("放入草稿成功", "你可以前往草稿箱查看", "success");
				}
				$("#summernote").code()
				$("#title").val("");
				$("#introduction").val("");
				$("#keyword").val("");
				$("#summernote").code("");
			} else {
				if (id == 1) {
					swal("发布失败", "请重新操作", "error");
				} else if (id == -1) {
					swal("放入草稿失败", "请重新操作", "error");
				}
			}
		},
		error : function() {
			if (id == 1) {
				swal("发布错误", "请重新操作", "error");
			} else if (id == -1) {
				swal("放入草稿错误", "请重新操作", "error");
			}
		}
	});
};

//只有验证通过才能执行 添加
$("#add_draft,#add_draft2").click(function() {
	if ($("#commentForm").valid()) {
		addBlog(-1);
	}
});

//只有验证通过才能执行 预览
$("#prev1").click(function() {
	if ($("#commentForm").valid()) {
		$("#prev2").click();
	}
});