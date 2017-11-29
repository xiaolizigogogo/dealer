<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible"
	content="IE=9; IE=8; IE=7; IE=edge; chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Cache-Control" content="no-transform">
<title>e车贷管理系统—总公司还款表</title>
<%@include file="../common/taglibs.jsp"%>
<link rel="stylesheet"
	href="${basePath}/css/bootstrap-datetimepicker.min.css">
<%--     <link rel="stylesheet" href="${ basePath }/css/bootstrap/bootstrap-table.css"> --%>
<script src="${basePath}/js/bootstrap-datetimepicker.min.js"></script>
<script src="${basePath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="${basePath}/js/datetimepicker.js"></script>
<script src="${basePath}/js/uploadPreview.js" type="text/javascript"></script>
<script src="${basePath}/js/tableutils.js"></script>
<script src="${basePath}/js/Map.js"></script>
<style type="text/css">
.table>tbody>tr>td.tr_back, .table-striped>tbody>tr:nth-child(odd)>td.tr_back,
	.table-striped>tbody>tr:nth-child(odd)>th.tr_back {
	background-color: #FCF8E3;
	!
	important;
}
</style>
</head>
<body>
	<input type="hidden" value="" id="loanstatus" />
	<input type="hidden" value="" id="state" />
	<input type="hidden" value="" id="edit_customer_id" />
	<input type="hidden" value="" id="statusnew">
	<input type="hidden" value="" id="customer_id_hidden">
	<input type="hidden" value="" id="taskId_hidden">
	<input type="hidden" value="" id="processDefinitionId_hidden">
	<input type="hidden" value="" id="loanId" />
	<div class="tools_bar col-lg-12">
		<div class="clearfix">
			<form class="form-inline pull-left" role="form">
				<div class="form-group">
					<label class="sr-only" for="orderNo">订单号</label> <input type="text"
						class="form-control" id="orderId" name="orderNo"
						placeholder="请输入订单号">
				</div>
				<div class="form-group">
					<label class="sr-only" for="customerName">分公司名称</label> <input
						type="text" class="form-control" id="companyName"
						name="customerName" placeholder="分公司名称">
				</div>
				<div class="form-group">
					<select class="form-control" id="loanStatus" name="loanStatus">
						<option value="">选择订单状态</option>
						<option value="WAIT_REPAY">待还款</option>
						<option value="REPAY_OVER">已结清</option>
						<option value="OVER_DUE">已逾期</option>
					</select>
				</div>
				<button type="button" onclick="select()"
					class="btn btn-primary btn-search">
					<i class="fa fa-search"></i> 搜索
				</button>
			</form>
		</div>
		<div class="list_btn">
			<ul class="list-inline">
				<!-- <li><a class="btn btn-danger"   href = "javascript:void(0)"  onclick="opendiv(0)"> <i class="fa fa-plus"></i>新增</a></li>-->

				<li><a class="btn btn-danger" href="javascript:void(0)"
					 onclick="exportExcel();"> <i class="fa fa-download"></i>导出催收列表
				</a></li>
				<li><p class="text-danger" id="dc_tip" style="display:none;">催收列表统计.xls已导出</p></li>
			</ul>
		</div>
	</div>
	<div class="list_box col-sm-12">
		<table data-toggle="table" class="table table-bordered table-striped">
			<thead>
				<tr>
					<th>订单号</th>
					<th>客户姓名</th>
					<th>贷款金额</th>
					<th>期数</th>
					<th>分公司名称</th>
					<th>订单状态</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody id="record">
			</tbody>
		</table>
	</div>
	<div id="r-page"></div>
	<div id="fk_modal" class="modal modal_mid fade in" style="width: 60%;">
	</div>
	<div id="fade2" class="black_overlayx"></div>
	<div id="order_modal" class="modal fade in"></div>
	<iframe src="" style="display:none;" id="exportIframe">

