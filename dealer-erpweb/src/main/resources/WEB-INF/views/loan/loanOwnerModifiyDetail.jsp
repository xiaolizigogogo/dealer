<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
  import="com.maiqianweng.common.utils.*"%>
<!DOCTYPE html>
<%
  String searchDate = request.getParameter("date");
%>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible"
  content="IE=9; IE=8; IE=7; IE=edge; chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Cache-Control" content="no-transform">
<title>e车贷管理系统—坏账统计</title>
<%@include file="../common/taglibs.jsp"%>
<link rel="stylesheet"
  href="${basePath}/css/bootstrap-datetimepicker.min.css">
<%--     <link rel="stylesheet" href="${ basePath }/css/bootstrap/bootstrap-table.css"> --%>
<script src="${basePath}/js/bootstrap-datetimepicker.min.js"></script>
<script src="${basePath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="${basePath}/js/datetimepicker.js"></script>
<script src="${basePath}/js/uploadPreview.js" type="text/javascript"></script>
<script src="${basePath}/js/tableutils.js"></script>
<script src="${basePath}/js/lightbox.js" /></script>
<link rel="stylesheet" type="text/css"
  href="${basePath}/css/dateRange.css" />
<script type="text/javascript" src="${basePath}/js/dateRange.js"></script>
<style type="text/css">
.table>tbody>tr>td.tr_back, .table-striped>tbody>tr:nth-child(odd)>td.tr_back,
  .table-striped>tbody>tr:nth-child(odd)>th.tr_back {
  background-color: #FCF8E3;
  !
  important;
}
</style>
</head>
<body>

  <div class="modal-header" id="header" style="position:static; background:#fff;"> <a type="button" href="javascript:void(0)" onclick="closePage(0)" class="close"><span aria-hidden="true">×</span></a>
    <h4 class="modal-title" id="myModalLabel" style="font-size:16px;">修改归属人<small style="padding-left:20px; font-size:14px;" class="text-muted" id="order_id">订单号：</small></h4>
  </div>
  <div class="modal-body clearfix" style="margin-top:0px;">
    <div class="from_box">
      <div class="from_tit clearfix">
        <h3 class="pull-left">客户经理修改</h3>
      </div>
      <div class="row" style=" margin-bottom:5px;">
        <div class="col-sm-8">
          <dl class="dl-horizontal">
            <dt>原客户经理</dt>
            <dd id="old_user"></dd>
          </dl>
        </div>
      </div>
      <div class="row">
        <div class="col-sm-12">
          <dl class="dl-horizontal">
            <dt style="padding-top:5px;">更换客户经理</dt>
            <dd>
              <select class="form-control error" id="company_loan" style="display:inline;">
                <option value="">请选择所属分公司</option>
              </select>
              <select class="form-control error" id="dept_loan" style="display:inline;">
                <option value="">请选择所属部门</option>
              </select>
              <select class="form-control error" id="user_loan" style="display:inline;">
                <option value="">所属客户经理</option>
              </select>
            </dd>
          </dl>
        </div>
        <div class="col-sm-12">
          <dl class="dl-horizontal">
            <dt></dt>
            <dd>
              <button id="loanButton" type="button" class="btn btn-danger" style="display:inline;" onclick="modifiyLoanOwner()">修改</button>
            </dd>
          </dl>
        </div>
      </div>
    </div>
    <div class="from_box">
      <div class="from_tit clearfix">
        <h3 class="pull-left">任务归属人修改</h3>
      </div>
      <div class="row" style=" margin-bottom:5px;">
        <div class="col-sm-5">
          <dl class="dl-horizontal">
            <dt>任务节点</dt>
            <dd id="task_name"></dd>
          </dl>
        </div>
        <div class="col-sm-5">
          <dl class="dl-horizontal">
            <dt>待办人</dt>
            <dd id="task_user"></dd>
          </dl>
        </div>
      </div>
      <div class="row">
        <div class="col-sm-12">
          <dl class="dl-horizontal">
            <dt style="padding-top:5px;">更换任务归属人</dt>
            <dd>
              <select class="form-control error" id="company_task"  style="display:inline;">
                <option value="">请选择所属分公司</option>
              </select>
              <select class="form-control error" id="dept_task" style="display:inline;">
                <option value="">请选择所属部门</option>
              </select>
              <select class="form-control error" id="user_task" style="display:inline;">
                <option value="">请选择操作人</option>
              </select>
            </dd>
          </dl>
        </div>
        <div class="col-sm-12">
          <dl class="dl-horizontal">
            <dt></dt>
            <dd>
              <button id="taskButton" type="button" class="btn btn-danger" style="display:inline;" onclick="modifiyTaskOwner()">修改</button>
            </dd>
          </dl>
        </div>
      </div>
    </div>
  </div>
