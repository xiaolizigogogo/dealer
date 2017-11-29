<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.utonw.utonbase.core.erpcommon.config.ParamterControl" %>
<% String mobile = request.getParameter("mobile"); %>
<% String date = request.getParameter("date"); %>
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
<link rel="stylesheet" type="text/css" href="${basePath}/css/login.css" />

<script type="text/javascript">
		function  resets(){
			debugger;
			var  newpass=$("#newpass").val();
			var  newpassword=$("#newpassword").val();
			if (newpass == null || newpass == "" || newpassword == null || newpassword == "") {
		        alertMessage("新密码不能为空！",null);
		        return;
		    }
			if(newpass != newpassword){
				alertMessage("您两次输入的密码不一致请重新输入",null);
				return;
			}
			$.ajax({
				type:"POST",
				url:"/admin/user/updatethePassword?mobile=" + $("#mobile").val()+"&date="+$("#date").val()+"&newpass="+newpass,
				success:function(data){
					
					if(data.a=="yes"){
						alertMessage("修改密码成功请重新登录","login1()");
					}else if(data.a=="overtime"){
						alertMessage("已超时请重新发送短信","again()");
					}
					else{
						alertMessage("修改密码失败请重新修改",null);
					}
					
				}
			})

		}
		function login1(){
			window.location.href="/admin/login.html";
		}
		function again() {
			window.location.href="/admin/loan/forget.html";
		}
</script>

</head>
<body >
<input type="hidden" value="<%=mobile %>" id="mobile" />
<input type="hidden" value="<%=date %>" id="date" />
<h1 class="text-center"> <img src="<%=ParamterControl.LOGO_DISPLAY%>"><br />
  <p><%=ParamterControl.TITLE_DISPLAY%>金融管理系统</p>
</h1>
<div class="container">
  <div class="col-lg-6 col-lg-offset-3 clearfix" id="login_box">
  	<h2 style="padding-top:20px;">重置密码</h2>
    <form>
    <div class="form-group">
        <label for="exampleInputPassword1">新密码</label>
        <div class="input-group">
          <input type="password" class="form-control" id="newpass" placeholder="请输入密码">
          <span class="input-group-addon"> <i class="fa fa-unlock-alt"></i> </span> </div>
      </div>
      <div class="form-group">
        <label for="exampleInputPassword1">确认新密码</label>
        <div class="input-group">
          <input type="password" class="form-control" id="newpassword" placeholder="请输入密码">
          <span class="input-group-addon"> <i class="fa fa-unlock-alt"></i> </span> </div>
      </div>
      <div class="clearfix">
        <button type="button" class="btn btn-danger col-sm-3"  onclick="resets()" >重置密码</button>
      </div>
    </form>
  </div>
</div>
<div id="qs_box" class="modal modal_sml fade in" style="left:40% !important;top:30% !important;">
		<div class="modal-header">
			<a type="button" href=" " onclick="colsediv(0)"
				class="close"><span aria-hidden="true">&times;</span></a>
			<h4 class="modal-title" id="myModalLabel" style="font-size: 16px;">提示</h4>
		</div>
		<div class="modal-body">
			<p class="p_tip">
				<i class="fa fa-check-circle"></i> 
				<span id="alert_message">
				
				</span>
			</p >
			<div class="btn_list clearfix">
				<a class="btn btn-danger btn-sm" href="javascript:void(0)"
					onclick="colsediv(0)">取消</a>
				<a class="btn btn-default btn-sm"
					href="javascript:void(0)" onclick="colsediv(0)" id="ok_button">确定</a>
			</div>
		</div>
	</div>
	<div id="fade2" class="black_overlayx"></div>
</body>
</html>
