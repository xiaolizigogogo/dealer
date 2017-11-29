<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=edge; chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Cache-Control" content="no-transform">
    <title>卖钱翁金融网网站后台管理</title>
    <%@include file="../common/taglibs.jsp" %>
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <![endif]-->
    <script language="javascript">
        $(document).ready(function () {
            $('.a1').click(function () {
                $(this).toggleClass("active").siblings(".a1").removeClass("active")
                $(this).next(".sub").slideToggle(200).siblings(".sub").slideUp(200);
            });
        });

        function selectModule(moduleId, moduleUrl) {
            $("a[id^='divclass_']").removeClass("al active");
            var objMain = $('#mainFrame', parent.document);
            if (null != moduleUrl && "" != moduleUrl) {
                $(objMain).attr("src", "${ baseUrl }/" + moduleUrl);
            }
            $("#divclass_" + moduleId).addClass("al active");
        }
    </script>
</head>

<body class="left-bg">
<div class="left-menu">
    <c:forEach var="module" items="${moduleList}" varStatus="idxStatus">
        <c:if test="${module.moduleParentId eq parentModuleId}">
            <a href="javascript:void(0);"
               onclick="selectModule(${module.moduleId},'${module.moduleUrl}');"
               class="a1">${module.moduleName}</a>
            <c:if test="${! empty module.children}">
                <ul class="sub" style="display:block;">
                    <c:forEach var="childrenModule" items="${module.children}" varStatus="status">
                        <li><a id="divclass_${childrenModule.moduleId}" href="javascript:void(0)"
                               onclick="selectModule(${childrenModule.moduleId},'${childrenModule.moduleUrl}')">${childrenModule.moduleName}</a>
                        </li>
                    </c:forEach>
                </ul>
            </c:if>
        </c:if>
    </c:forEach>
</div>

</body>
</html>

