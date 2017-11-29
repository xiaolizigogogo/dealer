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
<title>e车贷管理系统—贷款余额统计</title>
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
<style type="text/css">
.table > tbody > tr > td.tr_back, .table-striped > tbody > tr:nth-child(odd) > td.tr_back, .table-striped > tbody > tr:nth-child(odd) > th.tr_back {
	background-color: #FCF8E3;
!important;
}
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
       <div class="input-group date form_date" data-date="" data-date-format="yyyy-mm-dd" data-link-field="purchaseDate" data-link-format="yyyy-mm-dd" style="width:160px;">
                  <input class="form-control valid" value="" readonly="" style="width:100%;" type="text" id="end_date">
                  <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span> </div></div>
      <div class="form-group">
        <label class="sr-only" for="txt_name">合同编号</label>
        <input type="text" class="form-control" id="txt_orderid" placeholder="请输入合同编号">
      </div>
      <div class="form-group">
        <label class="sr-only" for="txt_number">客户姓名</label>
        <input type="text" class="form-control" id="txt_name" placeholder="客户姓名">
      </div>
      
      <div class="form-group">
        <select class="form-control" id="pledge_type">
          <option value="">抵押方式</option>
          <option value="drivePledge">押证</option>
          <option value="vehiclePledge">押车</option>
        </select>
      </div>
      <div class="form-group">
        <select class="form-control" id="repay_way">
          <option value="">还款方式</option>
          <option value="AverageCapitalPlusInterest">等本等息</option>
          <option value="InterestRatesBefore">先息后本</option>
        </select>
      </div>
      <div class="form-group">
        <select class="form-control" id="companyId" name="companyId">
          <option value="0">选择分公司</option>
        </select>
      </div>
      <div class="form-group">
        <select class="form-control" id="deptId" name="deptId">
          <option value="0">选择部门</option>
        </select>
      </div>
      <div class="form-group">
        <select class="form-control" name="responsibleCmId" id="responsibleCmId">
          <option value="0">选择客户经理</option>

        </select>
      </div>
      <button type="button" class="btn btn-primary btn-search" id="btn-submit"><i class="fa fa-search" onclick="select"></i> 搜索</button>
    </form>
  </div>
  <div class="tj_box clearfix" style="margin-top:10px;">
    <!-- <p>抵押方式：<b class="text-warning" id="pledgeTypeName">押车</b>，分公司：<b class="text-warning" id="companyName">车易宝</b>，部门：<b class="text-warning" >业务部一部</b>，客户经理：<b class="text-warning">常虎</b><br/>-->
      订单数 <b class="text-danger" id="OrderCount">25单</b>，合同总金额 <b class="text-danger" id="ContractCount">341.0万元</b>，本金总余额 <b class="text-danger" id="CaptialBalCount">341.0万元</b>，总利息余额 <b class="text-danger" id="InterestBalCount">120.0万元</b>，总贷款余额 <b class="text-danger" id=LoanBalCount>341.0万元</b>，总已收利息 <b class="text-danger" id="InterestCount">120.0万元</b></p>
  </div>
  <div class="list_btn">
    <ul class="list-inline">
      <!-- <li><a class="btn btn-danger"   href = "javascript:void(0)"  onclick="opendiv(0)"> <i class="fa fa-plus"></i>新增</a></li>-->
      
      <li><a class="btn btn-danger" href="javascript:void(0)" id="dc_btn" onclick="exportExcel();"> <i class="fa fa-download"></i>导出文件</a></li>
            <li><p class="text-danger" id="dc_tip" style="display:none;">贷款余额统计.xls已导出</p></li>
    </ul>
  </div>
</div>
<div class="list_box col-sm-12">
  <table data-toggle="table" class="table table-bordered table-striped">
    <thead>
      <tr>
        <th>客户经理</th>
        <th>合同编号</th>
        <th>订单编号</th>
        <th>客户姓名</th>
        <th>抵押方式</th>
        <th>还款方式</th>
        <th>贷款日</th>
        <th>到期日</th>
        <th>贷款金额</th>
        <th>本金余额</th>
        <th>利息余额</th>
        <th>贷款余额</th>
        <th>已收利息</th>
      </tr>
    </thead>
    <tbody id="record">
    </tbody>
  </table>
