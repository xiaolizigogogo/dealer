<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="basePath" value="<%= request.getContextPath() %>"/>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=edge; chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Cache-Control" content="no-transform">

    <title>e车贷管理系统—此借款全部还款任务</title>
    <%@include file="../common/taglibs.jsp" %>
    <script type="text/javascript" src="${basePath}/js/framework.js"></script>
    <script src="${basePath}/js/menu/contextmenu.js" type="text/javascript"></script>

    <link type="text/css" rel="stylesheet" href="${basePath}/css/css.css"/>
    <link type="text/css" rel="stylesheet" href="${basePath}/css/bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="${basePath}/css/dropZone.css"/>
    <link type="text/css" rel="stylesheet" href="${basePath}/js/layer/skin/layer.css"/>
    <link type="text/css" rel="stylesheet" href="${basePath}/css/jquery.fileupload-ui.css"/>
    <link type="text/css" rel="stylesheet" href="${basePath}/css/jquery.fileupload.css"/>
    <link type="text/css" rel="stylesheet" href="${basePath}/js/completer/completer.min.css"/>
    <link type="text/css" rel="stylesheet" href="${basePath}/css/bootstrap-datetimepicker.min.css">

    <script type="text/javascript" src="${basePath}/js/jquery/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="${ basePath}/js/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="${basePath}/js/jquery/jquery.ui.widget.js"></script>
    <script type="text/javascript" src="${basePath}/js/jquery/jquery.iframe-transport.js"></script>
    <script type="text/javascript" src="${basePath}/js/jquery/jquery.fileupload.js"></script>

    <script type="text/javascript" src="${basePath}/js/other.js"></script>
    <script type="text/javascript" src="${basePath}/js/my.js"></script>
    <script type="text/javascript" src="${basePath}/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${basePath}/js/layer/layer.js"></script>
    <script type="text/javascript" src="${basePath}/js/completer/completer.min.js"></script>

    <script src="${basePath}/js/bootstrap-datetimepicker.min.js"></script>
    <script src="${basePath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="${basePath}/js/datetimepicker.js"></script>

    <script src="${basePath}/js/jquery.validate.js"></script>
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
        <li>历史流程</li>
    </ul>
</div>

