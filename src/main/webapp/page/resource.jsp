<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>资源页_个人博客 - 一个在Java道路上的技术员个人博客网站</title>
<meta name="keywords" content="个人博客,罗廷方个人博客,罗廷方" />
<meta name="description" content="罗廷方个人博客，是一个在Java道路上的技术员个人博客网站" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="favicon.ico"> 
   <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css?v=4.1.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/base.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet">
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
      <div class="newblogs">
        <div class="row">
            <div class="col-sm-12">
                <div class="wrapper wrapper-content ">
                   
                 
                     
                </div>
                <div class="pagelist ">
      
     		    </div>
            </div>
        </div>

      </div>
    </div>

    <div class="rightbox ">
      <div class="search1">
        <form name="searchform" id="searchform">
          <input name="keyboard" id="keyboard" class="input_text" value="请输入关键字" style="color: rgb(153, 153, 153);" onfocus="if(value=='请输入关键字'){this.style.color='#000';value=''}" onblur="if(value==''){this.style.color='#999';value='请输入关键字'}" type="text">
          <input name="Submit" class="input_submit" value="搜索" type="submit">
        </form>
      </div>
      <div class="paihang ">
        <h2 class="ab_title"><a href="/">本栏推荐</a></h2>
        <ul class="animated fadeInDown">
          <li><b><a href="/" target="_blank">住在手机里的朋友</a></b>
            <p>对于刚毕业的学生来说，想学习建网站，掌握一技之长，最简单的入门无学...</p>
          </li>
          <li><b><a href="/" target="_blank">教你怎样用欠费手机拨打电话</a></b>
            <p>对于刚毕业的学生来说，想学习建网站，掌握一技之长，最简单的入门...</p>
          </li>
          <li><b><a href="/" target="_blank">原来以为，一个人的勇敢是，删掉他的手机号码</a></b>
            <p>.先前发表过一篇文章《如果要学习web前端开发，需要学习什么？》</p>
          </li>
          <li><b><a href="/" target="_blank">手机的16个惊人小秘密，据说99.999%的人都不知</a></b>
            <p>对于刚毕业的学生来说，.需要学习什么？》</p>
          </li>
          <li><b><a href="/" target="_blank">你面对的是生活而不是手机</a></b>
            <p>.最简单的入门无非就是学会html和css，先前发表过一篇文章...</p>
          </li>
        </ul>
        <div class="ad"><img src="${pageContext.request.contextPath}/images/ad300x100.jpg"></div>
      </div>
    </div>
  </article>



    

    <!-- 全局js -->
    <script src="${pageContext.request.contextPath}/js/jquery.min.js?v=2.1.4"></script>
	<script src="${pageContext.request.contextPath}/js/layer/layer.js"></script>
    <!-- 自定义js -->
    <script src="${pageContext.request.contextPath}/js/content.js?v=1.0.0"></script>
    
    <script>
	$(document).ready(function() {
		//初始化类别信息
		 initResource(1);
		//初始化技术专栏的信息
		/*initBlogListByPage(1,"none");
		initBlogByLike();
		initBlogByClick(); */
	});
	var initResource=function(pageNum){
		 var params={
				 pageSize: 12,
		         page:pageNum,
   				 title:$(".keyword").val(),
   				 content:$(".keyword").val(),
   				 link:$(".keyword").val(),
   				 status:1    //1 表示已发布
   			 };
              	$.ajax({
	            url:'../admin/selectLikeResourceListByPage',    
	            type:'get',
	            data:params,
	            dataType:'json',    
	            success:function (date) {
	            	var resourceList='';
	            	var page=date.pageInfo;
	            	var data=date.resourceList;
	            	if(data.length>0){
	            		for (var i = 0; i < data.length; i++) {
	            			resourceList+='<div class="col-sm-4 animated fadeInDown" ><div class="panel panel-info"><div class="panel-heading">'+data[i].title+'</div><div class="panel-body"><p style="word-break:break-word;">'+data[i].content+'</p></div><div class="panel-footer"><b>密码：'+data[i].password+'</b></span><a href="'+data[i].link+'" target="_blank"><span class="label label-danger pull-right">Go</span></a> </div></div></div>';
	            		}
	            	}else{
	            		resourceList="无查询结果";
	            	}
	            	$(".newblogs").find(".wrapper").html(resourceList);
	            	
	            	if(page.total>12){
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
	
	</script>
</body>
</html>
