<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=edge; chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Cache-Control" content="no-transform">
    <title>e车贷管理系统—编辑角色列表</title>
    <%@include file="../common/taglibs.jsp" %>
    <link rel="stylesheet" href="${basePath}/css/awesomeStyle/awesome.css" type="text/css">
    <script type="text/javascript" src="${basePath}/js/ztree/jquery.ztree.core-3.5.min.js"></script>
    <script type="text/javascript" src="${basePath}/js/ztree/jquery.ztree.excheck-3.5.min.js"></script>
    <style>
.ztree >li {
	float: left;
	margin-right: 20px;
}
</style>
</head>
<script>
    var zNodes;
    var moduleId;
    var parentId;
    var moduleManage;
    var setting = {
        check: {
            enable: true,
            chkStyle: "checkbox",
            chkboxType: {"Y": "ps", "N": "ps"},
            nocheckInherit: true
        },
        data: {
            simpleData: {
                enable: true,
                idKey: "id",
                pidKey: "pId"
            }
        },
        callback: {
            onClick: zTreeOnClick
        },
        view: {
            showLine: false,
            dblClickExpand: false
        },
        checkable: true
    };

    function zTreeOnClick(event, treeId, treeNode) {
        $("#moduleParentId").attr("value", treeNode.moduleId);
        $("#citySel").attr("value", treeNode.moduleName);
        moduleId = treeNode.moduleId;
        parentId = treeNode.moduleParentId;
    }

    function onBodyDown(event) {
        if (!(event.target.id == "menuBtn" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length > 0)) {
            hideMenu();
        }
    }


    $(document).ready(function () {
		
        $.fn.zTree.init($("#treeDemo"), setting, zNodes).expandAll(true);
				var main = $(window.parent.document).find("#main_ifream角色管理");
	
	main.height($(window.document).height());
    });

    $(function () {
        $.ajax({
            async: false,
            cache: false,
            type: 'POST',
            contentType: "application/json",
            url: "${basePath}/admin/module/getModuleManageListByRole/" +${roleManage.roleId},//请求的action路径
            error: function () {//请求失败处理函数
            	alertMessage("请求失败!",null);
            },
            success: function (data) { //请求成功后处理函数。
                moduleManage = data;
                zNodes = eval(data);
            }
        });

        $.fn.zTree.init($("#treeDemo"), setting, zNodes).expandAll(true);
				var main = $(window.parent.document).find("#main_ifream角色管理");
	
	main.height($(window.document).height()+100);

    });
    
    
    function saveOrUpdateSuccess(){
		setTimeout(function() {
            colsediv(0);
            window.location.href = '${basePath}/admin/roleManage/toRoleManagePage';
        },
        1500);
    }

    function saveOrUpdate() {
        var roleName = $("#roleName").val();
        if (roleName == null || roleName == "") {
        	alertMessage("请填写角色名称！",null);
            return;
        }

        var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
        var nodes = treeObj.getCheckedNodes(true);
        var arr = new Array();
        for (var node in nodes) {
            for (var key in nodes[node]) {
                if ("moduleId" == key) {
                    arr.push(nodes[node][key]);
                }
            }
        }

        $.ajax({
            type: 'POST',
            url: '${basePath}/admin/roleManage/saveOrUpdateRoleManage',
            data: {roleId: $("#roleId").val(), roleName: $("#roleName").val(), moduleIds: arr},
            dataType: "text",
            success: function (data) {
                if (data == '0000') {
                    $.ajax({
                        type: 'POST',
                        url: '${basePath}/admin/refreshCache.html',
                        dataType: 'text',
                        success: function (data) {
                            if (data == '0000') {
                            } else {
                                layer.msg("刷新缓存失败");
                                return false;
                            }
                        }, error: function () {
                            layer.msg("网络错误");
                        }
                    });
                    saveOrUpdateSuccess();
                	alertMessage("操作成功!","saveOrUpdateSuccess()");
                } else {
                	alertMessage("操作失败!",null);
                    return false;
                }
            }, error: function () {
            	alertMessage("网络错误!",null);
                return false;
            }
        });
    }

</script>

<body>
<div class="col-lg-12">
  <div class="tools_bar ">
    <div class="bar_tit clearfix">
      <h2 class="pull-left">编辑角色</h2>
      <a href="/admin/roleManage/toRoleManagePage" class="pull-right btn btn-link"><i class="fa fa-mail-forward"></i> 返回列表</a> </div>
  </div>
  <form>
  	<input type="text" hidden="hidden" id="roleId" name="roleId"
                   value="${roleManage.roleId}">
    <div class="form-group">
      <label for="exampleInputEmail1">角色名称</label>
      <div class="clearfix">
        <input type="text" class="form-control" style=" width:30%;" id="roleName" name="roleName"
                         value="${roleManage.roleName}">
      </div>
    </div>
    <div class="form-group clearfix"  style="margin-bottom:0px;">
      <label for="exampleInputPassword1">分配权限</label>
      <div class="panel clearfix" style="padding:10px; padding-bottom:20px; border:solid 1px #ccc;">
        <ul id="treeDemo" class="ztree" style="margin-top:0;">
        </ul>
      </div>
    </div>
    <button type="button" class="btn btn-danger" onclick="saveOrUpdate()" style="width:100px;">提交</button>
  </form>
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
</body>
</html>

