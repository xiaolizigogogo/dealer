<%@page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 附件资料 -->
<div role="tabpanel" class="tab-pane" id="tab_attachment">
  <div class="">
    <c:forEach items="${attachmentTypes}" var="item">
      <div class="col-sm">
        <div class="from_box">
          <div class="from_tit clearfix">
            <h3 class="pull-left">${item.name }</h3>
          </div>
          <div class="img_list">
            <ul class="list-inline" id="${item.id }">
            </ul>
          </div>
        </div>
      </div>
    </c:forEach>
          <div class="col-sm">
              <div class="from_box">
                <div class="from_tit clearfix">
                  <h3 class="pull-left">合同下载</h3>
                </div>
                <div class="ht_list">
                  <ul class="list-inline" id="contact_ul">
                  <li><div class="file_img"><img src="/img/aqb/ht01.png" /></div><h4 class="text-center"><i class="text-muted glyphicon glyphicon-cloud-download"></i> <a href="javascript:void(0);" id="car_register_info" >车辆情况登记表</a></h4></li>
                  </ul>
                </div>
              </div>
            </div>
  </div>
      
</div>
<script>
//分离图片浏览页面
$(function(){
 //var loanId=$("#customer_id_hidden").val().split(":")[0];
 var customerIdHidden=$("#customer_id_hidden").val();
 var loanDetailsAll = map.get(customerIdHidden);
 var loanId = loanDetailsAll.uuid;
 
  
  $.ajax({
	url:"/admin/loan/getAllAttachment?loanId="+loanId,
    type:"get",
    dataType:"json",
    success : function(data){
      //兼容单个附件和多个附件
      //所有附件
      var attachments=data.loanInfoAttachments;
      //附件父类型
      var attachmentTypes=data.attachmentTypeMap;
      //附件下载
      debugger;
      var contractDownloads=data.contractDownloads;
      var contract=data.contract;
        //显示抵押合同
        if(data.status!='vehicleAssess'){
        $("#contact_ul").append('<li><div class="file_img"><img src="/img/aqb/ht02.png" /></div><h4 class="text-center"><i class="text-muted glyphicon glyphicon-cloud-download"></i> <a href="#" id="pledge_contract">车辆质押借款合同</a></h4></li>');
        } 
        //特定节点显示
        if(contract.indexOf(data.status)==-1){
        $("#contact_ul").append('<li><div class="file_img"><img src="/img/aqb/ht03.png" /></div><h4 class="text-center"><i class="text-muted glyphicon glyphicon-cloud-download"></i> <a href="#" id="responsibility_excuse">免责承诺</a></h4></li><li><div class="file_img"><img src="/img/aqb/ht04.png" /></div><h4 class="text-center"><i class="text-muted glyphicon glyphicon-cloud-download"></i> <a href="#" id="vehicle_sales_contracts" >车辆买卖合同</a></h4></li><li><div class="file_img"><img src="/img/aqb/ht05.png" /></div><h4 class="text-center"><i class="text-muted glyphicon glyphicon-cloud-download"></i> <a href="#" id="loan_receipt" >借条</a></h4></li><li><div class="file_img"><img src="/img/aqb/ht06.png" /></div><h4 class="text-center"><i class="text-muted glyphicon glyphicon-cloud-download"></i> <a href="#" id="loan_receipt_rev" >收条</a></h4></li><li><div class="file_img "><img src="/img/aqb/ht07.png" /></div><h4 class="text-center"><i class="text-muted glyphicon glyphicon-cloud-download"></i> <a href="#" id="authorization"><i class=""></i>授权委托书</a></h4></li>')
        }
      $.each(contractDownloads,function(key,value){
          $("#"+key).attr("href","javascript:getLoanContractWord(\'"+loanId+"\', \'"+value+"\')");
     	});
           
      if(attachments==null){
        return;
      }

      for(var i=0 ; i<attachments.length;i++){
        var attachment=attachments[i];
        var title=attachment.attachmentTitle.split("-")[0];
        var video='${videoAttachment}';
        var context="";
        
        var attachmentInfo=attachmentTypes[trimNumber(attachment.attachmentType)];
        if(attachmentInfo){
		if(attachmentInfo.attachmentType!="image"){
          context=  "<li><div class='file_img file_mvo' style='display: table-cell;'><p class=tools><a href='javascript:void(0);' onclick='pictureDownload("+attachment.id+")' title=保存><i class='fa  fa-save'></i></a></p><a href=#  id=telephoneRecordings><span id=recordingsIcon_telephoneRecordings > <i class='glyphicon glyphicon-file' style='font-size: 64px;'></i> <label id='recordings_telephoneRecordings'>"+attachment.attachmentTitle+"</label></span></a></div><h4>"+title+"</h4></li>"
        }
        else{
         context='<li> <div class="file_img"> <p class="tools">'
            +'<a href="javascript:void(0);" onclick="pictureDownload('+attachment.id+')" title="保存"><i class="fa  fa-save"></i></a>'
            +'<a href="'+attachment.attachmentPath+'" data-lightbox="example-set" data-title="'+title+'" title="放大"><i class="fa  fa-search-plus"></i></a></p>'
            +'<a href="'+attachment.attachmentPath+'" data-lightbox="set_img" data-title="'+title+'" title="放大"><img class="example-image" src="'+attachment.attachmentThumb+'"  id="'+attachment.attachmentType+'" /></a> </div>'
            +'<h4>'+title+'</h4>'
            +'</li>';
            }
		 $("#"+attachmentInfo.attachmentParentId).append(context);}
      }
    }
    });
  function trimNumber(str){ 
		return str.replace(/\d+/g,''); 
	} 
})
</script>