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
<link href="${pageContext.request.contextPath}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">

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
							
							<button class=" btn  dim btn-outline btn-danger" type="button"
								onclick="getSelectRows()"><i class="fa fa-remove"></i></button>
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
									<h3 class="news_title"></h3>
									<div class="news_author">
										<span class="au01">罗廷方</span><span class="au02"></span><span
											class="au03">共<b></b>人围观
										</span>
									</div>
									<div class="tags">
										
									</div>
									<div class="news_about">
										<strong>简介</strong><span class="news_intr">
									</span>
									</div>
									<div class="news_infos">
										
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<span class="update"></span>
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
	<script src="${pageContext.request.contextPath}/js/plugins/sweetalert/sweetalert.min.js"></script>
 	<script src="${pageContext.request.contextPath}/js/contabs.js"></script>
 	
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
  		    	swal("上传错误", "请重新操作", "error");
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
			   // singleSelect : true,
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
	                		checkbox:true,
	                		 width: '3%',
	                		 align: 'center',
		                     valign: 'middle',
	            		},
		                  {
		                      title: 'ID',
		                      field: 'id',
		                      align: 'center',
		                      valign: 'middle',
		                      width: '5%',
		                  }, 
		                  {
		                      title: '标题',
		                      field: 'title',
		                      align: 'center',
		                      valign: 'middle',
		                      width:'15%',
		                      formatter:function(value,row,index){ 
		                    	  var title="";
		                    	  var content=$(".form-control").val().toLowerCase();
		                    	  var contentUpper=$(".form-control").val().toUpperCase();
		                    	   if(row.title.search(content)!=-1||row.title.search(contentUpper)!=-1){
		                    		  var strs= new Array();
			                    	  strs=row.title.split("");
		                    		  var strStartIndex = row.title.indexOf(content);
		                    		  var strEndIndex = strStartIndex+content.length-1;
		                    		  if(row.title.search(contentUpper)!=-1){
		                    			  strStartIndex = row.title.indexOf(contentUpper);
			                    		  strEndIndex = strStartIndex+contentUpper.length-1;
		                    		  }
		                    		  for(var i=0;i<strs.length;i++){
		                    			  if(i>=strStartIndex&&i<=strEndIndex){
		                    				  title+='<span style="color:#000;font-weight:bold;">'+strs[i]+'</span>';
		                    			  }else{
		                    				  title+='<span >'+strs[i]+'</span>';
		                    			  }
		                    		  }
		                    	  }else{
		                    		  title=row.title;
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
			                             for (var i = 0; i < strs.length&&strs[i]!=""; i++) {
			                        	   keyword +='<span class="label '+label[i]+' pull-left">'+strs[i]+'</span>';
			                          }
		                    	    }else{
		                    	    	keyword ='<span class="label label-info pull-left">'+row.keyword+'</span>';
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
		                  /* {
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
		                      
		                  }, */	
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
		                      width:'15%',
		                      
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
		                   //查看	
		                   var a = '<a  class=" btn-sm btn-info" href="#" data-toggle="modal" data-target="#myModal" onclick="selectBlogById(\''+ row.id + '\')">查看</a> ';  
		                   //编辑
		                   var b = '<a  class=" btn-sm btn-primary"  href="../blog/updateBlog.jsp?id='+row.id+'"><i class="fa fa-edit" ></i>编辑</a> ';  
		                   //从回收站还原
		                   var c = '<a  class=" btn-sm btn-danger"  onclick="operationBlog('+ row.id + ',1,null,null)"><i class="fa fa-file-o" ></i>还原</a> '; 
		                   //取消推荐
		                   var d = '<a  class=" btn-sm btn-warning"  onclick="operationBlog('+ row.id + ',null,0,null)"><i class="fa fa-hand-o-down" ></i>推荐</a> ';
		                   //发布
		                   var e = '<a  class=" btn-sm btn-danger"  onclick="operationBlog('+ row.id + ',1,null,null)"><i class="fa fa-check-square-o" ></i>发表</a> ';  
		                   //取消置顶
		                   var f = '<a  class=" btn-sm btn-warning"  onclick="operationBlog('+ row.id + ',null,null,0)"><i class="fa fa-hand-o-down" ></i>置顶</a> ';  
		                   if(row.status==2){
		                	   return a+c;
		                   } else if(row.status==1){
		                	   if(row.isrecommend==1){
		                		   return a+d;
		                	   }else if(row.istop==1){
		                		   return a+f;  
		                	   }else{
		                		   return a+b;  
		                	   }
		                   }else if(row.status==-1)
		                	   return a+e;  
		                    } 
		                  }
		              ]
		      });
	  }
	
	
	//传参数到后台
	function queryParams(params){
        return{
            pageSize: params.limit,
            page:(params.offset)/params.limit+1,
            title:$(".form-control").val(),
            keyword:$(".form-control").val(),
           	status:1  //1 表示正文
        }
    }
	
	//获取行号  
	var getSelectRows = function(){
		 var date= $("#allBlog").bootstrapTable('getSelections'); 
		 var idArray= new Array();
		 var title='确定要删除这'+date.length+'条信息吗';
		 swal({
             title: title,
             text: "删除后前台将无法显示，请谨慎操作！",
             type: "warning",
             showCancelButton: true,
             confirmButtonColor: "#DD6B55",
             confirmButtonText: "删除",
             closeOnConfirm: false
         }, function () {
        	 for(var i=0;i<date.length;i++){
    			 idArray[i]=date[i].id;
    			 operationBlog(idArray[i],2,null); //参数2表示  放入回收站
    		}
             swal("删除成功！", "您可以去垃圾箱中还原该信息", "success");
         });
		 
		 
	}
	
	//博客的操作
	var operationBlog=function(idArray,status,isrecommend,isTop){
		var param='';
		if(status!=null){
			 param={
					 'id':idArray,
					 'status':status,
			};
		}
		if(isrecommend!=null){
			param={
					 'id':idArray,
					 'isrecommend':isrecommend,
			};
		}
		if(isTop!=null){
			param={
					 'id':idArray,
					 'istop':isTop,
			};
		}
		console.log(param);  
		$.ajax({
            url:'../updateBlog',    
            type:'post',
            data:param,
            dataType:'json',    
            success:function (data) {
            	//查询成功
            	if(data.status==200){
            		$("#allBlog").bootstrapTable('refresh');
            	}
            },    
		    error:function(){
		    	swal("删除错误", "请重新操作", "error");
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
	
	//查看博客内容
	function selectBlogById(blogId){
		var param={
				id:blogId
		}
		$.ajax({
            url:'../selectBlogById',    
            type:'post',
            data:param,
            dataType:'json',    
            success:function (data) {
            	//查询成功
            	if(data.status==200){
            	  $(".newsview").find(".news_title").html(data.blog.title);
            	  $(".newsview").find(".au02").html(Format(data.blog.addtime,"yyyy-MM-dd hh:mm:ss"));
            	  $(".au03").find('b').html(data.blog.clicknum);
            	  $(".news_about").find(".news_intr").html(data.blog.introduction);
            	  var keyword='' ;
            	  $(".newsview").find(".tags").html("");
            	  if(data.blog.keyword!=''&&data.blog.keyword!=null){
            		  if(data.blog.keyword.search(';')!=-1){
            			 var strs= new Array();
            		     strs=data.blog.keyword.split(";");
                         for (var i = 0; i < strs.length&&strs[i]!=''; i++) {
                    	   keyword +='<a href="#">'+strs[i]+'</a>';
                      }
            	    }else{
            	    	keyword ='<a href="#">'+data.blog.keyword+'</a>';
            	    }
            	  } 
            	  $(".newsview").find(".tags").append(keyword);
            	  $(".newsview").find(".news_infos").html(data.blog.content);
            	  var update='<a  class="J_menuItem btn btn-white" href="../blog/updateBlog.jsp?id='+data.blog.id+'">编辑</a>';
            	  $(".modal-footer").find(".update").html(update);
            	}
            },    
		    error:function(){
		    	swal("查询错误", "请重新操作", "error");
		    }	
        });
	}
	
	</script>
</body>
</html>
