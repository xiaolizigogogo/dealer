<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="basePath" value="<%= request.getContextPath() %>" />
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=edge; chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Cache-Control" content="no-transform">

    <title>e车贷管理系统—任务明细</title>
    <%@include file="../common/taglibs.jsp" %>
    <script type="text/javascript" src="${basePath}/js/framework.js"></script>
    <script src="${basePath}/js/menu/contextmenu.js" type="text/javascript"></script>
    <%--<script type="text/javascript" src="${basePath}/js/tree/stree/stree.js"></script>--%>
    <%--<link href="${basePath}/js/tree/stree/stree.css" rel="stylesheet" type="text/css"/>--%>
    <script language="javascript">
        function claim(taskId) {
            $.ajax({
                type: "POST",
                url: "/admin/todo?method=claim",
                dataType: "json",
                data: {
                    taskId: taskId

                },
                success: function (data) {
                    var data1 = eval(data);
                    var code = data1.res;
                    if (code) {
                        layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
                            document.location.href = '/admin/todo?method=showTodolist';
                            return true;
                        });
                    } else {
                        {
                            layer.msg("操作失败!");
                            return false;
                        }
                    }
                },
                error: function () {
                    layer.msg("未知错误!");
                    return false;
                }

            });

        }


    </script>
</head>
<body class="main-bg">
<div class="loca-area clearfix">
    <ul class="breadcrumb">
        <li><a class="link-01" href="${basePath}/admin/layout/main.html">主页</a></li>
        <li>流程明细</li>
    </ul>
</div>

<div class="main-con">
    <div class="table-area" id="con_one_1">
        <table border="0" cellspacing="0" cellpadding="0"
               class="table table-bordered table-condensed table-striped table-hover tb-01 tb-font-s">
            <tr>

                <!--
                 <th>任务id</th>
                -->
                <th>任务名称</th>
                <th>负责人</th>
                <th>任务标识</th>
                <th>开始时间</th>
                <th>结束时间</th>
                <th>备注</th>

            </tr>
            <c:forEach items="${orderLoanInfoCustomList}" var="l">
                <tr>
                    <!--
                     <td align="center">${l.taskId}</td>
                    -->

                    <td align="center">${l.taskName}</td>
                    <td align="center">${l.assignee}</td>
                    <td align="center">${l.taskDefinitionKey}</td>
                    <td align="center"><fmt:formatDate value="${l.task_startTime}"
                                        pattern="yyyy-MM-dd HH:mm" /></td>
                    <td align="center"><fmt:formatDate value="${l.task_endTime}"
                                                       pattern="yyyy-MM-dd HH:mm" /></td>
                    <td align="center">${l.ext3}</td>
                </tr>
            </c:forEach>
            <%--<tr>--%>
                <%--<td colspan="7">--%>
                    <%--共有${tp.totalcount }条记录,分为${tp.totalpage }页,当前是${tp.currentpage+1 }页--%>
                    <%--<c:if test="${tp.haslast }">--%>
                        <%--<a href="todolist?currentPage=0&key=${key }">首页</a>--%>
                        <%--<a href="todolist?currentPage=${tp.currentpage-1 }&key=${key }">上一页</a>--%>
                    <%--</c:if>--%>
                    <%--<c:if test="${!tp.haslast }">--%>
                        <%--首页--%>
                        <%--上一页--%>
                    <%--</c:if>--%>
                    <%--<c:if test="${tp.hasnext }">--%>
                        <%--<a href="todolist?currentPage=${tp.currentpage+1 }&key=${key }">下一页</a>--%>
                        <%--<a href="todolist?currentPage=${tp.totalpage-1 }&key=${key }">尾页</a>--%>
                    <%--</c:if>--%>
                    <%--<c:if test="${!tp.hasnext }">--%>
                        <%--下一页--%>
                        <%--尾页--%>
                    <%--</c:if>--%>
                <%--</td>--%>
                <%--<td>--%>
                <%--</td>--%>
            <%--</tr>--%>
        </table>
    </div>
</div>
</body>

</html>
