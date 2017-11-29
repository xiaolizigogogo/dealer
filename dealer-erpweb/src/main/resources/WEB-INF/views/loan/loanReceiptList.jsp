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
<title>e车贷管理系统—贷款累放累收</title>
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
<script type="text/javascript" src="${basePath}/js/dateRange.js"></script>
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
      <div class="form-group">
        <div class="ta_date" id="div_date1"> <span class="date_title" id="date1"></span> <a class="opt_sel" id="input_trigger1" href="#"> <i class="i_orderd"></i> </a> </div>
        <div id="datePicker1"></div>
      </div>
      <div class="form-group">
        <label class="sr-only" for="txt_name">合同编号</label>
        <input type="text" class="form-control" id="txt_orderid" placeholder="请输入合同编号">
      </div>
      <div class="form-group">
        <label class="sr-only" for="txt_number">客户姓名</label>
        <input type="text" class="form-control" id="txt_name" placeholder="客户姓名">
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
      <button type="button" class="btn btn-primary btn-search" id="btn-submit"><i class="fa fa-search"></i> 搜索</button>
    </form>
  </div>
  <div class="tj_box clearfix" style="margin-top:10px;">
    <!--<p>自2016-5-1 至 2016-9-6，部门：<b class="text-warning">业务部一部</b>，客户经理：<b class="text-warning">张三</b>，-->订单数 <b class="text-danger" id="OrderCount">25单</b>，累放总额<b class="text-danger" id="OutCount">-1000.00万</b>，累收总额 <b class="text-danger" id="InCount"> 2000.00万</b>，收放总金额 <b class="text-danger" id="BalCount"> -1000.00万万元</b> </p>
  </div>
  <div class="list_btn">
    <ul class="list-inline">
      <!-- <li><a class="btn btn-danger"   href = "javascript:void(0)"  onclick="opendiv(0)"> <i class="fa fa-plus"></i>新增</a></li>-->
    
      <li><a class="btn btn-danger" href="javascript:void(0)" id="dc_btn" onclick="exportExcel('1');"> <i class="fa fa-download"></i>导出累放表</a></li>
      <li><a class="btn btn-danger" href="javascript:void(0)" id="" onclick="exportExcel('2');"> <i class="fa fa-download"></i>导出累收表</a></li>
      <li><a class="btn btn-danger" href="javascript:void(0)" id="" onclick="exportExcel('3');"> <i class="fa fa-download"></i>导出累收累放表</a></li>
    <li><p class="text-danger" id="dc_tip_1" style="display:none;">累放表已导出</p></li>
    <li><p class="text-danger" id="dc_tip_2" style="display:none;">累收表已导出</p></li>
    <li><p class="text-danger" id="dc_tip_3" style="display:none;">累收累放表已导出</p></li>
    </ul>
  </div>
</div>
<div class="list_box col-sm-12">
  <table data-toggle="table" class="table table-bordered table-striped">
    <thead>
      <tr>
       <th>贷款日</th>
        <th>到期日</th>
        <th>订单编号</th>
        <th>合同编号</th>
        <th>客户姓名</th>
        <th>月利率</th>
        <th>累放金额</th>
        <th>累收金额</th>
        <th>收放金额</th>
        <th>分公司</th>
        <th>部门</th>
        <th>客户经理</th>
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
var map = new Map();
$(function () {
		initDate();
	});
	
	function initDate() {
		
		var startDate = $("#startDate").val();
        var endDate = $("#endDate").val();

        if (("" !== startDate && null !== startDate) ||  ("" !== endDate && null !== endDate)) {
			var param = {
                "startDate" : startDate,
                "endDate" : endDate
			};
			onLoadDate(param);
		} else {
			onLoadDate({
			});
		}
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
	
	
	function select() {
		onLoadDate(param());
	}
	
    $("#btn-submit").click(function(){   	 
      	 select();
     });
	
	var dateRange1 = new pickerDateRange('date1', {
		isTodayValid : true,
		startDate : '请选择日期',
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




	var currentReviewLoanStatus = "${map.status}"; // 根据不同的状态进行查询,参数由IndexController封装为map
	var currentpledgeType = "${map.pledgeType}";
    $(function () {
		init();
        $("#pledgeType").find('option[value="' + currentpledgeType + '"]').attr("selected", true);
        
	});
	
	function init() {

			onLoadDate({
                "status": currentReviewLoanStatus
			});
	}

	function onLoadDate(param) {
		
		$("#OrderCount").html("0单");
        $("#OutCount").html("0.00万元");
        $("#InCount").html("0.00万元");
        $("#BalCount").html("0.00万元");
		
        var writetablefn = function (data)      
		{ 
        	$("#OrderCount").html(data.OrderCount+"单");
            $("#OutCount").html(parseFloat(data.OutCount/10000).toFixed(2)+"万元");
            $("#InCount").html(parseFloat(data.InCount/10000).toFixed(2)+"万元");
            $("#BalCount").html(parseFloat(data.BalCount/10000).toFixed(2)+"万元");


          var loanDetails = {};
          loanDetails.uuid = data.uuid;
          loanDetails.orderId = data.contractNo;
          loanDetails.taskId = data.taskId;
          loanDetails.activityId = data.activityId;
          loanDetails.assignee = data.assignee;
          loanDetails.loan_status = data.loan_status;
          loanDetails.customerId = data.customerId;

			var context;

			context = "<tr>" 
					+ "<td>"+data.startDate+"</td>"
					+ "<td>" + data.endDate + "</td>"
					+ "<td>" + "<a id=" + data.uuid + " onclick='setCustomerIdHidden(this)' href='javascript:void(0);'>" + data.contractNo + "</a>"+"</td>"
					+ "<td>" + "<a id=" + data.uuid + " onclick='setCustomerIdHidden(this)' href='javascript:void(0);'>" + data.cnum + "</a>"+"</td>"
					+ "<td>" + "<a id=" + data.uuid + " onclick='getlenderdetails(this)' href='javascript:void(0);'>" + data.customerName + "</td>"
					+ "<td>" + data.loanRate + "</td>"
					+ "<td>" + data.outMoney + "</td>"
					+ "<td>" + data.inMoney + "</td>"
					+ "<td>" + data.balMoney + "</td>" 
					+ "<td>" + data.companyName + "</td>" 
					+ "<td>" + data.deptName + "</td>" 
					+ "<td>" + data.responsibleName + "</td>" 
					+ "</tr>";
          map.put(data.uuid.toString(),loanDetails);
			return context;
		};
  
        pageComm("${basePath}/admin/loan/queryLoanReceipt", param == null ? {} : param, writetablefn, "record", 17);
	}

    var param = function () {
		return {
            "startDate" : $("#startDate").val(),
            "endDate" : $("#endDate").val(),
            "deptId":$("#deptId").val(),
            "orderId":$("#txt_orderid").val(),
            "customerName":$("#txt_name").val(),
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
		function exportExcel(type){
		    var src = "/admin/loan/exportLoanReceiptList?startDate=" + $("#startDate").val() + "&endDate=" + $("#endDate").val() + "&deptId=" + $("#deptId").val() + "&companyId=" + $("#companyId").val()+ "&orderId=" + $("#txt_orderid").val() + "&customerName=" + $("#txt_name").val()
		    		+ "&responsible_cm_id=" + $("#responsibleCmId").val() + "&type=" + type;
		    $("#exportIframe").attr("src",src);
		 	$('#dc_tip_'+type).show();
	        	setTimeout(function() {
	          		$('#dc_tip_'+type).hide();
	        },1500);
		}
</script>
</html>
