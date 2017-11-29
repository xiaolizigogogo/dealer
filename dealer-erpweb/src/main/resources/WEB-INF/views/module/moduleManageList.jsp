<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible"
	content="IE=9; IE=8; IE=7; IE=edge; chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Cache-Control" content="no-transform">
<title>发发金融网站后台管理—模块列表</title>
<%@include file="../common/taglibs.jsp" %>
<link rel="stylesheet" href="${basePath}/css/awesomeStyle/awesome.css" type="text/css">
<script type="text/javascript" src="${basePath}/js/jquery.ztree.core-3.5.min.js"></script>
<script type="text/javascript" src="${basePath}/js/jquery.ztree.excheck-3.5.min.js"></script>
<SCRIPT type="text/javascript">
	var treeNodes;
	var moduleId;
	var parentId;
	var setting = {
		callback : {
			onClick : zTreeOnClick
		},
		view : {
			showLine : false,
			dblClickExpand : false
		}
	};

	$(function() {
		$.ajax({
			async : false,
			cache : false,
			type : 'POST',
			contentType : "application/json",
			url : "${basePath}/admin/module/getModuleManageList",//请求的action路径
			error : function() {//请求失败处理函数
				alertMessage("请求失败！",null);
			},
			success : function(data) { //请求成功后处理函数。
				treeNodes = eval(data);
			}
		});
		$.fn.zTree.init($("#moduleTree"), setting, treeNodes).expandAll(true);
	});

	function zTreeOnClick(event, treeId, treeNode) {
		moduleId = treeNode.moduleId;
		parentId = treeNode.moduleParentId;
	}

	$(document).ready(function() {
		$.fn.zTree.init($("#moduleTree"), setting, treeNodes).expandAll(true);
	});

	function editModuleManage() {
		if (moduleId == null) {
			alertMessage("请选择一个模块进行编辑！",null);
		}else{
			window.location.href = "${basePath}/admin/module/editModuleManagePage/"
				+ moduleId;
		}
		
	}
	
	function deleteSuccess(){
		colsediv(0);
		window.location.href = '${basePath}/admin/module/moduleManageList.html';
	}
	
	function dodeleteModuleManage(){
		$
		.ajax({
			type : 'POST',
			url : '${basePath}/admin/module/delete/'
					+ moduleId,
			dataType : "text",
			success : function(data) {
				if (data == '0000') {
					alertMessage("操作成功!","deleteSuccess()");
				} else if (data == 'isSubdata') {
					alertMessage("存在子模块，请删除其下的子模块再进行此操作!",null);
					return false;
				} else if (data == 'isRole') {
					alertMessage("该模块已被授权，请清除权限后再继续此操作！",null);
					return false;
				} else {
					alertMessage("操作失败!",null);
					return false;
				}
			},
			error : function() {
				alertMessage("网络错误!",null);
				return false;
			}
		});
	}
	
	function deleteModuleManage() {
		if (moduleId == null) {
			alertMessage("请选择一条数据！",null);
		} else {
			alertMessage("你确定删除此模块吗？","dodeleteModuleManage()");
		}
	}
	
	function clearRoleModuleSuccess(){
		colsediv(0);
		window.location.href = '${basePath}/admin/module/moduleManageList.html';
	}
	
	function doclearRoleModule(){
		$
		.ajax({
			type : 'POST',
			url : '${basePath}/admin/module/clearRoleModule/'
					+ moduleId,
			dataType : "text",
			success : function(data) {
				if (data == '0000') {
					alertMessage("操作成功!","clearRoleModuleSuccess()");
				} else {
					alertMessage("操作失败!",null);
					return false;
				}
			},
			error : function() {
				alertMessage("网络错误!",null);
				return false;
			}
		});
	}

	function clearRoleModule() {
		if (moduleId == null) {
			alertMessage("请选择一条数据！",null);
		} else {
			alertMessage("你确定清楚该模块下所有授权吗？","doclearRoleModule()");
		}
	}
	
	
</SCRIPT>
    <style>
    .ztree >li{ float:left; margin-right:20px;}
    </style>
</head>

<body>
	<div class="col-lg-12">
		<div class="tools_bar clearfix">
			<div class="list_btn" style="margin-top: 0;">
				<!--模块管理功能消除-->
				<%--<ul class="list-inline">--%>
					<%--<li><a class="btn btn-danger" href="${basePath}/admin/module/moduleManageInfo.html?type=add"> <i--%>
							<%--class="fa fa-plus"></i>添加--%>
					<%--</a></li>--%>
					<%--<li><a class="btn btn-danger" href="javascript:void(0);" onclick="editModuleManage()"> <i--%>
							<%--class="fa fa-pencil-square-o"></i>编辑--%>
					<%--</a></li>--%>
					<%--<li><a class="btn btn-danger " href="javascript:void(0)"--%>
						<%--onclick="deleteModuleManage()"><i class="fa fa-trash-o"></i>删除</a></li>--%>
					<%--<li><a class="btn btn-danger " href="javascript:void(0)" onclick="clearRoleModule()"><i--%>
							<%--class="fa fa-minus-circle"></i> 一键清除此模块下的授权</a></li>--%>
				<%--</ul>--%>
			</div>
		</div>
		<div class="row" style="border-top: 2px #d43f3a solid;">
			<ul id="moduleTree" class="ztree"></ul>
		</div>
	</div>
	<div id="custom_modal" class="modal fade in"></div>
	<div id="order_modal" class="modal fade in"></div>
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
