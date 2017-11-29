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
    <script src="${basePath}/js/uploadPreview.js" type="text/javascript"></script>
    <script type="text/javascript" src="${basePath}/js/dateRange.js"></script>
    <script src="${basePath}/js/tableutils.js"></script>
    <link rel="stylesheet" type="text/css" href="${basePath}/css/dateRange.css"/>
    <style type="text/css">
    .table > tbody > tr > td.tr_back,.table-striped > tbody > tr:nth-child(odd) > td.tr_back, .table-striped > tbody > tr:nth-child(odd) > th.tr_back{background-color:#FCF8E3; !important;}
</style>
</head>
<body>
<div class="tools_bar col-lg-12">
  <div class="tj_box clearfix">
    <div class="col-sm-12 row">
      <div class="col-sm-3" >
        <ul>
          <li>分销订单数 <span class="badge red">5</span></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <ul>
          <li>放款金额 <b class="text-danger" >150000.00</b></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <ul>
          <li>提成金额 <b class="text-success" >150000.00</b></li>
        </ul>
      </div>
    </div>
  </div>
  <div class="clearfix">
    <form class="form-inline pull-left" role="form">
      <div class="form-group">
        <label class="sr-only" for="txt_name">订单号</label>
        <input type="text" class="form-control" id="orderNo" name="orderNo" placeholder="请输入订单号">
      </div>
      <div class="form-group">
        <label class="sr-only" for="txt_number">客户姓名</label>
        <input type="text" class="form-control" id="customerName" name="customerName" placeholder="客户姓名">
      </div>
     <div class="form-group">
        <div class="ta_date" id="div_date1"> <span class="date_title" id="date1"></span> <a class="opt_sel" id="input_trigger1" href="#"> <i class="i_orderd"></i> </a> </div>
        <div id="datePicker1"></div>
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
        <th>流程状态</th>
        <th>客户经理</th>
        <th>申请金额</th>
        <th>审批金额</th>
        <th>分销提成</th>
        <th>申请时间</th>
        <th>操作</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td ><i class="fa fa-bookmark text-success"></i><a href = "javascript:void(0)"  onclick="opendiv('order_modal')" title="加急">1245212512</a></td>
        <td><i class="fa fa-star text-danger" ></i><a  href = "javascript:void(0)"  onclick="opendiv('custom_modal')"  title="重点">穆天阳</a></td>
        <td>待评估</td>
        <td>某某</td>
        <td>20,0000,00</td>
        <td>20,0000,00</td>
        <td>2000.00</td>
        <td>2015-06-14</td>
        <td><a href = "javascript:void(0)"  onclick="opendiv('fx_modal')">分销详情</a></td>
      </tr>
    </tbody>
  </table>
</div>
<div id="custom_modal" class="modal fade in"> </div>
<div id="order_modal" class="modal fade in"> </div>
<div id="fx_modal" class="modal modal_mid fade in">
  
</div>
<div id="fade2" class="black_overlayx"> </div>
</body>
<script type="text/javascript">
    $(function () {
		init();
	});
	
	function init() {
		
		var customerName = $("#customerName").val();
		var orderNo = $("#orderNo").val();
		var startDate = $("#startDate").val();
        var endDate = $("#endDate").val();

        if (("" !== customerName && null !== customerName) ||  ("" !== orderNo && null !== orderNo)) {
			var param = {
                "customerName": customerName,
                "orderNo":orderNo,
                "startDate" : startDate,
                "endDate" : endDate
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
			
			var state = "";
			if(data.loanState == 'yes'){
				state = "<i class='fa fa-bookmark text-success'></i>&nbsp;";
			}
			var isImportant = "";
			if(data.isImportant == 1){
				isImportant = "<i class='fa fa-star text-danger' ></i>&nbsp;";
			}

			context = "<tr>" 
					+ "<td>" + state + data.orderid + "</td>"
					+ "<td>" + isImportant + data.customerName + "</td>" 
					+ "<td>" + data.loan_money + "</td>"
					+ "<td>" + data.duration + "</td>" 
					+ "<td>" + data.repayPeriod + "</td>" 
					+ "<td>" + data.endedAt + "</td>" 
					+ "<td>" + data.moneySum + "</td>" 
					+ "<td><a href = 'javascript:void(0)' id="+data.id+" onclick='showDetail(this)'>查看</a></td>"
					+ "</tr>";
			return context;
		};

        pageComm("${basePath}/admin/loan/queryDistributionOrderList", param == null ? {} : param, writetablefn, "record", 17);
	}

    var param = function () {
		return {
        	"orderNo": $("#orderNo").val(),
            "customerName": $("#customerName").val(),
            "startDate" : $("#startDate").val(),
            "endDate" : $("#endDate").val()
		};
	};
	
	function select() {
		onLoadDate(param());
	}
	
	var dateRange1 = new pickerDateRange('date1', {
		isTodayValid : true,
		startDate : '请选择结清日期',
		endDate : '',
		autoSubmit : true,
		inputTrigger : 'input_trigger1',
		theme : 'ta',
		success : function(obj) {
			$("#dCon2").html('开始时间 : ' + obj.startDate + '<br/>结束时间 : ' + obj.endDate);
			$("#startDate").val(obj.startDate);
			$("#endDate").val(obj.endDate);
		}
	});
	
	function showDetail(obj){
		$.ajax({
			url:"/admin/loan/queryIncomeList?uuid=" +$(obj).attr("id"),
			type:"get",
			success:function(data){
			    $("#orderid").html(data.dataList[0].orderid);
			    $("#loan_money").html(data.dataList[0].loan_money + "万");
			    $("#orderid").html(data.dataList[0].orderid);
			    $("#create_at").html(data.dataList[0].chargedoffAt);
			    $("#duration").html(data.dataList[0].duration);
			    $("#endedAt").html(data.dataList[0].endedAt);
			    $("#repayInterestSum").html(data.dataList[0].repayInterestSum);
			    $("#manageFeeSum").html(data.dataList[0].manageFeeSum);
			    $("#parkCostSum").html(data.dataList[0].parkCostSum);
			    $("#gpsCostSum").html(data.dataList[0].gpsCostSum);
			    $("#towCostSum").html(data.dataList[0].towCostSum);
			    $("#checkCostSum").html(data.dataList[0].checkCostSum);
			    $("#moneySum").html(data.dataList[0].moneySum);
			    $("#customer_name").html(data.dataList[0].customerName);
				opendiv('sr_modal');
			}
		})
	}
	
	//导出Excel
	function exportExcel(){
	    var src = "/admin/loan/exportIncomeList?customerName=" + $("#customerName").val() + "&orderNo=" + $("#orderNo").val()
	    		+ "&startDate=" + $("#startDate").val() + "&endDate=" + $("#endDate").val();
	    $("#exportIframe").attr("src",src);
	 	$('#dc_tip').show();
        	setTimeout(function() {
          		$('#dc_tip').hide();
        },1500);
	}
</script>
</html>
