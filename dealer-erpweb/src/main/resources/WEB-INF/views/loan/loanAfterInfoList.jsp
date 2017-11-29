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
<link rel="stylesheet"
	href="${basePath}/css/bootstrap-datetimepicker.min.css">
	<link type="text/css" rel="stylesheet" href="${basePath}/css/lightbox.min.css" />
<script src="${basePath}/js/bootstrap-datetimepicker.min.js"></script>
<script src="${basePath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="${basePath}/js/datetimepicker.js"></script>
<script src="${basePath}/js/tableutils.js"></script>
<script src="${basePath}/js/loan/loanHelper.js"></script>
<script type="text/javascript" src="${basePath}/js/lightbox.js"></script>
<script type="text/javascript" src="${basePath}/js/Map.js"></script>
</head>
<body>
	<input type="hidden" id="customer_id_hidden" />
	<input type="hidden" id="status_hidden" />
	<div class="tools_bar col-sm-12 ">
		<div class="tj_box clearfix">
			<div class="col-sm-12 row">
				<div class="col-sm-3 ">
					<ul>
						<li class="active"><a href="javascript:void(0);" onclick="assignment(this)" id="allOrder" >全部订单</a> <span class="badge" id="allOrderNumber">0</span></li>
					</ul>
				</div>
				<div class="col-sm-3 ">
					<ul>
						<li><a href="javascript:void(0);" onclick="assignment(this)" id="overDueTodayOrder">今日逾期订单</a> <span class="badge red" id="overDueToday">0</span></li>
					</ul>
				</div>
				<div class="col-sm-3">
					<ul>
						<li><a href="javascript:void(0);" onclick="assignment(this)" id="overDueSevenDayOrder">7日内逾期订单</a> <span class="badge" id="overDueSevenDay">0</span></li>
					</ul>
				</div>
				<div class="col-sm-3">
					<ul>
						<li><a href="javascript:void(0);" onclick="assignment(this)" id="overDueUnhandledOrder">逾期未处理订单</a> <span class="badge" id="overDueUnhandled">0</span></li>
					</ul>
				</div>

			</div>

		</div>
		<div class="clearfix">
			<form class="form-inline pull-left" role="form">
				<div class="form-group">
					<label class="sr-only" for="txt_name">订单号</label> <input
						type="text" class="form-control" id="orderNo"
						placeholder="请输入订单号">
					<label class="sr-only" for="txt_name">订单号</label> <input
						type="text" class="form-control" id="customerName"
						placeholder="请输入客户名">
				</div>
				<div class="form-group">
					<select class="form-control" id="pledgeType">
						<option value="">全部</option>
						<option value="repayment">待还款</option>
						<option value="yuqi">逾期</option>
					</select>
				</div>
				<button type="button" onclick="select()" class="btn btn-primary btn-search">
					<i class="fa fa-search"></i> 搜索
				</button>
			</form>
			<ul class="list-inline pull-right">
			<li><a class="btn btn-danger" href="javascript:void(0)" id="dc_btn" onclick="exportExcel();"> <i class="fa fa-download"></i>导出文件</a></li>
        		<li><p class="text-danger" id="dc_tip" style="display:none;">货后待办统计表已导出</p></li>
			</ul>
		</div>
	</div>
	<div class="list_box col-sm-12">
		<table class="table table-bordered table-striped">
			<thead>
				<tr>
					<th>订单号</th>
					<th>客户姓名</th>
					<th>订单状态</th>
					<th>任务节点</th>
					<th>期数</th>
					<th>本期应还金额</th>
					<th>本期应还时间</th>
					<th>客户经理</th>
					<th>团队经理</th>
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
				<a class="btn btn-danger btn-sm" href="javascript:void(0)"
					onclick="colsediv(0); opendiv('order_modal');">现在去处理</a><a
					class="btn btn-default btn-sm" href="javascript:void(0)"
					onclick="colsediv(0)">暂不处理</a>
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
				<a class="btn btn-danger btn-sm" href="../product/index.html"
					onclick="colsediv(0)">确认</a><a class="btn btn-default btn-sm"
					href="javascript:void(0)" onclick="colsediv(0)">取消</a>
			</div>
		</div>
	</div>
	<div id="fade2" class="black_overlayx"></div>
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
	<iframe src="" style="display:none;" id="exportIframe">
	</iframe>
