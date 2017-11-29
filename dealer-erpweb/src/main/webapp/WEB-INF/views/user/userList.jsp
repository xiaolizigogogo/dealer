<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=edge; chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Cache-Control" content="no-transform">
    <title>e车贷管理系统—用户列表</title>
    <%@include file="../common/taglibs.jsp" %>
    <link rel="stylesheet" href="${basePath}/css/bootstrap-datetimepicker.min.css">
    <script src="${basePath}/js/bootstrap-datetimepicker.min.js"></script>
    <script src="${basePath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="${basePath}/js/datetimepicker.js"></script>
    <script src="${basePath}/js/tableutils.js"></script>
</head>
<body>
<div class="tools_bar col-lg-12">
  <form class="form-inline" role="form">
    <div class="form-group">
      <label class="sr-only" for="txt_name">手机号</label>
      <input type="text" class="form-control" id="mobile" name="mobile" placeholder="请输入手机号">
    </div>
    <div class="form-group">
      <select class="form-control" id="role_select">
        <option value="">选择角色</option>
      </select>
    </div>
      <div class="form-group">
          <label class="sr-only" for="txt_number">客户姓名</label>
          <input type="text" class="form-control" id="txt_name" placeholder="姓名">
      </div>
    <button type="button" onclick="select()" class="btn btn-primary btn-search"><i class="fa fa-search"></i> 搜索</button>
  </form>
  <div class="list_btn clearfix">
    <ul class="list-inline">
      <li><a class="btn btn-danger"   href = "/admin/user/toUserInfoPage.html"> <i class="fa fa-plus"></i>新增用户</a></li>
       <li><a class="btn btn-danger"   href = "#" onclick="deleteUserInfo()"> <i class="fa fa-trash-o"></i>删除用户</a></li>
      <%--<li><a class="btn btn-danger"   href="role.html"> <i class="fa fa-cubes"></i>分配角色</a></li><!--点击某行-->--%>
    </ul>
  </div>
</div>
<div class="list_box col-sm-12">
  <table class="table table-bordered table-striped">
    <thead>
      <tr><th><input type="checkbox" name="checkboxAll" id="checkAll" onclick="selectAll()"></th>
        <th>姓名</th>
        <th>昵称</th>
        <th>所属公司</th>
        <th>所属部门</th>
      
        <th>性别</th>
        <th>手机号码</th>
        <th>邮箱地址</th>
        <th>职位</th>
               <th>创建时间</th>
      
        <th>操作</th>
      </tr>
    </thead>
    <tbody id="record">
    </tbody>
  </table>
  <div id="r-page"></div>
