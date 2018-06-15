var globalCount = 0;
$(".top").click(function(){
    $('body,html').animate({scrollTop:0},1000);
    return false;
});
var pageNext=1;
	var isEnd=false;
	for(var i=1;i<=7;i++){
		if(i==4){
			$(".a4 a").addClass("nav_color");
		}else{
			$('.a'+i+' a').removeClass("nav_color");
		}
	}
	var width = window.innerWidth || document.documentElement.clientWidth; 
	if (width < 960) {
		var pagenav='<p style="text-align:center;margin:-5px auto 20px;"><a href="javascript:void(0);" onclick="initResourceByPage()"><i class="fa fa-arrow-down"></i> 加载更多</a></p>';
		$(".pageMin").html(pagenav);
	}else{
		$(window).scroll(function(){
	        if(isEnd == true){
	           return;
	       } 
	       if ($(document).scrollTop() + 50 >= $(document).height() - $(window).height()) {
	       	isEnd=true;
	       	$('.pagelist').css('display','block');
	       	setTimeout(function () {
	       		initResource(pageNext);
			},500); 
		   }
	   });
	}
	var initResourceByPage=function(){
		setTimeout(function () {
			initResource(pageNext);
		},100);
	}
	
	$(document).ready(function() {
		//初始化类别信息
		 initResource(1);
		 initBlogByLike();
	});
	var initResource=function(pageNum){
		var keyword=$("#keyword").val().replace(/</g,'&lt;').replace(/>/g,'&gt;').replace(/"/g, "&quot;").replace(/'/g, "&#039;");
		var prarm='';
		if(keyword=="请输入关键字"){
			keyword="";
			prarm='none'
		}else{
			prarm='搜索关键字为<span class="text-info">#'+keyword+'#</span>的资源'
		}
		 var params={
				 pageSize: 9,
		         page:pageNum,
   				 title:keyword,
   				 content:keyword,
   				 prarm:prarm,
   				 status:1    //1 表示已发布
   			 };
              	$.ajax({
	            url:'selectLikeResourceListByPage',    
	            type:'get',
	            data:params,
	            dataType:'json',    
	            success:function (date) {
	            	var resourceList='';
	            	var page=date.pageInfo;
	            	var data=date.resourceList;
	            	if(data.length>0){
	            		for (var i = 0; i < data.length; i++) {
	            			var time=i*0.05;
	            			resourceList+='<div style="animation-delay:'+time+'s" class="col-sm-4 animated fadeIn" ><div class="panel panel-default"><div class="panel-heading" style="border:none">'+data[i].title+'</div><div class="panel-body" style=" padding: 10px 15px;"> <p style="word-break:break-word;height: 40px;">'+data[i].content+'</p></div><div class="panel-footer"><b>密码：'+data[i].password+'</b></span><a href="'+data[i].link+'" target="_blank"><span class="label label-info pull-right" style="background-color: #748c8c;">Go</span></a> </div></div></div>';
	            		}
	            	}else{
	            		resourceList="无查询结果";
	            	}
	            	if(page.pageNum>=2){
	            		$(".newblogs").find(".wrapper").append(resourceList);
	            	}else{
	            		$(".newblogs").find(".wrapper").html(resourceList);
	            	} 
	            	if(page.total>9){
	            		var pagenav='';
	            		if(page.pageNum==page.pages){
	            			isEnd=true;
	            			pagenav='<p style="text-align:center;margin:-5px auto 10px;"><a href="javascript:void(0);" style="border:none" onclick="window.scrollTo(0,0)"><i class="fa fa-arrow-up"></i> 没有更多了</a></p>';
	            			if(width<960){
	            				$(".pageMin").html(pagenav);
	            			}
	            		}else{
	            			isEnd=false;
	            			pageNext=page.pageNum+1;
	            			pagenav='<div style="margin:-5px auto 10px;width:10%;"><div class="loader-inner ball-pulse"><div></div><div></div><div></div></div></div>';
	            		}
	            		$(".pagelist").html(pagenav);
	            	}else{
	            		$(".pagelist").html("");
	            	}
	            },
			    error:function(){
			    	alert("失败");
			    }	
	        });
	};
	
	var pageNav=function(pageNum){
		var index ='';
		 layer.ready(function(){
		   index=layer.load(2, {
			  shade: [0.1,'#eee'] //0.1透明度的白色背景
		    });
		  }); 
		 initResource(pageNum);
		setTimeout(function () {
		 window.scrollTo(0,0);   //滑动到浏览器顶部
		 layer.close(index);
	},200);
	};
	
	//初始化推荐
	var initBlogByLike=function(){
		var params ={
				 pageSize: 5,
		         page:1,
		         isrecommend:1  //1 表示推荐
		};
		$.ajax({
            url:'selectGroupLikeBlogListByPage',    
            type:'get',
            data:params,
            dataType:'json',    
            success:function (data) {
            	var likeBlog_1='';
            	var likeBlog_2='';
            	var data=data.blogList;
            	var time='';
            	
                for (var i = 0; i < data.length; i++) {
                	 if(data[i].title.length>25){
                		data[i].title=data[i].title.substring(0,25)+"...";
                	}
                	var id=data[i].id.toString(8)*data[i].id;
                	time=i*0.05;
                	if(i==1){
                		likeBlog_1='<i ><img src="'+data[i].images+'"></i><p><a href="find/'+id+'.html">'+data[i].title+'</a></p>'
                	}else{
                		likeBlog_2+='<li style="animation-delay:'+time+'s" class="animated fadeInDown"> <i><img src="'+data[i].images+'"></i><p><a href="find/'+id+'.html">'+data[i].title+'</a></p><span>'+Format(data[i].addtime,"yyyy-MM-dd")+'</span> </li>';
                		//likeBlog+='<li style="animation-delay:'+time+'s" class="animated fadeInDown"><b><a href="find/'+id+'.html">'+data[i].title+'</a></b><p>'+data[i].introduction+'</p></li>';
                	}
                }
                // 初始化数据
                $(".tuijian2").find(".tjpic").html(likeBlog_1);
                $(".tuijian2").find(".sidenews").html(likeBlog_2);
            },    
		    error:function(){
		    	layer.msg('出错啦', {icon: 2});
		    }	
        });
	};
	
	var selectResource=function(){
		var index ='';
	     layer.ready(function(){
	    	index=layer.load(2, {
				  shade: [0.1,'#eee'] //0.1透明度的白色背景
	    	});
	    }); 
	     initResource(1);
		setTimeout(function () {
			layer.close(index);
		},200);
	};
	
	//格式化时间
	function Format(datetime, fmt) {
	    if (parseInt(datetime) == datetime) {
	        if (datetime.length == 10) {
	            datetime = parseInt(datetime) * 1000;
	        }else if (datetime.length == 13) {
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
	window.onload = function (){
		var oH2 = document.getElementsByTagName("h2")[0];
		var oUl = document.getElementsByTagName("ul")[0];
		oH2.onclick = function (){
			var style = oUl.style;
			style.display = style.display == "block" ? "none" : "block";
			oH2.className = style.display == "block" ? "open" : "";
		};
	};