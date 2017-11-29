<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%   
    String searchDate = request.getParameter("date");
  %>
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
      <link rel="stylesheet" href="${basePath}/css/lightbox.min.css"/>
    <script src="${basePath}/js/lightbox.js"></script>
    <script src="${basePath}/js/Map.js"></script>
    <link rel="stylesheet" type="text/css" href="${basePath}/css/dateRange.css"/>
    <style type="text/css">
    .table > tbody > tr > td.tr_back,.table-striped > tbody > tr:nth-child(odd) > td.tr_back, .table-striped > tbody > tr:nth-child(odd) > th.tr_back{background-color:#FCF8E3; !important;}
</style>
</head>
<body>
<input type="hidden" value="<%=searchDate %>" id="searchDate" />
    <input type="hidden" value="" id="edit_customer_id"/>
    <input type="hidden" value=""  id="statusnew">
	<input type="hidden" value=""  id="customer_id_hidden">
	<input type="hidden" value=""  id="taskId_hidden">
	<input type="hidden" value=""  id="processDefinitionId_hidden">
    <div class="tools_bar col-lg-12">
  <div class="clearfix">
    <form class="form-inline pull-left" role="form">
    <div class="form-group"><label class="sr-only" for="txt_name">年/月</label>
       <div class="input-group date form_date" data-date="" data-date-format="yyyy-mm" data-link-field="purchaseDate" data-link-format="yyyy-mm" style="width:160px;">
                  <input class="form-control valid" id="date" readonly style="width:100%;" type="text">
                  <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span> </div></div>
    <!--  <div class="form-group">
        <label class="sr-only" for="txt_name">订单号</label>
        <input type="text" class="form-control" id="txt_orderid" placeholder="请输入订单号">
      </div>
      <div class="form-group">
        <label class="sr-only" for="txt_number">客户姓名</label>
        <input type="text" class="form-control" id="txt_name" placeholder="客户姓名">
      </div>-->
     
      <div class="form-group">
        <select class="form-control" id="pledgetype" name="pledgetype">
          <option value="9999">抵押方式</option>
          <option value="drivePledge">不押车</option>
          <option value="vehiclePledge">押车</option>
        </select>
      </div>
       <div class="form-group">
        <select class="form-control" id="repayWay" name="repayWay">
          <option value="9999">还款方式</option>
          <option value="AverageCapitalPlusInterest">等额本息</option>
          <option value="InterestRatesBefore">先息后本</option>
        </select>
      </div>
      <div class="form-group">
        <label>贷款额度：</label>
        <input type="text" class="form-control sml-control" id="txt_start" placeholder="万元" style="width:80px;"> - <input type="text" class="form-control sml-control" id="txt_end" placeholder="万元"  style="width:80px;">
      </div>
      <div class="form-group">
        <select class="form-control" id="coName" name="coName">
            <option value="9999">请选择</option>
        </select>
      </div>
      <div class="form-group">
        <select class="form-control" id="deName" name="deName">
            <option value="9999">请选择</option>
        </select>
      </div>
      <div class="form-group">
        <select class="form-control" id="realName" name="realName">
            <option value="9999">请选择</option>
        </select>
      </div>
     
      <button type="button" class="btn btn-primary btn-search" id="btn-submit" onclick="select()"><i class="fa fa-search"></i> 搜索</button>
    </form>
  </div>
    <div class="tj_box clearfix" style="margin-top:10px;">
        <p>新增订单数 <b class="text-danger" id="count"></b>，新增贷款总额 <b class="text-danger" id="sum"></b></p>
    </div>
  <div class="list_btn">
    <ul class="list-inline">
      <!-- <li><a class="btn btn-danger"   href = "javascript:void(0)"  onclick="opendiv(0)"> <i class="fa fa-plus"></i>新增</a></li>-->
      <li><a class="btn btn-danger"
					href="/admin/loan/loanCount.html"> <i class="fa fa-bar-chart-o"></i>返回图表
				</a></li>
                <li><a class="btn btn-danger" href="javascript:void(0)" id="dc_btn" onclick="exportExcel();"> <i class="fa fa-download"></i>导出文件</a></li>
                <li><p class="text-danger" id="dc_tip" style="display:none;">销售统计列表.xls已导出</p></li>
    </ul>
  </div>
</div>
	<div class="list_box col-sm-12">
		<table data-toggle="table" class="table table-bordered table-striped">
			<thead>
				<tr>
					<th>订单号</th>
					<th>合同号</th>
					<th>客户姓名</th>
					<th>贷款金额</th>
                    <th>抵押方式</th>
                    <th>还款方式</th>
                    <th>购车类型</th>
                    <th>流程状态</th>
                    <th>客户经理</th>
                    <th>部门</th>
                    <th>分公司</th>
					<th>放款时间</th>
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
	<iframe src="" style="display:none;" id="exportIframe">
	</iframe>
</body>
<script type="text/javascript">

	var years = new Date();
	var yearStr = years.getFullYear().toString();
	yearStr += "-"+searchDate.value;
	$("#date").val(yearStr);

	var currentReviewLoanStatus = "${map.status}"; // 根据不同的状态进行查询,参数由IndexController封装为map
	var currentpledgeType = "${map.pledgetype}";
    var map = new Map();
    $(function () {
		init();
        $("#pledgetype").find('option[value="' + currentpledgeType + '"]').attr("selected", true);
        
	});
	
	function init() {
		$.ajax({
			url:"${basePath}/admin/loan/queryLoanInfoCount",
			type:"get",
			datatype:"json",
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
			}
		})
		var customerName = $("#customerName").val();
		var orderid = $("#orderid").val();
		var customerManage = $("#customerManage").val();
		var pledgetype = $("#pledgetype").val();
		var statusnew = $("#statusnew").val();
		var date = $("#date").val();
		var repayWay = $("#repayWay").val();
		var txt_start = $("#txt_start").val();
		var txt_end = $("#txt_end").val();
		var coName = $("#coName").val();
		var deName = $("#deName").val();
		var realName = $("#realName").val();

        if ( ("" != currentReviewLoanStatus && null != currentReviewLoanStatus)
                || ("" !== customerName && null !== customerName) ||  ("" !== orderid && null !== orderid)
                || ("" !== customerManage && null !== customerManage) || ("" !== pledgetype && null !== pledgetype)
                || ("" !== repayWay && null !== repayWay) || ("" !== txt_start && null !== txt_start)  
                || ("" !== txt_end && null !== txt_end) || ("" !== coName && null !== coName)  
                || ("" !== deName && null !== deName) || ("" !== realName && null !== realName)) {
			var param = {
                "status": currentReviewLoanStatus,
                "customerName": customerName,
                "customerManage":customerManage,
                "pledgetype":pledgetype,
                "orderid":orderid,
                "statusnew":statusnew,
                "searchDate":date,
                "repayWay" : repayWay,
                "txt_start" : txt_start,
                "txt_end" : txt_end,
                "coName" : coName,
                "deName" : deName,
                "realName" : realName
			};
			onLoadDate(param);
		} else {
			onLoadDate({
                "status": currentReviewLoanStatus
			});
		}
	}

	function onLoadDate(param) {

		$("#count").empty().html(0);
		$("#sum").empty().html("0万元");

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
			}else if (loanStatus == "urgeRepayment") {
				loanStatusStr = "还款催收";
			}else if (loanStatus == "detainCar") {
				loanStatusStr = "风控逾期处理";
			}else if (loanStatus == "fineSet") {
				loanStatusStr = "罚息处理";
			}else if (loanStatus == "advancedRepaymented") {
				loanStatusStr = "提前还款审核";
			}else if (loanStatus == "continueUpload") {
				loanStatusStr = "续借手续处理";
			}else if (loanStatus == "continueRepayment") {
				loanStatusStr = "续借还款审核";
			}else if (loanStatus == "lateProcessed") {
				loanStatusStr = "风控二次处理";
			} else if (loanStatus == "badLoanApplication") {
				loanStatusStr = "坏账归档处理";
			}else if (loanStatus == "continueLoan") {
				loanStatusStr = "借款展期续借";
			}else if (loanStatus == "detainedCarDispose") {
				loanStatusStr = "已拖车处理";
			}else if (loanStatus == "end") {
				loanStatusStr = "已完结";
			}else if(loanStatus == "saleRepayment"){
				loanStatusStr = "卖车还款";
			}else if(loanStatus == "detainedCarRepayment"){
				loanStatusStr = "还款提车";
			}else if(loanStatus == "vehicleNoSaleRepayment"){
				loanStatusStr = "还款不提车";
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
			}else if (loanStatus == "mortgage_rejected"){
				loanStatusStr = "抵押失败";
			}else if (loanStatus == "dataReview_rejected"){
				loanStatusStr = "总部资料复核失败";
			}else if (loanStatus == "visiteCheck_rejected"){
				loanStatusStr = "线下上门核实失败";
			}else if (loanStatus == "helploanAduit"){
				loanStatusStr = "待助贷初审";
			}

			var linkUrl = "${basePath}/admin/loan/queryLoanDetail/" + data.uuid + ".html";

			var edit = "";
            if(loanStatus == "vehicleAssess"){
				edit = "<a href='"+linkUrl+"' class='link-01'>编辑</a>";
            }else{
                edit="";
			}

			var pledgetype = data.pledgeType;
			var pledgeTypeStr = "";
			if(pledgetype == "drivePledge"){
				pledgeTypeStr = "不押车";
			}else if(pledgetype == "vehiclePledge"){
				pledgeTypeStr = "押车";
			}

			var repayWay = data.repayWay;
			var repayWayStr = "";
			if(repayWay == "AverageCapitalPlusInterest"){
				repayWayStr = "等额本息";
			}else if(repayWay == "InterestRatesBefore"){
				repayWayStr = "先息后本";
			}

			$("#count").empty().html(data.count);
			$("#sum").empty().html(data.sum/10000 + "万元");

			var loanDetails = {};
			loanDetails.uuid = data.uuid;
			loanDetails.orderId = data.orderid;
			loanDetails.taskId = data.taskId;
			loanDetails.activityId = data.activityId;
			loanDetails.assignee = data.assignee;
			loanDetails.loan_status = data.loan_status;
			loanDetails.customerId = data.customerId;

			context = "<tr id="+data.uuid+" onclick='setEditCustomer(this)'>" 
					+ "<td>" + "<a id="+data.uuid
					+ " onclick='setCustomerIdHidden(this)' href='javascript:void(0);'>" + data.orderid + "</a>" + "</td>"
					+ "<td>" + "<a id="+data.uuid
					+ " onclick='setCustomerIdHidden(this)' href='javascript:void(0);'>" + data.contractNum + "</a>" + "</td>"
					+ "<td>" + data.customerName + "</td>"
					+ "<td>" + data.loanMoney + "</td>"
					+ "<td>" + pledgeTypeStr + "</td>"
					+ "<td>" + repayWayStr + "</td>"
					+ "<td>" + data.buyTheWay + "</td>"
					+ "<td>" + loanStatusStr + "</td>"
					+ "<td>" + data.realName + "</td>"
					+ "<td>" + data.deName + "</td>"
					+ "<td>" + data.coName + "</td>"
					+ "<td>" + data.chargedOff + "</td>"
					+ "</tr>";
            map.put(data.uuid.toString(),loanDetails);
			return context;
		};
  
		pageComm("${basePath}/admin/loan/queryLoanList", param == null ? {} : param, writetablefn, "record", 17);
	}

    var param = function () {
		return {
            "orderid": $("#orderid").val(),
            "customerName": $("#customerName").val(),
            "customerManage":$("#customerManage").val(),
            "pledgetype":$("#pledgetype").val(),
            "statusnew":$("#statusnew").val(),
            "searchDate": $("#date").val(),
            "repayWay" : $("#repayWay").val(),
            "txt_start" : $("#txt_start").val() * 10000,
            "txt_end" : $("#txt_end").val() * 10000,
            "coName" : $("#coName").val(),
            "deName" : $("#deName").val(),
            "realName" : $("#realName").val()
		};
	};
    function assignment(obj){
    	$("#statusnew").val($(obj).attr("id"));
    	select();
    	}
	function select() {
		var limitLoan_start = $("#txt_start").val();
		var limitLoan_end = $("#txt_end").val();
		if("" != limitLoan_start && "" != limitLoan_end){
			if(parseInt(limitLoan_end) < parseInt(limitLoan_start)){
				layer.msg("贷款额度的起始金额与最大金额相反");
			return false;
			}
		}
		onLoadDate(param());
	}

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
	 //设为加急
	 function addUrgent(oid){
		 
		 if(    commonToOpenDiv("edit_customer_id")){
	    		commonSetHtml("alert_span","确认将此订单设为加急么！");
	    		$("#confirm_a").attr("onclick","confirmToBlackList()");
	    		opendiv('hmd_box');
	    	}
		 
	 }
	 function confirmToBlackList(){
	    	$.ajax({
	    		url:"/admin/customer/addUrgent",
	    		data:"uuid=" +$("#edit_customer_id").val(),
	    		type:"post",
	    		dataType:"text",
	    		success:function(data){
	    			if(data == 'success'){
	    				commonSetHtml("alert_span","加急成功！");
	    				opendiv('hmd_box');
	    				$("#confirm_a").attr("onclick","colsediv(0)");
	    			}
	    		}
	    	})
	    }
	   
	 //弹出框公共function
	 function commonToOpenDiv(oid){
	    	var edit_customer_id =  $("#"+oid).val();
	    	if(null == edit_customer_id || "" == edit_customer_id){
	    		commonSetHtml("alert_span","请先选中一个客户！");
	    		opendiv('hmd_box');
	    		return false;
	    	}else{
	    		return true;
	    	}
	    }
	 function commonSetHtml(oid,html){
	    	$("#" + oid).html(html);
	    }

		$(document).ready(function () {
        $.ajax({
            type: "Post",
            url:"${basePath}/admin/loan/queryCompanyList",
            datatype:"json",
            success:function(data){
                $("#coName").append(data.coName);
            }
        });
        /*动态加载所有公司*/
        $.get("${basePath}/admin/loan/queryCompanyList.html", function (result) {
            var companyNameObj = $("#coName");
                var html = '<option value="9999">请选择</option>';
            $(result).each(function (i) {
                html += '<option value="' + result[i].id + '">' + result[i].name + '</option>';
            });
                companyNameObj.html(html);

            /*动态加载公司名下部门*/
            companyNameObj.live("change", function () {
                getDeptName(this.value);
          });
            companyNameObj.find('option[value="' + '${result[i].id}' + '"]').attr("selected", true);
        });
        var getDeptName = function(companyId) {
            var deptNameObj = $("#deName");
            if(companyId != null && companyId != ""){
               $.get("${basePath}/admin/loan/queryDeptInfoList.html?companyId=" + companyId,
                   function(result) {
                           var html = '<option value="9999">请选择</option>';
                       $(result).each(function (i) {
                           html += '<option value="' + result[i].companyId + '">' + result[i].name +
                                   '</option>';
                       });
                           deptNameObj.html(html);
            /*动态加载公司名下客户经理*/
            deptNameObj.live("change", function () {
            getManagerName(this.value);
            });
          });
        }}
        var getManagerName = function(companyId){
            var managerNameObj = $("#realName");
            if(companyId != null && companyId != ""){
              $.get("${basePath}/admin/loan/queryUserManagerName.html?companyId=" + companyId,
                  function(result) {
                         var html = '<option value="9999">请选择</option>';
                     $(result).each(function (i) {
                         html += '<option value="' + result[i].uuid + '">' + result[i].realName +
                                 '</option>';
                     });
                    managerNameObj.html(html);
              });
           }
        };
    });

    // 出力账票
    function exportExcel(){
        var src = "/admin/loan/exportLoanInfoList?searchDate=" + $("#date").val() + "&pledgetype=" + $("#pledgetype").val() + "&repayWay=" + $("#repayWay").val()
                + "&txtStart=" + $("#txt_start").val()*10000 + "&txtEnd=" + $("#txt_end").val()*10000 + "&coName=" + $("#coName").val()
                + "&deName=" + $("#deName").val() + "&realName=" + $("#realName").val();
        $("#exportIframe").attr("src",src);
        $('#dc_tip').show();
            setTimeout(function() {
                $('#dc_tip').hide();
        },1500);
    }

</script>
</html>
