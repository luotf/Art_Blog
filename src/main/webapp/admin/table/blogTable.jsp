<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>H+ 后台主题UI框架 - Bootstrap Table</title>
<meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
<meta name="description"
	content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">
<link rel="shortcut icon" href="favicon.ico">
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/font-awesome.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/css/plugins/bootstrap-table/bootstrap-table.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/animate.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/index.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/base.css"
	rel="stylesheet">
</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">

		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>博客信息表格</h5>
				<div class="ibox-tools">
					<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
					</a> <a class="dropdown-toggle" data-toggle="dropdown" href="#"> <i
						class="fa fa-wrench"></i>
					</a>
					<ul class="dropdown-menu dropdown-user">
						<li><a href="#">选项1</a></li>
						<li><a href="#">选项2</a></li>
					</ul>
					<a class="close-link"> <i class="fa fa-times"></i>
					</a>
				</div>
			</div>
			<div class="ibox-content">
				<div class="row row-lg">
					<div class="example">
						<table id="allBlog" data-mobile-responsive="true">

						</table>
						<div id="toolbar">
							<button class="type btn btn-outline btn-primary" type="button"
								id="typeButton" value="5">All</button>
							<button class="type btn btn-outline btn-primary" type="button"
								id="typeButton" value="-1">草稿</button>
							<button class="type btn btn-outline btn-info" type="button"
								id="typeButton" value="1">发布</button>
							<button class="type btn btn-outline btn-danger" type="button"
								id="typeButton" value="2">垃圾箱</button>
							<button class="type btn btn-outline btn-success" type="button"
								id="typeButton" value="3">推荐</button>
							<button class="type btn btn-outline btn-primary" type="button"
								id="typeButton" value="4">置顶</button>
							<div class="btn-group">
								<button data-toggle="dropdown"
									class="btn btn-outline btn-warning dropdown-toggle">
									类别 <span class="caret"></span>
								</button>
								<ul class="dropdown-menu">

								</ul>
							</div>
						</div>
					</div>
				</div>

				<div class="modal inmodal" id="myModal" tabindex="-1" role="dialog"
					aria-hidden="true">
					<div class="modal-dialog" style="width:702px">
						<div class="modal-content animated fadeInUp">
						<button type="button" class="close" style="margin-right:7px" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
							<div class="infos" style="margin:0px;">
							
								<div class="newsview" style="padding-top:0px;">
									<h3 class="news_title">作为一个设计师,如果遭到质疑你是否能恪守自己的原则?</h3>
									<div class="news_author">
										<span class="au01">XXX</span><span class="au02">2018-03-18</span><span
											class="au03">共<b>309</b>人围观
										</span>
									</div>
									<div class="tags">
										<a href="/">中兴</a> <a href="/" target="_blank">咔咔</a> <a
											href="/" target="_blank">MWC</a> <a href="/" target="_blank">小蚁</a>
										<a href="/" target="_blank">运动相机</a>
									</div>
									<div class="news_about">
										<strong>简介</strong>曾经有站长找我求助，他说他不知道该怎么办，自己做出来的网站，不仅没有得到大家的认可，反而让大家给他开了一个评判大会。他自己认为已经是做的最好的，却遭受大家无情的指责是“垃圾”作品。
									</div>
									<div class="news_infos">
										<p>曾经有站长找我求助，他说他不知道该怎么办，自己做出来的网站，不仅没有得到大家的认可，反而让大家给他开了一个评判大会。他自己认为已经是做的最好的，却遭受大家无情的指责是“垃圾”作品。</p>
										<p>
											有的给他提出了意见，有的没有提意见，直接扔了两个字，“垃圾”。这没有谁对谁错，每个人的审美观点都不一样，我们能做的就是尊重别人。我相信他是认真对待网站的，我仔细看了他的设计，布局，颜色搭配都是他精心的设计。美和丑是没有一个评判标准的。我给他讲了一个关于建筑设计师的故事。
										</p>
										<p>
											300多年前，建筑设计师克里斯托·莱伊恩受命设计了英国温泽市政府大厅，他运用工程力学的知识，依据自己多年的实践经验，巧妙地设计了只用一根柱子支撑的大厅天花板。但是一年以后，在进行工程验收时，市政府权威人士却对此提出了质疑，并要求莱伊恩一定要再多加几根柱子。莱伊恩对自己的设计很自信，因此他非常苦恼：坚持自己的主张吧，他们肯定会另找人修改设计；不坚持吧，又有悖自己为人的准则。
										</p>
										<p>
											<img src="${pageContext.request.contextPath}/images/v1.jpg">
										</p>
										<p>矛盾了很长时间，莱伊恩终于想到了一条妙计，他在大厅里加了四根柱子，但它们并未与天花板连接，只不过是装装样子，糊弄那些刚愎自用的家伙。这个秘密始终没有被发现。直到300多年后市政府准备修缮大厅天花板时，才发现莱伊恩的“弄虚作假”。我们每个人都想得到别人的尊敬，尤其有了一定的社会地位的人，更想得到别人尊重。建筑设计师克里斯托·莱伊恩很明白这一点，当市政府权威人士对他的建筑设计提出疑问时，他并不坚持己见，而是让市政府权威人士感到他对他们很尊重。所以，一个聪明的人，不仅能维护自己的尊严，还能够顾及他人的尊严。</p>
										<p>
											<img src="${pageContext.request.contextPath}/images/v2.jpg">
										</p>
										<p>莱伊恩的故事，向我们讲述了一个深刻的哲理“恪守着自己的原则，哪怕遭遇到最大的阻力，也要想办法抵达胜利。”</p>
										<p>就拿我自己来说吧，有时候会很矛盾，设计好的作品，不把它分享出来，会觉得待在自己电脑里面实在是没有意义。干脆就发布出去吧。我也害怕收到大家不好的评论，有些评论，可能说者无意，但是对于每一个用心的站长来说，都会受很深的影响，愤怒，恼羞。</p>
										<p>心态很重要，再来看莱伊恩，他当时顶着多大的压力呀。同样作为一个前端设计师，哪怕遭到质疑，我们也要像莱伊恩一样恪守自己的原则。</p>
									</div>
								</div>

							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-white" >编辑</button>
								<button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
							</div>
						</div>
					</div>
				</div>



			</div>
		</div>

	</div>

	<!-- 全局js -->
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

	<!-- 自定义js -->
	<script src="${pageContext.request.contextPath}/js/content.js"></script>

	<!-- Bootstrap table -->
	<script
		src="${pageContext.request.contextPath}/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>

	<script>
	$(document).ready(function() {
		//var url="../selectGroupLikeBlogListByPage";
		selectBlog();
	}); 
	
	//草稿/发布...按钮绑定查询事件  
    $("#toolbar .type").click(function() { 
 		var statu;
 		var isrecommend;
 		var istop;
 		if($(this).val()<3)
 			statu=$(this).val();
 		if($(this).val()==3)
 			isrecommend=1;
 		if($(this).val()==4)
 			istop=1;
        var params = $('#allBlog').bootstrapTable('getOptions')  
        params.queryParams = function(params) {  
         return{
            pageSize: params.limit,
            page:(params.offset)/params.limit+1,
            title:$(".form-control").val(),
            keyword:$(".form-control").val(),
            status:statu,
            isrecommend:isrecommend,
            istop:istop,
    		}
        }  
        $('#allBlog').bootstrapTable('refresh',params) 
    }); 
	
	//实现点击类别传参数到后台
    $("#toolbar .btn-group .btn").click(function() { 
    	selectBlogType();
    });
	
	//初始化类别信息
	  var selectBlogType=function(){
		  var params ={
  				"data":"all"
  		};
			$.ajax({
              url:'../selectBlogType',    
              type:'post',
              data:params,
              dataType:'json',    
              success:function (data) {
              	  var typeName = '';
              	  $(".btn-group").find(".dropdown-menu").html('');
                  for (var i = 0; i < data.length; i++) {
                	  typeName +='<li><a href="javascript:void(0);" style="font-weight: bold;font-size: 13px;color: black;" onclick="sendType('+data[i].id+')">' + data[i].typename + '</a></li>';
                  }
                  // 初始化数据
                  $(".btn-group").find(".dropdown-menu").append(typeName);
              },    
  		    error:function(){
  		    	alert("上传失败");
  		    }	
          });
	  }
	
	  //传参数类别ID
	  var sendType=function(type_id){
		  var params = $('#allBlog').bootstrapTable('getOptions')  
	        params.queryParams = function(params) {  
	         return{
	            pageSize: params.limit,
	            page:(params.offset)/params.limit+1,
	            title:$(".form-control").val(),
	            keyword:$(".form-control").val(),
	            'type.id':type_id,
      		  }
	        }  
	        $('#allBlog').bootstrapTable('refresh',params) 
	  }
	  
	  //初始化表格数据
	  var selectBlog=function(){
		  $('#allBlog').bootstrapTable({
				method: 'post',  
				url: "../selectGroupLikeBlogListByPage", 
				dataType: "json",  
				striped: false,     //使表格带有条纹  
				pagination: true, //在表格底部显示分页工具栏  
				pageSize: 10,  
				pageNumber: 1,
				sortStable:true, 
				sortable:true,
				pageList: [10, 20, 50],  
				idField: "id",  //标识哪个字段为id主键  
				showToggle: false,   //名片格式  
				cardView: false,//设置为True时显示名片（card）布局  
				showColumns: true, //显示隐藏列    
				showRefresh: true,  //显示刷新按钮  
				//singleSelect: true,//复选框只能选择一条记录  
				search: true,//是否显示搜索框
				searchOnEnterKey:true,//设置为 true时，按回车触发搜索方法，否则自动触发搜索方法
				//clickToSelect: true,//点击行即可选中单选/复选框  
				queryParams: queryParams, //参数  
				//showFullscreen:true,  //全屏按钮
				//queryParamsType: "limit", //查询参数组织方式
			    sidePagination: "server", //服务端处理分页
			    //silent: true,  //刷新事件必须设置  
			    searchTimeOut:500, //设置搜索超时时间
			    toolbarAlign:'left',//工具栏对齐方式
			    buttonsAlign:'right',//按钮对齐方式
			    toolbar:'#toolbar',//指定工作栏
			    searchAlign:'right',
			    contentType: "application/x-www-form-urlencoded",
			    formatLoadingMessage: function () {  
			        return "请稍等，正在加载中...";  
			      },  
			      formatNoMatches: function () {  //没有匹配的结果  
			        return "无符合条件的记录";  
			      },  
			    responseHandler: function(res) {
	                return {
	                    "total": res.pageInfo.total,//总页数
	                    "rows": res.pageInfo.list   //数据
	                 };
	            },
			    columns: [
			             {
	                		//title:'全选',
	                		//field:'全选',
	                		//复选框
	                		checkbox:true,
	                		width:'5%',
	                		align:'center',
	                		valign:'middle'
	            		},
		                  {
		                      title: 'ID',
		                      field: 'id',
		                      align: 'center',
		                      valign: 'middle',
		                      width: '5%',
		                      //sortable:true,
		                  }, 
		                  {
		                      title: '标题',
		                      field: 'title',
		                      align: 'center',
		                      valign: 'middle',
		                      width:'15%',
		                      formatter:function(value,row,index){ 
		                    	  var title="";
		                    	  var content=$(".form-control").val();
		                    	  if(content==""||content==null){
		                    		  title=row.title;
		                    	  }else if(row.title.search(content)!=-1){
		                    		  var strs= new Array();
			                    	  strs=row.title.split("");
		                    		  var strStartIndex = row.title.indexOf(content);
		                    		  var strEndIndex = strStartIndex+content.length-1;
		                    		  for(var i=0;i<strs.length;i++){
		                    			  if(i>=strStartIndex&&i<=strEndIndex){
		                    				  title+='<span style="color:#000;font-weight:bold;">'+strs[i]+'</span>';
		                    			  }else{
		                    				  title+='<span >'+strs[i]+'</span>';
		                    			  }
		                    		  }
		                    	  }
		                    	  return title;
			   	                } 
		                  },
		                  {
		                      title: '类别',
		                      field: 'type.typename',
		                      align: 'center',
		                      width:'8%',
		                  },
		                  {
		                      title: '关键字',
		                      field: 'keyword',
		                      align: 'center',
		                      width:'15%',
		                      formatter:function(value,row,index){
		                    	  var keyword = '';
		                    	  if(row.keyword!=''&&row.keyword!=null){
		                    		  if(row.keyword.search(';')!=-1){
		                    			 var strs= new Array();
		                    		     strs=row.keyword.split(";");
		                    		     var label = new Array("label-info","label-danger","label-warning");
			                             for (var i = 0; i < strs.length; i++) {
			                        	   keyword +='<span class="label '+label[i]+' pull-left">'+strs[i]+'</span>&nbsp;';
			                          }
		                    	    }else{
		                    	    	keyword ='<span class="label label-info pull-left">'+row.keyword+'</span>&nbsp;';
		                    	    }
		                    	  }
			   	                  return keyword;
			   	                }
		                  },
		                  
		                  {
		                      title: '浏览量',
		                      field: 'clicknum',
		                      align: 'center',
		                      width:'5%',
		                      
		                  },
		                  {
		                      title: '评论量',
		                      field: 'commentnum',
		                      align: 'center',
		                      width:'5%',
		                     
		                  },
		                  {
		                      title: '点赞量',
		                      field: 'agreenum',
		                      align: 'center',
		                      width:'5%',
		                      
		                  },
		                  {
		                      title: '博主推荐',
		                      field: 'isrecommend',
		                      align: 'center',
		                      width:'5%',
		                      formatter:function(value,row,index){  
		   	                  if(row.isrecommend==0){
		   	                	return '<button class="btn-xs">否</button> ';  
		   	                  	}else if(row.isrecommend==1){
		   	                  	return '<button class="btn-xs btn-success">是</button>'; 
		   	                  	}
		   	                  	 
		   	                    } 
		                  },
		                  {
		                      title: '状态',
		                      field: 'status',
		                      align: 'center',
		                      width:'7%',
		                      formatter:function(value,row,index){  
		   	                  if(row.status==-1){
		   	                	return '<button class="btn-xs btn-primary">草稿</button>';  
		   	                  	}else if(row.status==1){
		   	                  	return '<button class="btn-xs btn-info">发布</button>'; 
		   	                  	}else if(row.status==2){
		   	                  	return '<button class="btn-xs btn-danger">垃圾</button>'; 
		   	                  	}
		   	                   } 
		                  },
		                  {
		                      title: '发表时间',
		                      field: 'addtime',
		                      align: 'center',
		                      width:'14%',
		                      
		                      formatter:function(value,row,index){  
		                    	 return Format(row.addtime,"yyyy-MM-dd hh:mm:ss");
			   	                 } 
		                  },
		                  {
		                      title: '操作',
		                      field: 'id',
		                      align: 'center',
		                      width:'20%',
		                      formatter:function(value,row,index){
		                    	
		                   var e = '<button class="btn-xs btn-info" data-toggle="modal" data-target="#myModal" onclick="searchBlog(\''+ row.id + '\')">查看</button> ';  
		                   var d = '<button class="btn-xs btn-primary" data-toggle="modal" data-target="#myModal" onclick="updateBlog(\''+ row.id +'\')">编辑</button> ';  
		                        return e+d;  
		                    } 
		                  }
		              ]
		      });
	  }
	
	
	//传参数到后台
	function queryParams(params){
        return{
            //每页多少条数据
        	//pageIndex: params.offset+1,
            pageSize: params.limit,
            page:(params.offset)/params.limit+1,
            title:$(".form-control").val(),
            keyword:$(".form-control").val(),
           
        }
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
	
	//修改博客内容
	function updateBlog(blogId){
		
	}
	</script>
</body>
</html>
