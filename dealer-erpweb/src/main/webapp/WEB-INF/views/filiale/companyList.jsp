<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=edge; chrome=1" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="Cache-Control" content="no-transform">
  <title>e车贷管理系统—分公司列表</title>
  <%@include file="../common/taglibs.jsp" %>
  <script src="${basePath}/js/bootstrap-datetimepicker.min.js"></script>
  <script src="${basePath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
  <script src="${basePath}/js/datetimepicker.js"></script>
  <script src="${basePath}/js/tableutils.js"></script>

</head>
<body>
<div class="tools_bar col-lg-12">
  <form class="form-inline" role="form">
    <div class="form-group">
      <label class="sr-only" for="name">分公司名称</label>
      <input type="text" id="userId" name="userId" value="${map.userId}"
                 hidden="hidden">
      <input type="text" class="form-control" id="name" name="name"
                 value="${map.name}" placeholder="分公司名称">
    </div>
    <div class="form-group">
      <label class="sr-only" for="principal">负责人</label>
      <input type="text" class="form-control" id="principal" name="principal"
                 value="${map.principal}" placeholder="负责人">
    </div>
  <div class="form-group">
      <label class="sr-only" for="txt_name">联系电话</label>
      <input type="text" class="form-control" id="telephone"
                 name="telephone" placeholder="联系电话">
    </div>
    <button type="button" onclick="select()" class="btn btn-primary btn-search"><i class="fa fa-search"></i> 搜索</button>
  </form>
  <div class="list_btn clearfix">
    <ul class="list-inline">
      <!-- <li><a class="btn btn-danger"   href = "javascript:void(0)"  onclick="opendiv(0)"> <i class="fa fa-plus"></i>新增</a></li>-->
      <li><a class="btn btn-danger"   href = "/admin/company/toAddCompany.html"> <i class="fa fa-plus"></i>新增分公司</a></li>
    </ul>
  </div>
</div>
<div class="list_box col-sm-12">
  <table class="table table-bordered table-striped">
    <thead>
      <tr>
        <th>公司名称</th>
        <th>公司别名</th>
        <th>负责人</th>
        <th>联系电话</th>
    
        <th>保证金账号</th>
        <th>保证金(万元)</th>
        <th>逾期比率</th>
        <%--<th>累计违约金</th>--%>
        <th>管理费费率</th>
        <th>注册时间</th>
        <th>开始服务时间</th>
        <th>结束服务时间</th>
         <th>操作</th>
      </tr>
    </thead>
    <tbody id="record">
      
    </tbody>
  </table>
</div>
<div id="r-page"></div>
	<div id="qs_box" class="modal modal_sml fade in">
		<div class="modal-header">
			<a type="button" href="javascript:void(0)" onclick="colsediv(0)"
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
					onclick="colsediv(0)">取消</a>
				<a class="btn btn-default btn-sm"
					href="javascript:void(0)" onclick="colsediv(0)" id="ok_button">确定</a>
			</div>
		</div>
	</div>
<div id="fade2" class="black_overlayx"></div>
</body>
<script type="text/javascript">
  $(function () {
    var name = $("#name").val();
    var principal = $("#principal").val();
    var telephone = $("#telephone").val();
    var startDate = $("#startDate").val();
    var endDate = $("#endDate").val();
    if (("" != name && null != name) || ("" != principal && null != principal) || ("" != telephone && null != telephone)|| ("" != startDate && null != startDate) || ("" != endDate && null != endDate)) {
      var param = {
        name: name,
        principal: principal,
        telephone: telephone,
        startDate: startDate,
        endDate: endDate
      };
      onloadDate(param);
    } else {
      onloadDate(null);
    }
  });


  function onloadDate(param) {
    var writetablefn = function (data) {
      var context;
      $("#checkAll").prop("checked", false);
        var operation = "<td align='center'><a href='/admin/company/toAddCompany.html?id="+data.id+"'>编辑</a>";
        //如果公司的company id是null/0的话，表示该公司是总公司，因此则不表示删除按钮。
        if(data.parentId != 0){
            operation += "| <a href='javascript:void(0);' onclick='deleteCompany(this)' id='"+data.id+"'>删除</a></td>";
        }
      context = "<tr>" +
              "<td align='center'>" + data.name + "</td>" +
              "<td align='center'>" + data.dialect + "</td>" +
              "<td align='center'>" + data.principal + "</td>" +
              "<td align='center'>" + data.telephone + "</td>" +
              "<td align='center'>" + data.pledgeAccount + "</td>" +
              "<td align='center'>" + data.pledgeAmount + "</td>" +
              "<td align='center'>" + data.overdueRate + "</td>" +
//              "<td align='center'>" + data.superminiatureDefaultMoney + "</td>" +
              "<td align='center'>" + data.managementCostRate + "</td>" +
              "<td align='center'>" + data.registerAt + "</td>" +
              "<td align='center'>" + data.startServiceDate + "</td>" +
              "<td align='center'>" + data.stopServiceDate + "</td>" +
              operation +
              "</tr>";
      return context;
    };

    pageComm("${basePath}/admin/company/getCompanyPage", param == null ? {} : param, writetablefn, "record", 14);
    $("#name").val(null);
    $("#principal").val(null);
    $("#telephone").val(null);
  }

  var param = function () {
    return {
      "name": $("#name").val(),
      "principal": $("#principal").val(),
      "telephone": $("#telephone").val(),
      "startDate": $("#startDate").val(),
      "endDate": $("#endDate").val()
    };
  };

  function select() {
    onloadDate(param());
  }
  
  function doDeleteCompany(oid){
	  $.ajax({
	        type: 'POST',
	        url: '${basePath}/admin/company/deleteCompany.html?ids=' + oid,
	        dataType: "text",
	        success: function (data) {
	          if (data == '0000') {
	        	doDeleteCompanySuccess();
	          } else {
	            alertMessage("操作失败！",null);
	            return false;
	          }
	        }, error: function () {
	          alertMessage("网络错误！",null);
	          return false;
	        }
	      });
  }
  
  function doDeleteCompanySuccess(){
	  colsediv(0);
	  window.location.reload();
  }

  function deleteCompany(obj) {
    var checkValues = $(obj).attr("id");
	
    alertMessage("你确定删除此数据吗？","doDeleteCompany("+checkValues+")");
  }
</script>
</html>
