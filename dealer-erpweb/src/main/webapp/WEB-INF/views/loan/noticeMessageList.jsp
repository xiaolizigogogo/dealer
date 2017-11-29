<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<%@include file="../common/taglibs.jsp"%>
<link href="${basePath}/css/bootstrap/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${basePath}/css/bootstrap/bootstrap-table.css">
<link rel="stylesheet" type="text/css"
	href="${basePath}/css/libs/font-awesome.css" />
<link rel="stylesheet" type="text/css" href="${basePath}/css/common.css" />
<script src="${basePath}/js/bootstrap.js"></script>
<script src="${basePath}/js/common.js"></script>
<script src="${basePath}/js/layer/layer.js"></script>
<script type="text/javascript"
	src="${ basePath }/js/jquery/jquery.min.js"></script>
<title>Insert title here</title>
<script>
	$(function() {
		init();
	});
	function init() {
		$
				.ajax({
					type : 'POST',
					url : '${basePath}/admin/noti/mySendedMessage',
					dataType : "json",
					success : function(data) {
						debugger;
						var con = "";
						if (data.myMessage.length == 0) {
							con = "<tr class='no-data'><td align='center' colspan='4'>暂无数据</td></tr>";
							$("#messageForMe").html(con);
						} else {
							for (i = 0; i < data.myMessage.length; i++) {
								var uuid = data.myMessage[i].uuid;
								var userid = data.myMessage[i].userid;                
								con = "<tr>"
										+ "<td>"
										+ (i + 1)
										+ "</td>"
										+ "<td><a href='javascript:void(0);' id='"
										+ uuid
										+ userid
										+ "' onclick='openMyMessage(this)'>"
										+ data.myMessage[i].title
										+ "</a></td>"
										+ "<td>"
										+ data.myMessage[i].createTime
										+ "</td>"
										+ "<td><a href='#' onclick='deleteMsgAll(this)' id='"
										+ uuid + "'>删除</a></td>" + "</tr>";

								$("#messageForMe").append(con);
								//alert(data.myMessage[0].title);
							}
						}

					}
				});
	}
	function deleteMsgAll(id) {
		//debugger;
		var uuid = $(id).attr("id");
		var dialogMsg = "你确定删除么？此操作将删除所有用户接收的此消息！";
		alertMessage(dialogMsg, 'deleteMessageAll("' + uuid + '")', 'qs_box1');

	}
	function deleteMessageAll(uuid) {
		$.ajax({
			type : "POST",
			url : "/admin/noti/deleteAllMessage",
			dataType : "text",
			data : {
				"uuid" : uuid
			},
			success : function(data) {
				//debugger;
				if (data == "0000") {
					layer.msg("操作成功!", {
						icon : 1,
						time : 1000
					}, function() {
						//colsediv(0);
						$("td").remove();
						init();
						//$("#user_modal").load("/admin/loan/noticeMessages.html");
						//opendiv("user_modal");
						return true;
					});
				} else {
					{
						layer.msg("操作失败!");
						return false;
					}
				}
			},
			error : function() {
				layer.msg("未知错误!");
				return false;
			}

		});
	}
	function openMyMessage(id) {
		debugger;
		var uuid = $(id).attr("id");
		$("#content").load("/admin/loan/openContentMessage.html?uuid=" + uuid);
	}
</script>
</head>
<body>
	<div class="tools_bar ">
		<div class="bar_tit clearfix">
			<h2 class="pull-left">公告列表</h2>
		</div>
	</div>
	<div class="tools_bar col-lg-12">
		<div class="list_btn clearfix">
			<ul class="list-inline">
				<!-- <li><a class="btn btn-danger"   href = "javascript:void(0)"  onclick="opendiv(0)"> <i class="fa fa-plus"></i>新增</a></li>-->
				<li><a class="btn btn-danger"
					href="/admin/loan/messageGroup.html"> <i class="fa fa-plus"></i>新增公告
				</a></li>
			</ul>
		</div>
	</div>
	<div class="list_box col-sm-12">
		<table class="table table-bordered table-striped">
			<thead>
				<tr>
					<th>序号</th>
					<th>标题</th>
					<th>发送时间</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody id="messageForMe">
			</tbody>
		</table>
	</div>
	<div id="qs_box" class="modal modal_sml fade in"></div>
	<div id="fade2" class="black_overlayx"></div>
	<div id="content"></div>
	<div id="qs_box1" class="modal modal_sml fade in">
		<div class="modal-header">
			<a type="button" href="javascript:void(0)"
				onclick="colsediv('qs_box1')" class="close"><span
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
					onclick="colsediv('qs_box1')">取消</a> <a
					class="btn btn-default btn-sm" href="javascript:void(0)"
					onclick="colsediv('qs_box1')" id="ok_button">确定</a>
			</div>
		</div>
	</div>
</body>
</html>