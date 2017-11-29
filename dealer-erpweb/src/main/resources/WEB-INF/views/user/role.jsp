<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=edge; chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Cache-Control" content="no-transform">
    <title>e车贷管理系统—角色列表</title>
    <%@include file="../common/taglibs.jsp" %>
</head>
<script src="${basePath}/js/tableutils.js"></script>

<body>
<div class="tools_bar col-lg-12">
  <form class="form-inline" role="form">
    <div class="form-group">
      <label class="sr-only" for="txt_name">角色名称</label>
      <input type="text" class="form-control" id="roleName" name="roleName" placeholder="请输入角色名称">
    </div>
    <button type="button" onclick="select()" class="btn btn-primary btn-search"><i class="fa fa-search"></i> 搜索</button>
  </form>
  <div class="list_btn clearfix">
    <ul class="list-inline">
      <li><a class="btn btn-danger"   href = "${ basePath }/admin/roleManage/addRoleManagePage"> <i class="fa fa-plus"></i>添加角色</a></li>
    </ul>
  </div>
</div>
<div class="list_box col-sm-12">
  <table class="table table-bordered table-striped">
    <thead>
      <tr>
        <th style="text-align:center;">角色名称</th>
        <th style="text-align:center;">操作</th>
      </tr>
    </thead>
    <tbody id="msgdiv">

    </tbody>
  </table>
  <div id="r-page">

  </div>
</div>
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

<script type="text/javascript">
    $(function () {
        onloadDate(null);
    });

    function onloadDate(param) {
        var writetablefn = function (data) {
            return "<tr>" +
                    "<td align='center'>" + data.roleName + "</td>" +
                    "<td align='center'><a href='${basePath}/admin/roleManage/editRoleManagePage/" +
                    data['roleId'] + "' class='link-01'>编辑</a>&nbsp;&nbsp;<a href='javascript:void(0)' onclick='deleteRoleManage(" + data.roleId + ")' class='link-01'>删除</a></td>" +
                    "</tr>";
        };
        pageComm("${basePath}/admin/roleManage/getRoleManageList", param == null ? {} : param, writetablefn, "msgdiv", 2);
        $("#roleName").val(null);
    }

    var param = function () {
        return {
            roleName: $("#roleName").val()
        };
    };

    function select() {
        onloadDate(param());
    }
    
    function deleteRoleManageSuccess(){
		setTimeout(function() {
            colsediv(0);
            window.location.href = '${basePath}/admin/roleManage/toRoleManagePage';
        },
        1500);
    }
	
    function dodeleteRoleManage(roleManageId){
    	 $.ajax({
             type: 'POST',
             url: '${ basePath }/admin/roleManage/deleteRoleManage/' + roleManageId,
             dataType: "text",
             success: function (data) {
                 if (data == '0000') {
                	 deleteRoleManageSuccess();
                	 alertMessage("操作成功!","deleteRoleManageSuccess()");
                 } else {
                     alertMessage(data,null);
                     return false;
                 }
             }, error: function () {
            	 alertMessage("网络错误!",null);
                 return false;
             }
         });
    }
    
    function deleteRoleManage(roleManageId) {
    	alertMessage("你确定删除这个角色吗？","dodeleteRoleManage("+roleManageId+")");
    }
</script>
</body>
</html>
