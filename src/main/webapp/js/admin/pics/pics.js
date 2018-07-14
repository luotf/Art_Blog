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
	$('.fancybox').fancybox({
		openEffect : 'none',
		closeEffect : 'none'
	});

	common_getPicFileList();

});
var returnAllCount = function() {
	if (globalCount == 1) {
		setTimeout(function() {
			$('#fakeloader').css('display', 'none');
		}, 500);
	}
}

var common_getPicFileList = function() {
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
					pics += '<a class="fancybox" href="' + data.fileList[i] + '"><img style="width: 254px; height: 143px;margin-right:5px;" alt="image" src="' + data.fileList[i] + '" /></a>'
				}
			}
			$(".pics").html(pics);

		},
		error : function(e) {
			swal("获取图片错误", "请检查接口服务", "error");
		}
	});
	globalCount++;
	returnAllCount();
}