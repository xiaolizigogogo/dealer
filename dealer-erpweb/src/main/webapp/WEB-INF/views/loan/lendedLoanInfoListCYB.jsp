<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=edge; chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Cache-Control" content="no-transform">
    <title>e车贷管理系统—借款列表</title>
    <%@include file="../common/taglibs.jsp" %>
    <link rel="stylesheet" href="${basePath}/css/bootstrap-datetimepicker.min.css">
<%--     <link rel="stylesheet" href="${ basePath }/css/bootstrap/bootstrap-table.css"> --%>
    <script src="${basePath}/js/bootstrap-datetimepicker.min.js"></script>
    <script src="${basePath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="${basePath}/js/datetimepicker.js"></script>
    <script src="${basePath}/js/tableutils.js"></script>
    <script src="${basePath}/js/Map.js"></script>

    <style type="text/css">
    .table > tbody > tr > td.tr_back,.table-striped > tbody > tr:nth-child(odd) > td.tr_back, .table-striped > tbody > tr:nth-child(odd) > th.tr_back{background-color:#FCF8E3; !important;}
</style>
</head>
<body>
    <input type="hidden" value="" id="edit_customer_id"/>
    <input type="hidden" value=""  id="statusnew">
	<input type="hidden" value=""  id="customer_id_hidden">
	<input type="hidden" value=""  id="taskId_hidden">
	<input type="hidden" value=""  id="processDefinitionId_hidden">
	<div class="tools_bar col-lg-12">
		<div class="clearfix">
			<form class="form-inline pull-left" role="form">
				<div class="form-group">
					<label class="sr-only" for="txt_name">订单号</label> <input
						type="text" class="form-control" id="orderNo" name="orderNo"
						placeholder="请输入订单号">
				</div>
				<div class="form-group">
					<label class="sr-only" for="txt_number">客户姓名</label> <input
						type="text" class="form-control" id="customerName"
						name="customerName" placeholder="客户姓名">
				</div>
				<div class="form-group">
					<select class="form-control" id="status" name="status">
						<option value="" selected>全部</option>
						<option value="0">未放款</option>
						<option value="1">已放款</option>
					</select>
				</div>
				<button type="button" onclick="select()"
					class="btn btn-primary btn-search">
					<i class="fa fa-search"></i> 搜索
				</button>
			</form>
		</div>
	</div>
	<div id="hmd_box" class="modal modal_sml fade in">
		<div class="modal-header">
			<a type="button" href="javascript:void(0)" onclick="colsediv(0)"
				class="close"><span aria-hidden="true">&times;</span></a>
			<h4 class="modal-title" id="myModalLabel" style="font-size: 16px;">提示</h4>
		</div>
		<div class="modal-body">
			<p class="p_tip">
				<i class="fa fa-question-circle"></i> <span id="alert_span"></span>
			</p>
			<div class="btn_list clearfix">
				<a class="btn btn-danger btn-sm" href="javascript:void(0);" id="confirm_a"
					onclick="colsediv(0)">确认</a><a class="btn btn-default btn-sm"
					href="javascript:void(0)" onclick="colsediv(0)">取消</a>
			</div>
		</div>
	</div>
	<div class="list_box col-sm-12">
		<table data-toggle="table" class="table table-bordered table-striped">
			<thead>
				<tr>
					 <th>订单号</th>
					 <th>合同号</th>
				     <th>客户姓名</th>
				     <th>审批金额</th>
				     <th>放款情况</th>
				     <th>放款时间</th>
				     <th>操作</th>
				</tr>
			</thead>
			<tbody id="record">

			</tbody>
		</table>
	</div>
	<div id="r-page"></div>
	
<div id="fade2" class="black_overlayx"></div>
<div id="order_modal" class="modal fade in"></div>
	<div id="qs_box1" class="modal modal_sml fade in">
		<div class="modal-header">
			<a type="button" href="javascript:void(0)" onclick="colsediv('qs_box1')"
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
				   onclick="colsediv('qs_box1')">取消</a>
				<a class="btn btn-default btn-sm"
				   href="javascript:void(0)" onclick="colsediv('qs_box1')" id="ok_button">确定</a>
			</div>
		</div>
	</div>
<div id="fk_modal" class="modal modal_mid fade in">
  <div class="modal-header" id="header"> <a  type="button" href = "javascript:void(0)" onclick = "colsediv(0)"  class="close" ><span aria-hidden="true">&times;</span></a>
    <h4 class="modal-title" id="myModalLabel" style="font-size:16px;">放款详情</h4>
  </div>
  <div class="modal-body" >
    <div class="fk_modal_con">
      <div class="row">
        <div class="col-sm-6">
          <dl class="dl-horizontal">
            <dt>订单编号</dt>
            <dd id="order_id"></dd>
          </dl>
        </div>
        <div class="col-sm-6">
          <dl class="dl-horizontal">
            <dt>还款方式</dt>
            <dd id="repay_way"></dd>
          </dl>
        </div>
        <div class="col-sm-6">
          <dl class="dl-horizontal">
            <dt>客户名称</dt>
            <dd id="customer_name"></dd>
          </dl>
        </div>
        <div class="col-sm-6">
          <dl class="dl-horizontal">
            <dt>审批金额</dt>
            <dd><b class="text-danger" id="loan_money"></b></dd>
          </dl>
        </div>
        <div class="col-sm-6">
          <dl class="dl-horizontal">
            <dt>开户银行</dt>
            <dd id="bank_name"></dd>
          </dl>
        </div>
        <%--<div class="col-sm-6">--%>
          <%--<dl class="dl-horizontal">--%>
            <%--<dt>开户网点</dt>--%>
            <%--<dd id="branch_bank_name"></dd>--%>
          <%--</dl>--%>
	  <%--</div>--%>
        <div class="col-sm-6">
          <dl class="dl-horizontal">
            <dt>银行账户</dt>
            <dd id="account_num"></dd>
          </dl>
        </div>
        <div class="col-sm-6">
          <dl class="dl-horizontal">
            <dt>财务专员</dt>
            <dd id="reviewedBy"></dd>
          </dl>
        </div>
         <div class="col-sm-12">
          <dl class="dl-horizontal">
            <dt>实际放款金额</dt>
            	<dd><b class="text-danger" id="chargedof_money"> </b>
			</dd>
          </dl>
        </div>
      </div>
    </div>
	  <hr style="margin-top:0;" />
	  <div class="list_box">
		  <p><b>放款明细</b></p>
		  <table class="table table-bordered table-striped" style="margin-bottom:0px;" id="feetbl">
			  <thead>
			  <tr>
				  <th>办理费</th>
				  <th>查档费</th>
				  <th>停车费</th>
				  <th>服务费</th>
				  <th>核查管理费</th>
				  <th>风险金</th>
				  <th>认证费</th>
				  <th>手续费</th>
				  <th>首期利息</th>
			  </tr>
			  </thead>
			  <tbody >
			  </tbody>
		  </table>
    </div>
  </div>
</div>
</body>
<script type="text/javascript">
	var status = "${map.status}"; // 根据不同的状态进行查询,参数由IndexController封装为map
	var map = new Map();
    $(function () {
		init();
        $("#status").find('option[value="' + status + '"]').attr("selected", true);
	});
	
	function init() {
		
		var customerName = $("#customerName").val();
		var orderNo = $("#orderNo").val();
		var status = $("#status").val();

        if ( ("" != status && null != status)
                || ("" !== customerName && null !== customerName) ||  ("" !== orderNo && null !== orderNo)) {
			var param = {
                "status": status,
                "customerName": customerName,
                "orderNo":orderNo
			};
			onLoadDate(param);
		} else {
			onLoadDate({
                "status": status
			});
		}
	}

	function onLoadDate(param) {
        var writetablefn = function (data)
        
		{ 
			var context;

			var loanStatus = data.loanStatus;
			var loanStatusStr = "";
			if (loanStatus == "lended"||loanStatus == "reloanAduit"||loanStatus == "reloanReview"||loanStatus == "reloanE_Contract"||loanStatus == "reloan_lended") {
				loanStatusStr = "未放款";
			} else {
				loanStatusStr = "已放款";
			}

			var loanDetails = {};
			loanDetails.uuid = data.uuid;
			loanDetails.orderId = data.orderid;
			loanDetails.taskId = data.taskId;
			loanDetails.activityId = data.activityId;
			loanDetails.assignee = data.assignee;
			loanDetails.loan_status = data.loan_status;
			loanDetails.customerId = data.customerId;

			var edit = "";
            if(loanStatus == "lended"){
            	 edit = ""
            	 var array = eval(data);
            	 if(data.assignee != null && data.assignee != ""){
            	 	edit = "<a href = 'javascript:void(0)'  onclick='setCustomerIdHidden(this)' id="+data.uuid+">处理</a>";
            	 }else{
            	 	edit = "<a href='javascript:void(0)' id="+data.taskId+" href='javascript:void(0);' onclick='claim(this)'>签收</a> ";
            	 }
            }else{
                edit="<a href = 'javascript:void(0)'  id="+data.uuid+" onclick='openDetail(this)'>查看</a>";
			}
			
			var jiaji = "";
            if(data.loanState == "yes"){
            	jiaji = "<i class='fa fa-bookmark text-success'></i>&nbsp;&nbsp;";
            }
            
            var isImportant = "";
            if(data.isImportant == "1"){
            	isImportant = "<i class='fa fa-star text-danger'></i>&nbsp;&nbsp;";
            }
            

			context = "<tr>" 
					+ "<td>" + jiaji + "<a id="+data.uuid
					+ " onclick='setCustomerIdHiddenview(this)' href='javascript:void(0);'>"+data.orderid +"</a>"+ "</td>"
					+ "<td>" + "<a id="+data.uuid
					+ " onclick='setCustomerIdHiddenview(this)' href='javascript:void(0);'>" + data.contract_num + "</a>" + "</td>"
					+ "<td>" + isImportant + data.customerName + "</td>" 
					+ "<td>" + data.loan_money + "</td>"
					+ "<td>" + loanStatusStr + "</td>" 
					+ "<td>" + data.chargedoffAt + "</td>" 
					+ "<td>" + edit + "</td>"
					+ "</tr>";

			map.put(data.uuid.toString(),loanDetails);

			return context;
		};

        pageComm("${basePath}/admin/loan/queryLendedLoanInfoList", param == null ? {} : param, writetablefn, "record", 17);
        $("#orderNo").val(null);
        $("#customerName").val(null);
        $("#status").val(null);
	}

    var param = function () {
		return {
        	"orderNo": $("#orderNo").val(),
            "customerName": $("#customerName").val(),
            "status":$("#status").val(),
		};
	};
	function select() {
		onLoadDate(param());
	}

	 function claim(obj) {
		 var taskId = $(obj).attr("id");
         $.ajax({
             type: "POST",
             url: "/admin/todo?method=claim",
             dataType: "json",
             data: {
                 taskId: taskId
             },
             success: function (data) {
                 var data1 = eval(data);
                 var code = data1.res;
                 if (code) {
                     layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
                    	 select();
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
	   
	 
	function setCustomerIdHidden(obj){
		var id = $(obj).attr("id");
		$("#customer_id_hidden").val(id);
		var loanDetailsTemp = map.get(id);
		loanDetailsTemp.channel = "no";
		map.put(id,loanDetailsTemp);
		$("#customer_id_hidden").val($(obj).attr("id"));
		$("#order_modal").load("/admin/loan/loanerDetail2.html");
		opendiv("order_modal");
	}
	function setCustomerIdHiddenview(obj){
		var id = $(obj).attr("id");
		$("#customer_id_hidden").val(id);
		var loanDetailsTemp = map.get(id);
		loanDetailsTemp.channel = "yes";
		map.put(id,loanDetailsTemp);
		$("#order_modal").load("/admin/loan/vieworderdetails.html");
		opendiv("order_modal");
	}
	
	//查看放款详情
	function openDetail(obj){
	    var uuid = $(obj).attr("id");
	    $.ajax({
	    	url:"/admin/loan/getLendedDetail?uuid=" + uuid,
	    	dataType:"json",
	    	success:function(data){
	    		var repayWay = data.loanInfoWithBLOBs.repayWay;
	    		if(repayWay == 'InterestRatesBefore'){
	    			repayWay = '先息后本';
	    		}else if(repayWay == 'AverageCapitalPlusInterest'){
	    			repayWay = '等本等息';
	    		}else if(repayWay == 'flexiblerepaymentv2'){
	    			repayWay = '灵活还款';
	    		}else if(repayWay == 'averagePrincipalreduceinterest'){
	    			repayWay = '等本减息';
	    		}else if(repayWay == 'averagePrincipalzerointerestrent'){
	    			repayWay = '等本零息（押证）';
	    		}else if(repayWay == 'intrestbeforePrincipaltransfer'){
	    			repayWay = '先息后本（押车）';
	    		}else if(repayWay == 'intrestbeforePrincipalrent'){
	    			repayWay = '先息后本（押证）';
	    		}
	    		$("#order_id").html(data.loanInfoWithBLOBs.orderid);
	    		$("#repay_way").html(repayWay);
	    		$("#customer_name").html(data.loanInfoWithBLOBs.customerRegisterInfo.customerName);
	    		$("#loan_money").html(data.loanInfoWithBLOBs.loanMoney);
	    		$("#bank_name").html(data.loanInfoWithBLOBs.customerAccountInfo.bankName);
//	    		$("#branch_bank_name").html(data.loanInfoWithBLOBs.customerAccountInfo.branchBankName);
	    		$("#account_num").html(data.loanInfoWithBLOBs.customerAccountInfo.accountNum);

	    		$("#reviewedBy").html(data.listReviewInfo.user.realname);
				var repayplandetail = data.repayPlanDetail;
				var chargemoney = parseFloat(data.loanInfoWithBLOBs.loanMoney) - parseFloat(repayplandetail.repayTotal);
				$("#chargedof_money").html(chargemoney.toFixed(2));
				$("#feetbl tr:not(:first)").empty();
				var str = "<tr>"
						+"<td>"+( repayplandetail.gpsCost==undefined?0:repayplandetail.gpsCost) + "</td>"
						+"<td>"+ (repayplandetail.checkCost==undefined?0:repayplandetail.checkCost) + "</td>"
						+"<td>"+ (repayplandetail.parkCost==undefined?0:repayplandetail.parkCost) + "</td>"
						+"<td>"+ (repayplandetail.depreciationFee==undefined?0:repayplandetail.depreciationFee) + "</td>"
						+"<td>"+ (repayplandetail.drunkDrive==undefined?0:repayplandetail.drunkDrive) + "</td>"
						+"<td>"+ (repayplandetail.cashdepositFee==undefined?0:repayplandetail.cashdepositFee) + "</td>"
						+"<td>"+ (repayplandetail.certificatefee==undefined?0:repayplandetail.certificatefee) + "</td>"
						+"<td>"+ (repayplandetail.manageFee==undefined?0:repayplandetail.manageFee) + "</td>"
						+"<td>"+ (repayplandetail.repayInterest==undefined?0:repayplandetail.repayInterest) + "</td>"
						+"</tr>";
				$("#feetbl tr:last").after(str);
	    		opendiv("fk_modal");
	    	}
	    })
	}
	
	$(function () {
     
      $('[data-toggle="popover"]').each(function () {
        var element = $(this);
        var id = element.attr('id');
        var txt = "扣除详情";
        element.popover({
          trigger: 'manual',
          placement: 'right', //top, bottom, left or right
          title: txt,
          html: 'true',
          content: ContentMethod(txt),
        }).on("mouseenter", function () {
          var _this = this;
          $(this).popover("show");
          $(this).siblings(".popover").on("mouseleave", function () {
            $(_this).popover('hide');
          });
        }).on("mouseleave", function () {
          var _this = this;
          setTimeout(function () {
            if (!$(".popover:hover").length) {
              $(_this).popover("hide")
            }
          }, 100);
        });
      });
    });
	
	function ContentMethod(txt) {
      return '<div class="clear kf_pop"><div class="col-sm-6"><dl class="dl-horizontal"><dt>GPS费用</dt><dd>100.00</dd></dl></div><div class="col-sm-6"><dl class="dl-horizontal"><dt>查档费</dt><dd>100.00</dd></dl></div><div class="col-sm-6"><dl class="dl-horizontal"><dt>停车费</dt><dd>100.00</dd></dl></div><div class="col-sm-6"><dl class="dl-horizontal"><dt>折旧费</dt><dd>100.00</dd></dl></div><div class="col-sm-6"><dl class="dl-horizontal"><dt>酒毒驾</dt><dd>100.00</dd></dl></div><div class="col-sm-6"><dl class="dl-horizontal"><dt>保证金</dt><dd>100.00</dd></dl></div><div class="col-sm-6"><dl class="dl-horizontal"><dt>认证费</dt><dd>100.00</dd></dl></div><div class="col-sm-6"><dl class="dl-horizontal"><dt>扣除利息</dt><dd>100.00</dd></dl></div><div class="col-sm-6"><dl class="dl-horizontal"><dt>管理费</dt><dd>100.00</dd></dl></div><div class="col-sm-6"><dl class="dl-horizontal"><dt>扣除本金</dt><dd>100.00</dd></dl></div></div>';
    }
	 
</script>
</html>