<div class="main-con">

    <div class="form-group col-md-4">
        <label>历史催收列表</label><strong class="corange"/>
    </strong>
    </div>
    <div class="table-area" id="con_one_1">
        <table border="0" cellspacing="0" cellpadding="0"
               class="table table-bordered table-condensed table-striped table-hover tb-01 tb-font-s">
            <tr>
                <th>流程实例ID</th>
                <th>业务</th>
                <th>项目名</th>
                <th>还款时间</th>
                <th>借款金额</th>
                <th>创建时间</th>
                <th>结束时间</th>
                <th>查看任务</th>

            </tr>

            <c:set var="tp" value="${orderRepaymentCustomPage}"/>
            <c:forEach items="${tp.context}" var="l">
                <tr>
                    <td align="center">${l.processinsId}</td>
                    <td align="center">贷后管理流程</td>
                    <td align="center">${l.name}</td>
                    <td align="center">${l.remark}</td>
                    <td align="center">${l.ext2}</td>
                    <td align="center"><fmt:formatDate value="${l.processInstance_startTime}"
                                                       pattern="yyyy-MM-dd HH:mm"/></td>
                    <td align="center"><fmt:formatDate value="${l.processInstance_endTime}"
                                                       pattern="yyyy-MM-dd HH:mm"/></td>
                    <td align="center">
                        <a class="link-01"
                           href="${basePath}/admin/loan/showLoanEndOrderRepayemntDetail.html?processInstanceId=${l.processinsId}">查看任务</a>
                    </td>
                </tr>
            </c:forEach>
            <tr>
                <td colspan="7">
                    共有<strong style="color:red">${tp.totalcount }</strong>条记录,分为<strong
                        style="color:red">${tp.totalpage }</strong>页,当前是<strong
                        style="color:red">${tp.currentpage+1 }</strong>页
                    &nbsp; &nbsp;
                    <c:if test="${tp.haslast }">
                        <a href="${basePath}/admin/loan/adminShowLoanEndRepaymentOrderAll?page=0">首页</a>
                        <a href="${basePath}/admin/loan/adminShowLoanEndRepaymentOrderAll?page=${tp.currentpage-1 }">上一页</a>
                    </c:if>
                    <c:if test="${!tp.haslast }">
                        首页
                        上一页
                    </c:if>
                    <c:if test="${tp.hasnext }">
                        <a href="${basePath}/admin/loan/adminShowLoanEndRepaymentOrderAll?page=${tp.currentpage+1 }">下一页</a>
                        <a href="${basePath}/admin/loan/adminShowLoanEndRepaymentOrderAll?page=${tp.totalpage-1 }">尾页</a>
                    </c:if>
                    <c:if test="${!tp.hasnext }">
                        下一页
                        尾页
                    </c:if>
                </td>
                <td>
                </td>
            </tr>
        </table>
    </div>

    <hr/>


    <div class="form-group col-md-4">
        <label>运行催收列表</label><strong class="corange">
    </strong>
    </div>

    <div class="table-area" id="con_one_2">
        <table border="0" cellspacing="0" cellpadding="0"
               class="table table-bordered table-condensed table-striped table-hover tb-01 tb-font-s">
            <tr>
                <th>流程实例ID</th>
                <th>业务</th>
                <th>项目名</th>
                <th>还款时间</th>
                <th>借款金额</th>
                <th>创建时间</th>
                <th>结束时间</th>
                <th>查看任务</th>

            </tr>

            <c:set var="tp" value="${orderRepaymentCustomActivityPage}"/>
            <c:forEach items="${tp.context}" var="l">
                <tr>
                    <td align="center">${l.processinsId}</td>
                    <td align="center">贷后管理流程</td>
                    <td align="center">${l.name}</td>
                    <td align="center">${l.remark}</td>
                    <td align="center">${l.ext2}</td>
                    <td align="center"><fmt:formatDate value="${l.processInstance_startTime}"
                                                       pattern="yyyy-MM-dd HH:mm"/></td>
                    <td align="center"><fmt:formatDate value="${l.processInstance_endTime}"
                                                       pattern="yyyy-MM-dd HH:mm"/></td>
                    <td align="center">
                        <a class="link-01"
                           href="${basePath}/admin/loan/showLoanEndOrderRepayemntDetail.html?processInstanceId=${l.processinsId}">查看任务</a>
                    </td>
                </tr>
            </c:forEach>
            <tr>
                <td colspan="7">
                    共有<strong style="color:red">${tp.totalcount }</strong>条记录,分为<strong
                        style="color:red">${tp.totalpage }</strong>页,当前是<strong
                        style="color:red">${tp.currentpage+1 }</strong>页
                    &nbsp; &nbsp;
                    <c:if test="${tp.haslast }">
                        <a href="${basePath}/admin/loan/adminShowLoanEndRepaymentOrderAll?page=0">首页</a>
                        <a href="${basePath}/admin/loan/adminShowLoanEndRepaymentOrderAll?page=${tp.currentpage-1 }">上一页</a>
                    </c:if>
                    <c:if test="${!tp.haslast }">
                        首页
                        上一页
                    </c:if>
                    <c:if test="${tp.hasnext }">
                        <a href="${basePath}/admin/loan/adminShowLoanEndRepaymentOrderAll?page=${tp.currentpage+1 }">下一页</a>
                        <a href="${basePath}/admin/loan/adminShowLoanEndRepaymentOrderAll?page=${tp.totalpage-1 }">尾页</a>
                    </c:if>
                    <c:if test="${!tp.hasnext }">
                        下一页
                        尾页
                    </c:if>
                </td>
                <td>
                </td>
            </tr>
        </table>
    </div>
</div>
</body>

</html>
