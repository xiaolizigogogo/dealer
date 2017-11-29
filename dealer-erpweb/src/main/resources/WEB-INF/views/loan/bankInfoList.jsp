<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=edge; chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Cache-Control" content="no-transform">
    <title>e车贷管理系统—银行账号列表</title>
    <%@include file="../common/taglibs.jsp" %>
    <link rel="stylesheet" href="${basePath}/css/bootstrap-datetimepicker.min.css">
<%--     <link rel="stylesheet" href="${ basePath }/css/bootstrap/bootstrap-table.css"> --%>
    <script src="${basePath}/js/bootstrap-datetimepicker.min.js"></script>
    <script src="${basePath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="${basePath}/js/datetimepicker.js"></script>
    <script src="${basePath}/js/uploadPreview.js" type="text/javascript"></script>
    <script src="${basePath}/js/tableutils.js"></script>
    
    <style type="text/css">
    .table > tbody > tr > td.tr_back,.table-striped > tbody > tr:nth-child(odd) > td.tr_back, .table-striped > tbody > tr:nth-child(odd) > th.tr_back{background-color:#FCF8E3; !important;}
</style>
</head>
<body>
<div class="tools_bar col-lg-12">
  
  <div class="clearfix">
    <form class="form-inline pull-left" role="form">
     <div class="form-group">
        <label class="sr-only" for="txt_name">订单号</label>
        <input type="text" class="form-control" id="orderNo" name="orderNo" placeholder="请输入订单号">
      </div>
      <div class="form-group">
        <label class="sr-only" for="txt_name">入客户姓名</label>
        <input type="text" class="form-control" id="customerName" name="customerName" placeholder="请输入客户姓名">
      </div>
      
      
      <div class="form-group">
        <div class="ta_date" id="div_date1"> <span class="date_title" id="date1"></span> <a class="opt_sel" id="input_trigger1" href="#"> <i class="i_orderd"></i> </a> </div>
        <div id="datePicker1"></div>
      </div>
      <button type="button" onclick="select()"
					class="btn btn-primary btn-search">
					<i class="fa fa-search"></i> 搜索
				</button>
    </form>
  </div>
</div>
<div class="list_box col-sm-12">
  <table data-toggle="table" class="table table-bordered table-striped">
    <thead>
      <tr>
        <th>订单号</th>
		<th>客户姓名</th>
        <th>开户名</th>
        <th>开户行</th>
        <th>账号</th>
        <th>创建日期</th>
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
<div id="bank_modal" class="modal modal_sml fade in" style=" width:400px; height:450px; top:20%;">
  <div class="modal-header" id="header"> <a  type="button" href = "javascript:void(0)" onclick = "colsediv(0)"  class="close" ><span aria-hidden="true">&times;</span></a>
    <h4 class="modal-title" id="myModalLabel" style="font-size:16px;">编辑银行账号</h4>
  </div>
  <div class="modal-body" >
   
      <form>
  <div class="form-group">
    <label>订单编号</label>
    <input type="text" value="" id="orderid" readonly class="form-control" >
  </div>
  <div class="form-group">
    <label>开户名</label>
    <input type="text" id="accountname" name="accountname" class="form-control" >
  </div>
  <div class="form-group">
    <label>开户行</label>
    <input type="text" id="bankname" name="bankname" class="form-control" maxlength="10" >
  </div>
 <div class="form-group">
    <label>账号</label>
    <input type="text" id="accountnum" name="accountname" class="form-control" maxlength="20">
  </div>

  <button type="button" onclick="colsediv(0)" class="btn btn-default">取消</button> <button type="button" onclick="saveAccount()" class="btn btn-danger">提交</button>
</form>
    
  </div>
</div>
 <div id="qs_box" class="modal modal_sml fade in" style="top:5% !important;left: 35% !important;">
 		<input type="hidden" value="" id="bank_id" />
		<div class="modal-header">
			<a type="button" href="javascript:void(0)" onclick="colsediv('qs_box')"
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
					onclick="colsediv('qs_box')">取消</a>
				<a class="btn btn-default btn-sm" href="javascript:void(0)" 
					onclick="colsediv('qs_box')" id="ok_button">确定</a>
			</div>
		</div>
	</div>
<div id="fade2" class="black_overlayx"></div>
</body>
<script type="text/javascript">
    $(function () {
		init();
	});
	
	function init() {
		
		var customerName = $("#customerName").val();
		var orderNo = $("#orderNo").val();

        if (("" !== customerName && null !== customerName) ||  ("" !== orderNo && null !== orderNo)) {
			var param = {
                "customerName": customerName,
                "orderNo":orderNo
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
            var bianji="";
			if((""!=data.customerAccountInfo.bankName&&null!=data.customerAccountInfo.bankName)&&
			   (""!=data.customerAccountInfo.accountNum&&null!=data.customerAccountInfo.accountNum)&&
			   (""!=data.customerAccountInfo.accountName&&null!=data.customerAccountInfo.accountName)){
			   bianji="<td><a href = 'javascript:void(0)'  onclick='editBank(this)' id="+data.customerAccountNumId+" order-id="+data.orderid+" account-name="+data.customerAccountInfo.accountName+" bank-name="+data.customerAccountInfo.bankName+" account-num="+data.customerAccountInfo.accountNum+">编辑</a></td>"
			 }else if(""!=data.customerAccountInfo.bankName&&null!=data.customerAccountInfo.bankName){
			   bianji="<td><a href = 'javascript:void(0)'  onclick='editBank(this)' id="+data.customerAccountNumId+" order-id="+data.orderid+" account-name="+data.customerAccountInfo.accountName+" bank-name="+data.customerAccountInfo.bankName+" >编辑</a></td>"
			 }else if(""!=data.customerAccountInfo.accountNum&&null!=data.customerAccountInfo.accountNum){
			   bianji="<td><a href = 'javascript:void(0)'  onclick='editBank(this)' id="+data.customerAccountNumId+" order-id="+data.orderid+" account-name="+data.customerAccountInfo.accountName+" account-num="+data.customerAccountInfo.accountNum+" >编辑</a></td>"
			 }else if(""!=data.customerAccountInfo.accountName&&null!=data.customerAccountInfo.accountName){
			   bianji="<td><a href = 'javascript:void(0)'  onclick='editBank(this)' id="+data.customerAccountNumId+" order-id="+data.orderid+" account-name="+data.customerAccountInfo.accountName+" account-num="+data.customerAccountInfo.accountNum+" >编辑</a></td>"
			 }else{
			   bianji="<td><a href = 'javascript:void(0)'  onclick='editBank(this)' id="+data.customerAccountNumId+" order-id="+data.orderid+" account-name="+data.customerAccountInfo.accountName+" >编辑</a></td>"
			 }
			context = "<tr>" 
					+ "<td>" + state + data.orderid + "</td>"
					+ "<td>" + isImportant + data.customerRegisterInfo.customerName + "</td>"
					+ "<td>" + data.customerAccountInfo.accountName + "</td>" 
					+ "<td>" + data.customerAccountInfo.bankName + "</td>"
					+ "<td>" + data.customerAccountInfo.accountNum + "</td>"
					+ "<td>" + data.createdAt.substring(0,19) + "</td>"
					+ bianji
					+ "</tr>";
			return context;
		};

        pageComm("${basePath}/admin/loan/queryBankCardInfoList", param == null ? {} : param, writetablefn, "record", 17);
        $("#orderNo").val(null);
        $("#customerName").val(null);
	}

    var param = function () {
		return {
        	"orderNo": $("#orderNo").val(),
            "customerName": $("#customerName").val()
		};
	};
	
	function select() {
		onLoadDate(param());
	}
	
	function editBank(obj){
		$("#orderid").val($(obj).attr("order-id"));
		$("#customer_id").val($(obj).attr("customer-name"));
		$("#accountname").val($(obj).attr("account-name"));
		$("#bankname").val($(obj).attr("bank-name"));
		$("#accountnum").val($(obj).attr("account-num"));
		$("#bank_id").val($(obj).attr("id"))
		opendiv('bank_modal');
	}
	
	function saveAccount(){
		var accountname = $.trim($("#accountname").val());
		var bankname = $.trim($("#bankname").val());
		var accountnum = $.trim($("#accountnum").val());
		var bankid=$("#bank_id").val();
		if(null == accountname || "" == accountname){
			alertMessage("开户名不能为空!","colsediv('qs_box')");
			return;
		}
		if(null == bankname || "" == bankname){
			alertMessage("开户行不能为空!","colsediv('qs_box')");
			return;
		}
		if(null == accountnum || "" == accountnum){
			alertMessage("账号不能为空!","colsediv('qs_box')");
			return;
		}
		$.ajax({
			url:"/admin/loan/updateBankAccount",
			data:{"accountname":accountname,"bankname":bankname,"accountnum":accountnum,"bank_id":$("#bank_id").val()},
			type:"post",
			dataType:"text",
			success:function(data){
				if(data == "0000"){
					alertMessage("操作成功!","saveAccountSuccess()");
					colsediv('qs_box');
				}
			},error(){
				alertMessage("未知错误!",null);
			}
		})
	}
	
	function saveAccountSuccess(){
		colsediv(0);
		select();
	}
	
</script>
</html>
