<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=edge; chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Cache-Control" content="no-transform">
    <title>e车贷管理系统—添加/编辑模块列表</title>
    <%@include file="../common/taglibs.jsp" %>
    <link rel="stylesheet" href="${basePath}/css/awesomeStyle/awesome.css" type="text/css">
    <script type="text/javascript" src="${basePath}/js/ztree/jquery.ztree.core-3.5.min.js"></script>
    <script type="text/javascript" src="${basePath}/js/ztree/jquery.ztree.excheck-3.5.min.js"></script>
</head>
<style>
    #left {
        width: 50%;
        float: left
    }

    #main {
        width: 50%;
        float: right;
    }
</style>
<script>
    var zNodes;
    var moduleId;
    var parentId;

    var setting = {
        checkable: true,
        expandSpeed: "fast",
        callback: {
            onClick: zTreeOnClick
        },
        async: {
            enable: true,
            url: "${basePath }/admin/module/getModuleManageList",
            dataFilter: null
        },
        view: {
            showLine: false,
            dblClickExpand: false
        }
    };

    function zTreeOnClick(event, treeId, treeNode) {
        $.ajax({
            type: 'POST',
            url: '${basePath}/admin/module/checkSelectModule',
            data: {moduleId: treeNode.moduleId},
            dataType: "text",
            success: function (data) {
                if (data == "0000") {
                    $("#moduleParentId").val(treeNode.moduleId);
                    $("#citySel").val(treeNode.moduleName);
                    moduleId = treeNode.moduleId;
                    parentId = treeNode.moduleParentId;
                    return true;
                } else if (data == "9999") {
                	alertMessage("无法选择第三级目录作为上级目录，请重新选择！",null);
                    return false;
                }
            }, error: function () {
                alertMessage("网络错误!",null);
                return false;
            }
        });
    }

    function showMenu() {
        var cityObj = $("#citySel");
        var cityOffset = $("#citySel").offset();
        $("#menuContent").css({
            left: cityOffset.left + "px"
        }).slideDown("fast");

        $("body").bind("mousedown", onBodyDown);
    }

    function onBodyDown(event) {
        if (!(event.target.id == "menuBtn" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length > 0)) {
            hideMenu();
        }
     }

    function hideMenu() {
        $("#menuContent").fadeOut("fast");
        $("body").unbind("mousedown", onBodyDown);
    }

    $(function () {
        $.ajax({
            async: false,
            cache: false,
            type: 'POST',
            contentType: "application/json",
            url: "${basePath}/admin/module/getModuleManageList.html",//请求的action路径
            error: function () {//请求失败处理函数
            	alertMessage("请求失败",null);
            },
            success: function (data) { //请求成功后处理函数。
                zNodes = eval(data);
            }
        });
        $.fn.zTree.init($("#moduleTree"), setting, zNodes).expandAll(true);
    });

    $(document).ready(function () {
        $.fn.zTree.init($("#moduleTree"), setting, zNodes).expandAll(true);
    });
	
    
    function saveOrUpdateSuccess(){
    	 colsediv(0);
    	 window.location.href = '${basePath}/admin/module/moduleManageList.html';
    }
    
    /**
     * 添加/编辑
     */
    function saveOrUpdate() {
        var moduleName = $("#moduleName").val();
        if (moduleName == null || moduleName == "") {
        	alertMessage("请填写模块名称！",null);
            return;
        }
        $.ajax({
            type: 'POST',
            url: '${pageContext.request.contextPath}/admin/module/checkSelectModule.html',
            data: {moduleId: $("#moduleParentId").val()},
            dataType: "text",
            success: function (data) {
                if (data == '9999') {
                	alertMessage("无法选择第三级目录作为上级目录，请重新选择！",null);
                    return false;
                } else if (data == '0000') {
                    $.ajax({
                        type: 'POST',
                        url: '${basePath}/admin/module/saveOrUpdateModuleManage',
                        data: $("#moduleManageForm").serializeArray(),
                        dataType: "text",
                        success: function (data) {
                            if (data == '0000') {
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
          <h2 class="pull-left">
          	<c:if test="${map.type eq 'add'}">添加模块</c:if>
          	<c:if test="${map.type eq 'edit'}">编辑模块</c:if>
          </h2>
          <a href="/admin/module/moduleManageList.html" class="pull-right btn btn-link"><i class="fa fa-mail-forward"></i> 返回列表</a> </div>
      </div>
      <div class="clearfix">
        <div class="col-sm-6">
          <form id="moduleManageForm">
            <div class="form-group">
              <label for="exampleInputEmail1">父模块名称</label>
              <div class="clearfix">
              	<input type="text" hidden="hidden" id="moduleId" name="moduleId"
                           value="${moduleManage.moduleId}"/>
                <input type="text" hidden="hidden" id="moduleType" name="moduleType"
                           value="${moduleManage.moduleType}"/>
                <input id="moduleParentId" name="moduleParentId"
                                   value="${moduleManage.moduleParentId }" hidden="hidden">
                                   
                
                <c:choose>
                     <c:when test="${!empty(moduleManage.moduleParentName)}">
                           <input id="citySel" name="moduleParentName" class="form-control pull-left"
                                           style="width:40%;"
                                           type="text" readonly
                                           value="${moduleManage.moduleParentName }"/>&nbsp;
                            <input id="menuBtn" type="button" onclick="showMenu();"
                                           value="选择"
                                           class="btn btn-default pull-left" style="margin-left:10px;"/>
                     </c:when>
                     <c:otherwise>
                            <input id="citySel" name="moduleParentName" class="form-control pull-left"
                                           style="width:40%;"
                                           type="text" readonly value="顶级目录"/>&nbsp;
                            <input id="menuBtn" type="button" onclick="showMenu();"
                                           value="选择"
                                           class="btn btn-default pull-left" style="margin-left:10px;"/>
                     </c:otherwise>
                </c:choose>
              </div>
            </div>
            <div class="form-group">
              <label for="exampleInputPassword1">模块名称 <i class="text-danger">*</i> </label>
              <input type="text" class="form-control" id="moduleName"
                                   name="moduleName"
                                   value="${moduleManage.moduleName}">
            </div>
            <div class="form-group">
              <label for="exampleInputPassword1">模块排序</label>
              <input type="text" class="form-control" style="width:40%;" id="moduleSeq" name="moduleSeq"
                                   value="${moduleManage.moduleSeq}" oncontextmenu="return false;"
                                   onafterpaste="this.value=this.value.replace(/\D/g,'')"
                                   onkeyup="this.value=this.value.replace(/\D/g,'')" >
            </div>
            <div class="form-group">
              <label for="exampleInputPassword1">模块URL</label>
              <input type="text" class="form-control" id="moduleUrl" name="moduleUrl"
                                   value="${moduleManage.moduleUrl}" >
            </div>
            <div class="form-group">
              <label for="exampleInputPassword1">模块描述</label>
              <textarea class="form-control" id="moduleDescribe"
                                           name="moduleDescribe">${moduleManage.moduleDescribe}</textarea>
            </div>
            <button type="button" class="btn btn-default" onclick="javascript:history.go(-1);" style="width:100px;">返回</button>
            <button type="button" class="btn btn-danger" onclick="saveOrUpdate()" style="width:100px;">提交</button>
          </form>
        </div>
        <div class="col-sm-6" id="menuContent" style="display:none;">
         <ul id="moduleTree" class="ztree"></ul>
        </div>
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
</body>

</html>
