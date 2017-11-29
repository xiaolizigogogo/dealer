<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.utonw.utonbase.core.erpcommon.config.ParamterControl" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible"
	content="IE=9; IE=8; IE=7; IE=edge; chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Cache-Control" content="no-transform">
<title><%=ParamterControl.TITLE_DISPLAY%>管理系统—找回密码</title>
<%@include file="../common/taglibs.jsp"%>
<link rel="stylesheet"
	href="${basePath}/css/bootstrap-datetimepicker.min.css">
<%--     <link rel="stylesheet" href="${ basePath }/css/bootstrap/bootstrap-table.css"> --%>
<script src="${basePath}/js/bootstrap-datetimepicker.min.js"></script>
<script src="${basePath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="${basePath}/js/datetimepicker.js"></script>
<script src="${basePath}/js/jquery.cookie.js"></script>
<link rel="stylesheet" type="text/css" href="${basePath}/css/login.css" />
<%-- <script src="${basePath}/js/uploadPreview.js" type="text/javascript"></script> --%>
</head>

<body>
	<h1 class="text-center">
		<img src="<%=ParamterControl.LOGO_DISPLAY%>"><br />
		<p><%=ParamterControl.TITLE_DISPLAY%>金融管理系统</p>
	</h1>

	<div class="container">
		<div class="col-sm-6 col-sm-offset-3 clearfix reset_box"
			id="login_box">
			<ul class="nav nav-tabs" role="tablist" id="myTab">
				<li role="presentation" class="active"><a href="#home"
					role="tab" data-toggle="tab" style="border-top-left-radius: 4px;">手机找回</a></li>
				<li role="presentation"><a href="#profile" role="tab"
					data-toggle="tab" style="border-top-right-radius: 4px;">邮箱找回</a></li>
			</ul>
			<div class="tab-content">
				<!--<h2 style="padding-top:20px;">重置密码</h2>-->
				<div role="tabpanel" class="tab-pane active" id="home">
					<form name="form1">
						<div class="input-group col-sm-8">
							<input type="text" class="form-control" placeholder="请输入您的手机号"
								id="mobile" name="mobile"> <span class="input-group-btn">
								<input type="button" id="phonenum" class="btn btn-default"
								value="发送短信" />
							</span>
						</div>
						<input type="hidden" id="date" value="" />

						<div class="form-group" style="margin-top: 15px;">
							<input type="text" class="form-control" id="verifiCode"
								name="verifiCode" placeholder="请输入验证码" style="width: 200px;">
						</div>

						<div class="clearfix">
							<button type="button" class="btn btn-danger col-sm-3"
								onclick="nextUpdate()">下一步</button>
						</div>
					</form>
				</div>
				<div role="tabpanel" class="tab-pane" id="profile">
					<form>
						<div class="form-group">
							<input type="email" class="form-control" id="txtname"
								name="txtname" placeholder="请输入您的电子邮件地址">
						</div>
						<div class="clearfix">
							<button type="button" class="btn btn-danger col-sm-3"
								onclick="sendouts()">发送邮件</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	function nextUpdate(data) {
		$.ajax({
			type : "POST",
			url : "/admin/user/compareverifiCode",
			data : {
				verifiCode : $("#verifiCode").val(),
				mobile : $("#mobile").val()
			},
			success : function(data) {
				debugger;
				if (data == "success") {
					alertMessage("正确", "xiayiye()");

				} else {
					alertMessage("您输入的验证码错误", "colsediv(0)");
				}
			}
		})
	}
	function xiayiye() {
		window.location.href = "/admin/loan/updatepasswordformobile.html?mobile="
				+ document.form1.mobile.value
				+ "&date="
				+ document.form1.date.value;
	}
</script>
<script>
	$(function() {
		/*防刷新：检测是否存在cookie*/
		if ($.cookie("captcha")) {
			var count = $.cookie("captcha");
			var btn = $('#phonenum');
			btn.val('重新获取(' + count + ')').attr('disabled', true).css('cursor',
					'not-allowed');
			var resend = setInterval(function() {
				count--;
				if (count > 0) {
					btn.val('重新获取(' + count + ')').attr('disabled', true).css(
							'cursor', 'not-allowed');
					$.cookie("captcha", count, {
						path : '/',
						expires : (1 / 86400) * count
					});
				} else {
					clearInterval(resend);
					btn.val("获取验证码").removeClass('disabled').removeAttr(
							'disabled style');
				}
			}, 1000);
		}

		/*点击改变按钮状态，已经简略掉ajax发送短信验证的代码*/
		$('#phonenum').click(
				function() {
					var myReg = /^1[3,4,5,7,8]\d{9}$/g;
					var nowt = new Date().getTime();
					var date = document.getElementById("date");
					date.value = nowt;
					var mobiless = document.form1.mobile.value;
					var mobile = $("#mobile").val();
					if (mobile == null || mobile == "") {
						alertMessage("手机号不能为空！", null);
						return;
					}
					if (!myReg.exec(mobiless)) {
						alertMessage("请输入11位正确的手机号码！");
						document.form1.mobile.focus();
						event.returnValue = false;
						return false;
					}
					var btn = $(this);
					$.ajax({
						type : "POST",
						url : "/admin/user/sendMessagePassword",
						data : {
							mobile : $("#mobile").val()
						},
						success : function(data) {
							if (data == "0000") {
								alertMessage("短信已发送请注意查收", null);
								var count = 10;
								var resend = setInterval(function() {
									count--;
									if (count > 0) {
										btn.val("重新获取(" + count + ")");
										$.cookie("captcha", count, {
											path : '/',
											expires : (1 / 86400) * count
										});
									} else {
										clearInterval(resend);
										btn.val("获取验证码").removeAttr(
												'disabled style');
									}
								}, 1000);
								btn.attr('disabled', true).css('cursor',
										'not-allowed');
								dddd = nowt;
							} else if (data == "0001") {
								alertMessage("你所输入的手机错误，不是注册手机请与客服联系", null);
							}
						}
					})

				});

	});
</script>
<script type="text/javascript">
	function sendouts() {
		var txtname = $("#txtname").val();
		if (txtname == null || txtname == "") {
			alertMessage("邮箱不能为空！", null);
			return;
		}

		$.ajax({
			type : "POST",
			url : "/admin/mail/sendmail",
			data : {
				txtname : $("#txtname").val()
			},
			success : function(data) {
				if (data.sign) {
					alertMessage("邮件已发送请注意查收", "colsediv(0)");
				} else {
					alertMessage("你所输入的邮件错误，不是注册邮箱请与客服联系", "colsediv(0)");
				}
			}
		})
	}
</script>
</html>