<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=edge; chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Cache-Control" content="no-transform">
    <title>e车贷管理系统—个人角色</title>
    <%@include file="../common/taglibs.jsp" %>
</head>

<script>
		function getValue() {
		    var arr = [];
		    var checkbox = document.getElementsByName('roleId');
		    for (var i = 0; i < checkbox.length; i++) {
		        if (checkbox[i].checked == true) {
		            arr.push(checkbox[i].value);
		        }
		    }
		    debugger;
		    $.ajax({
		    	type: 'POST',
		        url: '${basePath}/admin/roleManage/grantRoleUser',
		        data: {userId: '${user.uuid}', roleIds: arr},
		        dataType: "text",
		        success: function (data) {
		            if (data == '0000') {
		            	alertMessage("操作成功!","getValueSuccess()");
		            } else {
		            	alertMessage("操作失败!",null);
		                return false;
		            }
		        }, 
		        error: function () {
		        	alertMessage("网络错误!",null);
		            return false;
		        }
		    });
		}
		
		function getValueSuccess(){
			colsediv(0);
			window.location.href = '${basePath}/admin/user/userList.jsp';
		}
</script>

<body>
<div class="col-lg-12">
  <div class="tools_bar ">
    <div class="bar_tit clearfix">
      <h2 class="pull-left">个人角色</h2>
      <a onclick="window.location='/admin/user/userList.jsp'" class="pull-right btn btn-link"><i class="fa fa-mail-forward"></i> 返回列表</a> </div>
  </div>
  <form class="form-horizontal user_form" style="margin-top:20px;">
    <div class="form-group">
      <label  class="col-sm-2 control-label">用户姓名</label>
      <div class="col-sm-5">
        <p class="form-control-static">${user.realname}</p>
      </div>
    </div>
    <div class="form-group">
    <label  class="col-sm-2 control-label">已分配角色</label>
    <div class="col-sm-10">
      <ul class="list-inline">
        <c:if test="${! empty inRole}">
           <c:forEach var="inRole" items="${inRole}" varStatus="s1">
           	<c:if test= "${inRole.isShow =='Y'}">
                <li class="checkbox">
                    <label>
						<input type="checkbox" checked value="${inRole.roleId}"  name="roleId">
						${inRole.roleName}
					</label>
                    </li>
                   </c:if>
          </c:forEach>
        </c:if>
      </ul>
    </div></div>
    <div class="form-group">
    <label  class="col-sm-2 control-label">可分配角色</label>
    <div class="col-sm-10">
      <ul class="list-inline">
      	<c:if test="${! empty noRole}">
            <c:forEach var="noRole" items="${noRole}" varStatus="s2">
            <c:if test= "${noRole.isShow =='Y'}">
            	<li class="checkbox">
                    <label>
						<input type="checkbox" value="${noRole.roleId}"  name="roleId">
						${noRole.roleName}
					</label>
                </li>
           </c:if>  
            </c:forEach>
        </c:if>               
      </ul>
    </div></div>
    <div class="form-group">
      <div class="col-sm-offset-2 col-sm-10">
        <button type="button" class="btn btn-default" onclick="window.location='/admin/user/userList.html'" style="width:100px;">返回</button>
        <button type="button" class="btn btn-danger"  onclick="getValue()" style="width:100px;">提交</button>
      </div>
    </div>
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
