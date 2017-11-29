<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible"
	content="IE=9; IE=8; IE=7; IE=edge; chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Cache-Control" content="no-transform">
<title>e车贷管理系统—借款列表</title>
<%@include file="../common/taglibs.jsp"%>
<link rel="stylesheet" type="text/css" href="${basePath}/css/bootstrap-datetimepicker.min.css">
<link rel="stylesheet" type="text/css" href="${basePath}/css/common.css"/>
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
	<div class="tools_bar col-lg-12">
		<div class="clearfix">
			<form class="form-inline pull-left" role="form">
				<div class="form-group">
					<label class="sr-only" for="orderNo">订单号</label> <input type="text"
						class="form-control" id="orderNo" name="orderNo"
						placeholder="请输入订单号">
				</div>
				<div class="form-group">
					<label class="sr-only" for="customerName">客户姓名</label> <input
						type="text" class="form-control" id="customerName"
						name="customerName" placeholder="客户姓名">
				</div>
				<div class="form-group">
					<select class="form-control" id="pledgeType" name="pledgeType">
						<option value="">请选择</option>
						<option value="signContract">未签订</option>
						<option value="no">已签订</option>
						<option value="">全部</option>
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
				<a class="btn btn-danger btn-sm" href="javascript:void(0);"
					id="confirm_a" onclick="colsediv(0)">确认</a><a
					class="btn btn-default btn-sm" href="javascript:void(0)"
					onclick="colsediv(0)">取消</a>
			</div>
		</div>
	</div>
	<div class="list_box col-sm-12">
		<table data-toggle="table" class="table table-bordered table-striped">
			<thead>
				<tr>
					<th>订单号</th>
					<th>客户姓名</th>
					<th>附件个数</th>
					<th>是否签订</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody id="record">

			</tbody>
		</table>
	</div>
	<div id="r-page"></div>
	<div id="test1" class="modal fade in">
		<div class="modal-header">
			<a type="button" href="javascript:void(0)" onclick="colsediv(0)"
				class="close"><span aria-hidden="true">&times;</span></a>
			<h4 class="modal-title" id="myModalLabel" style="font-size: 16px;">查看订单</h4>
		</div>
		<div class="modal-body">
			<div class="row" style="position: fixed;"></div>
		</div>
		<div class="modal-footer">
			<p class="text-center">
				<a class="text-center">
					<button class="btn btn-small" data-dismiss="modal"
						onclick="colsediv(0)" aria-hidden="true">保存</button>
				</a> <a class="text-center">
					<button class="btn btn-small" data-dismiss="modal"
						onclick="colsediv(0)" aria-hidden="true">返回</button>
				</a>
			</p>
		</div>
	</div>
	<div id="fade2" class="black_overlayx"></div>
	<div id="order_modal" class="modal fade in"></div>
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
<script type="text/javascript">
	var map = new Map();
	var currentReviewLoanStatus = "${map.status}"; // 根据不同的状态进行查询,参数由IndexController封装为map
	var currentpledgeType = "${map.pledgeType}";
	$(function() {
		init();
		$("#pledgeType").find('option[value="' + currentpledgeType + '"]')
				.attr("selected", true);

	});

	function init() {
		$.ajax({
			url : "${basePath}/admin/loan/queryLoanInfoCount",
			type : "get",
			datatype : "json",
			success : function(data) {
				$("#vehicleAssessdisplay").html(data.vehicleAssess);
				$("#departLeadAduitdisplay").html(data.departLeadAduit);
				$("#trialPhasedisplay").html(data.trialPhase);
				$("#callBackdisplay").html(data.callBack);
				$("#visiteCheckdisplay").html(data.visiteCheck);
				$("#judgmentdisplay").html(data.judgment);
				$("#signContractdisplay").html(data.signContract);
				$("#dataReviewdisplay").html(data.dataReview);
				$("#lendeddisplay").html(data.lended);
				$("#loanordercountdisplay").html(data.loanordercount);
				$("#noloanordercountdisplay").html(data.loanordercount);
			}
		})

		var customerName = $("#customerName").val();
		var orderNo = $("#orderNo").val();
		var customerManage = $("#customerManage").val();
		var pledgeType = $("#pledgeType").val();
		var statusnew = $("#statusnew").val();

		if (("" != currentReviewLoanStatus && null != currentReviewLoanStatus)
				|| ("" !== customerName && null !== customerName)
				|| ("" !== orderNo && null !== orderNo)
				|| ("" !== customerManage && null !== customerManage)
				|| ("" !== pledgeType && null !== pledgeType)) {
			var param = {
				"status" : currentReviewLoanStatus,
				"customerName" : customerName,
				"customerManage" : customerManage,
				"pledgeType" : pledgeType,
				"orderNo" : orderNo,
				"statusnew" : statusnew
			};
			onLoadDate(param);
		} else {
			onLoadDate({
				"status" : currentReviewLoanStatus
			});
		}
	}

	function onLoadDate(param) {
		var writetablefn = function(data)

		{
			$("#noloanorder").html(data.noloanorder);
			var context;
			$("#checkAll").prop("checked", false);

			var loanStatus = data.loanStatus;
			var a = "";
			if (loanStatus == "signContract") {
				a = "未签订";

			} else {
				a = "已签订";
			}

			var loanDetails = {};
			loanDetails.uuid = data.uuid;
			loanDetails.orderId = data.orderid;
			loanDetails.taskId = data.taskId;
			loanDetails.activityId = data.activityId;
			loanDetails.assignee = data.assignee;
			loanDetails.loan_status = data.loanStatus;
			loanDetails.customerId = data.customerId;

			var caozuo;
			if (loanStatus == "signContract") {
				if (data.assignee != null && data.assignee != "") {
					if (loanStatus == "vehicleAssess") {
						caozuo = "<td><a href='${basePath}/admin/todo?method=detail&taskId="
								+ data.taskId + "'>处理</a></td>";
					} else {
						caozuo = "<td><a href='#' onclick='setCustomerIdHidden(this)' id="
								+ data.uuid
								+ "  >处理</a></td>"
					}
				} else {
					caozuo = "<td><a id="
							+ data.taskId
							+ " href='javascript:void(0);' onclick='claim(this)'>签收</a></td>";
				}
			} else {
				caozuo = "<td><a id="
						+ data.uuid
						+  " href='javascript:void(0);' onclick='getlenderdetails(this)' >查看</a></td>";
			}

			var state = "";
			if (data.state == 'yes') {
				state = "<i class='fa fa-bookmark text-success'></i>&nbsp;";
			}
			var isImportant = "";
			if (data.isImportant == 1) {
				isImportant = "<i class='fa fa-star text-danger' ></i>&nbsp;";
			}

			context = "<tr><td>"
					+ state
					+ "<a id="
					+ data.uuid
					+ " onclick='setCustomerIdHidden(this)' href='javascript:void(0);'>"
					+ data.orderid
					+ "</a>"
					+ "</td>"
					+ "<td><a id="
					+ data.uuid
					+ " onclick='getlenderdetailsinfo(this)' href='javascript:void(0);'>"
					+ isImportant + data.customerName + "</a></td>" + "<td>"
					+ data.liacount + "</td>" + "<td>" + a + "</td>" + caozuo
					+ "</tr>";
			map.put(data.uuid.toString(),loanDetails);
			return context;
		};

		pageComm("${basePath}/admin/loan/querycontractList", param == null ? {}
				: param, writetablefn, "record", 17);
		$("#orderNo").val(null);
		$("#customerName").val(null);
		$("#pledgeType").val(null);
	}

	var param = function() {
		return {
			"orderNo" : $("#orderNo").val(),
			"customerName" : $("#customerName").val(),
			"customerManage" : $("#customerManage").val(),
			"pledgeType" : $("#pledgeType").val(),
		};
	};
	function select() {
		onLoadDate(param());
	}
	function setCustomerIdHidden(obj) {
		var id = $(obj).attr("id");
		$("#customer_id_hidden").val(id);
		var loanDetailsTemp = map.get(id);
		loanDetailsTemp.channel = "yes";
		map.put(id,loanDetailsTemp);
		$("#order_modal").load("/admin/loan/vieworderdetails.html");
		opendiv("order_modal");
	}

	function getlenderdetailsinfo(obj) {
		$("#customer_id_hidden").val($(obj).attr("id"));
		$("#order_modal").load("/admin/loan/lenderdetails.html");
		opendiv("order_modal");
	}
	function reset() {
		$("#mobile").val("");
		$("#customerName").val("");
	}

	function claim(obj) {
		var taskId = $(obj).attr("id");
		$.ajax({
			type : "POST",
			url : "/admin/todo?method=claim",
			dataType : "json",
			data : {
				taskId : taskId

			},
			success : function(data) {
				var data1 = eval(data);
				var code = data1.res;
				if (code) {
					layer.msg("操作成功!", {
						icon : 1,
						time : 1000
					}, function() {
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
			error : function() {
				layer.msg("未知错误!");
				return false;
			}

		});

	}
	//设为加急
	function addUrgent(oid) {

		if (commonToOpenDiv("edit_customer_id")) {
			commonSetHtml("alert_span", "确认将此订单设为加急么！");
			$("#confirm_a").attr("onclick", "confirmToBlackList()");
			opendiv('hmd_box');
		}

	}
	function confirmToBlackList() {
		$.ajax({
			url : "/admin/customer/addUrgent",
			data : "uuid=" + $("#edit_customer_id").val(),
			type : "post",
			dataType : "text",
			success : function(data) {
				if (data == 'success') {
					commonSetHtml("alert_span", "加急成功！");
					opendiv('hmd_box');
					$("#confirm_a").attr("onclick", "colsediv(0)");
				}
			}
		})
	}

	//弹出框公共function
	function commonToOpenDiv(oid) {
		var edit_customer_id = $("#" + oid).val();
		if (null == edit_customer_id || "" == edit_customer_id) {
			commonSetHtml("alert_span", "请先选中一个客户！");
			opendiv('hmd_box');
			return false;
		} else {
			return true;
		}
	}
	function commonSetHtml(oid, html) {
		$("#" + oid).html(html);
	}
	function getlenderdetails(obj) {
		var id = $(obj).attr("id");
		$("#customer_id_hidden").val(id);
		var loanDetailsTemp = map.get(id);
		$("#order_modal").load("/admin/loan/contractEnclosure.html");
		opendiv("order_modal");
	}
</script>
</html>
