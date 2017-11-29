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
    <script src="${basePath}/js/bootstrap-datetimepicker.min.js"></script>
    <script src="${basePath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="${basePath}/js/datetimepicker.js"></script>
    <script src="${basePath}/js/tableutils.js"></script>
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
	<input type="hidden" value=""  id="isReloanAndHeloanDis_hid">
	<div class="tools_bar col-lg-12">
	<div class="tj_box clearfix" >
	<div class="col-sm-12 row">
      <div class="col-sm-4">
        <ul>
          <li><a href="#" onclick="assignment(this)" id="">未处理的贷前订单</a> <span class="badge"  id="noloanordercountdisplay"></span></li>
        </ul>
      </div>
      <div class="col-sm-4">
        <ul>
          <li class="active" ><a  href="#" onclick="assignment(this)" id="">全部贷前订单</a> <span class="badge" id="loanordercountdisplay"></span></li>
        </ul>
      </div>
    </div>
    <div class="col-sm-12 row">
      <div class="col-sm-2">
        <ul>
          <li> <a href="#" onclick="assignment(this)" id="vehicleAssess">评估</a> <span class="badge" id="vehicleAssessdisplay"></span> </li>
          <li> <a href="#" onclick="assignment(this)" id="judgment">终审</a> <span class="badge" id="judgmentdisplay"></span> </li>
        </ul>
      </div>
      <div class="col-sm-2">
        <ul>
          <li> <a href="#" onclick="assignment(this)" id="departLeadAduit">初审</a> <span class="badge" id="departLeadAduitdisplay"></span> </li>
          <li><a href="#" onclick="assignment(this)" id="signContract">签合同</a> <span class="badge" id="signContractdisplay"></span></li>
        </ul>
      </div>
      <div class="col-sm-2">
        <ul>
          <li><a href="#" onclick="assignment(this)" id="trialPhase" >面审</a> <span class="badge" id="trialPhasedisplay"></span></li>
          <li> <a href="#" onclick="assignment(this)" id="mortgage">办理抵押</a> <span class="badge" id="mortgagedisplay"></span></li>
        </ul>
      </div>
      <div class="col-sm-2">
        <ul>
          <li><a href="#" onclick="assignment(this)" id="callBack">电话核实</a> <span class="badge" id="callBackdisplay"></span></li>
          <li><a href="#" onclick="assignment(this)" id="instock">办理入库</a> <span class="badge" id="instockdisplay"></span></li>
        </ul>
      </div>
      <div class="col-sm-2">
        <ul>
          <li> <a href="#" onclick="assignment(this)" id="visiteCheck">家访</a> <span class="badge" id="visiteCheckdisplay"></span> </li>
          <li> <a href="#" onclick="assignment(this)" id="dataReview">复核</a> <span class="badge" id="dataReviewdisplay"></span></li>
        </ul>
      </div>
    </div>
     <div class="col-sm-12 row" id="headHref">
      <div class="col-sm-2" id="headlended">
        <ul>
          <li> <a href="#" onclick="assignment(this)" id="lended">出账</a> <span class="badge" id="lendeddisplay"></span> </li>
          <li><a href="#" onclick="assignment(this)" id="helploanReview">助贷资料复核</a> <span class="badge" id="helploanReviewdisplay"></span> </li>
        </ul>
      </div>
      <div class="col-sm-2">
        <ul>
          <li> <a href="#" onclick="assignment(this)" id="reloanReview">再贷资料复核</a> <span class="badge" id="reloanReviewdisplay"></span> </li>
          <li><a href="#" onclick="assignment(this)" id="helploanApprove">助贷审批</a> <span class="badge" id="helploanApprovedisplay"></span></li>
        </ul>
      </div>
      <div class="col-sm-2">
        <ul>
          <li> <a href="#" onclick="assignment(this)" id="reloanApprove">再贷审批</a> <span class="badge" id="reloanApprovedisplay"></span></li>
          <li><a href="#" onclick="assignment(this)" id="helploanE_Contract">助贷电子合同签订</a> <span class="badge" id="helploanE_Contractdisplay"></span></li>
        </ul>
      </div>
      <div class="col-sm-2">
        <ul>
          <li><a href="#" onclick="assignment(this)" id="reloanE_Contract">再贷电子合同签订</a> <span class="badge" id="reloanE_Contractdisplay"></span></li>
          <li><a href="#" onclick="assignment(this)" id="helploan_lended">助贷放款</a> <span class="badge" id="helploan_lendeddisplay"></span> </li>
        </ul>
      </div>
      <div class="col-sm-2">
        <ul>
          <li> <a href="#" onclick="assignment(this)" id="reloan_lended" >再贷放款</a> <span class="badge" id="reloan_lendeddisplay"></span></li>
        </ul>
      </div>
    </div>
		</div>
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
				<div class="form-group">
					<label class="sr-only" for="customerManage">客户经理</label> <input
						type="text" class="form-control" id="customerManage"
						name="customerManage" placeholder="客户经理">
				</div>
				<div class="form-group">
					<select class="form-control" id="pledgeType" name="pledgeType">
						<option value="">请选择</option>
						<option value="drivePledge">押证</option>
						<option value="vehiclePledge">押车</option>
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
				<li><a class="btn btn-danger"
					href="/admin/loan/goLoanApplyPage.html"> <i class="fa fa-plus"></i>贷款申请
				</a></li>
				<li><a class="btn btn-danger " onclick="addUrgent();"><i
						class="fa fa-star"></i>设为加急</a></li>
      			<li><a class="btn btn-danger" href="javascript:void(0)" id="dc_btn" onclick="exportExcel();"> <i class="fa fa-download"></i>导出文件</a></li>
        		<li><p class="text-danger" id="dc_tip" style="display:none;">货前待办统计表已导出</p></li>
    		</ul>
 		 </div>
			</ul>
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
			<div class="btn_list clearfix" id="selector">
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
<script type="text/javascript">
	var currentReviewLoanStatus = "${map.status}"; // 根据不同的状态进行查询,参数由IndexController封装为map
	var currentpledgeType = "${map.pledgeType}";
	var isReloanAndHeloanDis = "";
    $(function () {
		init();
        $("#pledgeType").find('option[value="' + currentpledgeType + '"]').attr("selected", true);
			isReloanAndHeloanDis = $("#isReloanAndHeloanDis_hid").val();
			var headHref = "";
			var lended = "";
			if("y" == isReloanAndHeloanDis){
				headHref += "<div class='col-sm-2'><ul>";
				headHref += "<li> <a href='#' onclick='assignment(this)' id='reloanReview'>再贷资料复核</a> <span class='badge' id='reloanReviewdisplay'></span> </li>";
				headHref += "<li> <a href='#' onclick='assignment(this)' id='helploanApprove'>助贷审批</a> <span class='badge' id='helploanApprovedisplay'></span> </li>";
				headHref += "</ul></div>";
				headHref += "<div class='col-sm-2'><ul>";
				headHref += "<li> <a href='#' onclick='assignment(this)' id='reloanAduit'>再贷初审</a> <span class='badge' id='reloanAduitdisplay'></span> </li>";
				headHref += "</ul></div>";
				headHref += "<div class='col-sm-2'><ul>";
				headHref += "<li> <a href='#' onclick='assignment(this)' id='reloanApprove'>再贷审批</a> <span class='badge' id='reloanApprovedisplay'></span> </li>";
				headHref += "<li> <a href='#' onclick='assignment(this)' id='helploanE_Contract'>助贷电子合同签订</a> <span class='badge' id='helploanE_Contractdisplay'></span> </li>";
				headHref += "</ul></div>";
				headHref += "<div class='col-sm-2'><ul>";
				headHref += "<li> <a href='#' onclick='assignment(this)' id='reloanE_Contract'>再贷电子合同签订</a> <span class='badge' id='reloanE_Contractdisplay'></span> </li>";
				headHref += "<li> <a href='#' onclick='assignment(this)' id='helploan_lended'>助贷放款</a> <span class='badge' id='helploan_lendeddisplay'></span> </li>";
				headHref += "</ul></div>";
				headHref += "<div class='col-sm-2'><ul>";
				headHref += "<li> <a href='#' onclick='assignment(this)' id='reloan_lended'>再贷放款</a> <span class='badge' id='reloan_lendeddisplay'></span> </li>";
				headHref += "</ul></div>";
				headHref += "<div class='col-sm-2'><ul>";
				headHref += "<li> <a href='#' onclick='assignment(this)' id='helploanAduit'>助贷初审</a> <span class='badge' id='helploanAduitdisplay'></span> </li>";
				headHref += "</ul></div>";
				lended += "<ul><li> <a href='#' onclick='assignment(this)' id='helploanReview'>助贷资料复核</a> <span class='badge' id='helploanReviewdisplay'></span> </li></ul>";
				$("#headlended").append(lended);
				$("#headHref").append(headHref);
				
			}
	});
	
	function init() {
		$.ajax({
			url:"${basePath}/admin/loan/queryLoanInfoCount",
			type:"get",
			datatype:"json",
			async:true,
			success:function(data){
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
				$("#mortgagedisplay").html(data.mortgage);
				$("#instockdisplay").html(data.instock);
				$("#reloanReviewdisplay").html(data.reloanReview);
				$("#reloanApprovedisplay").html(data.reloanApprove);
				$("#reloanE_Contractdisplay").html(data.reloanE_Contract);
				$("#reloan_lendeddisplay").html(data.reloan_lended);
				$("#helploanReviewdisplay").html(data.helploanReview);
				$("#helploanApprovedisplay").html(data.helploanApprove);
				$("#helploanE_Contractdisplay").html(data.helploanE_Contract);
				$("#helploan_lendeddisplay").html(data.helploan_lended);
				$("#reloanAduitdisplay").html(data.reloanAduit);
				$("#helploanAduitdisplay").html(data.helploanAduit);
				$("#isReloanAndHeloanDis_hid").val(data.isReloanAndHelploanDis);
			}
		})
		var customerName = $("#customerName").val();
		var orderNo = $("#orderNo").val();
		var customerManage = $("#customerManage").val();
		var pledgeType = $("#pledgeType").val();
		var statusnew = $("#statusnew").val();

        if ( ("" != currentReviewLoanStatus && null != currentReviewLoanStatus)
                || ("" !== customerName && null !== customerName) ||  ("" !== orderNo && null !== orderNo)
                || ("" !== customerManage && null !== customerManage) || ("" !== pledgeType && null !== pledgeType)) {
			var param = {
                "status": currentReviewLoanStatus,
                "customerName": customerName,
                "customerManage":customerManage,
                "pledgeType":pledgeType,
                "orderNo":orderNo,
                "statusnew":statusnew
			};
			onLoadDate(param);
		} else {
			onLoadDate({
                "status": currentReviewLoanStatus
			});
		}
		 //changeHeight();
	}

	function onLoadDate(param) {
        var writetablefn = function (data)
        
		{ 
        	$("#noloanorder").html(data.noloanorder);
			var context;
			$("#checkAll").prop("checked", false);

			var loanStatus = data.loan_status;
			isReloanAndHeloanDis = $("#isReloanAndHeloanDis_hid").val();
			//订单状态
			var loanStatusStr = "待"+data.name;

            var linkUrl = "${basePath}/admin/loan/queryLoanDetail/" + data.uuid + ".html";
            
			var pledgeType = data.pledge_type;
			var pledgeTypeStr = "";
            if(pledgeType == "drivePledge"){
				pledgeTypeStr = "押证";
            }else if(pledgeType == "vehiclePledge"){
				pledgeTypeStr = "押车";
			}
            
            var jiaji = "";
             var states="no";
            if(data.state == "yes"){
            	jiaji = "<i class='fa fa-bookmark text-success'></i>&nbsp;&nbsp;";
            	states="yes";
            }
            
            var isImportant = "";
            if(data.is_important == "1"){
            	isImportant = "<i class='fa fa-star text-danger'></i>&nbsp;&nbsp;";
            }
            
            var caozuo;
            
            if(data.assignee != null && data.assignee != ""){
            	if((loanStatus == "vehicleAssess")||
						(loanStatus == "instock")){
            		caozuo =  "<td><a href='${basePath}/admin/todo?method=detail&taskId="+data.taskId+"'>处理</a></td>";
            	}else if(loanStatus=="reuploadInformatin"){
            		caozuo="<td><a href='#' onclick='setCustomerIdHidden2(this)' id="+data.uuid+":"+data.orderid+":"+data.taskId+":"+data.activityId+":"+data.assignee+":"+data.loan_status+":no  >处理</a></td>"
            	}
            	else{
            		caozuo="<td><a href='#' onclick='setCustomerIdHidden(this)' id="+data.uuid+":"+data.orderid+":"+data.taskId+":"+data.activityId+":"+data.assignee+":"+data.loan_status+":no  >处理</a></td>"
            	}
			}else{
				caozuo =  "<td><a id="+data.taskId+" href='javascript:void(0);' onclick='claim(this)'>签收</a></td>"; 
			}

			context = "<tr id="+data.uuid+":"+states+" onclick='setEditCustomer(this)'>" 
					+ "<td>" +jiaji+ "<a id="+data.uuid+":"+data.orderid+":"+data.taskId+":"+data.activityId+":"+data.assignee+":"+data.loan_status+":yes"
					+ " onclick='setCustomerIdHidden(this)' href='javascript:void(0);'>" + data.orderid + "</a>" + "</td>"
					+ "<td>" + isImportant
					+ "<a id="+data.uuid+":"+data.orderid+":"+data.taskId+":"+data.activityId+"::"+":"+data.customerId
					+ " onclick='getlenderdetails(this)' href='javascript:void(0);'>" 
					+data.customer_name + "</a></td>"
					+ "<td>" + loanStatusStr + "</td>"
					+ "<td>" + pledgeTypeStr + "</td>"
					+ "<td>" + data.create_by + "</td>"
					+ "<td>" + data.principalName + "</td>"
					+ "<td>" + new Date(data.created_at).Format("yyyy-MM-dd") + "</td>"
					+ caozuo
					+ "</tr>";
			return context;
		};
  
        pageComm("${basePath}/admin/loan/queryLoanInfoList", param == null ? {} : param, writetablefn, "record", 17);
        $("#orderNo").val(null);
        $("#customerName").val(null);
        $("#customerManage").val(null);
        $("#pledgeType").val(null);
	}

    var param = function () {
    	if(arguments.length==1){
    			return {
        	"orderNo": $("#orderNo").val(),
            "customerName": $("#customerName").val(),
            "customerManage":$("#customerManage").val(),
            "pledgeType":$("#pledgeType").val(),
            "statusnew":$("#statusnew").val(),
            "claim":"claim"
			};
    	}
    	else
    	{
		return {
        	"orderNo": $("#orderNo").val(),
            "customerName": $("#customerName").val(),
            "customerManage":$("#customerManage").val(),
            "pledgeType":$("#pledgeType").val(),
            "statusnew":$("#statusnew").val(),
		};
		}
	};
    function assignment(obj){
    	$("#statusnew").val($(obj).attr("id"));
    	
    	$("#customerName").val("");
		$("#orderNo").val("");
		$("#customerManage").val("");
		$("#pledgeType").val("");
		$(obj).parents($(".col-sm-12")).find('li').removeClass('active');
	    $(obj).parents("li").addClass('active');
		select();
    	}
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
	
	function select1() {
		onLoadDate(param());
		colsediv(0);
	}

	function reset() {
		$("#mobile").val("");
		$("#customerName").val("");
	}

	function setCustomerIdHidden(obj){
		$("#customer_id_hidden").val($(obj).attr("id"));
		$("#order_modal").load("/admin/loan/loanerDetail2.html");
		opendiv("order_modal");
	}
	
	function setCustomerIdHidden2(obj){
		$("#customer_id_hidden").val($(obj).attr("id"));
		$("#order_modal").load("/admin/loan/loanerDetailEditACB.html");
		opendiv("order_modal");
	}
	
	
	function caozuo (){
	   var a=$("#processid").val();S
	   colsediv(0)
	   window.location ="${basePath}/admin/todo?method=detail&taskId="+a; 
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
                    	 select('claim');
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
	 //设为加急
	 function addUrgent(oid){
		 $("#selector").show();
		 if(    commonToOpenDiv("edit_customer_id")){
	    		commonSetHtml("alert_span","确认将此订单设为加急么！");
	    		$("#confirm_a").attr("onclick","confirmToBlackList()");
	    		opendiv('hmd_box');
	    	}
		 
	 }
	 function confirmToBlackList(){
	    	$.ajax({
	    		url:"/admin/customer/addUrgent",
	    		data:"uuid=" +$("#edit_customer_id").val().split(":")[0],
	    		type:"post",
	    		dataType:"text",
	    		success:function(data){
	    			if(data == 'success'){
	    			    $("#edit_customer_id").val(null);
	    			    prompt();
	    				commonSetHtml("alert_span","加急成功！");
	    			}
	    		}
	    	})
	    }
	   
	 //弹出框公共function
	 function commonToOpenDiv(oid){
	    	var edit_customer_id =  $("#"+oid).val();
	    	var a=edit_customer_id.split(":")[1];
    		if(a=="yes"){
    			commonSetHtml("alert_span","该订单已为加急请重新选择！");
    			opendiv('hmd_box');
    			return false;
    	    }else if(null == edit_customer_id || "" == edit_customer_id){
	    		commonSetHtml("alert_span","请先选中一个订单！");
	    		opendiv('hmd_box');
	    		return false;
	    	}else{
	    		return true;
	    	}
	 }
	 function prompt(){
        opendiv('hmd_box');
        $("#selector").hide();
        setTimeout(function() {
            colsediv(0);
            select1();
        },
        1500);
    }
	 function commonSetHtml(oid,html){
	    	$("#" + oid).html(html);
	 }
	 
	 function getlenderdetails(obj){
		$("#customer_id_hidden").val($(obj).attr("id"));
		$("#order_modal").load("/admin/loan/lenderdetails.html");
		opendiv("order_modal");
	 }

		function exportExcel(type){
			var src = "/admin/loan/exportloanInfoListCYB?orderNo=" + $("#orderNo").val() + "&customerName=" + $("#customerManage").val() 
					+ "&customerManage=" + $("#customerManage").val() + "&pledgeType=" + $("#pledgeType").val() + "&statusnew=" + $("#statusnew").val();
			$("#exportIframe").attr("src",src);
			$('#dc_tip').show();
		    setTimeout(function() {
		          $('#dc_tip').hide();
		     },1500);
			}
	 
</script>
</html>