</body>
<script>
	$(document).ready(function(e) {
// 		$("#custom_modal").load("../custom/custom_modal.html"); 
// 		$("#order_modal").load("../order/a_order_modal.html"); 
  	});
</script>

<script type="text/javascript">
	var currentpledgeType = "${map.pledgeType}";
	var map = new Map();
    $(function () {
		init();
        $("#pledgeType").find('option[value="' + currentpledgeType + '"]').attr("selected", true);
        
	});
	
	function init() {
		$.ajax({
			url:"${basePath}/admin/loan/queryLoanAfterCount",
			type:"get",
			datatype:"json",
			success:function(data){
				$("#overDueToday").html(data.overDueToday);
				$("#overDueSevenDay").html(data.overDueSevenDay);
				$("#overDueUnhandled").html(data.overDueUnhandled);
				$("#allOrderNumber").html(data.allOrdercount);
			}
		})
		
		var orderNo = $("#orderNo").val();
		var pledgeType = $("#pledgeType").val();
		var status = $("#status_hidden").val();
		var customerName=$("#customerName").val();

        if ( ("" !== orderNo && null !== orderNo) || ("" !== pledgeType && null !== pledgeType)) {
			var param = {
                "pledgeType":pledgeType,
                "orderNo":orderNo,
                "status":status,
                "customerName":customerName
			};
			onLoadDate(param);
		} else {
			onLoadDate({
			});
		}
	}

	function onLoadDate(param) {
        var writetablefn = function (data)
        
		{ 
			var context;

			var repaydiff = data.repaydiff;
			var loanStatusStr = "";
			if (repaydiff >= 0) {
				loanStatusStr = "<span class='label label-info'>还款中</span>";
			} else if(repaydiff < 0){
				loanStatusStr = "<span class='label label-danger'>逾&nbsp;&nbsp;&nbsp;&nbsp;期</span>";
			}

            
            var caozuo;

			var loanDetails = {};
			loanDetails.uuid = data.uuid;
			loanDetails.orderId = data.orderid;
			loanDetails.taskId = data.taskId;
			loanDetails.repId = data.repId;
			loanDetails.customerId = data.customerId;
			loanDetails.assignee = data.assignee;
			loanDetails.activityId = data.activityId;

            if(data.assignee != null && data.assignee != ""){
//             	if(loanStatus == "vehicleAssess"){
//            		caozuo =  "<td><a href='${basePath}/admin/todo?method=detail&taskId="+data.taskId+"'>处理</a></td>"; 
//             	}else{
             		caozuo="<td><a href='#' onclick='setCustomerIdHidden(this)' id="+data.uuid+">处理</a></td>"
//             	}
			}else{
				caozuo =  "<td><a id="+data.taskId+" href='javascript:void(0);' onclick='claim(this)'>签收</a></td>"; 
			}
            
            var jiaji = "";
            if(data.state == "yes"){
            	jiaji = "<i class='fa fa-bookmark text-success'></i>&nbsp;&nbsp;";
            }
            
            var isImportant = "";
            if(data.isImportant == "1"){
            	isImportant =  "<i class='fa fa-star text-danger'></i>&nbsp;&nbsp;";
            }

			context = "<tr id="+data.uuid+">" 
					+ "<td>" 
					+ jiaji
					+ "<a id='"+data.uuid+"' onclick='setCustomerIdHiddenSubmit(this)' href='javascript:void(0);'>" + data.orderid + "</a>" + "</td>"+"<td>"
					+ isImportant
					+ "<a id='"+data.uuid+"' onclick='getlenderdetails(this)' href='javascript:void(0);'>"
					+ data.customer_name + "</a>"+"</td>"
					+ "<td>" + loanStatusStr + "</td>"
					+ "<td>" + data.taskName + "</td>" 
					+ "<td>第" + data.repayPeriod + "期</td>" 
					+ "<td>" + data.repaymentSum + "</td>"
					+ "<td>" + new Date(data.repayDate).Format("yyyy-MM-dd") + "</td>"
					+ "<td>" + data.clientManager + "</td>"
					+ "<td>" + data.principalName + "</td>"
					+ caozuo
					+ "</tr>";

			map.put(data.uuid.toString(),loanDetails);

			return context;
		};

        pageComm("${basePath}/admin/loan/queryLoanAfterInfoList", param == null ? {} : param, writetablefn, "record", 17);
        $("#orderNo").val(null);
        $("#pledgeType").val(null);
	}

    var param = function () {
    	if(arguments.length==1){
			return {
	        	"orderNo": $("#orderNo").val(),
	            "pledgeType":$("#pledgeType").val(),
	            "status" : $("#status_hidden").val(),
	            "customerName":$("#customerName").val(),
        "claim":"claim"
		};
	}
    	else{
		return {
        	"orderNo": $("#orderNo").val(),
            "pledgeType":$("#pledgeType").val(),
            "status" : $("#status_hidden").val(),
            "customerName":$("#customerName").val()
		};
    	}
	};
	function select() {
		if(arguments.length==1)
		{
			onLoadDate(param('claim'));
		}
		else
		{
			onLoadDate(param());
		}
	}
	
	function assignment(obj){
	    $("#orderNo").val(null);
	    $("#pledgeType").val(null);  
    	$("#status_hidden").val($(obj).attr("id"));
    	$(obj).parents($(".col-sm-12")).find('li').removeClass('active');
	    $(obj).parents("li").addClass('active');
    	select();
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
                    	 //select('claim');
                    	 $(obj).html("处理");
							$(obj).attr("href","#");
							$(obj).attr("onclick","setCustomerIdHidden(this)");
							$(obj).attr("id",$(obj).parent().parent().attr("id").substring(0,32));
							var id = $(obj).parent().parent().attr("id").substring(0,32);
							var loanDetailsTemp = map.get(id);
							loanDetailsTemp.channel = "no";
							map.put(id,loanDetailsTemp);
							loanDetailsTemp.assignee = data.assignee;
							map.put(id,loanDetailsTemp);
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
		//$("#customer_id_hidden").val($(obj).attr("id"));
		var id = $(obj).attr("id");
		$("#customer_id_hidden").val(id);
		var loanDetailsTemp = map.get(id);
		loanDetailsTemp.channel = "yes";
		map.put(id,loanDetailsTemp);
		$("#order_modal").load("/admin/loan/loanerDetail3.html");
		opendiv("order_modal");
	}

	function setCustomerIdHiddenSubmit(obj){
		//$("#customer_id_hidden").val($(obj).attr("id"));
		var id = $(obj).attr("id");
		$("#customer_id_hidden").val(id);
		var loanDetailsTemp = map.get(id);
		loanDetailsTemp.channel = "no";
		map.put(id,loanDetailsTemp);
		$("#order_modal").load("/admin/loan/loanerDetail3.html");
		opendiv("order_modal");
	}

	function getlenderdetails(obj){
		debugger;
		$("#customer_id_hidden").val($(obj).attr("id"));
		$("#order_modal").load("/admin/loan/lenderdetails.html");
		opendiv("order_modal");
	}  
	function exportExcel(type){
		debugger;
		var src = "/admin/loan/exportloanAfterList?orderNo=" + $("#orderNo").val() + "&customerName=" + $("#customerName").val() 
				 + "&pledgeType=" + $("#pledgeType").val() + "&status=" + $("#status_hidden").val();
		$("#exportIframe").attr("src",src);
		$('#dc_tip').show();
	    setTimeout(function() {
	          $('#dc_tip').hide();
	     },1500);
		}
</script>
</html>