</iframe>
</body>
<script type="text/javascript">
	var currentReviewLoanStatus = "${map.status}"; // 根据不同的状态进行查询,参数由IndexController封装为map
	var currentpledgeType = "${map.pledgeType}";
	var map = new Map();
	$(function() {
		init();
	});

	function init() {
			onLoadDate({
				"status" : currentReviewLoanStatus
			});
	}

	function onLoadDate(param) {
		var writetablefn = function(data)
		{
						
			var complete = false;
			
			var loanStatusStr="";
			switch(data.loanStatus)
			{
			case "OVER_DUE":
				loanStatusStr="已逾期";
				break;
			case "WAIT_REPAY":
				loanStatusStr="待还款";
				break;
			case "REPAY_OVER":
			default:
				loanStatusStr="已结清";
				complete=true;
				break;
			
			}

			var loanDetails = {};
			loanDetails.uuid = data.uuid;
			loanDetails.orderId = data.orderId;
			loanDetails.taskId = data.taskId;
			loanDetails.activityId = data.activityId;
			loanDetails.assignee = data.assignee;
			loanDetails.loan_status = data.loan_status;
			loanDetails.customerId = data.customerId;

			context = "<tr id="
				+ data.uuid
				+ ":"
				+ data.orderId
				+ ":"
				+ data.taskId
				+ ":"
				+ data.activityId+":"+data.id
					+ " onclick='setEditCustomer(this)'>"
					+ "<td>"
					+ "<a id="
					+ data.uuid
					+ " onclick='setCustomerIdHidden(this)' href='javascript:void(0);'>"
					+ data.orderId
					+ "</a>"
					+ "</td>"
					+ "<td>"
					+ data.customerName
					+ "</td>"
					+ "<td>"
					+ data.loanMoney
					+ "</td>"
					+ "<td>"
					+ data.period
					+ "</td>"
					+ "<td>"
					+ data.companyName
					+ "</td>"
					+ "<td>"
					+ loanStatusStr
					+ "</td>";
					if(complete==true)
					{
						context+= "<td>-</td></tr>";						
					}
					else
					{
						context+= "</td>"
					+ "<td><a href = 'javascript:void(0)'  onclick='setRepayment(this)'>还款</a></td>"
					+ "</tr>";
						}
			map.put(data.uuid.toString(),loanDetails);
			return context;
		};

		pageComm("${basePath}/admin/loanB2B/selectLoanB2BList", param == null ? {} : param, writetablefn, "record", 17);
		//清空日期搜索设置
	}

	var param = function() {
		return {
			"orderId" : $("#orderId").val(),
			"companyName" : $("#companyName").val(),
			"loanStatus" : $("#loanStatus").val()
		};
	};

	function select() {
		onLoadDate(param());
	}
	function reset() {
		$("#mobile").val("");
		$("#customerName").val("");
	}

	function setCustomerIdHidden(obj) {
		$("#customer_id_hidden").val($(obj).attr("id"));
		var id = $(obj).attr("id");
		$("#customer_id_hidden").val(id);
		var loanDetailsTemp = map.get(id);
		loanDetailsTemp.channel = "no";
		map.put(id,loanDetailsTemp);
		$("#order_modal").load("/admin/loan/vieworderdetailsCYB.html");
		opendiv("order_modal");
	}

	function setRepayment(obj) {
		$("#customer_id_hidden").val($(obj).parents('tr').attr('id'));
		$("#fk_modal").load("/admin/loan/loanB2BDetail2.html");
		opendiv("fk_modal");
	}

	function getlenderdetails(obj) {
		$("#customer_id_hidden").val($(obj).attr("id"));
		$("#order_modal").load("/admin/loan/lenderdetails.html");
		opendiv("order_modal");
	}
	
	
	//导出Excel
	function exportExcel(){
	    var src = "/admin/loanB2B/exportLoanB2BInfo?orderId=" + $("#orderId").val() + "&companyName=" + $("#companyName").val()
	    		+ "&loanStatus=" + $("#loanStatus").val();
	    $("#exportIframe").attr("src",src);
	 	$('#dc_tip').show();
        	setTimeout(function() {
          		$('#dc_tip').hide();
          		document.location.href = '/admin/loan/loanB2BDetail.html';
          		
        },1500);
	}

	function submit() {
		//判定
		var applyMoney = $("#applyMoney").val();
		var repayMoney = $("#repayMoney").val();
		var repaymentFile = $("#repaymentFile").val();
		if (applyMoney == null) {
			layer.msg("请输入还款金额");
		}
		if (repaymentFile == null || repaymentFile == '') {
			layer.msg("请输入上传凭证");
		}
		if (applyMoney != repayMoney) {
			layer.msg("还款金额必须等于应还金额");
		} else {
			$
					.ajax({
						type : "POST",
						url : "/admin/companyRepay",
						dataType : "json",
						data : {
							loanId : $("#loanId").val(),
							repayPlanId : $("#repayPlanId").val(),
							repaymentMoney : $("#applyMoney").val(),
							overdueMoney : $("#overdueMoney").val(),
							remark : $("#remark").val(),
							repaymentDate : $("#repaymentDate").val(),

						},
						success : function(data) {
							layer
									.msg(
											"操作成功!",
											{
												icon : 1,
												time : 1000
											},
											function() {
												$("#fade2").css("display",
														"none");
												parent.document
														.getElementById('fade1').style.display = 'none';
												if (window.location.href
														.indexOf("category=0") > 0) {
													document.location.href = '/admin/loan/agency.html?category=0';
												} else if (window.location.href
														.indexOf("category=1") > 0) {
													document.location.href = '/admin/loan/agency.html?category=1';
												} else if (window.location.href
														.indexOf("lendedLoanInfoList") > 0) {
													document.location.href = '/admin/loan/lendedLoanInfoList.html';
												} else {
													document.location.href = '/admin/loan/loanInfoList.html';
												}
												return true;
											});
						}
					});
		}
	}

	//提不提交
</script>
</html>
