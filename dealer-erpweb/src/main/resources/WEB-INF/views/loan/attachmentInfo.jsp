<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <link type="text/css" rel="stylesheet" href="${basePath}/css/dropZone.css" />
    <link type="text/css" rel="stylesheet" href="${basePath}/css/jquery.fileupload-ui.css" />
    <link type="text/css" rel="stylesheet" href="${basePath}/css/jquery.fileupload.css" />
    <link type="text/css" rel="stylesheet" href="${basePath}/js/completer/completer.min.css" />
    <link rel="stylesheet" href="${basePath}/css/bootstrap/bootstrap-table.css">
    <link rel="stylesheet" href="${basePath}/css/lightbox.min.css"/>

    <script src="${basePath}/js/lightbox.js"></script>
    <script type="text/javascript" src="${basePath}/js/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="${basePath}/js/jquery/jquery.ui.widget.js"></script>
    <script type="text/javascript" src="${basePath}/js/jquery/jquery.iframe-transport.js"></script>
    <script type="text/javascript" src="${basePath}/js/jquery/jquery.fileupload.js"></script>
    <script type="text/javascript" src="${basePath}/js/other.js"></script>
    <script type="text/javascript" src="${basePath}/js/my.js"></script>
    <script src="${basePath}/js/uploadPreview.js" type="text/javascript"></script>
    <script type="text/javascript" src="${basePath}/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${basePath}/js/layer/layer.js"></script>
    <script type="text/javascript" src="${basePath}/js/completer/completer.min.js"></script>

    <link rel="stylesheet" href="${basePath}/css/bootstrap-datetimepicker.min.css">

    <script src="${basePath}/js/bootstrap-datetimepicker.min.js"></script>
    <script src="${basePath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="${basePath}/js/datetimepicker.js"></script>
    <script src="${basePath}/js/loan/loanHelper.js"></script>

</head>

<body>
        <form class="form-inline clearfix" action="javascript:;" id="attachmentInfoForm" method="POST">
        <input id="attachment_id" name="id" type="hidden">
		<ul>
  			<li>名称：<input id="attachmentName" name="attachmentName"></li>
  			<li>Code：<input id="attachmentCode" name="attachmentCode"></li>
  			<li>类型：<input id="attachmentType" name="attachmentType"></li>
  			<li>父类型：<select class="control-sml"
												name="attachmentParentId">
											<c:forEach items="${attachmentParentInfos}" var="item">
													<option id="attachmentParentId_${item.id}" value="${item.id}">${item.name}</option>
												</c:forEach>
											</select> </li>
  			<li>是否有效：<input id="enable" name="enable"></li>
  			<li>排序值：<input id="attachmentOrder" name="attachmentOrder"></li>
  			<li>是否唯一：<input id="attachmentUnique" name="attachmentUnique"></li>
  			<li>是否必要：<input id="attachmentRequired" name="attachmentRequired"></li>
  			<li>备注：<input id="memo" name="memo"></li>
  			<li>数量：<input id="attachmentNum" name="attachmentNum" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"  
    onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'0')}else{this.value=this.value.replace(/\D/g,'')}"></li>
			</ul>
            <div class="btn-area">
                <button  class="btn btn-01" id="submit"  onclick="submitHandler(this)">提交申请</button>
                <button  class="btn btn-01" id="close"  onclick="closethis(this)">关 闭</button>
            </div>
			<input type="hidden" name="taskCode" id="taskCode" >
        </form>
</body>

<script type="text/javascript">
$(function(){
	var id=$("#attachmentId").val();
	
	debugger;
	if(id&&id.length>0){
		
		$.ajax({
			url:"/admin/loan/getAttachmentInfo?attachmentId="+id,
			type:"get",
			success:function(data){
				var item=data.attachmentInfo;
				$("#attachment_id").val(item.id);
				$("#attachmentName").val(item.attachmentName)
				$("#attachmentCode").val(item.attachmentCode)
				$("#attachmentType").val(item.attachmentType)
				$("#attachmentParentId_"+item.attachmentParentId).attr("selected","selected")
				$("#enable").val(item.enable)
				$("#attachmentOrder").val(item.attachmentOrder)
				$("#attachmentUnique").val(item.attachmentUnique)
				$("#attachmentRequired").val(item.attachmentRequired)
				$("#memo").val(item.memo)
				$("#attachmentNum").val(item.attachmentNum)
			}
		})	
	}

});
var submitHandler=function(obj){
	debugger;
	$.ajax({
		url:"/admin/loan/modifyAttachmentInfo",
		type:"post",
		data:$("#attachmentInfoForm").serialize(),
		success:function(data){
			alert("操作成功");
		}
	})
}

var closethis=function(obj){
	$("#lightboxOverlay").remove();
		$("#lightbox").remove();
		$("#order_modal").empty();
		colsediv(0);
}
</script>
</html>
