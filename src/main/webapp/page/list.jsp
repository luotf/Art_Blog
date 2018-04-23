<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>列表页_个人博客 - 一个在Java道路上的技术员个人博客网站</title>
<meta name="keywords" content="个人博客,罗廷方个人博客,罗廷方" />
<meta name="description" content="罗廷方个人博客，是一个在Java道路上的技术员个人博客网站" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/base.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/animate.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/font-awesome.css"
	rel="stylesheet">
</head>
<body>
<header>
  <div id="mnav">
    <h2><span class="navicon"></span></h2>
    <ul>
      <li><a href="${pageContext.request.contextPath}/page/index.jsp">网站首页</a></li>
      <li><a href="${pageContext.request.contextPath}/page/list.jsp">技术博客</a></li>
      <li><a href="${pageContext.request.contextPath}/page/list.jsp">面试汇总</a></li>
      <li><a href="${pageContext.request.contextPath}/page/project.jsp">项目案例</a></li>
      <li><a href="${pageContext.request.contextPath}/page/resource.jsp">资源分享</a></li>
      <li><a href="${pageContext.request.contextPath}/page/about.jsp">关于我</a></li>
      <li><a href="/">留言</a></li>
    </ul>
  </div>
  <nav>
    <ul>
      <li><a href="${pageContext.request.contextPath}/page/index.jsp">网站首页</a></li>
      <li><a href="${pageContext.request.contextPath}/page/list.jsp">技术博客</a></li>
      <li><a href="${pageContext.request.contextPath}/page/list.jsp">面试汇总</a></li>
      <li><a href="${pageContext.request.contextPath}/page/project.jsp">项目案例</a></li>
      <li><a href="${pageContext.request.contextPath}/page/resource.jsp">资源分享</a></li>
      <li><a href="${pageContext.request.contextPath}/page/about.jsp">关于我</a></li>
      <li><a href="/">留言</a></li>
    </ul>
  </nav>
</header>
<article>
  <div class="leftbox">
    <div class="newblogs ">
      <h2 class="hometitle">
      <span class="tagTitle">
      
      </span>技术专栏</h2>
      <ul class="animated fadeInDown">
      
      </ul>
      <div class="pagelist ">
      
      </div> 
    </div>
  </div>
  <div class="rightbox">
    <div class="search1">
      <form action="" method="post" name="searchform" id="searchform">
        <input name="keyword" id="keyword"  class="input_text" value="请输入关键字" style="color: rgb(153, 153, 153);" onfocus="if(value=='请输入关键字'){this.style.color='#000';value=''}" onblur="if(value==''){this.style.color='#999';value='请输入关键字'}" type="text">
        <input name="Submit" class="input_submit" value="搜索" type="button" onclick="search()">
      	<input type="hidden" class="type_id">
      
      </form>
     
     <ul class="tag tag-list animated fadeIn" style="padding: 0;">
		
	</ul >
	
    </div>
    
      <div class="paihang " >
				<h2 class="ab_title">
					<a href="/">本栏推荐</a>
				</h2>
				<ul class="like animated fadeInDown" >

				</ul>
				<div class="ad"></div>
			</div>
			<div class="paihang ">
				<h2 class="ab_title">
					<a href="/">点击排行</a>
				</h2>
				<ul class="click animated fadeInDown">

				</ul>

			</div>
    
    <div class="weixin">
      <h2 class="ab_title">公众号</h2>
      <ul class="animated fadeInDown">
        
      </ul>
    </div>
  </div>
</article>

