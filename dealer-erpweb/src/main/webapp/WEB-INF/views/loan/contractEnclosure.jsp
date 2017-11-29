<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link type="text/css" rel="stylesheet" href="${basePath}/css/dropZone.css" />
<link type="text/css" rel="stylesheet" href="${basePath}/js/layer/skin/layer.css" />
<link type="text/css" rel="stylesheet" href="${basePath}/css/jquery.fileupload-ui.css" />
<link type="text/css" rel="stylesheet" href="${basePath}/css/jquery.fileupload.css" />
<link type="text/css" rel="stylesheet" href="${basePath}/js/completer/completer.min.css" />
<link type="text/css" rel="stylesheet" href="${basePath}/css/bootstrap-datetimepicker.min.css">
<script type="text/javascript" src="${basePath}/js/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${basePath}/js/jquery/jquery.min.js"></script>
<script type="text/javascript" src="${basePath}/js/jquery/jquery.ui.widget.js"></script>
<script type="text/javascript" src="${basePath}/js/jquery/jquery.iframe-transport.js"></script>
<script type="text/javascript" src="${basePath}/js/jquery/jquery.fileupload.js"></script>
<script type="text/javascript" src="${basePath}/js/other.js"></script>
<script type="text/javascript" src="${basePath}/js/my.js"></script>
<script type="text/javascript" src="${basePath}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${basePath}/js/layer/layer.js"></script>
<script type="text/javascript" src="${basePath}/js/completer/completer.min.js"></script>
<script src="${basePath}/js/uploadPreview.js" type="text/javascript"></script>
<script src="${basePath}/js/bootstrap-datetimepicker.min.js"></script>
<script src="${basePath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="${basePath}/js/datetimepicker.js"></script>
<script src="${basePath}/js/jquery.validate.js"></script>
<script type="text/javascript" src="${basePath}/js/lightbox.js"></script>
<link rel="stylesheet" href="${basePath}/css/lightbox.min.css"/>
<body>
<div class="modal-header"> <a type="button" href="javascript:void(0)" onclick="closePage();" class="close"><span aria-hidden="true">&times;</span></a>
  <h4 class="modal-title" id="myModalLabel" style="font-size:16px;">合同附件<small style="padding-left:20px; font-size:14px;" class="text-muted" id="orderid"></small></h4>
</div>
<div class="modal-body clearfix" style="background:#eee;" >
  <div class="from_box">
    <div class="from_tit clearfix">
      <h3 class="pull-left">个人信息</h3>
    </div>
    <div class="img_list" >
                <ul class="list-inline" id="display">
   
    </ul>
    </div>
  </div>
</div>
<iframe src="" id="downloadIframe" style="display:none;"> </iframe>
</body>
<script type="text/javascript" >

$(function(){
	
	var orderid = $("#customer_id_hidden").val().split(":")[1];
	var customer_id_hidden=$("#customer_id_hidden").val().split(":")[0];
	$("#orderid").html("订单号："+orderid)
	
	$.ajax({     
		url : "${basePath}/admin/loan/review/recordnew/" + customer_id_hidden + ".html",
		type : "get",
		dataType : "json",	
		success : function(data) {
			var enclosure="";
			for(var q=0;q<data.loanInfoAttachmentssize;q++){
				path=data.loanInfoAttachments[q].attachmentPath;
				var c=data.loanInfoAttachments[q].id;
				var attachmentTitle=data.loanInfoAttachments[q].attachmentTitle.split("-")[0];
				type=data.loanInfoAttachments[q].attachmentType;
				if(type!="telephoneRecordings"){
				var a="<li><div class='file_img'> <p class='tools'>"
					+"<a href='#' onclick='pictureDownload(this);' title='保存'  id='"+c+"'  ><i class='fa  fa-save'></i></a>"
					+"<a href='"+path+"' id='enclosure' data-lightbox='example-set' data-title='"+attachmentTitle+"'>"
					+ "<i class='fa  fa-search-plus'></i></a></p>"
				    +"<img src='"+path+"' id='enclosure'> </div></li>"
				}else{
				var a='<li> <div class="file_img"> <p class="tools">'
					 +'<a  href="#" title="下载"  onclick="pictureDownload(this)" id="'+c+'" ><i class="fa fa-cloud-download" >'
					 +'</i></a></p><img class="example-image" src="${basePath}/img/luyin.jpg" alt="录音"/></div></li>';
				 }
			if(type=="visiteCheckReview"){
				enclosure=enclosure;
			}else{
			enclosure=enclosure+a;
			}
			}			
			$("#display").html(enclosure);		
		}})
	
})
     function pictureDownload(obj){
       var route= $(obj).attr("id");
       $("#downloadIframe").attr("src","/admin/loan/getroute?id=" + route);
     }
     function closePage(){
		$("#lightboxOverlay").remove();
		$("#lightbox").remove();
		$("#order_modal").empty();
		colsediv(0);
	}
     

</script>
<%-- <script type="text/javascript" src="${basePath}/js/loanerDetail.js"></script> --%>
