﻿<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.utonw.utonbase.core.erpcommon.config.ParamterControl"%>
<c:set var="basePath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible"
	content="IE=9; IE=8; IE=7; IE=edge; chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Cache-Control" content="no-transform">
<title><%=ParamterControl.TITLE_DISPLAY%>金融管理系统</title>
<%@include file="common/index.jsp"%>
<link rel="stylesheet" type="text/css" href="${basePath}/css/login.css" />
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <![endif]-->
<script type="text/javascript">
	$(function() {
		if (window.parent != window){
			window.top.location.href = location.href;
		}
		$(document).keydown(function(event) {
			if (event.keyCode == 13) {
				login();
			}
		});
	});

	function login() {
		var jobNumber = $("#jobNumber").val();
		if ("" == jobNumber.trim()) {
			layer.msg("用户名不能为空!");
			return;
		}
		var password = $("#password").val();
		if ("" == password.trim()) {
			layer.msg("密码不能为空!");
			return;
		}
		var load;
		$
				.ajax({
					type : "POST",
					url : "${basePath}/admin/user/loginHtml.html",
					beforeSend : function() {
						load = layer.load();
					},
					data : {
						jobNumber : jobNumber,
						password : password
					},
					success : function(data) {
						debugger;
						if (data == "success") {
							layer.close(load);
							loginSubmitSms();
//							window.location.href = "${basePath}/admin/user/layout/index.html";
						    window.location.href = "${basePath}/admin/page/merchant/homepage/index.html";

						} else if (data == "failure") {
							layer.close(load);
							layer.msg("用户名或密码错误！");
						} else if (data == "outdate") {
							layer.close(load);
							layer.msg("授权文件过期，请联系系统管理员！");
						}
					}
				});
	}

	function loginSubmitSms() {
		var jobNumber = $("#jobNumber").val();
		$.ajax({
			type : 'POST',
			url : '/admin/user/SysgeLoginSubmitSms',
			data : {

				"jobNumber" : jobNumber
			},
			success : function(data) {
			}
		});
	}
</script>
</head>
<!--BUG068-[20160629]-->
<body id="AjaxTimeOutMark">
	<!--BUG068-[20160629]-->
	<h1 class="text-center">
		<img src="<%=ParamterControl.LOGO_DISPLAY%>"><br />
		<p>金融管理系统</p>
	</h1>
	<div class="container">
		<div class="col-lg-6 col-lg-offset-3 clearfix" id="login_box">
			<form>
				<div class="form-group">
					<label>用户名</label>
					<div class="input-group">
						<input type="text" class="form-control" id="jobNumber"
							name="jobNumber" placeholder="请输入用户名"> <span
							class="input-group-addon"> <i class="fa fa-user"></i>
						</span>
					</div>
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">密码</label>
					<div class="input-group">
						<input type="password" id="password" name="password"
							class="form-control" placeholder="请输入密码"> <span
							class="input-group-addon"> <i class="fa fa-unlock-alt"></i>
						</span>
					</div>
				</div>
				<div class="clearfix">
					<button type="button" class="btn btn-danger col-sm-3"
						onclick="login()">登录</button>
					<a href="${basePath}/admin/loan/forget.html" class="btn btn-link">&nbsp;&nbsp;&nbsp;忘记密码？</a>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
