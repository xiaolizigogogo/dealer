<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=edge; chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Cache-Control" content="no-transform">
    <title>e车贷管理系统—车贷收入列表</title>
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
<!-- 日期 -->

<div class="tools_bar col-lg-12">
  <div class="clearfix">
    <form class="form-inline pull-left" role="form" id="exportForm">
      <input type="hidden" id="startDate" name="startDate"/>
      <input type="hidden" id="endDate" name="startDate"/>
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
  <div class="list_btn">
    <ul class="list-inline">
      <li><a class="btn btn-danger"   href = "javascript:void(0)" id="dc_btn" onclick="exportExcel();"> <i class="fa fa-download"></i>导出</a></li>
      <li><p class="text-danger" id="dc_tip" style="display:none;">车贷收入列表.xls已导出</p></li>
    </ul>
  </div>
</div>
<div class="list_box col-sm-12">
  <table  class="table table-bordered table-striped">
    <thead>
      <tr>
        <th>订单号</th>
        <th>客户姓名</th>
        <th>借款金额</th>
        <th>借款期数</th>
        <th>期数</th>
        <th>结清日期</th>
        <th>总收入</th>
        <th>操作</th>
      </tr>
    </thead>
    <tbody id="record">
    </tbody>
  </table>
</div>
<div id="r-page"></div>
<div id="custom_modal" class="modal fade in"> </div>
<div id="order_modal" class="modal fade in"> </div>
<div id="sr_modal" class="modal modal_mid fade in" style="max-height:450px;">
  <div class="modal-header" id="header"> <a  type="button" href = "javascript:void(0)" onclick = "colsediv(0)"  class="close" ><span aria-hidden="true">&times;</span></a>
    <h4 class="modal-title" id="myModalLabel" style="font-size:16px;">车贷收入详情</h4>
  </div>
  <div class="modal-body" >
    <div class="fk_modal_con row clearfix">
      <div class="col-sm-6">
        <dl class="dl-horizontal">
          <dt>订单编号</dt>
          <dd id="orderid"></dd>
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
          <dt>借款金额</dt>
          <dd style="font-weight:bold;" ><b class="text-success" id="loan_money"></b></dd>
        </dl>
      </div>
      <div class="col-sm-6">
        <dl class="dl-horizontal">
          <dt>借款日期</dt>
          <dd id="applyed_at"></dd>
        </dl>
      </div>
      <div class="col-sm-6">
        <dl class="dl-horizontal">
          <dt>期数</dt>
          <dd id="loan_limit_time"></dd>
        </dl>
      </div>
      <div class="col-sm-6">
        <dl class="dl-horizontal">
          <dt>结清日期</dt>
          <dd id="ended_at"></dd>
        </dl>
      </div>
      <div class="col-sm-6">
        <dl class="dl-horizontal">
          <dt>总收入</dt>
          <dd id="cur_repayinterestsum"></dd>
        </dl>
      </div>
        <div class="col-sm-6">
            <dl class="dl-horizontal">
                <dt>利息收入</dt>
                <dd id="cur_repayinterestonly"></dd>
            </dl>
        </div>
      <div class="col-sm-6">
        <dl class="dl-horizontal">
          <dt>管理费收入</dt>
          <dd id="manageFee"></dd>
        </dl>
      </div>
      <div class="col-sm-6">
        <dl class="dl-horizontal">
          <dt>停车费</dt>
          <dd id="parkCost"></dd>
        </dl>
      </div>

      <div class="col-sm-6">
        <dl class="dl-horizontal">
          <dt>GPS费</dt>
          <dd id="gpsCost"></dd>
        </dl>
      </div>
      <div class="col-sm-6">
        <dl class="dl-horizontal">
          <dt>拖车费</dt>
          <dd id="towCost"></dd>
        </dl>
      </div>
   	  <div class="col-sm-6">
        <dl class="dl-horizontal">
          <dt>违约金</dt>
          <dd id="overdueFee"><!--0.00--></dd>
        </dl>
      </div>

      <div class="col-sm-6">
        <dl class="dl-horizontal">
          <dt>查档费</dt>
          <dd id="checkCost"></dd>
        </dl>
      </div>
        <div class="col-sm-6">
            <dl class="dl-horizontal">
                <dt>上门催收费</dt>
                <dd id="visitCost"></dd>
            </dl>
        </div>
      <div class="col-sm-6">
        <dl class="dl-horizontal">
          <dt>平台折旧费</dt>
          <dd id="depreciationFee"></dd>
        </dl>
      </div>
        <div class="col-sm-6">
            <dl class="dl-horizontal">
                <dt>酒毒驾</dt>
                <dd id="drunkDrive"></dd>
            </dl>
        </div>
        <div class="col-sm-6">
            <dl class="dl-horizontal">
                <dt>保证金</dt>
                <dd id="cashdepositFee"></dd>
            </dl>
        </div>
        <div class="col-sm-6">
            <dl class="dl-horizontal">
                <dt>认证费</dt>
                <dd id="certificatefee"></dd>
            </dl>
        </div>
    </div>
  </div>
