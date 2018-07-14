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
	//参数1表示当前页为1
	initBlog(1);

});

var returnAllCount = function() {
	if (globalCount == 1) {
		setTimeout(function() {
			$('#fakeloader').css('display', 'none');
		}, 500);
	}
}

var initBlog = function(pageNum) {
	//查询出文章
	//获取关键字，表示查询所有符合的记录
	var params = {
		pageSize : 9,
		page : pageNum,
		title : $(".form-control").val().replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, "&quot;").replace(/'/g, "&#039;"),
		keyword : $(".form-control").val().replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, "&quot;").replace(/'/g, "&#039;"),
		status : 1 //1 表示已发布
	};
	$.ajax({
		url : '../selectGroupLikeBlogListByPage',
		type : 'post',
		data : params,
		dataType : 'json',
		success : function(data) {
			var blogList = '';
			var page = data.pageInfo;
			var data = data.blogList;
			var circle = new Array("text-navy", "text-danger", " text-info", "text-primary", "text-warning");
			for (var i = 0; i < data.length; i++) {
				var time = 0.03 * i;
				blogList += '<li class="animated fadeInDown" style="margin: 0 0 5px 0;animation-delay:' + time + 's""><a href="javascript:void(0);" style="padding: 0;" onclick="findBlogById(' + data[i].id + ')"> <i style="width:14px;height: 15px;" class="fa ' + circle[i % 5] + ' fa-circle "></i> ' + data[i].title + '</a></li>';
			}
			if (page.pageNum >= 2) {
				$(".category-list").append(blogList);
			} else {
				$(".category-list").html(blogList);
				findBlogById(data[0].id);
				$(".allTotal").find("b").html(page.total);
				$(".allPage").find("b").html(page.pages);
			}
			var nextPage = page.pageNum + 1;
			var more = '<p style="text-align:center"><a onclick="pageNav(' + nextPage + ',' + page.pages + ')"><i class="fa fa-arrow-down"></i> 加载更多</a></p>';
			if (page.pageNum == page.pages) {
				more = '<p style="text-align:center"><a href="javascript:void(0);" onclick="window.scrollTo(0,0)"><i class="fa fa-arrow-up"></i> 没有更多了</a></p>';
			}
			$(".pageNav").html(more);
			$(".cPage").find("b").html(page.pageNum);

		},
		error : function() {
			swal("您的请求太快", "请重新操作", "error");
		}
	});
	globalCount++;
	returnAllCount();
};

var pageNav = function(pageNum, allPage) {
	if (pageNum <= 0) {
		swal("查询失败", "当前为第1页", "error");
	} else if (pageNum > allPage) {
		swal("查询失败", "当前为最后一页", "error");
	} else {
		initBlog(pageNum);
	}
}

var findBlogByKey = function() {
	if ($(".form-group").find(".form-control").val() != "") {
		initBlog(1);
	}

}


var findBlogById = function(id) {
	var params = {
		id : id
	};
	$.ajax({
		url : '../selectBlogById',
		type : 'post',
		data : params,
		dataType : 'json',
		success : function(data) {
			//初始化右边详情内容
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
			$('pre').each(function(i, block) {
				hljs.highlightBlock(block);
			});
		},
		error : function() {
			swal("初始化内容失败", "请重新操作", "error");
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