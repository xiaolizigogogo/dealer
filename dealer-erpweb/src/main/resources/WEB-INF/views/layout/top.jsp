<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=edge; chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Cache-Control" content="no-transform">
    <title>E车贷金融网站后台管理</title>
    <%@include file="../common/taglibs.jsp" %>
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <![endif]-->
</head>
<script>
    $(function () {
        $("#divclass_" + '${moduleId}').addClass("active");
        var objLeft = $('#leftFrame', parent.document);
        $(objLeft).attr("src", "${basePath}/admin/user/getUserModuleByRole/" + '${moduleId}');
    });

    function selectModule(moduleId) {
        $("a[id^='divclass_']").removeClass("active");
        var objLeft = $('#leftFrame', parent.document);
        $('#mainFrame', parent.document).attr("src", "${basePath}/admin/user/layout/main");
        $(objLeft).attr("src", "${basePath}/admin/user/getUserModuleByRole/" + moduleId);
        $("#divclass_" + moduleId).addClass("active");
    }

    function refreshCache() {
        $.ajax({
            type: 'POST',
            url: '${basePath}/admin/refreshCache.html',
            dataType: 'text',
            success: function (data) {
                if (data == '0000') {
                    layer.msg("刷新缓存成功", {icon: 1, time: 1000}, function () {
                        return true;
                    });
                } else {
                    layer.msg("刷新缓存失败");
                    return false;
                }
            }, error: function () {
                layer.msg("网络错误");
            }
        })
    }

</script>
<body>
<!--[if !IE]>header start<![endif]-->
<div class="top">
    <div class="logo">卖钱翁金融</div>
    <ul class="top-nav">
        <c:if test="${! empty moduleList}">
            <c:forEach var="module" items="${moduleList}">
                <c:if test="${ empty module.moduleParentId}">
                    <li><a href="javascript:selectModule(${module.moduleId});"
                           id="divclass_${module.moduleId}">${module.moduleName}</a></li>
                </c:if>
            </c:forEach>
        </c:if>
    </ul>
    <div class="account">欢迎你 ${sessionScope.auth_user.nickname }
        <a href="${basePath}/admin/user/updatePassword.html" target="mainFrame">修改密码</a>|
        <a href="${basePath}/admin/user/loginOut.html" target="_parent">注销</a>|
        <a href="javascript:refreshCache()">刷新系统缓存</a></div>
</div>
<!--[if !IE]>header end<![endif]-->
</body>
</html>

