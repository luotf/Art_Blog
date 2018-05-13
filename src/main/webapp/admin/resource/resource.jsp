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


<title>H+ 后台主题UI框架 - 写信</title>
<meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
<meta name="description"
	content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

<link rel="shortcut icon" href="favicon.ico">
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/font-awesome.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/css/plugins/iCheck/custom.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/animate.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/css/plugins/bootstrap-table/bootstrap-table.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/css/plugins/sweetalert/sweetalert.css"
	rel="stylesheet">
</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="row">
			<div class="col-sm-3">
				<div class="ibox float-e-margins">
					<div class="ibox-content mailbox-content">
						<div class="file-manager">
							<a class="btn btn-block btn-primary compose-mail"
								href="javascript:void(0);">资源管理</a>
							<div class="space-25"></div>
							<h5>博客状态</h5>
							<ul class="folder-list m-b-md" style="padding: 0">
								<li class="share" value="0"><a href="javascript:void(0);">
										<i class="fa fa-inbox "></i>总共<span
										class="a-1 label label-info pull-right">0 条</span>
								</a></li>
								<li class="share" value="1"><a href="javascript:void(0);">
										<i class="fa fa-file-text-o "></i>已上架<span
										class="a-2 label label-warning pull-right">0 条</span>
								</a></li>
								<li class="share" value="-1"><a href="javascript:void(0);">
										<i class="fa fa-trash-o "></i>下架<span
										class="a-3 label label-danger pull-right">0 条</span>
								</a></li>
							</ul>

							<h5 class="tag-title">增加资源</h5>
							<form role="form">
								<div class="form-group">
									<div class="input-group m-b">
										<span class="input-group-addon">名称</span> <input type="text"
											id="title" name="title" placeholder="请输入名称"
											class="form-control">
									</div>
								</div>
								<div class="form-group">
									<div class="input-group m-b">
										<span class="input-group-addon">内容</span>
										<!-- <input type="text" placeholder="请输入内容" class="form-control"> -->
										<textarea id="content" name="content" class="form-control"></textarea>
									</div>
								</div>
								<div class="form-group">
									<div class="input-group m-b">
										<span class="input-group-addon">链接</span> <input type="text"
											id="link" name="link" placeholder="请输入链接"
											class="form-control">
									</div>
								</div>
								<div class="form-group">
									<div class="col-md-9" style="padding:0px">
										<div class="input-group m-b">
											<span class="input-group-addon">密码</span> <input type="text"
												id="password" name="password" placeholder="请输入密码"
												class="form-control">
										</div>
									</div>
								</div>
								<button onclick="addResource()" class="btn btn-white pull-right"
									type="button">提交</button>
							</form>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-9">
				<div class="ibox float-e-margins">
					<div class="mail-box-header">
						<h2>资源信息</h2>

						<table id="allResource" data-mobile-responsive="true">

						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="modal-form" class="modal fade" aria-hidden="true">
		<div class="modal-dialog" style="width: 25%;">
			<div class="modal-content">
				<div class="modal-body">
					<div class="row">
						<h3 class="m-t-none m-b">修改资源信息</h3>

						<form role="form" class="form-horizontal">
							<div class="input-group m-b">
								<span class="input-group-addon">名称</span> <input type="text"
									id="newTitle" class="form-control">
							</div>
							<div class="input-group m-b">
								<span class="input-group-addon">内容</span>
								<textarea id="newContent" class="form-control"></textarea>
							</div>
							<div class="input-group m-b">
								<span class="input-group-addon">链接</span> <input type="text"
									id="newLink" class="form-control">
							</div>
							<div class="input-group m-b">
								<span class="input-group-addon">密码</span> <input type="text"
									id="newPassword" class="form-control">
							</div>

							<div id="update"></div>
						</form>

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
	<script
		src="${pageContext.request.contextPath}/js/plugins/sweetalert/sweetalert.min.js"></script>

	<!-- iCheck -->
	<script
		src="${pageContext.request.contextPath}/js/plugins/iCheck/icheck.min.js"></script>

	<!-- Bootstrap table -->
	<script
		src="${pageContext.request.contextPath}/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
	<script>
        
	$(document).ready(function() {
		initResourceCount();
		selectResource();
			});
	
		var initResourceCount=function(){
			$.ajax({
				url : '../selectResourceListByStatus',
				type : 'post',
				dataType : 'json',
				success : function(data) {
					var count=0;
					$(".a-2").html('0条');
					$(".a-3").html('0条');
					for (var i = 0; i < data.list.length; i++) {
						count+=data.list[i].count;
						if (data.list[i].status == 1) {
							$(".a-2").html(
									data.list[i].count + '条');
						} else if (data.list[i].status == -1) {
							$(".a-3").html(
									data.list[i].count + '条');
						}
					}
					$(".a-1").html(
							count + '条');
				},
				error : function() {
					swal("初始化资源数目错误", "请重新操作", "error");
				}
			});
			
		}
	
		//草稿/发布...按钮绑定查询事件  
	    $(".share").click(function() { 
	 		var statu=$(this).val();
	        var params = $('#allResource').bootstrapTable('getOptions');
	        params.queryParams = function(params) {  
	         return{
	            pageSize: params.limit,
	            page:(params.offset)/params.limit+1,
	            title:$(".search .form-control").val(),
	            status:statu,
	    		}
	        };
	        $('#allResource').bootstrapTable('refresh',params);
	    }); 
		
		
	 //初始化表格数据
	  var selectResource=function(){
		  $('#allResource').bootstrapTable({
				method: 'post',  
				url: "../selectLikeResourceListByPage", 
				dataType: "json",  
				striped: false,     //使表格带有条纹  
				pagination: true, //在表格底部显示分页工具栏  
				pageSize: 10,  
				pageNumber: 1,
				sortOrder: "asc",
				sortable: true,   
				pageList: [10, 20, 30],  
				idField: "id",  //标识哪个字段为id主键  
				showToggle: false,   //名片格式  
				cardView: false,//设置为True时显示名片（card）布局  
				showColumns: true, //显示隐藏列    
				showRefresh: true,  //显示刷新按钮  
				search: true,//是否显示搜索框
				searchOnEnterKey:true,//设置为 true时，按回车触发搜索方法，否则自动触发搜索方法
				queryParams: queryParams, //参数  
			    sidePagination: "server", //服务端处理分页
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
		                      title: '序号',
		                      align: 'center',
		                      valign: 'middle',
		                      width: '5%',
		                      formatter: function (value, row, index) {  
		                          return index+1;  
		                      }  
		                  }, 
		                  {
		                      title: '名称',
		                      field: 'title',
		                      align: 'center',
		                      width:'10%',
		                      cellStyle:formatTableUnit,
		                      formatter:operateOpinionFormatter
		                  },
		                  {
		                      title: '内容',
		                      field: 'content',
		                      align: 'center',
		                      width:'15%',
		                      cellStyle:formatTableUnit,
		                      formatter:operateOpinionFormatterContent
		                  },
		                  
		                  {
		                      title: '状态',
		                      field: 'status',
		                      align: 'center',
		                      width:'5%',
		                      formatter:function(value,row,index){  
		   	                  if(row.status==-1){
		   	                	return '<button class="btn-xs btn-warning">下架</button> ';  
		   	                  	}else if(row.status==1){
		   	                  	return '<button class="btn-xs btn-info" >上架</button> '; 
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
		                      width:'15%',
		                      formatter:function(value,row,index){
			                   //编辑
		                       var a = '<a  class=" btn-sm btn-info" data-toggle="modal" data-target="#modal-form" onclick="selectResourceById('+row.id+')"><i class="fa fa-edit" ></i> 编辑</a> ';  
		                       //删除
		                       var b = '<a  class=" btn-sm btn-danger"   onclick="deleteResource('+ row.id + ')"><i class="fa fa-trash-o" ></i> 删除</a> '; 
			                   //下架
		                       var c = '<a  class=" btn-sm btn-danger"  title="下架后前台将无法展示" onclick="updateResource('+ row.id + ',-1)"><i class="fa fa-hand-o-down" ></i> 下架</a> '; 
		                       //上架
		                       var d = '<a  class=" btn-sm btn-primary"  title="上架后将在前台展示" onclick="updateResource('+ row.id + ',1)"><i class="fa fa-hand-o-up" ></i> 上架</a> '; 
		                   	 	if(row.status==-1){
		                   	 	  return d+b;  
		                   	 	}else if(row.status==1){
		                   	 	  return a+c;  
		                   	 	}
		                       return a+b;  
		                    } 
		                  }
		              ]
		      });
	  }
	
			//传参数到后台
		function queryParams(params){
	        return{
	            //每页多少条数据
	            pageSize: params.limit,
	            page:(params.offset)/params.limit+1,
	            title:$(".search .form-control").val(),
	            content:$(".search .form-control").val(),
	            status:1,
	        };
	    }
			
		
			
		var selectResourceById=function(id){
			var params ={
				id:id
				};
			$.ajax({
                   url:'../selectResourcecById',    
                   type:'post',
                   data:params,
                   dataType:'json',    
                   success:function (data) { 
                    if(data.status==200){
                    	$("#newTitle").val(data.resource.title);
                    	$("#newContent").val(data.resource.content);
                    	$("#newLink").val(data.resource.link);
                    	$("#newPassword").val(data.resource.password);
                    	var updateButton=' <button class="btn btn-sm btn-primary pull-right m-t-n-xs" onclick="updateResource('+data.resource.id+',null)" type="button"><strong>提交</strong></button>'
                    	$("#update").html(updateButton);
                    }else if(data.status==0){
                    	swal("查询失败", "不存在该类别信息", "error");
                    }	
                    },    
        		    error:function(){
        		    	swal("查询错误", "请重新操作", "error");
        		    }	
                }); 
			
		};
		
		//设置 字数不超过宽度限制
		  var operateOpinionFormatter=function(value,row,index){ 
			  var title="";
        	  var resoureNameLow=$(".search .form-control").val().toLowerCase();
        	  var resoureName=$(".search .form-control").val();
        	  var strStartIndex="";
        	  var strEndIndex="";
        	  if(value.search(resoureName)!=-1||value.toLowerCase().search(resoureNameLow)!=-1){
        		  var strs= new Array();
            	  strs=value.split("");
            	  strStartIndex=value.indexOf(resoureName);
            	  strEndIndex = strStartIndex+resoureName.length-1;
            	  if(value.toLowerCase().search(resoureNameLow)!=-1){
            		  strStartIndex = value.toLowerCase().indexOf(resoureNameLow);
            		  strEndIndex = strStartIndex+resoureNameLow.length-1;
            	  }
        		  for(var i=0;i<strs.length;i++){
        			  if(i>=strStartIndex&&i<=strEndIndex){
        				  title+='<span style="color:#000;font-weight:bold;">'+strs[i]+'</span>';
        			  }else{
        				  title+='<span >'+strs[i]+'</span>';
        			  }
        		  }
        	  }else{
        		  title=value;
        	  }
        	  if(value.length>15){
          		  var num=strEndIndex-strStartIndex;
          		  var index=strStartIndex-4;
          		  if(index<0){
          			  index=0;
          		  }
          		  if(resoureName==""){
          			  return "<a href='"+row.link+"'><span  title='密码:"+row.password+"'>"+title.substring(0,150)+"..."+"</span></a>"; 
          		  }else{
          			  return "<a href='"+row.link+"'><span  title='密码:"+row.password+"'>"+title.substring(15*index,(15*index)+(num+1)*51+(9-num)*15)+"..."+"</span></a>"; 
          		  }
          	  }else{
          		  return  "<a href='"+row.link+"'><span  title='密码:"+row.password+"'>"+title.substring(0,title.length)+"</span></a>"; 
          	  }
	        }
		  
		//设置 字数不超过宽度限制
		  var operateOpinionFormatterContent=function(value,row,index){ 
			  var title="";
        	  var resoureNameLow=$(".search .form-control").val().toLowerCase();
        	  var resoureName=$(".search .form-control").val();
        	  var strStartIndex="";
        	  var strEndIndex="";
        	  if(value.search(resoureName)!=-1||value.toLowerCase().search(resoureNameLow)!=-1){
        		  var strs= new Array();
            	  strs=value.split("");
            	  strStartIndex=value.indexOf(resoureName);
            	  strEndIndex = strStartIndex+resoureName.length-1;
            	  if(value.toLowerCase().search(resoureNameLow)!=-1){
            		  strStartIndex = value.toLowerCase().indexOf(resoureNameLow);
            		  strEndIndex = strStartIndex+resoureNameLow.length-1;
            	  }
        		  for(var i=0;i<strs.length;i++){
        			  if(i>=strStartIndex&&i<=strEndIndex){
        				  title+='<span style="color:#000;font-weight:bold;">'+strs[i]+'</span>';
        			  }else{
        				  title+='<span >'+strs[i]+'</span>';
        			  }
        		  }
        	  }else{
        		  title=value;
        	  }
        	  if(value.length>15){
          		  var num=strEndIndex-strStartIndex;
          		  var index=strStartIndex-4;
          		  if(index<0){
          			  index=0;
          		  }
          		  if(resoureName==""){
          			  return "<span title='"+value+"'>"+title.substring(0,150)+"..."+"</span>"; 
          		  }else{
          			  return "<span title='"+value+"'>"+title.substring(15*index,(15*index)+(num+1)*51+(9-num)*15)+"..."+"</span>"; 
          		  }
          	  }else{
          		  return  "<span  title='"+value+"'>"+title.substring(0,title.length)+"</span>"; 
          	  }
	        }
		
		
		var formatTableUnit=function (value, row, index) {
		  return {
		      css: {
		          "overflow": 'hidden',
		          "text-overflow":'ellipsis',
		          "white-space":'nowrap'
		      }
			};
		};
		
		
		
	 	var updateResource=function(id,status){
	 		var params={
	 				'id':id,
        			'title':$("#newTitle").val(),
        			'content':$("#newContent").val(),
        			'link':$("#newLink").val(),
        			'password':$("#newPassword").val(),
        	};
	 		if(status!=null&&status!=""){
	 			params ={
	 					'id':id,
	        			'status':status,
	        	};
	 		}
	 			 $.ajax({
	                 url:'../updateResource',    
	                 type:'post',
	                 data:params,
	                 dataType:'json',    
	                 success:function (data) { 
	                  if(data.status==200){
	                	initResourceCount();
	                	$("#modal-form").modal('hide');
	                  	$("#allResource").bootstrapTable('refresh');
	                  	swal("更新成功", "", "success");
	                  }else if(data.status==0){
	                	  swal("更新失败", "", "error");
	                  }	
	                  },    
	      		    error:function(){
	      		    	swal("更新错误", "请重新操作", "error");
	      		    }	
	              });	
	 		
	 	}
		
		var deleteResource=function(id){
			var params ={
	 				'id':id,
        	};
			swal({
	             title: "确定要删除该资源吗",
	             text: "删除后将无法恢复，请谨慎操作！",
	             type: "warning",
	             showCancelButton: true,
	             confirmButtonColor: "#DD6B55",
	             confirmButtonText: "删除",
	             closeOnConfirm: false
	         }, function () {
	        	 
	        	 $.ajax({
	                 url:'../deleteResource',    
	                 type:'post',
	                 data:params,
	                 dataType:'json',    
	                 success:function (data) { 
	                  if(data.status==200){
	                	  $("#allResource").bootstrapTable('refresh');
	                	  initResourceCount();
	                	  swal("删除成功！", "", "success");
	                  }else{
	                	  swal("删除失败", "请重新操作", "error");
	                  }	
	                  },    
	      		    error:function(){
	      		    	swal("删除错误", "请重新操作", "error");
	      		    }	
	              });
	         });
			
	 		 
		};
	 	
        var addResource=function(){
          var params ={
        			title:$("#title").val(),
        			content:$("#content").val(),
        			link:$("#link").val(),
        			password:$("#password").val(),
        	};
            $.ajax({
                   url:'../addResource',    
                   type:'post',
                   data:params,
                   dataType:'json',    
                   success:function (data) { 
                    if(data.status==200){
                    	$("#allResource").bootstrapTable('refresh');
                    	initResourceCount();
                    	$("#title").val("");
                    	$("#content").val("");
                    	$("#link").val("");
                    	$("#password").val("");
                    	swal("添加成功", "", "success");
                    }	
                    },    
        		    error:function(){
        		    	swal("添加资源错误", "请重新操作", "error");
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
        
    </script>


</body>

</html>
