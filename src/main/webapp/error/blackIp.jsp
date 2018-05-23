<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>404 页面</title>
<meta name="keywords" content="">
<meta name="description"
	content="">

<link rel="shortcut icon" href="favicon.ico">

<style type="text/css">
	body {
		font-family: "open sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
		font-size: 13px;
		color: #676a6c;
		overflow-x: hidden;
		margin:0;
		padding:0px;
	}
	
	.gray-bg {
		background-color: #f3f3f4;
	}
	
	.middle-box {
		max-width: 400px;
		z-index: 100;
		margin: 0 auto;
		padding-top: 0px;
	}
	
	.text-center {
		text-align: center;
	}
	
	.middle-box h1 {
		font-size: 160px;
	}
	
	.h1,.h2,.h3,.h4,.h5,.h6,h1,h2,h3,h4,h5,h6 {
		font-family: inherit;
		line-height: 1.1;
		color: inherit;
	}
	
	h1 {
		margin: .67em 0;
		font-size: 2em;
	}
	
	.font-bold {
		font-weight: 600;
	}
	
	h3,h4,h5 {
		margin-top: 5px;
		font-weight: 600;
	}
	
	h3 {
		font-size: 16px;
	}
	
	.h3,h3 {
		font-size: 24px;
	}
	
	
	
	.h1,.h2,.h3,.h4,.h5,.h6,h1,h2,h3,h4,h5,h6 {
		font-family: inherit;
		line-height: 1.1;
		color: inherit;
	}
	
	.m-t {
		margin-top: 15px;
	}
	
	.form-inline .form-group {
		display: inline-block;
		margin-bottom: 0;
		vertical-align: middle;
	}
	
	.form-inline .form-control {
		display: inline-block;
		width: auto;
		vertical-align: middle;
		border:1px solid #1ab394;
	}
	
	.form-control,.single-line {
		background-color: #FFFFFF;
		background-image: none;
		border: 1px solid #e5e6e7;
		border-radius: 1px;
		color: inherit;
		display: block;
		padding: 6px 12px;
		-webkit-transition: border-color 0.15s ease-in-out 0s, box-shadow 0.15s
			ease-in-out 0s;
		transition: border-color 0.15s ease-in-out 0s, box-shadow 0.15s
			ease-in-out 0s;
		width: 100%;
		font-size: 14px;
	}
	
	.btn-primary {
		background-color: #1ab394;
		border-color: #1ab394;
		color: #FFFFFF;
	}
	
	.btn {
		border-radius: 3px;
	}
	
	
	
	.btn {
		display: inline-block;
		padding: 6px 12px;
		margin-bottom: 0;
		font-size: 14px;
		font-weight: 400;
		line-height: 1.42857143;
		text-align: center;
		white-space: nowrap;
		vertical-align: middle;
		-ms-touch-action: manipulation;
		touch-action: manipulation;
		cursor: pointer;
		-webkit-user-select: none;
		-moz-user-select: none;
		-ms-user-select: none;
		user-select: none;
		background-image: none;
		border: 1px solid transparent;
		border-radius: 4px;
	}
	
	button,input,select,textarea {
		font-family: inherit;
		font-size: inherit;
		line-height: inherit;
	}
	
	button,html input[type=button],input[type=reset],input[type=submit] {
		-webkit-appearance: button;
		cursor: pointer;
	}
	
	button,select {
		text-transform: none;
	}
	
	button {
		overflow: visible;
	}
	
	button,input,optgroup,select,textarea {
		margin: 0;
		font: inherit;
		color: inherit;
		
	}
	</style>
	 
</head>

<body class="gray-bg">
	<div class="middle-box text-center ">
		<h1>404</h1>
		<h3 class="font-bold">抱歉，你的Ip地址已被剔除~</h3>
		<div class="error-desc">
			申请访问~请填写理由并提交
			<form class="form-inline m-t" role="form">
				<div class="form-group">
					<input type="email" class="form-control" placeholder="请输入您的理由 …">
				</div>
				<button type="submit" class="btn btn-primary">提交</button>
			</form>
		</div>
	</div>

</body>

</html>
