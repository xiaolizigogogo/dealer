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
      <div class="form-group">
        <label class="sr-only" for="txt_name"></label>
        <div class="input-group date form_date" data-date="" data-date-format="yyyy-mm-dd" data-link-field="purchaseDate" data-link-format="yyyy-mm" style="width:160px;">
          <input class="form-control valid" value="" readonly style="width:100%;" type="text" placeholder="" id="endDate">
          <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span> </div>
      </div>
      <!--  <div class="form-group">
        <label class="sr-only" for="txt_name">订单号</label>
        <input type="text" class="form-control" id="txt_orderid" placeholder="请输入订单号">
      </div>
      <div class="form-group">
        <label class="sr-only" for="txt_number">客户姓名</label>
        <input type="text" class="form-control" id="txt_name" placeholder="客户姓名">
      </div>-->
      
     <div class="form-group" style="display:none">
        <label class="sr-only" for="txt_number">期数</label>
        <input type="number" class="form-control" id="period" placeholder="期数" style="width:100px;">
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
    <!--<p>截止2016年8月，期数：<b class="text-warning">1期</b>，分公司：<b class="text-warning">车易宝</b>，部门：<b class="text-warning">业务部一部</b>，客户经理：<b class="text-warning">张三</b>，-->逾期订单数<b class="text-danger" id="OrderCount"> 16单</b>，逾期总额<b class="text-danger" id="RepayTotalSUM"> 41.0万元</b></p>
  </div>
  <div class="list_btn">
    <ul class="list-inline">
      <!-- <li><a class="btn btn-danger"   href = "javascript:void(0)"  onclick="opendiv(0)"> <i class="fa fa-plus"></i>新增</a></li>-->
    
      <li><a class="btn btn-danger" href="javascript:void(0)" id="dc_btn" onclick="exportExcel();"> <i class="fa fa-download"></i>导出文件</a></li>
        <li><p class="text-danger" id="dc_tip" style="display:none;">逾期统计表已导出</p></li>
    </ul>
  </div>
</div>
<div class="list_box col-sm-12">
  <table data-toggle="table" class="table table-bordered table-striped">
    <thead>
      <tr>
        <th>合同编号</th>
        <th>订单编号</th>
        <th>客户姓名</th>
        <th>贷款金额</th>
        <th>期数</th>
        <th>应还金额</th>
        <th>应还时间</th>
        <th>逾期天数</th>
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
	var currentReviewLoanStatus = "${map.status}"; // 根据不同的状态进行查询,参数由IndexController封装为map
	var currentpledgeType = "${map.pledgeType}";
	var map = new Map();
    $(function () {
		init();
        
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
        });
        
	});
	
	function init() {
			var years = new Date();
			var yearsStr = years.getFullYear().toString();
			var month = years.getMonth()+1;
			var monthStr = month.toString();
			var myDate = years.getDate();
			var date = yearsStr + "-" + monthStr+"-"+myDate;
			$("#endDate").val(date);
			onLoadDate({
                "status": currentReviewLoanStatus
			});
        
	}
	
	

	function onLoadDate(param) {
        $("#OrderCount").html("0单");
        $("#RepayTotalSUM").html("0万元");
		
		
        var writetablefn = function (data)
        
		{ 

			var pledgeType = data.pledgeType;
			var pledgeTypeStr = "";
            if(pledgeType == "drivePledge"){
				pledgeTypeStr = "押证";
            }else if(pledgeType == "vehiclePledge"){
				pledgeTypeStr = "押车";
			}
			
			var loanDetails = {};
			loanDetails.uuid = data.uuid;
			loanDetails.orderId = data.contractNo;
			loanDetails.taskId = data.taskId;
			loanDetails.activityId = data.activityId;
			loanDetails.assignee = data.assignee;
			loanDetails.loan_status = data.loan_status;
			loanDetails.customerId = data.customerId;
			
            $("#OrderCount").html(data.OrderCount+"单");
            $("#RepayTotalSUM").html(parseFloat(data.RepayTotalSUM/10000).toFixed(2)+"万元");

			context = "<tr>" 
					+ "<td>" + "<a id=" + data.uuid + " onclick='setCustomerIdHidden(this)' href='javascript:void(0);'>" + data.contractNo + "</a></td>"
					+ "<td>" + "<a id=" + data.uuid + " onclick='setCustomerIdHidden(this)' href='javascript:void(0);'>" +data.oid + "</a></td>"
					+ "<td>" + "<a id=" + data.uuid + " onclick='getlenderdetails(this)' href='javascript:void(0);'>" + data.customerName + "</td>"
					+ "<td>" + data.loanMoney + "</td>" 
					+ "<td>" + data.period + "</td>" 
					+ "<td>" + data.repayCapital + "</td>" 
					+ "<td>" + data.repayDate.substring(0,10) + "</td>"
					+ "<td>" + data.overDueDay + "</td>"
					+ "<td>" + data.companyName + "</td>"
					+ "<td>" + data.deptName + "</td>"
					+ "<td>" + data.responsibleName + "</td>"
					+ "</tr>";
			map.put(data.uuid.toString(),loanDetails);
			return context;
		};
  
        pageComm("${basePath}/admin/loan/queryoverdueList", param == null ? {} : param, writetablefn, "record", 17);
	}

    var param = function () {
		return {
        	"searchDate": $("#endDate").val(),
            "period": $("#period").val(),
            "deptId":$("#deptId").val(),
            "companyId":$("#companyId").val(),
            "orderId":$("#txt_orderid").val(),
            "customerName":$("#txt_name").val(),
            "responsibleCmId":$("#responsibleCmId").val()

		};
	};
 
	function select() {
		onLoadDate(param());
	}


	function setCustomerIdHidden(obj){
		$("#customer_id_hidden").val($(obj).attr("id"));
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
		    var src = "/admin/loan/exportLoanOverdueList?searchDate=" + $("#endDate").val() + "&period=" + $("#period").val()+ "&deptId=" + $("#deptId").val() + "&companyId=" + $("#companyId").val()+ "&orderId=" + $("#txt_orderid").val() + "&customerName=" + $("#txt_name").val()
		    		+ "&responsibleCmId=" + $("#responsibleCmId").val();
		    $("#exportIframe").attr("src",src);
		 	$('#dc_tip').show();
	        	setTimeout(function() {
	          		$('#dc_tip').hide();
	        },1500);
		}
</script>
</html>