</div>
<div id="r-page"></div>
<div id="test1" class="modal fade in">
  <div class="modal-header"> <a type="button" href="javascript:void(0)" onclick="colsediv(0)"
				class="close"><span aria-hidden="true">&times;</span></a>
    <h4 class="modal-title" id="myModalLabel" style="font-size: 16px;">查看订单</h4>
  </div>
  <div class="modal-body">
    <div class="row" style="position: fixed;"></div>
  </div>
  <div class="modal-footer">
    <p class="text-center"> <a class="text-center">
      <button class="btn btn-small" data-dismiss="modal"
						onclick="colsediv(0)" aria-hidden="true">保存</button>
      </a> <a class="text-center">
      <button class="btn btn-small" data-dismiss="modal"
						onclick="colsediv(0)" aria-hidden="true">返回</button>
      </a> </p>
  </div>
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
    $(function () {
		init();
        $("#pledgeType").find('option[value="' + currentpledgeType + '"]').attr("selected", true);
        
	});
	
	function init() {

// 		var customerName = $("#customerName").val();
// 		var orderNo = $("#orderNo").val();
// 		var customerManage = $("#customerManage").val();
// 		var pledgeType = $("#pledgeType").val();
// 		var statusnew = $("#statusnew").val();
//         var searchDate = $("#searchDate").val();
//         if ( ("" != currentReviewLoanStatus && null != currentReviewLoanStatus)
//                 || ("" !== customerName && null !== customerName) ||  ("" !== orderNo && null !== orderNo)
//                 || ("" !== customerManage && null !== customerManage) || ("" !== pledgeType && null !== pledgeType)) {
// 			var param = {
//                 "status": currentReviewLoanStatus,
//                 "customerName": customerName,
//                 "customerManage":customerManage,
//                 "pledgeType":pledgeType,
//                 "orderNo":orderNo,
//                 "statusnew":statusnew,
//                 "searchDate":searchDate
// 			};
// 			onLoadDate(param);
// 		} else {
			onLoadDate({
                "status": currentReviewLoanStatus
			});
//		}
	}
	
	 var companyIdObj = $("#companyId");
     $.get("${basePath}/admin/company/queryCompanyList.html", function (result) {
         var html = '';
         $(result).each(function (i) {
             html += '<option value="' + result[i].id + '">' + result[i].name + '</option>';
         });
         companyIdObj.append(html);

     });

     /* 下拉列表选中之后调用的事件，加载出该公司下所有的部门 */
     companyIdObj.live("change", function () {
         getDept(this.value);
     });

     /* 根据公司Id查询部门*/
     var deptIdObj = $("#deptId");
     var getDept = function (companyId) {
         $.get("${basePath}/admin/dept/queryDeptComById?companyId=" + companyId + "&type=yw",
                 function (result) {
             var html = '<option value="0">选择部门</option>';
             $(result).each(function (i) {
                 html += '<option value="' + result[i].id + '">' + result[i].name + '</option>';
             });
             deptIdObj.html(html);// 此处不能使用append(html),原因：多次选择会出现叠加的情况

         });
     };

     /*动态加载公司部门名下所有员工*/
     deptIdObj.live("change", function () {
         getUsers($("#companyId").val(), this.value);
     });

     var getUsers = function (companyId, deptId) {
         var responsibleCmIdObj = $("#responsibleCmId");
         $.get("${basePath}/admin/user/queryComIdDeptId.html?companyId=" + companyId + "&deptId=" + deptId,
                 function (result) {
                     var html = '<option value="0">选择客户经理</option>';
                     $(result).each(function (i) {
                         html += "<option value='" + result[i].uuid + "'>" + result[i].realname + "</option>";
                     });
                     responsibleCmIdObj.html(html);
                 });
     };
     
     
     $("#btn-submit").click(function(){
    	 
    	 select();
    	 
    	 
     })
	

	function onLoadDate(param) {
    	 
         $("#OrderCount").html("0单");
         $("#ContractCount").html("0.00万元");
         $("#CaptialBalCount").html("0.00万元");
         $("#InterestBalCount").html("0.00万元");
         $("#LoanBalCount").html("0.00万元");
         $("#InterestCount").html("0.00万元");
    	 
        var writetablefn = function (data)
        
		{ 
        	$("#noloanorder").html(data.noloanorder);
			var context;
			$("#checkAll").prop("checked", false);

            var linkUrl = "${basePath}/admin/loan/queryLoanDetail/" + data.uuid + ".html";
            
            
            $("#OrderCount").html(data.OrderCount+"单");
            $("#ContractCount").html(parseFloat(data.ContractCount/10000).toFixed(2)+"万元");
            $("#CaptialBalCount").html(parseFloat(data.CaptialBalCount/10000).toFixed(2)+"万元");
            $("#InterestBalCount").html(parseFloat(data.InterestBalCount/10000).toFixed(2)+"万元");
            $("#LoanBalCount").html(parseFloat(data.LoanBalCount/10000).toFixed(2)+"万元");
            $("#InterestCount").html(parseFloat(data.InterestCount/10000).toFixed(2)+"万元");

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
            if(pledgeType == "drivePledge"){
				pledgeTypeStr = "押证";
            }else if(pledgeType == "vehiclePledge"){
				pledgeTypeStr = "押车";
			}
            
            var repayWayStr="";
            if(data.repay_way=="InterestRatesBefore"){
            	repayWayStr="先息后本";
            }
            else{
            	repayWayStr="等本等息";
            }
                        

			context = "<tr>" 
					+ "<td>" + data.responsibleName + "</td>"
					+ "<td>" + "<a id="
                    + data.uuid
                    + " onclick='setCustomerIdHidden(this)' href='javascript:void(0);'>"
                    + data.contractNo
                    + "</a>"+"</td>"
                    + "<td>" + "<a id="
                    + data.uuid
                    + " onclick='setCustomerIdHidden(this)' href='javascript:void(0);'>"
                    + data.orderid
                    + "</a>"+"</td>"
					+ "<td>"+ "<a id="
                    + data.uuid
                    + " onclick='getlenderdetails(this)' href='javascript:void(0);'>"
                    + data.customerName + "</td>"
					+ "<td>" + pledgeTypeStr + "</td>"
					+ "<td>" + repayWayStr + "</td>"
					+ "<td>" + data.chargedoff_at + "</td>"
					+ "<td>" + data.end_date+ "</td>"
					+ "<td>" + data.chargedof_money + "</td>"
					+ "<td>" + data.CapitalBal + "</td>"
					+ "<td>" + data.InterestBal + "</td>"
					+ "<td>" + data.LoanBal + "</td>"
					+ "<td>" + data.Interest + "</td>"
					+ "</tr>";
            map.put(data.uuid.toString(),loanDetails);
			return context;
		};
  
        pageComm("${basePath}/admin/loan/queryLoanBalance", param == null ? {} : param, writetablefn, "record", 17);
	}

    var param = function () {
		return {
        	"endDate": $("#end_date").val(),
            "pledge_type": $("#pledge_type").val(),
            "repay_way":$("#repay_way").val(),
            "orderId":$("#txt_orderid").val(),
            "customerName":$("#txt_name").val(),
            "repay_way":$("#repay_way").val(),
            "deptId":$("#deptId").val(),
            "companyId":$("#companyId").val(),
            "responsible_cm_id":$("#responsibleCmId").val()
		};
	};
    function assignment(obj){
    	$("#statusnew").val($(obj).attr("id"));
    	select();
    	}
	function select() {
		onLoadDate(param());
	}

	function reset() {
		$("#mobile").val("");
		$("#customerName").val("");
	}

	function setCustomerIdHidden(obj){
        var id = $(obj).attr("id");
        $("#customer_id_hidden").val(id);
        var loanDetailsTemp = map.get(id);
        loanDetailsTemp.channel = "yes";
        map.put(id,loanDetailsTemp);
		$("#order_modal").load("/admin/loan/vieworderdetails.html");
		opendiv("order_modal");
	}

function getlenderdetails(obj) {
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
		//导出Excel
		function exportExcel(){
		    var src = "/admin/loan/exportLoanBalList?endDate=" + $("#end_date").val() + "&pledge_type=" + $("#pledge_type").val()+ "&deptId=" + $("#deptId").val() + "&companyId=" + $("#companyId").val()+ "&orderId=" + $("#txt_orderid").val() + "&customerName=" + $("#txt_name").val()
		    		+ "&repay_way=" + $("#repay_way").val() + "&responsible_cm_id=" + $("#responsibleCmId").val();
		    $("#exportIframe").attr("src",src);
		 	$('#dc_tip').show();
	        	setTimeout(function() {
	          		$('#dc_tip').hide();
	        },1500);
		}
</script>
</html>
