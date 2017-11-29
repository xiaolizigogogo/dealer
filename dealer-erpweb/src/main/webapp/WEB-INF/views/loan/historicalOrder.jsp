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
    <script src="${basePath}/js/uploadPreview.js" type="text/javascript"></script>
    <script src="${basePath}/js/tableutils.js"></script>
    <script src="${basePath}/js/Map.js"></script>
    
    <style type="text/css">
    .table > tbody > tr > td.tr_back,.table-striped > tbody > tr:nth-child(odd) > td.tr_back, .table-striped > tbody > tr:nth-child(odd) > th.tr_back{background-color:#FCF8E3; !important;}
</style>
</head>
<body>
    <input type="hidden" value="" id="loanstatus" />
    <input type="hidden" value="" id="state"/>
    <input type="hidden" value="" id="edit_customer_id"/>
    <input type="hidden" value=""  id="statusnew">
	<input type="hidden" value=""  id="customer_id_hidden">
	<input type="hidden" value=""  id="taskId_hidden">
	<input type="hidden" value=""  id="processDefinitionId_hidden">
	<div class="tools_bar col-lg-12">
		<div class="clearfix">
			<form class="form-inline pull-left" role="form">
				<div class="form-group">
					<label class="sr-only" for="orderNo">订单号</label> <input
						type="text" class="form-control" id="orderNo" name="orderNo"
						placeholder="请输入订单号">
				</div>
				<div class="form-group">
					<label class="sr-only" for="customerName">客户姓名</label> <input
						type="text" class="form-control" id="customerName"
						name="customerName" placeholder="客户姓名">
				</div>
<!-- 				<div class="form-group"> -->
<!-- 					<label class="sr-only" for="txt_tel">客户经理</label> <input -->
<!-- 						type="text" class="form-control" id="customerManage" -->
<!-- 						name="customerManage" placeholder="客户经理"> -->
<!-- 				</div> -->
				<div class="form-group">
					<select class="form-control" id="loanStatus" name="loanStatus">
						<option value="">请选择</option>
						<option value="repayment">还款中</option>
						<option value="end">已完结</option>
						<option value="yuqi">逾期</option>
						<option value="">全部</option>
					</select>
				</div>
			<div class="form-group">
              <div class="input-group date form_date" data-date=""
                                 data-date-format="yyyy-mm-dd"
                                 data-link-field="searchDate"
                                 data-link-format="yyyy-mm-dd" style="width:200px;">
                <input class="form-control" type="text" value="" readonly style="width:100%;" id="time" >
                <span class="input-group-addon"><span
                                        class="glyphicon glyphicon-calendar"></span></span> </div>
              <input type="text" hidden="hidden" id="searchDate"
                                               name="searchDate" />
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
					<th>客户姓名</th>
					<th>流程状态</th>
					<th>抵押方式</th>
					<th>客户经理</th>
					<th>团队经理</th>
					<th>生成时间</th>
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
		<ol class="ui-step ui-step-red ui-step-10">
			<li class="step-start step-done">
				<div class="ui-step-line"></div>
				<div class="ui-step-cont">
					<span class="ui-step-cont-number">1</span> <span
						class="ui-step-cont-text">申请贷款</span>
				</div>
			</li>
			<li class="step-done">
				<div class="ui-step-line"></div>
				<div class="ui-step-cont">
					<span class="ui-step-cont-number">2</span> <span
						class="ui-step-cont-text">评估</span>
				</div>
			</li>
			<li class="step-done">
				<div class="ui-step-line"></div>
				<div class="ui-step-cont">
					<span class="ui-step-cont-number">3</span> <span
						class="ui-step-cont-text">初审</span>
				</div>
			</li>
			<li class="step-done">
				<div class="ui-step-line"></div>
				<div class="ui-step-cont">
					<span class="ui-step-cont-number">4</span> <span
						class="ui-step-cont-text">面审</span>
				</div>
			</li>
			<li class="step-done">
				<div class="ui-step-line"></div>
				<div class="ui-step-cont">
					<span class="ui-step-cont-number">5</span> <span
						class="ui-step-cont-text">电话核实</span>
				</div>
			</li>
			<li class="step-done">
				<div class="ui-step-line"></div>
				<div class="ui-step-cont">
					<span class="ui-step-cont-number">6</span> <span
						class="ui-step-cont-text">签订合同</span>
				</div>
			</li>
			<li class="step-active">
				<div class="ui-step-line"></div>
				<div class="ui-step-cont">
					<span class="ui-step-cont-number">7</span> <span
						class="ui-step-cont-text">家访</span>
				</div>
			</li>
			<li class="">
				<div class="ui-step-line"></div>
				<div class="ui-step-cont">
					<span class="ui-step-cont-number">8</span> <span
						class="ui-step-cont-text">终审</span>
				</div>
			</li>
			<li class="">
				<div class="ui-step-line"></div>
				<div class="ui-step-cont">
					<span class="ui-step-cont-number">9</span> <span
						class="ui-step-cont-text">复核</span>
				</div>
			</li>
			<li class="step-end">
				<div class="ui-step-line"></div>
				<div class="ui-step-cont">
					<span class="ui-step-cont-number">10</span> <span
						class="ui-step-cont-text">出账</span>
				</div>
			</li>

		</ol>
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
</body>
<script>
// 	function opendiv() {
// 		$(".modal").css("display", "block");
// 		$("#fade2").css("display", "block");
// 		//	    parent.document.getElementById('fade1').style.display='block';

// 	}
// 	//关闭模态框
// 	function colsediv() {
// 		$(".modal").css("display", "none");
// 		$("#fade2").css("display", "none");
// 		//	    parent.document.getElementById('fade1').style.display='none';
// 	}
</script>
<script type="text/javascript">
	var currentReviewLoanStatus = "${map.status}"; // 根据不同的状态进行查询,参数由IndexController封装为map
	var currentpledgeType = "${map.pledgeType}";
	var map = new Map();
    $(function () {
		init();
        $("#pledgeType").find('option[value="' + currentpledgeType + '"]').attr("selected", true);
        
	});

	function init() {
		
// 		$.ajax({
// 			url : "/admin/loan/getHistory/" + customer_id_hidden + ".html",
// 			type : "get",
// 			dataType : "json",	
// 			success : function(data) {
// 			}
// 		})
		var customerName = $("#customerName").val();
		var orderNo = $("#orderNo").val();
		var searchDate=$("#searchDate").val();
		var customerManage = $("#customerManage").val();
		var loanStatus = $("#loanStatus").val();
		var statusnew = $("#statusnew").val();
	    var state=$("#state").val();
	    var loanstatus=$("#loanstatus").val();

        if ( ("" != currentReviewLoanStatus && null != currentReviewLoanStatus)
                || ("" !== customerName && null !== customerName) ||  ("" !== orderNo && null !== orderNo)
                || ("" !== customerManage && null !== customerManage) || ("" !== loanStatus && null !== loanStatus)
                ||("" !== searchDate && null !== searchDate)) {
			var param = {
			     
                "status": currentReviewLoanStatus,
                "customerName": customerName,
                "customerManage":customerManage,
                "loanStatus":loanStatus,
                "orderNo":orderNo,
                "statusnew":statusnew,
                "state":state,
                "loanstatus":loanstatus,
                "searchDate":searchDate
			};
			onLoadDate(param);
		} else {
			onLoadDate({
                "status": currentReviewLoanStatus
			});
		}
	}

	function onLoadDate(param) {
        var writetablefn = function (data)
        
		{ 
        	$("#noloanorder").html(data.noloanorder);
			var context;
			$("#checkAll").prop("checked", false);

			var loanStatus = data.loanStatus;
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
			}else if (loanStatus == "mortgage") {
				loanStatusStr = "待办理抵押";
			}else if (loanStatus == "instock") {
				loanStatusStr = "待办理入库";
			}else if (loanStatus == "reloanReview"){
				loanStatusStr = "待再贷资料复核";
			}else if (loanStatus == "reloanApprove"){
				loanStatusStr = "待再贷审批";
			}else if (loanStatus == "reloanE_Contract"){
				loanStatusStr = "待再贷电子合同签订";
			}else if (loanStatus == "reloan_lended"){
				loanStatusStr = "待再贷放款";
			}else if (loanStatus == "helploanReview"){
				loanStatusStr = "待助贷资料复核";
			}else if (loanStatus == "helploanApprove"){
				loanStatusStr = "待助贷审批";
			}else if (loanStatus == "helploanE_Contract"){
				loanStatusStr = "待助贷电子合同签订";
			}else if (loanStatus == "helploan_lended"){
				loanStatusStr = "待助贷放款";
			}else if (loanStatus == "badLoanApplication"){
				loanStatusStr = "坏账归档";
			}else if (loanStatus == "receivemoneyconfirm"){
				loanStatusStr = "财务账务确认";
			}else if (loanStatus == "towTruck"){
				loanStatusStr = "已拖车";
			}else if (loanStatus == "badLoanApplication"){
				loanStatusStr = "坏账归档";
			}else if (loanStatus == "noTowTruck"){
				loanStatusStr = "未拖车";
			}else if (loanStatus == "reloanAduit_rejected"){
				loanStatusStr = "再贷初审放弃";
			}else if (loanStatus == "saleRepayment"){
				loanStatusStr = "卖车还款";
			}else if (loanStatus == "mortgage_rejected"){
				loanStatusStr = "抵押失败";
			}

            var linkUrl = "${basePath}/admin/loan/queryLoanDetail/" + data.uuid + ".html";


			var edit = "";
            if(loanStatus == "vehicleAssess"){
				edit = "<a href='"+linkUrl+"' class='link-01'>编辑</a>";
            }else{
                edit="";
			}
            
			var pledgeType = data.pledgeType;
			var pledgeTypeStr = "";
            if(pledgeType == "drivePledge"){
				pledgeTypeStr = "押证";
            }else if(pledgeType == "vehiclePledge"){
				pledgeTypeStr = "押车";
			}
            
            var caozuo;
            
            if(data.assignee != null && data.assignee != ""){
            	if(loanStatus == "vehicleAssess"){
            		caozuo =  "<td><a href='${basePath}/admin/todo?method=detail&taskId="+data.taskId+"'>处理</a></td>"; 
            	}else{
            		caozuo="<td><a href='#' onclick='setCustomerIdHidden(this)' id="+data.uuid+":"+data.orderid+":"+data.taskId+":"+data.activityId+"  >处理</a></td>"
            	}
			}else{
				caozuo =  "<td><a id="+data.taskId+" href='javascript:void(0);' onclick='claim(this)'>签收</a></td>"; 
			}
			
			var jiaji = "";
            if(data.state == "yes"){
            	jiaji = "<i class='fa fa-bookmark text-success'></i>&nbsp;&nbsp;";
            }
            
            var isImportant = "";
            if(data.isImportant == "1"){
            	isImportant = "<i class='fa fa-star text-danger'></i>&nbsp;&nbsp;";
            }
			var loanDetails = {};
			loanDetails.uuid = data.uuid;
			loanDetails.orderId = data.orderid;
			loanDetails.taskId = data.taskId;
			loanDetails.activityId = data.activityId;
			loanDetails.assignee = data.assignee;
			loanDetails.loan_status = data.loan_status;
			loanDetails.customerId = data.customerId;

            context = "<tr id="+data.uuid+" onclick='setEditCustomer(this)'>" 
			+ "<td>" + jiaji +  "<a id="+data.uuid
			+ " onclick='setCustomerIdHidden(this)' href='javascript:void(0);'>" + data.orderid + "</a>" + "</td>"
			+ "<td>" + isImportant + "<a id="+data.uuid
			+ " onclick='getlenderdetails(this)' href='javascript:void(0);'>" + data.customerName + "</a>"+"</td>"
			+ "<td>" + loanStatusStr + "</td>"
			+ "<td>" + pledgeTypeStr + "</td>"
			+ "<td>" + data.createBy + "</td>"
			+ "<td>" + data.principalName + "</td>"
			+ "<td>" + data.createdAt.substring(0,19) + "</td>"
			+ "</tr>";
			map.put(data.uuid.toString(),loanDetails);
			return context;
		};

        pageComm("${basePath}/admin/loan/getHistory", param == null ? {} : param, writetablefn, "record", 17);
		//清空日期搜索设置
		$("#time").val(null);
        $("#orderNo").val(null);
        $("#customerName").val(null);
        $("#searchDate").val(null);
        $("#statusnew").val(null);
	}
	
    var param = function () {
		return {
        	"orderNo": $("#orderNo").val(),
            "customerName": $("#customerName").val(),
            "customerManage":$("#customerManage").val(),
            "loanStatus":$("#loanStatus").val(),
            "statusnew":$("#statusnew").val(),
            "state":$("#state").val(),
            "loanstatus":$("#loanstatus").val(),
            "searchDate":$("#searchDate").val()
		};
	};

	function select() {
		onLoadDate(param());
	}
// 	function selectteam() {
// 		selectMyTeam(param)
// 	}

//     function assignment(obj){
//     	$("#state").val($(obj).attr("id"));
//     	alert($("#state").val())
//     	selectStateList(param());
//     	}
//     function querystate(obj){
//     	$("#loanstatus").val($(obj).attr("id"));
//     	alert($("#loanstatus").val())
//     	selectStateList(param());
//     }
    
    
	
// 	function selectlist() {
// 	 onLoadDate(null);
// 	}
	function reset() {
		$("#mobile").val("");
		$("#customerName").val("");
	}
	
	

	function setCustomerIdHidden(obj){
		$("#customer_id_hidden").val($(obj).attr("id"));
		$("#order_modal").load("/admin/loan/vieworderdetails.html");
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
		function getlenderdetails(obj){
			$("#customer_id_hidden").val($(obj).attr("id"));
			$("#order_modal").load("/admin/loan/lenderdetails.html");
			opendiv("order_modal");
		}
	 
	 
</script>

</html>
