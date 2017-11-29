<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<% String userid = request.getParameter("userid"); %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>


  <script src="${basePath}/js/lightbox.js"></script>
  <script type="text/javascript" src="${basePath}/js/jquery/jquery.min.js"></script>
  <script type="text/javascript" src="${basePath}/js/jquery/jquery.ui.widget.js"></script>
  <script type="text/javascript" src="${basePath}/js/jquery/jquery.iframe-transport.js"></script>
  <script type="text/javascript" src="${basePath}/js/jquery/jquery.fileupload.js"></script>
  <script type="text/javascript" src="${basePath}/js/other.js"></script>
  <script type="text/javascript" src="${basePath}/js/my.js"></script>
  <script type="text/javascript" src="${basePath}/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="${basePath}/js/layer/layer.js"></script>
  <script type="text/javascript" src="${basePath}/js/completer/completer.min.js"></script>
	<script type="text/javascript" src="${basePath}/js/common.js"></script>
  <link rel="stylesheet" href="${basePath}/css/bootstrap-datetimepicker.min.css">
  <script src="${basePath}/js/bootstrap-datetimepicker.min.js"></script>
  <script src="${basePath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
  <script src="${basePath}/js/datetimepicker.js"></script>
  <style type="text/css"> 
	.div0101{
		width:800px;
		height:800px;
	}
  </style>
</head>
<body>
	<div class="modal-header" id="header" style="position:static; background:#fff;"> <a type="button" href="javascript:void(0)" onclick="closePage(0)" class="close"><span aria-hidden="true">×</span></a>
		<h4 class="modal-title" id="myModalLabel" style="font-size:16px;">站内消息</h4>
	</div>
	<table class="table table-bordered table-striped" style="margin-bottom:0px;">
        <thead>
            <tr>
                <th>序号</th>
				<th>消息标题</th>
				<th>发送人</th>
				<th>发送时间</th>
				<th>操作</th>
            </tr>
        </thead>
        <tbody id="n_message">
        </tbody>
    </table>

<input type="hidden" value="<%=userid %>" id="userid" name="userid"/>
<div id="qs_box1" class="modal modal_sml fade in">
		<div class="modal-header">
			<a type="button" href="javascript:void(0)" onclick="colsediv(0)"
				class="close"><span aria-hidden="true">&times;</span></a>
			<h4 class="modal-title" id="myModalLabel" style="font-size: 16px;">提示</h4>
		</div>
		<div class="modal-body">
			<p class="p_tip">
				<i class="fa fa-check-circle"></i> 
				<span id="alert_message">
				
				</span>
			</p>
			<div class="btn_list clearfix">
				<a class="btn btn-danger btn-sm" href="javascript:void(0)"
					onclick="colsediv(0)">取消</a>
				<a class="btn btn-default btn-sm"
					href="javascript:void(0)" onclick="colsediv(0)" id="ok_button">确定</a>
			</div>
		</div>
	</div>

	<div class="modal-footer ">
		<p class="col-sm-2 ">
			<a href="javascript:void(0)" onClick="closePage(0);" class="btn btn-default btn-block">关闭</a>
		</p>
	</div>
	<div id="user_modal"></div>
	<div id="content" ></div>
	<div id="content1" ></div>
</body>
<script>
	//1.初始化页面 init方法,第一次请求不需要设置参数，需要设置页面初始化数据
	$(function() {
		init();
	});
	function init() {
		//alert($("#uuid").val());
		var context = "";
		$.ajax({
			url:"/admin/noti/queryMessageByuuid",
			type:"post",
			data:{
				"userid":$("#userid").val()
			},
			success:function(data){
				debugger;
				for(var i=0;i<data.message.length;i++){
						var uuid=data.message[i].uuid;
						var userid = data.message[i].userid;
						context = "<tr>"
						+ "<td>"+(i+1)+"</td>"
						+ "<td><a href='javascript:void(0);' id='"+uuid+userid+"' onclick='openContent(this)'>"+data.message[i].title+"</a></td>"
						
						+ "<td>" + data.message[i].realname + "</td>"
						+ "<td>" + data.message[i].createTime + "</td>"
						+ "<td><a href='#' id='"+uuid+userid+"' onclick='deleteMsg(this)'>删除</a></td>"
						+ "</tr>";					
					$("#n_message").append(context);
				}
			}
		})
		
		
	}
	function deleteMsg(id){
		//debugger;
		var uuid=$(id).attr("id");
		var dialogMsg = "你确定删除此信息吗？";
        alertMessage(dialogMsg,'deleteMessageNow("'+uuid+'")','qs_box1');
		
	}
	
	function openContent(id){
		debugger;
		$("#content").show();
		var uuid=$(id).attr("id");
		$("#content").load("/admin/loan/openContentMessage.html?uuid="+uuid);	
	}
	function deleteMessageNow(uuid){
		
		$.ajax({
			type: "POST",
			url: "/admin/noti/deleteMessage",
			dataType: "text",
			data: {
				"uuid": uuid
			},
			success: function (data) {
					//debugger;
				if (data == "0000") {
					layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
						//colsediv(0);
						$("td").remove();
						$("#content").hide();
						init();
						return true;
						
					});
				} else {
					{
						layer.msg("操作失败!");
						return false;
					}
				}
			},
			error: function () {
				layer.msg("未知错误!");
				return false;
			}

		});
	}
	
	function opendiv() {
 		$(".modal").css("display", "block");
 		$("#fade2").css("display", "block");
 		parent.document.getElementById('fade1').style.display='block';

 	
 	}
	function closePage(){
		colsediv(0);
	}
</script>
</html>