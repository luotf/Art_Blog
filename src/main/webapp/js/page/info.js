var globalCount = 0;
$(".top").click(function(){
    $('body,html').animate({scrollTop:0},1000);
    return false;
});

			$(function(){  
		        //查找h1-h6  
		        var i=1;
		        var navToc="";
		        var navToc="";
		        $(".news_infos :header").each(function(){
		        	navToc+='<li class="nav-item nav-level-4" id="#nav1_'+i+'"><a class="nav-link" ><span class="nav-number">'+i+'.</span> <span class="nav-text">'+$(this).text()+'</span></a></li>';
		        	$("#nav1_"+i).css({'border-left':'5px solid #FF926F','background-color':' #f6f6f6',padding:'7px 20px'});
		        	i++;
		        });  
		        $(".nav1").html(navToc);
		    }); 
	var count=1;		
	var width = window.innerWidth || document.documentElement.clientWidth; 
			(function(){ 
			var appid = 'cytzg9rLH'; 
			var conf = 'prod_230eb23e872ad7a4302e5802e6f91bf9'; 
			if (width < 960) { 
			window.document.write('<script id="changyan_mobile_js" charset="utf-8" type="text/javascript" src="https://changyan.sohu.com/upload/mobile/wap-js/changyan_mobile.js?client_id=' + appid + '&conf=' + conf + '"><\/script>'); } else { var loadJs=function(d,a){var c=document.getElementsByTagName("head")[0]||document.head||document.documentElement;var b=document.createElement("script");b.setAttribute("type","text/javascript");b.setAttribute("charset","UTF-8");b.setAttribute("src",d);if(typeof a==="function"){if(window.attachEvent){b.onreadystatechange=function(){var e=b.readyState;if(e==="loaded"||e==="complete"){b.onreadystatechange=null;a()}}}else{b.onload=a}}c.appendChild(b)};loadJs("https://changyan.sohu.com/upload/changyan.js",function(){window.changyan.api.config({appid:appid,conf:conf})}); } })(); 
	
	if (width < 700) { 
		$(".tool-box").css("display","none");
	}
	$(window).scroll(function(){
		if($(document).scrollTop()>20&&count==1){
				$(".dj").css("display","block");
				initBlogByClick();
				count++;
		}
		if($(document).scrollTop()>1200&&width>700){
			$(".top").addClass('cd-is-visible fadeIn');
			$(".fixed-menu-list").css("display","block");
		}else{
			$(".top").removeClass('cd-is-visible fadeOut');
			$(".fixed-menu-list").css("display","none");
		}
	});
	

		$(document).ready(function() {
		  if($(".newsview h1").text() != "404"){
		    Format();
	      Tags();
	      selectPrevBlog();
	      selectNextBlog();
	      initBlogByRel();   //初始化相关文章
		  }
		  initBlogByLike();
			setTimeout(function () {
			$(".ds").css("opacity","1");
		 }, 1000);
			var topId=$(".nav-item");  /*获取目录点击区域*/  
			topId.click(function(){
					var topId=$(this).attr("id");
					 $('body,html').animate({scrollTop:$(topId).offset().top},800);
					 return false;
			});
		});
		var Tags=function() {
			var tag = $(".tag").val();
			var keyword = "";
			$(".newsview").find(".tags").html("");
			if (tag != '' && tag != null) {
				if (tag.search(';') != -1) {
					var strs = new Array();
					strs = tag.split(";");
					for (var i = 0; i < strs.length && strs[i] != ''; i++) {
						keyword += '<a href="#">' + strs[i] + '</a>';
					}
				} else {
					keyword = '<a href="#">' + tag + '</a>';
				}
			}
			$(".newsview").find(".tags").append(keyword);
		}

		var selectPrevBlog=function(){
			var id=$(".id").val();
			var params ={
					id:id-1
			};
			$.ajax({
	            url:'../selectPrevBlog',    
	            type:'get',
	            data:params,
	            dataType:'json',    
	            success:function (data) {
	            	var preTitle="";
		            	if(data.status==200){
		            	  var id=data.blog.id.toString(8)*data.blog.id;
		  	              preTitle='<a href="../find/'+id+'.html">'+data.blog.title+'</a>';
		            	}else{
		            	  preTitle='<span>无</span>';
		            	}
		            	$(".pre").html(preTitle);
	            	}, 
			    error:function(){
			    	layer.msg('加载的太快啦', {icon: 2});
			    }	
	        });
			
		};

		var selectNextBlog=function(){
			var vid=$(".id").val();
			var id=parseInt(vid)+1;
			var params ={
					id:id
			};
			$.ajax({
	            url:'../selectNextBlog',    
	            type:'get',
	            data:params,
	            dataType:'json',    
	            success:function (data) {
	            	var nextTitle='';
	            	if(data.status==200){
			            var sid=data.blog.id.toString(8)*data.blog.id;
			            nextTitle='<a href="../find/'+sid+'.html">'+data.blog.title+'</a>';
	            	}else{
	            		nextTitle='<span>无</span>';
	            	}
	            	    $(".next").html(nextTitle);
	            	}, 
			    error:function(){
			    	layer.msg('加载的太快啦', {icon: 2});
			    }	
	        });
			
		};
		
		//初始化相关文章
		var initBlogByRel=function(){
			var params ={
					 pageSize: 6,
			         page:1,
			         'type.id':$(".typeId").val(),
			};
			$.ajax({
	            url:'../selectGroupLikeBlogListByPage',    
	            type:'get',
	            data:params,
	            dataType:'json',    
	            success:function (data) {
	            	var relBlog='';
	            	var data=data.blogList;
	                for (var i = 0; i < data.length; i++) {
	                	var id=data[i].id.toString(8)*data[i].id;
	                	relBlog+='<li><i style="color:#5788aa" class="fa fa-paperclip"></i> <a href="'+id+'.html" title="'+data[i].title+'">'+data[i].title+'</a></li>'
	                }
	                // 初始化数据
	                $(".otherlink").find("ul").html(relBlog);
	            },    
			    error:function(){
			    	layer.msg('加载的太快啦', {icon: 2});
			    }	
	        });
		};
		
		//初始化推荐
		var initBlogByLike=function(){
			//设置参数
			var params ={
					 pageSize: 5,
			         page:1,
			         isrecommend:1  //1 表示推荐
			};
			$.ajax({
	            url:'../selectGroupLikeBlogListByPage',    
	            type:'get',
	            data:params,
	            dataType:'json',    
	            success:function (data) {
	            	var likeBlog='';
	            	var data=data.blogList;
	            	var time='';
	                for (var i = 0; i < data.length; i++) {
	                	
						var id = data[i].id.toString(8) * data[i].id;
						time = i * 0.05;
						likeBlog += '<li style="animation-delay:0.'+i+'s" class="animated fadeIn"><b><a href="../find/'+id+'.html">'
								+ data[i].title
								+ '</a></b><p><i><img src="'+data[i].images+'"></i><span>'
								+ data[i].introduction + '<span></p></li>'
					}
	                // 初始化数据
	                $(".paihang").find(".like").html(likeBlog);
	            },    
			    error:function(){
			    	layer.msg('加载的太快啦', {icon: 2});
			    }	
	        });
		};
		
		//初始化点击排行
		var initBlogByClick=function(){
			//设置参数
			var params ={
					 pageSize: 5,
			         page:1,
			         sort:"clickNum",   //按点击量排序,默认按时间
			};
			$.ajax({
	            url:'../selectGroupLikeBlogListByPage',    
	            type:'get',
	            data:params,
	            dataType:'json',    
	            success:function (data) {
	            	var clickBlog='';
	            	var data=data.blogList;
	            	var time='';
	                for (var i = 0; i < data.length; i++) {
	                	
						var id = data[i].id.toString(8) * data[i].id;
						time = i * 0.05;
						clickBlog += '<li style="animation-delay:0.'+i+'s" class="animated fadeIn"><b><a href="../find/'+id+'.html">'
								+ data[i].title
								+ '</a></b><p><i><img src="'+data[i].images+'"></i><span>'
								+ data[i].introduction + '</span></p></li>'
					}
	                // 初始化数据
	                $(".paihang").find(".click").html(clickBlog);
	            },    
			    error:function(){
			    	layer.msg('加载的太快啦', {icon: 2});
			    }	
	        });
		};
		
		
		//格式化时间
		var Format=function() {
			var datetime=$(".addtime").val();
			var month = new Array();
			month["Jan"] = '01';
			month["Feb"] = '02';
			month["Mar"] = '03';
			month["Apr"] = '04';
			month["May"] = '05';
			month["Jun"] = '06';
			month["Jul"] = '07';
			month["Aug"] = '08';
			month["Sep"] = '09';
			month["Oct"] = 10;
			month["Nov"] = 11;
			month["Dec"] = 12;
			var arr = new Array();
			arr = datetime.split(" ");
			var fmt = arr[5] + '-' + month[arr[1]] + '-' + arr[2];
			$(".au02").html(fmt);
		}