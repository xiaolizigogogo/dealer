<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="basePath" value="<%= request.getContextPath() %>" />
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=edge; chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Cache-Control" content="no-transform">
    <title>e车贷管理系统—流程查看</title>
    <%--<%@include file="../common/taglibs.jsp" %>--%>
    <!--框架添加必需start-->
    <script type="text/javascript" src="${ basePath }/js/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="${basePath}/js/framework.js"></script>
    <script language="JavaScript" src="${basePath}/js/form/datePicker/WdatePicker.js"></script>
    <link href="${basePath}/css/import_basic.css" rel="stylesheet" type="text/css" />
    <link href="${basePath}/css/skins/sky/import_skin.css" rel="stylesheet" type="text/css"
          themeColor="blue" />
    <%--<script src="${basePath}/js/menu/contextmenu.js" type="text/javascript"></script>--%>
    <%--<script type="text/javascript" src="${basePath}/js/tree/stree/stree.js"></script>--%>
    <%--<link href="${basePath}/js/tree/stree/stree.css" rel="stylesheet" type="text/css" />--%>
    <%--<link href="${basePath}/js/qtip/jquery.qtip.min.css" type="text/css" rel="stylesheet">--%>
    <%--<script type="text/javascript" src="${basePath}/js/qtip/jquery.qtip.pack.js"></script>--%>
    <%--<script type="text/javascript" src="${basePath}/js/html/jquery.outerhtml.js"></script>--%>
    <!--框架添加必需end-->

    <!--自定义javaScript-->
    <script type="text/javascript">
        function loadImage() {
            var executionId = document.getElementById('executionId').value;
            var processinsId = document.getElementById('processinsId').value;

            var url = "traceprocess?executionId=" + executionId + "&processinsId=" + processinsId;
            $.post(url, function (data) {
                var dt = eval(data);
                var imagediv = "<img src='getpnginput?processinsId=" + processinsId + "' style='position:absolute;vertical-align:middle; left:0px; top:0px;'><div style='position: absolute;border: 2px solid red;left: " + (dt.x - 1) + "px;top: " + (dt.y - 1) + "px;width: " + (dt.width - 2) + "px;height: " + (dt.height - 2) + "px;' class='ui-corner-all-12'></div>"
                $('body').append(imagediv);
            });

            var url = "trace?processinsId=" + processinsId;
            $.getJSON(url, function (infos) {
                var positionHtml = "";
                // 生成图片
                var varsArray = new Array();
                $.each(infos, function (i, v) {

                    if (v.currentActiviti) {
                        $positionDiv.addClass('ui-corner-all-12').css({
                            border: '2px solid red'
                        });
                    }
                    positionHtml += $positionDiv.outerHTML();
                    varsArray[varsArray.length] = v.vars;
                });

                //流程图地址
                var image = "<img alt='跟踪工作流' src='getpnginput?processinsId=" +
                        processinsId + "' style='position:absolute;'>";

                //追加到body
                $("body").append(image).append(positionHtml);

            });
        }
    </script>
    <!--  自定义script end-->
</head>

<body onload="loadImage()">
<div class="main-con">
    <input type="hidden" id="executionId" value="${executionId }">
    <input type="hidden" id="processinsId" value="${processinsId }">
</div>
</body>

</html>
