/**
 * 
 */
var globalCount = 0;
$(".top").click(function(){
    $('body,html').animate({scrollTop:0},1000);
    return false;
});
		for (var i = 1; i <= 7; i++) {
			if (i == 1) {
				$(".a1 a").addClass("nav_color");
			} else {
				$('.a' + i + ' a').removeClass("nav_color");
			}
		}
		var pageNext = 1;
		var count = 1;
		var isEnd = false;
		var width = window.innerWidth || document.documentElement.clientWidth;
		if (width < 660) {
			var pagenav = '<p style="text-align:center;margin:-5px auto 20px;"><a href="javascript:void(0);" onclick="initBlogByClickMore()"><i class="fa fa-arrow-down"></i> 加载更多</a></p>';
			$(".pageMin").html(pagenav);
			$(".top").css("display", "none");
		}
		$(window).scroll(
				function() {
					if (isEnd == true) {
						return;
					}
					if ($(document).scrollTop() > 110 && count == 1) {
						$(".dj").css("display", "block");
						initBlogByClick(); //初始化点击排行5篇文章
						count++;
					}
					if ($(document).scrollTop() > 450 && count == 2) {
						$(".newblogs").css("display", "block");
						initBlogByNew(1); //初始化最新5篇文章
						count++;
					}
					if ($(document).scrollTop() > 850 && count == 3) {
						$(".git").css("display", "block");
						count++;
					}
					if ($(document).scrollTop() > 1070 && count == 4) {
						$(".weixin").css("display", "block");
						count++;
					}
					if ($(document).scrollTop() > 1350 && count == 5) {
						$(".link").css("display", "block");
						initAllLinks(); //初始化所有已上架友链
						count++;
					}
					if ($(document).scrollTop() > 1450 && width > 700) {
						$(".top").addClass('cd-is-visible fadeIn');
					} else {
						$(".top").removeClass('cd-is-visible fadeOut');
					}
					if ($(document).scrollTop() > 1900 && width > 700) {
						$(".guanzhu").css("display","block");
					} else {
						$(".guanzhu").css("display","none");
					}
					if ($(document).scrollTop() + 100 >= $(document).height()
							- $(window).height()
							&& width > 700) {
						isEnd = true;
						$('.page').css('display', 'block');
						setTimeout(function() {
							initBlogByNew(pageNext);
						}, 500);
					} else {
						$('.page').css('display', 'none');
					}
				});

		window.onload = function() {
			var oH2 = document.getElementsByTagName("h2")[0];
			var oUl = document.getElementsByTagName("ul")[0];
			oH2.onclick = function() {
				var style = oUl.style;
				style.display = style.display == "block" ? "none" : "block";
				oH2.className = style.display == "block" ? "open" : ""
			}
		}
		$(document).ready(function() {
			initBlogByTop(); //初始化置顶的3篇文章
			initBlogByLike(); //初始化特别推荐6篇文章
		});

		var initBlogByClickMore = function() {
			setTimeout(function() {
				initBlogByNew(pageNext);
			}, 200);
		}

		var returnAllCount = function() {
			if (globalCount == 2) {
				setTimeout(function() {
					$('article').css('opacity', '1');
				}, 200);
			}
		}

		var initBlogByTop = function() {
			//设置参数
			var params = {
				pageSize : 3,
				page : 1,
				istop : 1, //1 表示置顶
				status : 1
			};
			$.ajax({
						url : 'selectGroupLikeBlogListByPage',
						type : 'get',
						data : params,
						dataType : 'json',
						success : function(data) {
							var topBlog = '';
							var data = data.blogList;
							for (var i = 0; i < data.length; i++) {
								var id = data[i].id.toString(8) * data[i].id;
								topBlog += '<li class="animated fadeIn"><a href="find/'+id+'.html" onclick=""><img style="width:415px;height:155px;" src="'+data[i].images+'"></a><span>'
										+ data[i].title + '</span></li>'
							}
							// 初始化数据
							$(".pics").find("ul").html(topBlog);
							globalCount++;
							returnAllCount();
						},
						error : function() {
							layer.msg('请求太快，请稍后再试！', {
								icon : 5
							});
						}
					});
		};

		//初始化推荐
		var initBlogByLike = function() {
			//设置参数
			var params = {
				pageSize : 6,
				page : 1,
				isrecommend : 1, //1 表示推荐
				status : 1
			};
			$.ajax({
						url : 'selectGroupLikeBlogListByPage',
						type : 'get',
						data : params,
						dataType : 'json',
						success : function(data) {
							var likeBlog = '';
							var data = data.blogList;
							for (var i = 0; i < data.length; i++) {
								var id = data[i].id.toString(8) * data[i].id;
								var time = i * 0.05;
								likeBlog += '<li style="animation-delay:0.'+i+'s" class="animated fadeIn"><a href="find/'+id+'.html" ><div class="tpic"><img src="'+data[i].images+'"></div><b>'
										+ data[i].title
										+ '</b><span>'
										+ data[i].introduction
										+ '</span><a href="find/'+id+'.html" class="readmore">阅读原文</a></a></li>'
							}
							// 初始化数据
							$(".tuijian").find("ul").html(likeBlog);
							globalCount++;
							returnAllCount();
						},
						error : function() {
							layer.msg('请求太快，请稍后再试！', {
								icon : 5
							});
						}
					});
		};

		//初始化最新文章
		var initBlogByNew = function(page) {
			//设置参数
			var params = {
				pageSize : 5,
				page : page,
				status : 1
			};
			$
					.ajax({
						url : 'selectGroupLikeBlogListByPage',
						type : 'get',
						data : params,
						dataType : 'json',
						success : function(dataAll) {
							var newBlog = '';
							var parm = "";
							var arr = new Array();
							var data = dataAll.blogList;
							var page = dataAll.pageInfo;
							for (var i = 0; i < data.length; i++) {
								arr[i] = data[i].id;
								parm += data[i].id + ",";
								var id = data[i].id.toString(8) * data[i].id;
								var keyword = "";
								if (data[i].keyword != ""
										&& data[i].keyword != null) {
									if (data[i].keyword.search(';') != -1) {
										keyword = data[i].keyword.replace(/;/g,
												"|");
									} else {
										keyword = data[i].keyword;
									}
								}
								newBlog += '<li style="animation-delay:0.'+i+'s" class="animated fadeInDown"><h3 class="blogtitle"><a href="find/'+id+'.html"  >'
										+ data[i].title
										+ '</a></h3><div class="bloginfo"><span class="blogpic"><a href="find/'+id+'.html" title=""><img src="'+data[i].images+'"  /></a></span><p>'
										+ data[i].introduction
										+ '</p></div><div class="autor"><span style="float:left;padding:0;color: #38485a"><i class="fa fa-user" style="color: #88827dcc;"></i>&nbsp;罗廷方</span><span class="lm f_l"><a href="javascript:void(0);">'
										+ keyword
										+ '</a></span><span class="dtime f_l">'
										+ Format(data[i].addtime, "yyyy-MM-dd")
										+ '</span><span class="viewnum f_l">浏览<b>（<a href="javascript:void(0);">'
										+ data[i].clicknum
										+ '</a></b>）</span><span class="pingl f_l">评论（<b><a class='
										+ data[i].id
										+ ' href="javascript:void(0);">'
										+ data[i].commentnum
										+ '</a></b>）</span><span class="f_r"><a href="find/'+id+'.html" class="more">阅读原文>></a></span></div></li>'
							}
							var p = {
								client_id : 'cytzg9rLH',
								topic_source_id : parm
							};
							$
									.ajax({
										url : 'http://changyan.sohu.com/api/2/topic/count',
										type : 'get',
										data : p,
										dataType : 'jsonp',
										success : function(pl) {
											for (var i = 0; i < arr.length; i++) {
												$('.' + arr[i])
														.html(
																pl.result[arr[i]].comments);
											}
										},
										error : function() {
											layer.msg('出错啦', {
												icon : 2
											});
										}
									});
							// 初始化数据
							if (page.pageNum >= 2) {
								$(".newblogs").find("ul").append(newBlog);
							} else {
								$(".newblogs").find("ul").html(newBlog);
							}
							if (page.total > 5) {
								var pagenav = '';
								if (page.pageNum == page.pages) {
									isEnd = true;
									pagenav = '<p style="text-align:center;margin:-5px auto 10px;"><a href="javascript:void(0);" onclick="window.scrollTo(0,0)"><i class="fa fa-arrow-up"></i> 没有更多了</a></p>';
									if (width < 660) {
										$(".pageMin").html(pagenav);
									}
								} else {
									isEnd = false;
									pageNext = page.pageNum + 1;
									pagenav = '<div style="margin:-5px auto 10px;text-align:center;"><div class="loader-inner ball-pulse"><div></div><div></div><div></div></div></div>';
								}
								$(".page").html(pagenav);
							} else {
								$(".page").html("");
							}

						},
						error : function() {
							layer.msg('请求太快，请稍后再试！', {
								icon : 5
							});
						}
					});
		};

		//初始化点击排行
		var initBlogByClick = function() {
			//设置参数
			var params = {
				pageSize : 5,
				page : 1,
				sort : "clickNum", //按点击量排序,默认按时间
				status : 1,
			};
			$
					.ajax({
						url : 'selectGroupLikeBlogListByPage',
						type : 'get',
						data : params,
						dataType : 'json',
						success : function(data) {
							var clickBlog = '';
							var data = data.blogList;
							var time = '';
							for (var i = 0; i < data.length; i++) {
								if (data[i].introduction.length > 26) {
									data[i].introduction = data[i].introduction
											.substring(0, 26)
											+ "...";
								}
								var id = data[i].id.toString(8) * data[i].id;
								time = i * 0.05;
								clickBlog += '<li style="animation-delay:0.'+i+'s" class="animated fadeIn"><b><a href="find/'+id+'.html">'
										+ data[i].title
										+ '</a></b><p><i><img src="'+data[i].images+'"></i>'
										+ data[i].introduction + '</p></li>'
							}
							// 初始化数据
							$(".paihang").find("ul").html(clickBlog);
						},
						error : function() {
							layer.msg('请求太快，请稍后再试！', {
								icon : 5
							});
						}
					});
		};

		var initAllLinks = function() {

			$.ajax({
						url : 'selectAllLinks',
						type : 'get',
						data : "",
						dataType : 'json',
						success : function(data) {
							var linksAll = '';
							var data = data.linksList;
							var time = '';
							for (var i = 0; i < data.length; i++) {
								time = i * 0.05;
								linksAll += '<li style="animation-delay:0.'
										+ i
										+ 's;float:left;margin: 0 1% 10px 0;padding:3px;" class="animated fadeIn"><a href="'
										+ data[i].link
										+ '" target= "_blank" onclick="clickNum('
										+ data[i].id + ')">' + data[i].name
										+ '</a></li>';
							}
							// 初始化数据
							$(".link").find("ul").html(linksAll);
							time = time + 0.1;
							var msg = '<h5 style="animation-delay:'+time+'s" class="animated fadeIn" title="QQ:849673404">注：添加友链,请点击&nbsp;&nbsp;&nbsp;<a class="applyLinks" onclick="applyLinks()" href="javascript:void(0);" style="font-size:13px;color:#f8ac59">申请友链</a></h5>';
							$(".msg").find("a").html(msg);
						},
						error : function() {
							layer.msg('请求太快，请稍后再试！', {
								icon : 5
							});
						}
					});
		}
	
		var applyLinks=function(){
			swal({
				 title:'互换友链',
				 text: '注意：请在您的网站友链处添加本站链接后再行申请！！！！！！添加格式如下：名称&网站首页地址',
				 type:'input',
				 showCancelButton: true,
	             confirmButtonColor: "#1c84c6",
	             confirmButtonText: "提交",
	             closeOnConfirm: false
				},function(){
					//swal("删除成功！", "您已经永久删除了这条信息。", "success");
					checkLinks();			
			});
		}
		
		var checkLinks=function(){
			var inputLink=new Array();
			inputLink=$("fieldset").find("input").val().split("&");
			var title='';
			var text='';
			var type='';
			if(inputLink.length!=2){
				title='格式错误',
				text='请检查格式是否正确',
				type='error'
			}else{
				title='请核对信息',
				text='名称：'+inputLink[0].replace(/</g,'&lt;').replace(/>/g,'&gt;').replace(/"/g, "&quot;").replace(/'/g, "&#039;")+"   。"+'链接：'+inputLink[1].replace(/</g,'&lt;').replace(/>/g,'&gt;').replace(/"/g, "&quot;").replace(/'/g, "&#039;"),
				type='warning'
			 }
				swal({
				 title: title,
				 text: text,
				 type: type,
				 showCancelButton: true,
	             confirmButtonColor: "#1c84c6",
	             confirmButtonText: "确定",
	             closeOnConfirm: false
				},function(){
					if(type=='warning'){
					addLinks(inputLink[0],inputLink[1]);
					}
				   });
	            };
	      var addLinks=function(name,link){
	    		var params ={
	        			name:name,
	        			link:link,
	        			sort:0,
	        			isapply:-1,
	        			prarm:'有新伙伴申请友链啦！',
	        	};
	             $.ajax({
	                   url:'addLinks',    
	                   type:'post',
	                   data:params,
	                   dataType:'json',    
	                   success:function (data) { 
	                    if(data.status==200){
	                    	swal("申请成功", "等待管理审核", "success");
	                     }	
	                    },    
	        		    error:function(){
	        		    	swal("申请失败", "请检查格式是否正确", "error");
	        		    }	
	                }); 
	      }
	            
	            
		//更新链接点击次数
		var clickNum = function(id) {
			var params = {
				id : id,
			};
			$.ajax({
				url : 'selectLinksById',
				type : 'post',
				data : params,
				dataType : 'json',
				success : function(data) {
				},
				error : function() {
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
				"S" : datetime.getMilliseconds()
			//毫秒   
			};
			if (/(y+)/.test(fmt))
				fmt = fmt.replace(RegExp.$1, (datetime.getFullYear() + "")
						.substr(4 - RegExp.$1.length));
			for ( var k in o)
				if (new RegExp("(" + k + ")").test(fmt))
					fmt = fmt.replace(RegExp.$1,
							(RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k])
									.substr(("" + o[k]).length)));
			return fmt;
		}