<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
  import="com.maiqianweng.common.utils.*"%>
<!DOCTYPE html>
<%
  String searchDate = request.getParameter("date");
%>
<html lang="zh-cn">
<head>
<link type="text/css" rel="stylesheet" href="${basePath}/css/bootstrap.min.css" />
  <link type="text/css" rel="stylesheet" href="${basePath}/css/dropZone.css" />
  <link type="text/css" rel="stylesheet" href="${basePath}/css/jquery.fileupload-ui.css" />
  <link type="text/css" rel="stylesheet" href="${basePath}/css/jquery.fileupload.css" />
  <link type="text/css" rel="stylesheet" href="${basePath}/js/completer/completer.min.css" />
  <link rel="stylesheet" href="${basePath}/css/bootstrap/bootstrap-table.css">
  <link rel="stylesheet" type="text/css" href="${basePath}/css/libs/font-awesome.css"/>
  <link rel="stylesheet" type="text/css" href="${basePath}/css/common.css"/>
  <link rel="stylesheet" href="${basePath}/css/lightbox.min.css"/>

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

  <link rel="stylesheet" href="${basePath}/css/bootstrap-datetimepicker.min.css">
  <script src="${basePath}/js/bootstrap-datetimepicker.min.js"></script>
  <script src="${basePath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
  <script src="${basePath}/js/datetimepicker.js"></script>
</head>
<body>

  <div class="modal-header" id="header" style="position:static; background:#fff;"> <a type="button" href="javascript:void(0)" onclick="closePage(0)" class="close"><span aria-hidden="true">×</span></a>
    <h4 class="modal-title" id="myModalLabel" style="font-size:16px;">修改还款<small style="padding-left:20px; font-size:14px;" class="text-muted" id="order_id">订单号：</small></h4>
  </div>
  <form id="form" name="form">
  <div role="tabpanel" class="tab-pane" id="tab9">
        <div class="from_box">
          <div class="list_box">
            <table class="table table-bordered table-striped" style="margin-bottom:0px;">
              <thead>
              <tr>
                <th>期数</th>
				<th>还款本金</th>
                <th>还款利息</th>
                <th>综合服务费</th>
                <th>办理费</th>
                <th>GPS流量费</th>
                <th>停车费</th>
                <th>风险保证金</th>
                <th>罚息</th>
                <th>催收费</th>
                <th>违约金</th>
				<th>拖车费</th>
                <th>本期还款总额</th>
                <th>还款时间</th>
              </tr>
              </thead>
              <tbody id="leiji_repayment">
              </tbody>
            </table>
          </div>
        </div>
		
		<div class="modal-footer ">
			<p class="col-sm-2 ">
				<a href="javascript:void(0)" onClick="closePage(0);" class="btn btn-default btn-block">关闭</a>
			</p>
			<p class="col-sm-2">
				<input id="btn" type="button" name="Submit" class="btn btn-danger btn-block" onclick="keepUpdate(),msg()" value="保存"/>
			</p>
		</div>
		
		
      </div>
	  
	</form>	
	
</body>


