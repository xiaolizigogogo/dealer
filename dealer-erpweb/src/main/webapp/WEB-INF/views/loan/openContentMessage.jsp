<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String uuid = request.getParameter("uuid");
%>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
#new_message {
	font-size: 30px;
}

div.test {
	padding-left:30px;
	width: 1150px;
	border: 0px solid #000000;
	word-wrap: break-word;
}
</style>
</head>
<body>
	<input type="hidden" value="<%=uuid%>" id="uuid" name="uuid" />
	<br />
	<br />
	<div class="modal-header" id="header"
		style="position: static; background: #fff;">
		<h4 class="modal-title" id="myModalLabel" style="font-size: 16px;">消息内容</h4>
	</div>
	<div id="new_message" class="test"></div>
	
</body>
<script>
	$(function() {
		init1();
	});
	function init1() {
		//alert($("#uuid").val());
		var context = "";
		$.ajax({
			url : "/admin/noti/queryMessageOnly",
			type : "post",
			data : {
				"uuid" : $("#uuid").val()
			},
			success : function(data) {
				//for(var i=0;i<data.message.length;i++){
				debugger;
				$("#new_message").append(data.sumMessage);
				//}

			}
		})

	}
</script>
</html>