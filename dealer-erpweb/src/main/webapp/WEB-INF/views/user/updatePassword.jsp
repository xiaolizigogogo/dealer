<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=edge; chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Cache-Control" content="no-transform">
    <title>e车贷管理系统-修改密码</title>
    <%@include file="../common/taglibs.jsp" %>
    <link rel="stylesheet" href="${basePath}/css/zTreeStyle.css" type="text/css">
    <script type="text/javascript" src="${basePath}/js/ztree/jquery.ztree.core-3.5.min.js"></script>
    <script type="text/javascript"
            src="${basePath}/js/ztree/jquery.ztree.excheck-3.5.min.js"></script>
</head>
<body class="main-bg">
<div class="loca-area clearfix">
    <ul class="breadcrumb">
        <li>
            修改密码
        </li>
    </ul>
</div>
<div class="main-con">
    <div class="normal-area">
        <div class="title clearfix">
            <h2>修改密码</h2>
        </div>
        <div class="con clearfix">
            <form class="form-inline" id="updatePass">
                <div id="left">

                    <div class="row">
                        <div class="form-group col-md-12">
                            <label>原始密码：</label>
                            <input type="password" class="form-control" id="userPassword"
                                   name="userPassword"/>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-md-12">
                            <label>新密码：</label>
                            <input type="password" class="form-control" id="newPass" name="newPass"/>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-md-12">
                            <label>确认新密码：</label>
                            <input type="password" class="form-control" id="newPassword" name="newPassword"/>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <div class="btn-area"><a href="javascript:void(0);" class="btn btn-01" onclick="saveOrUpdate()">确定</a>
        </div>
    </div>
</div>

<script>
    $("#userPassword").blur(function(){
        // 验证密码是否正常
        var userPassword = $("#userPassword").val();
        $.ajax({
            type:"POST",
            url:"${basePath}/admin/user/verifyOldPassword.html",
            data:{
                userPassword:userPassword
            },
            success:function(data){
                if(data != "success") {
                    layer.msg("原始密码错误！");
                }

            }
        })
    });


    $("#newPass").blur(function () {
        // 验证新密码是否与旧密码一致
        var newPass = $("#newPass").val();
        $.ajax({
            type: "POST",
            url: "${basePath}/admin/user/verifyNewoldPwd.html",
            data: {
                newPass: newPass
            },
            success: function (data) {
                if (data == "success"){
                    layer.msg("新密码与原始密码一致！");
                }

            }
        })
    });


    function saveOrUpdate(){
        var newPass = $("#newPass").val();
        var newPassword = $("#newPassword").val();
        var userPasswordObj = $("#userPassword");
        var userPassword = userPasswordObj.val();

        if (userPassword == "" || userPassword == null) {
            layer.msg("原始密码不能为空!");
            userPasswordObj.focus();
            return false;
        }
        if (newPass == null || newPass == "" || newPassword == null || newPassword == "") {
            layer.msg("新密码不能为空！");
            return false;
        }
        if(newPass != newPassword){
            layer.msg("新密码与确认密码不一致");
            return false;
        }
        $.ajax({
            type: "POST",
            url: "${basePath}/admin/user/updatePwd.html",
            data: {
                password: newPassword
            },
            dataType: "text",
            success: function (data) {
                if (data == "0000") {
                    layer.msg("密码修改成功！");
                    <%--// TODO 修改密码之后跳转到退出页面--%>
                    <%--location.href = "${basePath}/admin/user/loginOut.html"--%>
                } else {
                    layer.msg("密码修改失败！");
                }
            },
            error: function () {
                layer.msg("密码修改失败！");
            }
        })
    }

</script>
</body>
</html>
