<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible"
	content="IE=9; IE=8; IE=7; IE=edge; chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Cache-Control" content="no-transform">
<title>e车贷管理系统—找回密码</title>
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

<script type="text/javascript">
	function nextUpdate(data) {
		$
				.ajax({
					type : "POST",
					url : "/admin/user/compareverifiCode",
					data : {
						verifiCode : $("#verifiCode").val(),
						mobile : $("#mobile").val()
					},
					success : function(data) {
						debugger;
						if (data == "success") {
							alertMessage("正确", null);
							window.location.href = "/admin/loan/updatepasswordformobile.html?mobile="
									+ document.form1.mobile.value
									+ "&date="
									+ document.form1.date.value;
						} else {
							alertMessage("您输入的验证码错误", null);
						}
					}
				})
	}
</script>

</head>
<body>

	<h1 class="text-center">
		<img src="/img/login_logo.png"><br />
		<p>e车贷金融管理系统</p>
	</h1>
	<div class="container">
		<div class="col-lg-6 col-lg-offset-3 clearfix" id="login_box">
			<h2>
				密码找回<small>请输入您的手机号</small>
			</h2>
			<form name="form1">
				<input type="hidden" id="date" value="" />
				<div class="form-group">
					<input type="text" class="form-control" id="mobile" name="mobile"
						placeholder="请输入您的手机号">
				</div>
				<div class="clearfix">
					<input type="button" id="phonenum" class="btn btn-danger col-sm-3"
						value="发送短信" />
				</div>
				<br />
				<div class="form-group">
					<input type="text" class="form-control" id="verifiCode"
						name="verifiCode" placeholder="请输入验证码">
				</div>
				<div class="clearfix">
					<button type="button" class="btn btn-danger col-sm-3"
						onclick="nextUpdate()">下一步</button>
				</div>
			</form>
		</div>
	</div>
	<div id="qs_box" class="modal modal_sml fade in"
		style="left: 40% !important; top: 30% !important;">
		<div class="modal-header">
			<a type="button" href=" " onclick="colsediv(0)" class="close"><span
				aria-hidden="true">&times;</span></a>
			<h4 class="modal-title" id="myModalLabel" style="font-size: 16px;">提示</h4>
		</div>
		<div class="modal-body">
			<p class="p_tip">
				<i class="fa fa-check-circle"></i> <span id="alert_message">

				</span>
			</p>
			<div class="btn_list clearfix">
				<a class="btn btn-danger btn-sm" href="javascript:void(0)"
					onclick="colsediv(0)">取消</a> <a class="btn btn-default btn-sm"
					href="javascript:void(0)" onclick="colsediv(0)" id="ok_button">确定</a>
			</div>
		</div>
	</div>
	<div id="fade2" class="black_overlayx"></div>
</body>
<script>
	$(function() {
		/*仿刷新：检测是否存在cookie*/
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
</html>
