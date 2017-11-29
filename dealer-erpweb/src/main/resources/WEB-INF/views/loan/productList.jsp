<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible"
	content="IE=9; IE=8; IE=7; IE=edge; chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Cache-Control" content="no-transform">
<title>e车贷管理系统—押品评估</title>
<%@include file="../common/taglibs.jsp"%>
<link rel="stylesheet" href="${basePath}/css/lightbox.min.css">
<script src="${basePath}/js/lightbox-plus-jquery.min.js"></script>
<script src="${basePath}/js/jquery.js" ></script>
<script src="${basePath}/js/tableutils.js"></script>
<script src="${basePath}/js/Map.js"></script>
<style>
   .table > tbody > tr > td.tr_back,.table-striped > tbody > tr:nth-child(odd) > td.tr_back, .table-striped > tbody > tr:nth-child(odd) > th.tr_back{background-color:#FCF8E3; !important;}
</style>
</head>
<body>
	<input type="hidden" value=""  id="customer_id_hidden">
	<input type="hidden" value=""  id="edit_customer_id">
	<div class="tools_bar col-lg-12">
		<div class="clearfix">
			<form class="form-inline pull-left" role="form">
				<div class="form-group">
					<label class="sr-only" for="txt_name">订单号</label> <input
						type="text" class="form-control" id="orderNo" name="orderNo"
						placeholder="请输入订单号">
				</div>
				<button type="button" onclick="select();" class="btn btn-primary btn-search">
					<i class="fa fa-search"></i> 搜索
				</button>
			</form>
		</div>
		<!--<div class="list_btn">
			<ul class="list-inline">
				<li><a class="btn btn-danger " href="javascript:void(0)"
					onclick="opendiv('hmd_box')"><i class="fa fa-trash-o"></i>加入黑名单</a></li>
			</ul>
		</div>-->
	</div>
	<div class="list_box col-sm-12">
		<table data-toggle="table" class="table table-bordered table-striped">
			<thead>
				<tr>
					<th>订单号</th>
					<th>客户姓名</th>
					<th>流程状态</th>
					<th>抵押方式</th>
					<th>客户经理</th>
					<th>团队经理</th>
					<th>生成时间</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody id="record">

			</tbody>
		</table>
	</div>
	<div id="r-page"></div>
	<div id="custom_modal" class="modal fade in "></div>
	<div id="order_modal" class="modal fade in"></div>
	<div id="qs_box" class="modal modal_sml fade in">
		<div class="modal-header">
			<a type="button" href="javascript:void(0)" onclick="colsediv(0)"
				class="close"><span aria-hidden="true">&times;</span></a>
			<h4 class="modal-title" id="myModalLabel" style="font-size: 16px;">提示</h4>
		</div>
		<div class="modal-body">
			<p class="p_tip">
				<i class="fa fa-check-circle"></i> 此订单已被签收！
			</p>
			<div class="btn_list clearfix">
				<a class="btn btn-danger btn-sm" href="add.html"
					onclick="colsediv(0)">现在去评估</a><a class="btn btn-default btn-sm"
					href="javascript:void(0)" onclick="colsediv(0)">暂不评估</a>
			</div>
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
				<i class="fa fa-question-circle"></i> 确认将此押品拉入黑名单么！
			</p>
			<div class="btn_list clearfix">
				<a class="btn btn-danger btn-sm" href="index.html"
					onclick="colsediv(0)">确认</a><a class="btn btn-default btn-sm"
					href="javascript:void(0)" onclick="colsediv(0)">取消</a>
			</div>
		</div>
	</div>
	<div id="fade2" class="black_overlayx"></div>
</body>
<script>
</script>
<script type="text/javascript">
// 	var productStatus = "${map.productStatus}";
var map = new Map();
	$(function() {
		init();
		$("#productStatus").find('option[value="' + productStatus + '"]')
				.attr("selected", true);
	});

	function init() {

		var orderNo = $("#orderNo").val();
		var productStatus = $("#productStatus").val();

		if (("" != orderNo && null != orderNo)
				|| ("" !== productStatus && null !== productStatus)) {
			var param = {
				"statusnew" : "vehicleAssess",
			};
			onLoadDate(param);
		}else{
			onLoadDate(null);
		}
	}

	function onLoadDate(param) {
		var writetablefn = function(data) {
			var context;
			var loanStatus = data.loan_status;
			var loanStatusStr = "";
			if (loanStatus == "vehicleAssess") {
				loanStatusStr = "待车辆评估";
			} else if (loanStatus == "departLeadAduit") {
				loanStatusStr = "待初审";
			} else if (loanStatus == "departLeadAduit_rejected") {
				loanStatusStr = "初审不通过";
			} else if (loanStatus == "trialPhase") {
				loanStatusStr = "待总部面审";
			} else if (loanStatus == "trialPhase_rejected") {
				loanStatusStr = "总部面审不通过";
			} else if (loanStatus == "callBack") {
				loanStatusStr = "待电话核实";
			} else if (loanStatus == "visiteCheck") {
				loanStatusStr = "待线下上门核实";
			} else if (loanStatus == "judgment") {
				loanStatusStr = "待总部终审";
			} else if (loanStatus == "judgment_rejected") {
				loanStatusStr = "总部终审不通过";
			} else if (loanStatus == "signContract") {
				loanStatusStr = "待线下签订相关合同";
			} else if (loanStatus == "signContract_rejected") {
				loanStatusStr = "签订合同终止";
			} else if (loanStatus == "dataReview") {
				loanStatusStr = "资料复核";
			} else if (loanStatus == "reuploadInformatin") {
				loanStatusStr = "资料或相关合同重新上传";
			} else if (loanStatus == "lended") {
				loanStatusStr = "待出账";
			} else if (loanStatus == "repayment") {
				loanStatusStr = "还款中";
			} else if (loanStatus == "end") {
				loanStatusStr = "已完结";
			}

			var loanDetails = {};
			loanDetails.uuid = data.uuid;
			loanDetails.orderId = data.orderid;
			loanDetails.taskId = data.taskId;
			loanDetails.activityId = data.activityId;
			loanDetails.assignee = data.assignee;
			loanDetails.loan_status = data.loan_status;
			loanDetails.customerId = data.customerId;

			var pledgeType = data.pledge_type;
			var pledgeTypeStr = "";
			if (pledgeType == "drivePledge") {
				pledgeTypeStr = "押证";
			} else if (pledgeType == "vehiclePledge") {
				pledgeTypeStr = "押车";
			}
			/*BUG030-20160628*/
            var jiaji = "";
            if(data.state == "yes"){
            	jiaji = "<i class='fa fa-bookmark text-success'></i>&nbsp;&nbsp;";
            }
            
            var isImportant = "";
            if(data.is_important == "1"){
            	isImportant = "<i class='fa fa-star text-danger'></i>&nbsp;&nbsp;";
            }
            /*BUG030-20160628*/
            
			var caozuo;

			if(data.assignee != null && data.assignee != ""){
				if(loanStatus == "vehicleAssess"){
					caozuo =  "<td><a href='${basePath}/admin/todo?method=detail&taskId="+data.taskId+"'>处理</a></td>";
				}else{
					caozuo="<td><a href='#' onclick='setCustomerIdHidden(this)' id="+data.uuid+"  >处理</a></td>"
				}
			}else{
				caozuo =  "<td><a id="+data.taskId+" href='javascript:void(0);' onclick='claim(this)'>签收</a></td>";
			}

			context = "<tr id="+data.uuid+" onclick='setEditCustomer(this)'>"
					/*BUG030-20160628*/
					+ "<td>" +jiaji+ "<a id="+data.uuid
					+ " onclick='setCustomerIdHidden(this)' href='javascript:void(0);'>" + data.orderid + "</a>" + "</td>"
					+ "<td>" + isImportant
					+ "<a id="+data.uuid
					/*BUG030-20160628*/
					+ " onclick='getlenderdetails(this)' href='javascript:void(0);'>"
					+data.customer_name + "</a></td>"
					+ "<td>" + loanStatusStr + "</td>"
					+ "<td>" + pledgeTypeStr + "</td>"
					+ "<td>" + data.create_by + "</td>"
					+ "<td>" + data.principalName + "</td>"
					+ "<td>" + data.created_at.substring(0,19) + "</td>"
					+ caozuo
					+ "</tr>";

			map.put(data.uuid.toString(),loanDetails);

			return context;
		};

		pageComm("${basePath}/admin/loan/queryLoanInfoList", param == null ? {} : param, writetablefn, "record", 17);
		$("#orderNo").val(null);
	}
	var param = function () {
		return {
			"orderNo": $("#orderNo").val(),
			"statusnew":"vehicleAssess",
		};
	};

	function select() {
		onLoadDate(param());
	}


	function setCustomerIdHidden(obj){
		var id = $(obj).attr("id");
		$("#customer_id_hidden").val(id);
		var loanDetailsTemp = map.get(id);
		loanDetailsTemp.channel = "yes";
		map.put(id,loanDetailsTemp);
		$("#customer_id_hidden").val($(obj).attr("id"));
		$("#order_modal").load("/admin/loan/loanerDetail2.html");
		opendiv("order_modal");
	}

	function getlenderdetails(obj){
		$("#customer_id_hidden").val($(obj).attr("id"));
		$("#order_modal").load("/admin/loan/lenderdetails.html");
		opendiv("order_modal");
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
</script>
</html>
