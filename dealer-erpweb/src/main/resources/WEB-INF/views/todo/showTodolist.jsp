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

    <title>e车贷管理系统—待办列表</title>
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
        <li>待办列表</li>
    </ul>
</div>

<div class="main-con">
    <div class="table-area" id="con_one_1">
        <table border="0" cellspacing="0" cellpadding="0" class="table table-bordered table-condensed table-striped table-hover tb-01 tb-font-s">
            <tr>
                <th>主标题</th>
                <th>次标题</th>
                <th>业务</th>
                <th>当前任务节点</th>
                <th>任务创建时间</th>
                <th>流程状态</th>
                <th>操作</th>
                <th>流程查看</th>
            </tr>
            <c:set var="tp" value="${todopage }"></c:set>
            <c:forEach items="${tp.context }" var="l">
                <tr>
                    <td align="center">${l.column1 }</td>
                    <td align="center">${l.column2 }</td>
                    <td align="center">${l.businessvalue }</td>
                    <td align="center">${l.task.name }</td>

                    <td align="center"><fmt:formatDate value="${l.task.createTime }"
                                        pattern="yyyy-MM-dd HH:mm" /></td>
                    <td align="center">${l.processins.suspended?"已挂起":"正常" }</td>

                    <td align="center">
                        <c:if test="${empty l.task.assignee }">
                            <a class="link-01" href="javascript:claim('${l.task.id}')">签收</a>
                        </c:if>
                        <c:if test="${not empty l.task.assignee }">
                            <a class="link-02" href="${basePath}/admin/todo?method=detail&taskId=${l.task.id }">处理</a>
                        </c:if>
                    </td>
                    <td align="center">
                        <a class="link-01" target="_blank"
                           href="${basePath}/admin/tolookflowview.html?executionId=${l.task.executionId}&processinsId=${l.task.processInstanceId }">查看</a>
                    </td>
                </tr>
            </c:forEach>


            <tr>
                <td colspan="8">
                    共有<strong  style="color:red">${tp.totalcount }</strong>条记录,分为<strong style="color:red">${tp.totalpage }</strong>页,当前是<strong style="color:red">${tp.currentpage+1 }</strong>页
                    &nbsp; &nbsp;
                    <c:if test="${tp.haslast }">
                        <a href="${basePath}/admin/todo?method=showTodolist&page=0">首页</a>
                        <a href="${basePath}/admin/todo?method=showTodolist&page=${tp.currentpage-1 }">上一页</a>
                    </c:if>
                    <c:if test="${!tp.haslast }">
                        首页
                        上一页
                    </c:if>
                    <c:if test="${tp.hasnext }">
                        <a href="${basePath}/admin/todo?method=showTodolist&page=${tp.currentpage+1 }">下一页</a>
                        <a href="${basePath}/admin/todo?method=showTodolist&page=${tp.totalpage-1 }">尾页</a>
                    </c:if>
                    <c:if test="${!tp.hasnext }">
                        下一页
                        尾页
                    </c:if>
                </td>
            </tr>
            <tr>
            </tr>

        </table>
    </div>
</div>
</body>

</html>
