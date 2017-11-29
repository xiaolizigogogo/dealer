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
    <script src="${basePath}/js/loan/imageUpLoadTile.js"></script>

</head>

<body>
        <form class="form-inline clearfix" action="javascript:;" id="taskLinkForm" method="POST">
        <c:forEach items="${attachmentParentInfos}" var="parent" >
 			${parent.name}<br>
          	<c:forEach items="${attachmentInofs}" var="item" >
          	<c:if test="${parent.id eq item.attachmentParentId}">
          	<input type="checkbox" name="attachmentInfos" value="${item.id}" id="${item.attachmentCode}">${item.attachmentName}
          	</c:if>
          	</c:forEach>
          	<br>
          </c:forEach>
            <div class="btn-area">
                <button  class="btn btn-01" id="submit"  onclick="submitHandler(this)">提交申请</button>
                  <button  class="btn btn-01" id="close"  onclick="closethis(this)">关闭</button>
            </div>
			<input type="hidden" name="taskCode" id="taskCode" >
        </form>
</body>

<script type="text/javascript">
$(function(){
	var id=$("#customer_id_hidden").val();
	$("#taskCode").val(id);
	$.ajax({
		url:"/admin/loan/getTaskAttachmentLink?taskCode="+id,
		type:"get",
		success:function(data){
			debugger;
			var attachmentInfos=data.attachmentInfos;
			for(var i=0;i<attachmentInfos.length;i++){
				var attachmentInfo=attachmentInfos[i];
				var obj=$("#"+attachmentInfo.attachmentCode);
				if(obj.length>0){
					$(obj).attr("checked","checked");
				}
			}
		}
	})
});
var submitHandler=function(obj){
	debugger;
	$.ajax({
		url:"/admin/loan/modifyTaskAttachmentLink",
		type:"post",
		data:$("#taskLinkForm").serialize(),
		success:function(data){
			alert("操作成功")
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