</div>
<div id="fade2" class="black_overlayx"></div>
<div id="qs_box1" class="modal modal_sml fade in">
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
</body>
<script type="text/javascript">
    $(function () {
        init();
    });

    function init() {
        var mobile = $("#mobile").val();
        if (("" != mobile && null != mobile)) {
            var param = {
                mobile: mobile
            };
            onLoadDate(param);
        } else {
            onLoadDate(null);
        }
        loadFilterOption();
    }
    function loadFilterOption(){
        $.ajax({
            type: 'POST',
            url: '${basePath}/admin/user/queryRoleList.html',
            dataType: "text",
            success: function (data) {
                //解析Map数据
                var roledata = JSON.parse(data);
                $.each(roledata.roleItem, function(i,item){
                    //动态追加Option
                    $("#role_select").append("<option value='"+item+"'>"+item+"</option>");

                })
            }, error: function () {
                layer.msg("网络错误!");
                return false;
            }
        });
    }
    function onLoadDate(param) {
        var writetablefn = function (data) {
            var context;
            $("#checkAll").prop("checked", false);
            var name = "";// 姓名
            var sexStr = "-----";    //性别
            if (data.sex == "FM") {
                sexStr = "女";
            } else if(data.sex == "M") {
                sexStr = "男";
            }
            var personalRoleUrl= "${basePath}/admin/user/toPersonalRolePage/" + data.uuid + ".html";
            var assignRoleUrl= "${basePath}/admin/user/toAssignRolePage/" + data.uuid + ".html";
            var editUrl = "${basePath}/admin/user/toUserInfoPage.html?uuid=" + data.uuid;
            var dateJoined = data.dateJoined;
            var date = new Date(dateJoined.replace(/-/g, "/")).Format("yyyy-MM-dd");
            context = "<tr>" +
                    "<td align='center'><input type='checkbox' onclick='paramClick()' name='checkbox1' value='" + data.uuid+"'></td>"+
                    "<td align='center'>" + data.realname + "</td>" +
                    "<td align='center'>" + data.nickname + "</td>" +
                    "<td align='center'>" + data.company.name + "</td>" +
                    "<td align='center'>" + data.dept.name + "</td>" +
                    "<td align='center'>" + sexStr + "</td>" +
                    "<td align='center'>" + data.mobile + "</td>" +
                    "<td align='center'>" + data.email + "</td>" +
                    "<td align='center'>" + data.position + "</td>" +
                    "<td align='center'>" + data.createdAt + "</td>" +
                    "<td align='center'><a href='"+ editUrl +"' class='link-01'>编辑</a> | <a href='" + personalRoleUrl +
                    "' class='link-01'>个人角色</a> | <a href='" + assignRoleUrl + "' class='link-01'>分配角色</a> </td>" +
                    "</tr>";
            return context;
        };

        pageComm("${basePath}/admin/user/list/page", param == null ? {} : param, writetablefn, "record", 14);
        $("#mobile").val(null);
        $("#role_select").val(null);
    }

    var param = function () {
        return {
            "mobile": $("#mobile").val(),
            "name": $("#txt_name").val(),
            "role":$("#role_select").val()
        };
    };

    function select() {
        onLoadDate(param());
    }

    function reset() {
        $("#mobile").val("");
    }

    function editUserInfo() {
        var checkbox = $('input[name="checkbox1"]:checked');
        var checkValue = checkbox.val();
        var checkLength = checkbox.length;
        if (checkValue == null || checkLength != 1) {
            layer.msg("请选择一行数据进行编辑！");
            return;
        }
        window.location.href = "${basePath}/admin/user/toUserInfoPage.html?uuid=" + checkValue;
    }

    function deleteUserInfo() {
        var checkbox = $('input[name="checkbox1"]:checked');
        var checkLength = checkbox.length;
        if (checkLength == 0) {
            layer.msg("请选择一行数据进行删除！");
            return;
        }
        var checkValues = [];
        var i = 0;
        checkbox.each(function () {
            checkValues[i] = this.value;
            i++;
        });
        var dialogMsg = "你确定删除此用户吗？";
        alertMessage(dialogMsg,'deleteUserNow("'+checkValues+'")','qs_box1');

    }
    function deleteUserNow(checkvalue){
            $.ajax({
                type: 'POST',
            url: '${basePath}/admin/user/delete.html?uuid=' + checkvalue,
                dataType: "text",
                success: function (data) {
                    if (data == '0000') {
                        layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
                        colsediv(0);
                            onLoadDate(null);
                            return true;
                        });
                    } else {
                        layer.msg("操作失败!");
                        return false;
                    }
                }, error: function () {
                    layer.msg("网络错误!");
                    return false;
                }
            });
    }

    /**
     * 全部选中或取消全选
     */
    function selectAll() {
        var isChecked = $("#checkAll").prop("checked");
        if (isChecked) {
            $("[name='checkbox1']").prop("checked", true);//全选
        } else {
            $("[name='checkbox1']").prop("checked", false);//取消全选
        }
    }

    /**
     * 判断子选则框是否有全部选中。如果没有则去将全选的checkbox置为false
     */
    function paramClick() {
        var boxLength = $("[name='checkbox1']").length;
        var checkLength = $("input[name='checkbox1']:checked").length;
        if (boxLength == checkLength && boxLength != 0) {
            $("#checkAll").prop("checked", true);
        } else {
            $("#checkAll").prop("checked", false);
        }
    }

</script>
</html>
