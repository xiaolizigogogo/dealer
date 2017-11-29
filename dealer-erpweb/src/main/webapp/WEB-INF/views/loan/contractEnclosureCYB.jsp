<%@ page import="com.utonw.utonbase.core.erpcommon.config.ParamterControl" %>
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
	<jsp:include page="<%=ParamterControl.PAGE_ATTACHMENT %>"></jsp:include>
</div>
<iframe src="" id="downloadIframe" style="display:none;"> </iframe>
</body>
<script type="text/javascript" >

$(function(){
	
	  var customerIdHidden=$("#customer_id_hidden").val();
	  var loanDetailsAll = map.get(customerIdHidden);
	  var loanId = loanDetailsAll.uuid;
	  var orderId=loanDetailsAll.orderId;
	$("#orderid").html("订单号："+orderId)
	
	$.ajax({     
		url : "${basePath}/admin/loan/review/recordnew/" + customer_id_hidden + ".html",
		type : "get",
		dataType : "json",	
		success : function(data) {
			var path="";
			var type="";
			var personalInformation="";
			var title="";
			var vehicleInformation="";
			var contractInformation="";
			var otherInformation="";
			var recordingInformation="";
			var videoInformation="";
			for(var q=0;q<data.loanInfoAttachmentssize;q++){
				path=data.loanInfoAttachments[q];
				type=path.attachmentType;
				title=path.attachmentTitle.split("-")[0];
				if(type=="idCardType"||type=="idCardBack"||type=="Illegal"||type=="litigation"||type=="trialPhaseReview"
				   ||type=="businessInformation"||type=="heWarrants"||type=="visiteCheckReview"){
					var ul='<li> <div class="file_img"> <p class="tools">'
				        +'<a href="javascript:void(0);" onclick="pictureDownload('+path.id+')" title="保存"><i class="fa  fa-save"></i></a>'
				        +'<a href="'+path.attachmentPath+'" data-lightbox="example-set" data-title="'+title+'" title="放大"><i class="fa  fa-search-plus"></i></a></p>'
				        +'<a href="'+path.attachmentPath+'" data-lightbox="set_img" data-title="'+title+'" title="放大"><img class="example-image" src="'+path.attachmentPath+'"  id="idCardType" /></a> </div>'
				        +'<h4>'+title+'</h4>'
				        +'</li>';
				   personalInformation=personalInformation+ul;    
				}
				$("#personalInformation").html(personalInformation);
				if(type=="oneCarPhoto"||type=="vehiclStatusOne"||type=="vehicleLicense"||type=="registrationCertificateOne"||type=="businessInsurancePolicy"||type=="vehiclStatusThree"||type=="vehiclStatusFour"
				   ||type=="spareKey"||type=="vehiclStatusTwo"||type=="gpsInstall"||type=="locationSuccess"||type=="vehicleDriveCard"||type=="registrationCertificateTwo"||type=="insurancePolicy"||type=="falseKey"
				   ||type=="pledgeVehicleConsultArchives"){
				 var ul='<li> <div class="file_img"> <p class="tools">'
				        +'<a href="javascript:void(0);" onclick="pictureDownload('+path.id+')" title="保存"><i class="fa  fa-save"></i></a>'
				        +'<a href="'+path.attachmentPath+'" data-lightbox="example-set" data-title="'+title+'" title="放大"><i class="fa  fa-search-plus"></i></a></p>'
				        +'<a href="'+path.attachmentPath+'" data-lightbox="set_img" data-title="'+title+'" title="放大"><img class="example-image" src="'+path.attachmentPath+'"  id="idCardType" /></a> </div>'
				        +'<h4>'+title+'</h4>'
				        +'</li>';
				   vehicleInformation=vehicleInformation+ul;    
				}
				$("#vehicleInformation").html(vehicleInformation);
				if(type=="loanContractOne"||type=="mortgageContractOne"||type=="pledgeContract"||type=="loanReceipt"||type=="signTheContract"||type=="loanContractTwo"||type=="mortgageContractTwo"
				   ||type=="pledgeContractTwo"||type=="lendedReview"||type=="signContractReview"||type=="continueUpload"){
				 var ul='<li> <div class="file_img"> <p class="tools">'
				        +'<a href="javascript:void(0);" onclick="pictureDownload('+path.id+')" title="保存"><i class="fa  fa-save"></i></a>'
				        +'<a href="'+path.attachmentPath+'" data-lightbox="example-set" data-title="'+title+'" title="放大"><i class="fa  fa-search-plus"></i></a></p>'
				        +'<a href="'+path.attachmentPath+'" data-lightbox="set_img" data-title="'+title+'" title="放大"><img class="example-image" src="'+path.attachmentPath+'"  id="idCardType" /></a> </div>'
				        +'<h4>'+title+'</h4>'
				        +'</li>';
				   contractInformation=contractInformation+ul;    
				}
				$("#contractInformation").html(contractInformation);
				if(type=="other"){
				 var ul='<li> <div class="file_img"> <p class="tools">'
				        +'<a href="javascript:void(0);" onclick="pictureDownload('+path.id+')" title="保存"><i class="fa  fa-save"></i></a>'
				        +'<a href="'+path.attachmentPath+'" data-lightbox="example-set" data-title="'+title+'" title="放大"><i class="fa  fa-search-plus"></i></a></p>'
				        +'<a href="'+path.attachmentPath+'" data-lightbox="set_img" data-title="'+title+'" title="放大"><img class="example-image" src="'+path.attachmentPath+'"  id="idCardType" /></a> </div>'
				        +'<h4>'+title+'</h4>'
				        +'</li>';
				   otherInformation=otherInformation+ul;    
				}
				$("#otherInformation").html(otherInformation);
				if(type=="telephoneRecordings"){
				var ul='<li> <div class="file_img"> <p class="tools">'
				       +'<a  href="#" title="下载"  onclick="pictureDownload('+path.id+')"><i class="fa fa-cloud-download" >'
				       +'</i></a></p><img class="example-image" src="${basePath}/img/luyin.jpg" alt="录音"/></div>'
				       +'<h4>电话回访录音</h4></li>';
				   recordingInformation=recordingInformation+ul;    
				}
				$("#recordingInformation").html(recordingInformation);
				if(type=="entrustVideo"){
				var ul='<li> <div class="file_img"> <p class="tools">'
						    +'<a  href="#" title="下载"  onclick="pictureDownload('+path.id+')"><i class="fa fa-cloud-download" >'			
						     +'</i></a></p><img class="example-image" src="${basePath}/img/video_add.jpg" alt="视频"/></div>'
						    +'<h4>'+title+'</h4>'
					        +'</li>';
					videoInformation=videoInformation+ul;    
					}
			}	
		}})
	
})
     function pictureDownload(oid){
       $("#downloadIframe").attr("src","/admin/loan/getroute?id=" + oid);
    }
     function closePage(){
		$("#lightboxOverlay").remove();
		$("#lightbox").remove();
		$("#order_modal").empty();
		colsediv(0);
	}
     
     //下载合同共通函数
     function getLoanContractWord(loanId, type) {
       $.ajax({
         type: 'POST',
         url: '${basePath}/admin/loan/'+type+'.html',
         data: {
           "loanId": loanId
         },
         dataType: "text",
         success: function (data) {
           var url = "${basePath}/loanAttachments/" + data;
//           window.open(url, '_blank');
           location.href=url;
         }, error: function () {
           layer.msg("系统错误!");
           return false;
         }
       })
     }
     

</script>
<%-- <script type="text/javascript" src="${basePath}/js/loanerDetail.js"></script> --%>