<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/layer/layer.js"></script>
<script id="cy_cmt_num" src="http://changyan.sohu.com/upload/plugins/plugins.list.count.js?clientId=cytzg9rLH"></script>
<script>
	$(document).ready(function() {
		//初始化类别信息
		initBlogType();
		//初始化技术专栏的信息
		initBlogListByPage(1,"none");
		initBlogByLike();
		initBlogByClick();
	});
	function ser(){
		return 5; 
	}
	var initBlogListByPage=function(pageNum,type_id){
		//查询出文章
		//获取关键字，表示查询所有符合的记录
		var params="";
		if(type_id=="none"){
			var keyword=$("#keyword").val();
			if(keyword=="请输入关键字")
				keyword="";
			 params ={
					pageSize: 10,
		            page:pageNum,
		            title:keyword,
		            content:keyword,
		            introduction:keyword,
		            keyword:keyword,
		           	status:1  //1 表示已发布
			};
		}else {
			params ={
					pageSize: 10,
		            page:pageNum,
		            'type.id':type_id,
		           	status:1  //1 表示已发布
			};
		}
		
		$.ajax({
            url:'../page/selectLikeBlogListByPage',    
            type:'get',
            data:params,
            dataType:'json',    
            success:function (data) {
            	var blogList='';
            	var page=data.pageInfo;
            	var data=data.blogList;
            	if(data.length>0){
            		 var parm="";
            		 var arr=new Array();
            		 for (var i = 0; i < data.length; i++) {
            			 arr[i]=data[i].id;
            			 parm+=data[i].id+",";
                      	var id=data[i].id.toString(8)*data[i].id;
                      	var keyword="";
                      	if(data[i].keyword!=""&&data[i].keyword!=null){
                      		if(data[i].keyword.search(';')!=-1){
                      			keyword=data[i].keyword.replace(/;/g,"|");
                      		}else{
                      			keyword=data[i].keyword;
                      		}
                      	}
                      	blogList+='<li><h3 class="blogtitle"><a href="find/'+id+'.html"  >'+data[i].title+'</a></h3><div class="bloginfo"><span class="blogpic"><a href="find/'+id+'.html" title=""><img src="'+data[i].images+'"  /></a></span><p>'+data[i].introduction+'</p></div><div class="autor"><span style="float:left;padding:0;color: #38485a"><i class="fa fa-user" style="color: #88827dcc;"></i>&nbsp;罗廷方</span><span class="lm f_l"><a href="javascript:void(0);">'+keyword+'</a></span><span class="dtime f_l">'+Format(data[i].addtime,"yyyy-MM-dd")+'</span><span class="viewnum f_l">浏览<b>（<a href="javascript:void(0);">'+data[i].clicknum+'</a></b>）</span><span class="pingl f_l">评论（<b><a class='+data[i].id+' href="javascript:void(0);"></a></b>）</span><span class="f_r"><a href="find/'+id+'.html" class="more">阅读原文>></a></span></div></li>'
            		 };
            		
            		 var p={
	           				 client_id:'cytzg9rLH',
	           				 topic_source_id:parm
	           			 };
	                      	$.ajax({
	        	            url:'http://changyan.sohu.com/api/2/topic/count',    
	        	            type:'get',
	        	            data:p,
	        	            dataType:'jsonp',    
	        	            success:function (pl) {
	        	            	for(var i=0;i<arr.length;i++){
	        	            		$('.'+arr[i]).html(pl.result[arr[i]].comments);
	        	            	}
	        	            },
	        			    error:function(){
	        			    	alert("失败");
	        			    }	
	        	        });
            		 
            		 
            	}else{
            		blogList="无查询结果";
            	}
            	 $(".newblogs").find("ul").html(blogList);
            	// $(".plNum").html('<span id = "sourceId::54" class = "cy_cmt_count" ></span>');
            	//初始化分页、总数>10显示分页栏
            	 if(page.total>10){
            		 var allTotal='<a title="Total record">&nbsp;<b>'+page.total+'</b> </a>&nbsp;&nbsp;';
            		 var pagesNum='';
            		 var fristPage='';
            		 var prePage='';
            		 var nextPage='';
            		 var lastPage='';
            		 var num='';
            		 var currNum=1;
            		 var maxNum=page.pages;
            		 if(page.pageNum>=3){
             			currNum=page.pageNum-2;
             		}
             		 if(page.pageNum>=page.pages-2){
             			 currNum=page.pages-4;
             		 }
            		 if(maxNum>5){
            			 maxNum=currNum+4;
            		 }else{
            			 currNum=1;
            		 }
            		 for(var i=currNum;i<=maxNum;i++){
            			 if(i>page.pages){
            				 break;
            			 }
            			 if(page.pageNum==i){
            				 num='<a href="javascript:void(0);"><b>'+i+'</b></a>&nbsp;'
            			 }else{
            				 num='<a href="javascript:void(0);" onclick="pageNav('+i+')">'+i+'</a>&nbsp;';
            			 }
            			 pagesNum+=num;
            		 }
            		 var pre=page.pageNum-1;
            		 var next=page.pageNum+1;
            		 if(page.pageNum==1){
            			 prePage='<a href="javascript:void(0);">上一页</a>&nbsp;';
            			 fristPage='<a href="javascript:void(0);">首页</a>&nbsp;';
            		 }else{
            			 prePage='<a href="javascript:void(0);" onclick="pageNav('+pre+')">上一页</a>&nbsp;';
            			 fristPage='<a href="javascript:void(0);" onclick="pageNav(1)">首页</a>&nbsp;';
            		 }
            		 if(page.pageNum==page.pages){
            			 nextPage='<a href="javascript:void(0);">下一页</a>&nbsp;';
            			 lastPage='<a href="javascript:void(0);">尾页</a>&nbsp;';
            		 }else{
            			 nextPage='<a href="javascript:void(0);" onclick="pageNav('+next+')">下一页</a>&nbsp;';
            			 lastPage='<a href="javascript:void(0);" onclick="pageNav('+page.pages+')">尾页</a>&nbsp;';
            		 }
            		 $(".pagelist").html(allTotal+fristPage+prePage+pagesNum+nextPage+lastPage);
            		
            	 }else{
            		 $(".pagelist").html("");
            	 }
             
            	},    
		    error:function(){
		    	alert("初始化失败");
		    }	
        });
	};
	
	var pageNav=function(pageNum){
		var type="";
		type=$(".type_id").val();
		$(".type_id").val("");
		if(type==null||type==""){
			type="none";
		}
		var index ='';
		 layer.ready(function(){
		   index=layer.load(2, {
			  shade: [0.1,'#eee'] //0.1透明度的白色背景
		    });
		  }); 
		    
		initBlogListByPage(pageNum,type);
		setTimeout(function () {
		 window.scrollTo(0,0);   //滑动到浏览器顶部
		 layer.close(index);
	},200);
			
	}
	
	
	
	var search=function(){
		var index ='';
	     layer.ready(function(){
	    	index=layer.load(2, {
				  shade: [0.1,'#eee'] //0.1透明度的白色背景
	    	});
	    }); 
	     initBlogListByPage(1,"none");
		setTimeout(function () {
			layer.close(index);
		},200);
	}
	
	//初始化所有类别信息
	var initBlogType=function(){
		//查询出文章类别
		//设置参数，表示查询所有的类别
		var params ={
				"data":"all"
		};
		$.ajax({
            url:'../admin/selectBlogType',    
            type:'post',
            data:params,
            dataType:'json',    
            success:function (data) {
            	var typeName='';
                for (var i = 0; i < data.length; i++) {
                	typeName+='<li><a style="padding: 5px;margin-right: 3px;border: none; background-color: #f1f1f1;" onclick="searchType('+data[i].id+')" href="javascript:void(0);"> <i class="fa fa-tag"></i>'+data[i].typename+'</a></li>'
                }
                var length='';
                var keyTitle='';
                if(data.length>5){
                	length=5;
                }else{
                	length=data.length;
                }
                for (var i = 0; i < length; i++) {
                	keyTitle+='<a href="javascript:void(0);" onclick="searchType('+data[i].id+')">'+data[i].typename+'</a>'
                }
                
                // 初始化数据
                $(".tag").html(typeName);
                $(".tagTitle").html(keyTitle);
            },    
		    error:function(){
		    	alert("初始化类别失败");
		    }	
        });
	}
	
	var searchType=function(type_id){
		$(".type_id").val(type_id);
		var index ='';
	     layer.ready(function(){
	    	index=layer.load(2, {
				  shade: [0.1,'#eee'] //0.1透明度的白色背景
	    	});
	    }); 
	     initBlogListByPage(1,type_id);
		setTimeout(function () {
			layer.close(index);
		},200);
		
		
	}
	
	//初始化推荐
	var initBlogByLike=function(){
		var params ={
				 pageSize: 5,
		         page:1,
		         isrecommend:1  //1 表示推荐
		};
		$.ajax({
            url:'../admin/selectGroupLikeBlogListByPage',    
            type:'get',
            data:params,
            dataType:'json',    
            success:function (data) {
            	var likeBlog='';
            	var data=data.blogList;
                for (var i = 0; i < data.length; i++) {
                	if(data[i].introduction.length>35){
                		data[i].introduction=data[i].introduction.substring(0,34)+"...";
                	}
                	var id=data[i].id.toString(8)*data[i].id;
                	likeBlog+='<li><b><a href="find/'+id+'.html">'+data[i].title+'</a></b><p>'+data[i].introduction+'</p></li>';
                }
                // 初始化数据
                $(".paihang").find(".like").html(likeBlog);
                var ad='<img src="${pageContext.request.contextPath}/images/ad300x100.jpg">';
				$(".ad").html(ad);
				
            },    
		    error:function(){
		    	layer.msg('出错啦', {icon: 2});
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
            url:'../admin/selectGroupLikeBlogListByPage',    
            type:'get',
            data:params,
            dataType:'json',    
            success:function (data) {
            	var clickBlog='';
            	var data=data.blogList;
            	 
                for (var i = 0; i < data.length; i++) {
                	if(data[i].introduction.length>35){
                		data[i].introduction=data[i].introduction.substring(0,34)+"...";
                	}
                	var id=data[i].id.toString(8)*data[i].id;
                	clickBlog+='<li><b><a href="find/'+id+'.html">'+data[i].title+'</a></b><p>'+data[i].introduction+'</p></li>'
                }
                // 初始化数据
                $(".paihang").find(".click").html(clickBlog);
                var ab='<img src="../images/wx.jpg">';
            	$(".weixin").find("ul").html(ab);
            	
            },    
		    error:function(){
		    	layer.msg('出错啦', {icon: 2});
		    }	
        });
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
		oH2.onclick = function ()
		{
			var style = oUl.style;
			style.display = style.display == "block" ? "none" : "block";
			oH2.className = style.display == "block" ? "open" : ""
		}
}
</script>
</body>

</html>
