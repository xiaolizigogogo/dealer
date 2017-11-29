<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=edge; chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Cache-Control" content="no-transform">
    <title>e车贷管理系统—分销列表</title>
    <%@include file="../common/taglibs.jsp" %>
    <link rel="stylesheet" href="${basePath}/css/bootstrap-datetimepicker.min.css">
<%--     <link rel="stylesheet" href="${ basePath }/css/bootstrap/bootstrap-table.css"> --%>
    <script src="${basePath}/js/bootstrap-datetimepicker.min.js"></script>
    <script src="${basePath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="${basePath}/js/datetimepicker.js"></script>
    <script type="text/javascript" src="${basePath}/js/dateRange.js"></script>
    <link rel="stylesheet" type="text/css" href="${basePath}/css/dateRange.css"/>
    <script src="${basePath}/js/tableutils.js"></script>
    <script src="${basePath}/js/Map.js"></script>
    <style type="text/css">
    .table > tbody > tr > td.tr_back,.table-striped > tbody > tr:nth-child(odd) > td.tr_back, .table-striped > tbody > tr:nth-child(odd) > th.tr_back{background-color:#FCF8E3; !important;}
</style>
</head>
<body>
<input type="hidden" id="startDate" name="startDate"/>
<input type="hidden" id="endDate" name="startDate"/>
<input type="hidden" id="customer_id_hidden" />
<div class="tools_bar col-lg-12">
  <div class="tj_box clearfix">
    <div class="col-sm-12 row">
      <div class="col-sm-3" >
        <ul>
          <li>订单数 <span class="badge red" id="order_count"></span></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <ul>
          <li>放款金额 <b class="text-danger" id="apply_money_sum"></b></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <ul>
          <li>提成金额 <b class="text-success" id="userCommissionSum"></b></li>
        </ul>
      </div>
    </div>
  </div>
  <div class="clearfix">
    <form class="form-inline pull-left" role="form">
      <div class="form-group">
        <label class="sr-only" for="orderNo">订单号</label>
        <input type="text" class="form-control" id="orderNo" name="orderNo" placeholder="请输入订单号">
      </div>
      <div class="form-group">
        <label class="sr-only" for="customerName">客户姓名</label>
        <input type="text" class="form-control" id="customerName" name="customerName" placeholder="客户姓名">
      </div>
     <div class="form-group">
        <div class="ta_date" id="div_date1"> <span class="date_title" id="date1"></span> <a class="opt_sel" id="input_trigger1" href="#"> <i class="i_orderd"></i> </a> </div>
        <div id="datePicker1"></div>
      </div>
      <div class="form-group">
      	<select class="form-control" id="customer_source" name="customer_source">
        	<option value="">客户来源</option>
        	<option value="0">线下</option>
        	<option value="1">分销</option>
      	</select>
      </div>
      <button type="button" onclick="select()" class="btn btn-primary btn-search"><i class="fa fa-search"></i> 搜索</button>
    </form>
  </div>
</div>
<div class="list_box col-sm-12">
  <table  class="table table-bordered table-striped">
    <thead>
      <tr>
        <th>订单号</th>
        <th>客户姓名</th>
        <th>合同号</th>
        <th>流程状态</th>
        <th>客户经理</th>
        <th>申请金额(元)</th>
        <th>审批金额(元)</th>
        <th>业务员提成(元)</th>
        <th>客户类型</th>
        <th>申请时间</th>
        <th>操作</th>
      </tr>
    </thead>
    <tbody id="record">
      <tr>
        
      </tr>
    </tbody>
  </table>
</div>
<div id="r-page"></div>
<div id="custom_modal" class="modal fade in"> </div>
<div id="order_modal" class="modal fade in"> </div>
<div id="fx_modal" class="modal modal_mid fade in">

</div>
<div id="fade2" class="black_overlayx"> </div>
</body>
<script type="text/javascript">
    var map = new Map();
    $(function () {
        init();
        $("#fx_modal").load("/admin/loan/saleDetail.html");
		
		$.ajax({
			url:"${basePath}/admin/financeManager/commissionManageCount",
			type:"get",
			async:false,
			success:function(data){
				//alert(data);
				$("#order_count").html(data.order_count);
				$("#apply_money_sum").html(data.applyMoneySum + "元");
				$("#userCommissionSum").html(data.userCommissionSum  + "元");
			}
		})
	});
	
	function init() {
		
		var customerName = $("#customerName").val();
		var orderNo = $("#orderNo").val();
		var startDate = $("#startDate").val();
        var endDate = $("#endDate").val();
		var customer_source = $("#customer_source").val();
        if (("" != customerName && null != customerName) ||  ("" != orderNo && null != orderNo)
        	|| (("" != startDate && null != startDate) && ("" != endDate && null != endDate)) || 
        	("" != customer_source && null != customer_source)) {
			var param = {
                "customerName": customerName,
                "orderNo":orderNo,
                "startDate" : startDate,
                "endDate" : endDate,
                "customer_source" : customer_source
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

            var loanDetails = {};
            loanDetails.uuid = data.loanId;
            loanDetails.orderId = data.loanOrderId;
            loanDetails.taskId = data.taskId;
            loanDetails.activityId = data.activityId;
            loanDetails.assignee = data.assignee;
            loanDetails.loan_status = data.loan_status;
            loanDetails.customerId = data.customerId;
            loanDetails.contract_num = data.contract_num;
            loanDetails.repId = data.repId;

			var state = "";
			if(data.state == 'yes'){
				state = "<i class='fa fa-bookmark text-success'></i>&nbsp;";
			}
			var isImportant = "";
			if(data.isImportant == 1){
				isImportant = "<i class='fa fa-star text-danger' ></i>&nbsp;";
			}
			
			var loanStatusStr = returnLoanStatus(data.loanStatus);
			
			var cusType = "";
			if(data.openId != null && data.openId != ""){
				cusType = "分销";
			}else{
				cusType = "线下";
			}
            datalist = data;
			context = "<tr>"
					+ "<td><a onclick='setCustomerIdHidden(this)' href='javascript:void(0);' id='"+datalist.loanId+"'>" + state + datalist.loanOrderId + "</a></td>"					+ "<td><a onclick='getlenderdetails(this)' href='javascript:void(0);' id='"+datalist.loanId+"'>" + isImportant + datalist.customerName + "</a></td>"
					+ "<td><a onclick='setCustomerIdHidden(this)' href='javascript:void(0);' id='"+datalist.loanId+"'>" + datalist.contract_num + "</a></td>"
					+ "<td>" + loanStatusStr + "</td>"
					+ "<td>" + datalist.realName + "</td>"
					+ "<td>" + datalist.applyMoney + "</td>"
					+ "<td>" + datalist.loanMoney + "</td>"
					+ "<td>" + datalist.userCommission + "</td>"
					+ "<td>" + cusType + "</td>"
					+ "<td>" + datalist.applyedAt + "</td>"
					+ "<td><a href = 'javascript:void(0)' id="+datalist.loanId+" onclick='showDetail(this)'>查看</a></td>"
					+ "</tr>";

            map.put(datalist.loanId.toString(),loanDetails);
			return context;
		};

        pageComm("${basePath}/admin/financeManager/commissionManage", param == null ? {} : param, writetablefn, "record", 17);
        $("#orderNo").val(null);
        $("#customerName").val(null);
        $("#customer_source").val(null);
        $("#date1").html("请选择开始日期");
		$("#startDate").val(null);
		$("#endDate").val(null);
	}

    var param = function () {
		return {
        	"orderNo": $("#orderNo").val(),
            "customerName": $("#customerName").val(),
            "startDate" : $("#startDate").val(),
            "endDate" : $("#endDate").val(),
            "customer_source" : $("#customer_source").val()
		};
	};
	
	function select() {
		onLoadDate(param());
	}
	var dateRange1 = new pickerDateRange('date1', {
		isTodayValid : true,
		startDate : '请选择开始日期',
		endDate : '',
		autoSubmit : false,
		inputTrigger : 'input_trigger1',
		theme : 'ta',
		success : function(obj) {
			$("#dCon2").html('开始时间 : ' + obj.startDate + '<br/>结束时间 : ' + obj.endDate);
			$("#startDate").val(obj.startDate);
			$("#endDate").val(obj.endDate);
		},
		clear :function(){
		
			$("#date1").html("请选择开始日期");
			$("#startDate").val(null);
			$("#endDate").val(null);
						
					}
	});
	
	function showDetail(obj){
		$.ajax({
			url:"/admin/loan/queryMyTeamLoanList?loanId=" +$(obj).attr("id"),
			type:"get",
			async:false,
			success:function(data){
				var loanStatusStr = returnLoanStatus(data.dataList[0].loanStatus);
				
				var pledgeType = data.dataList[0].pledgeType;
				var pledgeTypeStr = "";
            	if(pledgeType == "drivePledge"){
					pledgeTypeStr = "押证";
           		}else if(pledgeType == "vehiclePledge"){
					pledgeTypeStr = "押车";
				}
				
			    $("#order_id").html(data.dataList[0].orderid);
			    $("#loan_status").html(loanStatusStr);
			    $("#pledge_type").html(pledgeTypeStr);
			    $("#customer_name").html(data.dataList[0].customerRegisterInfo.customerName);
			    $("#telephone").html(data.dataList[0].mobile);
			    $("#idcard").html(data.dataList[0].idCard);
			    $("#responsibleBy").html(data.dataList[0].responsibleBy.realname);
			    $("#applyMoney").html(data.dataList[0].applyMoney);
			    $("#applyedAt").html(data.dataList[0].applyedAt);
			    $("#loanMoney").html(data.dataList[0].loanMoney);
			    $("#chargedoffAt").html(data.dataList[0].chargedoffAt);
			    $("#userCommission").html(data.dataList[0].userCommission);
				opendiv('fx_modal');
			}
		})
	}
	
	function setCustomerIdHidden(obj){
        var id = $(obj).attr("id");
        $("#customer_id_hidden").val(id);
        var loanDetailsTemp = map.get(id);
        loanDetailsTemp.channel = "yes";
        map.put(id,loanDetailsTemp);
		$("#order_modal").load("/admin/loan/loanerDetail3.html");
		opendiv("order_modal");
	}
	
	function getlenderdetails(obj){
        var id = $(obj).attr("id");
        $("#customer_id_hidden").val(id);
        var loanDetailsTemp = map.get(id);
        loanDetailsTemp.channel = "yes";
        map.put(id,loanDetailsTemp);
		$("#order_modal").load("/admin/loan/lenderdetails.html");
		opendiv("order_modal");
	}
	
	function returnLoanStatus(loanStatus){
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
			}else if (loanStatus == "towTruck"){
				loanStatusStr = "已拖车";
			}else if (loanStatus == "badLoanApplication"){
				loanStatusStr = "坏账归档";
			}else if (loanStatus == "noTowTruck"){
				loanStatusStr = "未拖车";
			}
            return loanStatusStr;
	}
</script>
</html>