<script>

  
  $(function() {
    
    var aaa = $("#customer_id_hidden").val();
    var loanId = $("#customer_id_hidden").val().split(":")[0];
    var taskid = $("#customer_id_hidden").val().split(":")[2];
    var state = $("#customer_id_hidden").val().split(":")[5];
    var div= ""

    $.ajax({
      url : "/admin/loan/loanRepaymentReviewByLoanIdss?taskId=" + taskId + "&loanId=" + loanId,
      type : "get",
      dataType : "json",
      success : function(data) {
        var leiji_repayment_html = "";
        var currentperiod = 0;
		var i=0;
		$.each(data.rList,function(key,value){
			debugger;
	          leiji_repayment_html += "<tr>" +
	                  "<td>"+value.repayPlanDetail.repayPeriod+"</td>" +
	                  "<td><input type='hidden' name='uuid"+i+"' value='"+value.uuid+"'><input class='checkZero' name='actualRepaymentCaptialSum"+i+"' style='width:60px' value='"+value.repaymentTransactions[0].actualRepaymentCaptialSum+"'/></td>" +
					  "<td><input class='checkZero' name='actualRepaymentInterestSum"+i+"' style='width:60px' value='"+value.repaymentTransactions[0].actualRepaymentInterestSum+"'/></td>" +
					  "<td><input name='manageFee"+i+"' type='hidden' value='"+(value.repaymentTransaction.manageFee==""?(0.00).toFixed(2):value.repaymentTransaction.manageFee)+"'/><input class='checkZero' name='depreciationFee"+i+"' style='width:60px' value='"+(value.repaymentTransaction.depreciationFee==""?(0.00).toFixed(2):value.repaymentTransaction.depreciationFee)+"'/></td>" +
					  "<td><input class='checkZero' name='gpsCost"+i+"' style='width:60px' value='"+(value.repaymentTransaction.gpsCost==""?(0.00).toFixed(2):value.repaymentTransaction.gpsCost)+"'/></td>" +
					  "<td><input class='checkZero' name='drunkDrive"+i+"' style='width:60px' value='"+(value.repaymentTransaction.drunkDrive==""?(0.00).toFixed(2):value.repaymentTransaction.drunkDrive)+"'/></td>" +
					  "<td><input class='checkZero' name='parkCost"+i+"' style='width:60px' value='"+(value.repaymentTransaction.parkCost==""?(0.00).toFixed(2):value.repaymentTransaction.parkCost)+"'/></td>" +
					  "<td><input name='checkCost"+i+"' type='hidden' value='"+(value.repaymentTransaction.checkCost==""?(0.00).toFixed(2):value.repaymentTransaction.checkCost)+"'/><input class='checkZero' name='cashdepositFee"+i+"' style='width:60px' value='"+(value.repaymentTransaction.cashdepositFee==""?(0.00).toFixed(2):value.repaymentTransaction.cashdepositFee)+"'/></td>" +
					  "<td><input name='certificatefee"+i+"' type='hidden' value='"+(value.repaymentTransaction.certificatefee==""?(0.00).toFixed(2):value.repaymentTransaction.certificatefee)+"'/><input class='checkZero' name='overdueFee"+i+"' style='width:60px' value='"+(value.repaymentTransaction.overdueFee==""?(0.00).toFixed(2):value.repaymentTransaction.overdueFee)+"'/></td>" +
					  "<td><input class='checkZero' name='visitCost"+i+"' style='width:60px' value='"+(value.repaymentTransaction.visitCost==""?(0.00).toFixed(2):value.repaymentTransaction.visitCost)+"'/></td>" +
					  "<td><input class='checkZero' name='penaltyFee"+i+"' style='width:60px' value='"+(value.repaymentTransaction.penaltyFee==""?(0.00).toFixed(2):value.repaymentTransaction.penaltyFee) +"'/></td>" +
					  "<td><input class='checkZero' name='towCost"+i+"' style='width:60px' value='"+(value.repaymentTransaction.towCost==""?(0.00).toFixed(2):value.repaymentTransaction.towCost)+"' /></td>"+
	                  "<td>"+value.repaymentTransactions[0].actualRepaymentSum+"</td>" +
	                  "<td>"+value.repaymentTransactions[0].createDay+"</td>"+
	                  "</tr>";
					  i++;
					  
	          //取得已经还款去期数的总和
	          currentperiod ++;
	        });
		var zongtiaoshu = currentperiod;
		leiji_repayment_html=leiji_repayment_html+"<input type=hidden name=zongtiaoshu value="+zongtiaoshu+" />"
		
        $("#leiji_repayment").html(leiji_repayment_html);
		
		
		$(".checkZero").keyup(function(){

        $(this).val($(this).val().replace(/[^0-9.]/g,'')); 
			if($(this).val().length==0)
			{
				$(this).val('0.00')
			}

		}).bind("paste",function(){ //CTR+V事件处理  $(this).val($(this).val().replace(/[^0-9.]/g,''));   

		}).css("ime-mode", "disabled"); //CSS设置输入法不可用 
		
		
		
      }
    });

    var uuid;
    var customer_id_hiddenstr = $("#customer_id_hidden").val();
    var strarray = new Array();
    strarray = customer_id_hiddenstr.split(":");
    var customer_id_hidden = strarray[0];
    var orderid = strarray[1];
    var taskId = strarray[2];
    var processDefinitionId = strarray[3];
    var assignee = strarray[4];
    $("#processDefinitionId").val(processDefinitionId);
    
  })
	function msg(){
		if (confirm("你确认要提交吗？"))
			$("#lightboxOverlay").remove();
	    	$("#lightbox").remove();
	    	$("#order_modal").empty();
			colsediv(0);
	}
  function keepUpdate(){
	
	
			
	  $.ajax({
		  url:"/admin/loan/repaymentUpdate",
		  type:"POST",
		  dataType:"json",
		  data:$("#form").serialize(),
		  success:function(){ 
					  
			//colsediv(0);
		  }
	  })
 }


 /* 
  $(document).ready(function(){
  $("button").click(function(){
    $("#div111").text($("form").serialize());
  });
});*/
  
  
  
  var loanId=$("#customer_id_hidden").val();
$(function(){
	init(loanId);
});
  function closePage(){
    $("#lightboxOverlay").remove();
    $("#lightbox").remove();
    $("#order_modal").empty();
    colsediv(0);
  }

 
  function init(id){
		
		$.ajax({
			url:"/admin/loan/loanOwnerInfo?loanId="+id,
			type:"get",
			dataType:"json",
			success:function(data){
				//
				$("#old_user").text(data.loanUser);
				$("#task_user").text(data.taskUser);
				$("#task_name").text(data.taskName);
				$("#order_id").text("订单号:"+data.orderId);
			}
		})
	}

</script>