</div>
<div id="fade2" class="black_overlayx"> </div>
<iframe src="" style="display:none;" id="exportIframe">

</iframe>
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
			if(data.state == 'yes'){
				state = "<i class='fa fa-bookmark text-success'></i>&nbsp;";
			}
			var isImportant = "";
			if(data.isImportant == 1){
				isImportant = "<i class='fa fa-star text-danger' ></i>&nbsp;";
			}
            var period = data.cur_period;
            if(period > data.loan_limit_time){
                period = data.loan_limit_time;
            }
            var loan_money=data.loan_money;
			context = "<tr>"
					+ "<td>" + state + data.orderid + "</td>"
					+ "<td>" + isImportant + data.account_name + "</td>"
					+ "<td>" + loan_money + "</td>"
					+ "<td>" + data.loan_limit_time + "</td>"
					+ "<td>" + period + "</td>"
					+ "<td>" + data.ended_at.substr(0,10) + "</td>"
					+ "<td>" + data.cur_repayinterestsum + "</td>"
					+ "<td><a href = 'javascript:void(0)' id="+data.uuid+" onclick='showDetail(this)'>查看</a></td>"
					+ "</tr>";
			return context;
		};

        pageComm("${basePath}/admin/loan/queryIncomeListAll", param == null ? {} : param, writetablefn, "record", 17);
        $("#orderNo").val(null);
        $("#customerName").val(null);
        $("#date1").html("请选择结清日期");
		$("#startDate").val(null);
		$("#endDate").val(null);
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
		isTodayValid : false,
		startDate : '请选择结清日期',
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
		
			$("#date1").html("请选择结清日期");
			$("#startDate").val(null);
			$("#endDate").val(null);
						
					}
	});

	function showDetail(obj){
		$.ajax({
			url:"/admin/loan/queryIncomeListAll?uuid=" +$(obj).attr("id"),
			type:"get",
			success:function(data){
			    $("#orderid").html(data.dataList[0].orderid);
                $("#customer_name").html(data.dataList[0].account_name);
			    $("#loan_money").html(data.dataList[0].loan_money);
                $("#applyed_at").html(data.dataList[0].applyed_at.substr(0,10));
                $("#loan_limit_time").html(data.dataList[0].loan_limit_time);
                $("#ended_at").html(data.dataList[0].ended_at.substr(0,10));
                $("#cur_repayinterestsum").html(data.dataList[0].cur_repayinterestsum);
                $("#manageFee").html(((data.dataList[0].manageFee == null)||(data.dataList[0].manageFee == "")) ?"0.00":data.dataList[0].manageFee);
                var manageFee =((data.dataList[0].manageFee == null)||(data.dataList[0].manageFee == "")) ?"0.00":data.dataList[0].manageFee;
                $("#parkCost").html(((data.dataList[0].parkCost == null)||(data.dataList[0].parkCost == "")) ?"0.00":data.dataList[0].parkCost);
                var parkCost = ((data.dataList[0].parkCost == null)||(data.dataList[0].parkCost == "")) ?"0.00":data.dataList[0].parkCost;
                $("#gpsCost").html(((data.dataList[0].gpsCost == null)||(data.dataList[0].gpsCost == "")) ?"0.00":data.dataList[0].gpsCost);
                var gpsCost = ((data.dataList[0].gpsCost == null)||(data.dataList[0].gpsCost == "")) ?"0.00":data.dataList[0].gpsCost;
                $("#towCost").html(((data.dataList[0].towCost == null)||(data.dataList[0].towCost == "")) ?"0.00":data.dataList[0].towCost);;
                var towCost = ((data.dataList[0].towCost == null)||(data.dataList[0].towCost == "")) ?"0.00":data.dataList[0].towCost;
                $("#overdueFee").html(((data.dataList[0].overdueFee == null)||(data.dataList[0].overdueFee == "")) ?"0.00":data.dataList[0].overdueFee);
                var overdueFee = ((data.dataList[0].overdueFee == null)||(data.dataList[0].overdueFee == "")) ?"0.00":data.dataList[0].overdueFee;
                $("#checkCost").html(((data.dataList[0].checkCost == null)||(data.dataList[0].checkCost == "")) ?"0.00":data.dataList[0].checkCost);
                var checkCost = ((data.dataList[0].checkCost == null)||(data.dataList[0].checkCost == "")) ?"0.00":data.dataList[0].checkCost;
                $("#visitCost").html(((data.dataList[0].visitCost == null)||(data.dataList[0].visitCost == "")) ?"0.00":data.dataList[0].visitCost);
                var visitCost = ((data.dataList[0].visitCost == null)||(data.dataList[0].visitCost == "")) ?"0.00":data.dataList[0].visitCost;
                $("#depreciationFee").html(((data.dataList[0].depreciationFee == null)||(data.dataList[0].depreciationFee == "")) ?"0.00":data.dataList[0].depreciationFee);;
                var depreciationFee = ((data.dataList[0].depreciationFee == null)||(data.dataList[0].depreciationFee == "")) ?"0.00":data.dataList[0].depreciationFee;
                $("#drunkDrive").html(((data.dataList[0].drunkDrive == null)||(data.dataList[0].drunkDrive == "")) ?"0.00":data.dataList[0].drunkDrive);
                var drunkDrive = ((data.dataList[0].drunkDrive == null)||(data.dataList[0].drunkDrive == "")) ?"0.00":data.dataList[0].drunkDrive;
                $("#cashdepositFee").html(((data.dataList[0].cashdepositFee == null)||(data.dataList[0].cashdepositFee == "")) ?"0.00":data.dataList[0].cashdepositFee);
                var cashdepositFee = ((data.dataList[0].cashdepositFee == null)||(data.dataList[0].cashdepositFee == "")) ?"0.00":data.dataList[0].cashdepositFee;
                $("#certificatefee").html(((data.dataList[0].certificatefee == null)||(data.dataList[0].certificatefee == "")) ?"0.00":data.dataList[0].certificatefee);
                var certificatefee = ((data.dataList[0].certificatefee == null)||(data.dataList[0].certificatefee == "")) ?"0.00":data.dataList[0].certificatefee;

                var cur_repayinterestonly = data.dataList[0].cur_repayinterestsum - manageFee - parkCost - gpsCost -
                        towCost -overdueFee - checkCost - visitCost - depreciationFee - drunkDrive - cashdepositFee - certificatefee;
                $("#cur_repayinterestonly").html(cur_repayinterestonly.toFixed(2));
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