</div>
</body>


<script>
var loanId=$("#customer_id_hidden").val();
$(function(){
	debugger;

	init(loanId);
	
});
function closePage(){
//	$("#order_modal").empty();
	$("#lightboxOverlay").remove();
	$("#lightbox").remove();
	$("#user_modal").empty();
	colsediv(0);
}

	function init(id){
		$.get("${basePath}/admin/company/queryCompanyList", function(data) {
	      for (var i = 0; i < data.length; i++) {
	        $("#company_loan").append(
	            "<option value="+data[i].id+">" + data[i].name
	                + "</option>");
	        $("#company_task").append(
		            "<option value="+data[i].id+">" + data[i].name
		                + "</option>");
	      }
	    });
		$.ajax({
			url:"/admin/loan/loanOwnerInfo?loanId="+id,
			type:"get",
			dataType:"json",
			success:function(data){
				//
				$("#old_user").text(data.loanUser);
				$("#task_user").text(data.taskUser);
				$("#task_name").text(data.taskName);
				$("#order_id").text("订单号:"+data.orderId);
			}
		})
	}
//选择分公司绑定事件，获取部门信息
$('#company_task').change(
    function(e) {
      $.post("/admin/dept/queryDeptComById", {
        companyId : this.value
      }, function(data) {
        $("#dept_task").empty().append(
            "<option value=''>请选择所属部门</option>");
        for (var i = 0; i < data.length; i++) {
          $("#dept_task").append(
              "<option value="+data[i].id+">" + data[i].name
                  + "</option>");
        }
      }, "json")
    });
$('#dept_task').change(
    function(e) {
      $.post("/admin/user/queryComIdDeptId", {
        companyId : $('#company_task').val(),
        deptId : this.value,
      }, function(data) {
        $("#user_task").empty().append(
            "<option value=''>请选择操作人</option>");
        for (var i = 0; i < data.length; i++) {
          $("#user_task").append(
              "<option value="+data[i].uuid+">"
                  + data[i].realname + "</option>");
        }
      }, "json")
    });
//选择分公司绑定事件，获取部门信息
$('#company_loan').change(
    function(e) {
      $.post("/admin/dept/queryDeptComById", {
        companyId : this.value
      }, function(data) {
    	  debugger;
        $("#dept_loan").empty().append(
            "<option value=''>请选择所属部门</option>");
        for (var i = 0; i < data.length; i++) {
          $("#dept_loan").append(
              "<option value="+data[i].id+">" + data[i].name
                  + "</option>");
        }
      }, "json")
    });
$('#dept_loan').change(
    function(e) {
      $.post("/admin/user/queryComIdDeptId", {
        companyId : $('#company_loan').val(),
        deptId : this.value
      }, function(data) {
        $("#user_loan").empty().append(
            "<option value=''>所属客户经理</option>");
        for (var i = 0; i < data.length; i++) {
          $("#user_loan").append(
              "<option value="+data[i].uuid+">"
                  + data[i].realname + "</option>");
        }
      }, "json")
    });
    
  var modifiyLoanOwner=function(){
	  var user=$("#user_loan").val();
	  if(user==null||user==''){
		  layer.msg("请选择客户经理");
		  return false;
	  }		  
	  $.ajax({
		  url:"/admin/loan/modifiyLoanOwner",
		  data:{
			  loanId:loanId,
			  userId:user
		  },
		  type:"post",
		  dataType:"json",
		  success:function(data){
			  if(data.result.success==true){
				  layer.msg("操作成功");
			  }
			  else{
				  layer.msg("操作失败:"+data.result.message)
			  }
		  }
	  });
  }
  
  var modifiyTaskOwner=function(){
	  var user=$("#user_task").val();
	  if(user==null||user==''){
		  layer.msg("请选择操作人");
		  return false;
	  }	
	  $.ajax({
		  url:"/admin/loan/modifiyLoanTaskOwner",
		  data:{
			  loanId:loanId,
			 userId:user
		  },
		  type:"post",
		  dataType:"json",
		  success:function(data){
			  if(data.result.success==true){
				  layer.msg("操作成功");
			  }
			  else{
				  layer.msg("操作失败:"+data.result.message)
			  }
		  }
	  });
	  }
</script>