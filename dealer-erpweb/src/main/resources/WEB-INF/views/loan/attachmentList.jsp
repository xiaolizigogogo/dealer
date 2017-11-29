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
<title>e车贷管理系统—附件列表</title>
<%@include file="../common/taglibs.jsp"%>
<link rel="stylesheet"
  href="${basePath}/css/bootstrap-datetimepicker.min.css">
<%--     <link rel="stylesheet" href="${ basePath }/css/bootstrap/bootstrap-table.css"> --%>
<script src="${basePath}/js/bootstrap-datetimepicker.min.js"></script>
<script src="${basePath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="${basePath}/js/datetimepicker.js"></script>
<script src="${basePath}/js/uploadPreview.js" type="text/javascript"></script>
<script src="${basePath}/js/tableutils.js"></script>
<link rel="stylesheet" href="${basePath}/css/lightbox.min.css" />
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
  <input type="hidden" value="<%=searchDate%>" id="searchDate" />
  <input type="hidden" value="" id="edit_customer_id" />
  <input type="hidden" value="" id="statusnew">
  <input type="hidden" value="" id="customer_id_hidden">
  <input type="hidden" value="" id="taskId_hidden">
  <input type="hidden" value="" id="processDefinitionId_hidden">
  <div class="list_box col-sm-12">
    <table data-toggle="table" class="table table-bordered table-striped">
      <thead>
        <tr>
          <th>名称</th>
          <th>类型</th>
          <th>父类型</th>
          <th>是否有效</th>
          <th>创建时间</th>
          <th>修改时间</th>
          <th>是否唯一</th>
          <th>是否必要</th>
          <th>数量</th>
          <th>备注</th>
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
  <input name="attachmentId" id="attachmentId" type="hidden">
  <div id="fade2" class="black_overlayx"></div>
  <div id="order_modal" class="modal fade in"></div>
  <iframe src="" style="display: none;" id="exportIframe"> </iframe>
</body>
<script type="text/javascript">
  //1.初始化页面 init方法,第一次请求不需要设置参数，需要设置页面初始化数据
  $(function() {
    init();
  });
  //初始化方法,调用queryBadLoanList接口，将返回的一系列信息添加到下拉选择框中,并将查询到的数据绑定到页面，需要分页
  function init() {
	$.ajax({
		url:"${basePath}/admin/loan/getAllAttachmentInfo",
		type:"get",
		success:function(data){
			var attachmentInfos=data.attachmentInfos;
			var record="";
			for(var i=0;i<attachmentInfos.length;i++){
				var item=attachmentInfos[i];
			     var context = "<tr><td>"+item.attachmentName+"</td><td>"
			      +item.attachmentType+"</td><td>"
			      +item.attachmentParentId+"</td><td>"
			      +item.enable+"</td><td>"
			      +item.gmtCreate+"</td><td>"
			      +item.gmtModify+"</td><td>"
			      +item.attachmentUnique+"</td><td>"
			      +item.attachmentRequired+"</td><td>"
			      +item.attachmentNum+"</td><td>"
			      +item.memo+"</td><td> <a id="+item.id+" href='javascript:void(0)' onclick='setCustomerIdHidden(this)'>修改</a> </td></tr>";
			      record=record+context;
			}
			$("#record").html(record);
		}
	})
  }
  //2.点击查询的查询方法
  function select() {
    onLoadDate(param());
  }

  function onLoadDate(param) {
	
    var writetablefn = function(data) {

          
         
      return context;
    };

    pageComm("${basePath}/admin/loan/getAllAttachmentInfo", param == null ? {}
        : param, writetablefn, "record", 17);

  }

  function assignment(obj) {
    $("#statusnew").val($(obj).attr("id"));
    select();
  }
  function reset() {
    $("#mobile").val("");
    $("#customerName").val("");
  }

  function setCustomerIdHidden(obj) {
    $("#attachmentId").val($(obj).attr("id"));
    $("#order_modal").load("/admin/loan/attachmentInfo.html");
    opendiv("order_modal");
  }
  function getlenderdetails(obj) {
    $("#customer_id_hidden").val($(obj).attr("id"));
    $("#order_modal").load("/admin/loan/lenderdetails.html");
    opendiv("order_modal");
  }



</script>
</html>
