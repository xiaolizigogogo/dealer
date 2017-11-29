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

    <title>e车贷管理系统—催收列表</title>
    <%@include file="../common/taglibs.jsp" %>
    <script type="text/javascript" src="${basePath}/js/framework.js"></script>
    <script src="${basePath}/js/menu/contextmenu.js" type="text/javascript"></script>
    <%--<script type="text/javascript" src="${basePath}/js/tree/stree/stree.js"></script>--%>
    <%--<link href="${basePath}/js/tree/stree/stree.css" rel="stylesheet" type="text/css"/>--%>
    <script language="javascript">
        function repaymentAppley(loanId) {
            $.ajax({
                type: "POST",
                url: "/admin/loan/runRepaymentBpm",
                dataType: "text",
                data: {
                    loanId: loanId

                },
                success: function (code) {
                    if (code == '0000') {
                        layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
                            document.location.reload();
                            return true;
                        });
                    } else if(code == '0001'){
                        {
                            layer.msg("无此借款！");
                            return false;
                        }
                    } else if(code == '0002'){
                        {
                            layer.msg("还款已存在，请查看代办事项！");
                            return false;
                        }
                    } else if(code == '0003'){
                        {
                            layer.msg("还款计划查询异常！");
                            return false;
                        }
                    } else if(code == '0004'){
                        {
                            layer.msg("借款客户查询异常！");
                            return false;
                        }
                    } else if(code == '0005'){
                        {
                            layer.msg("启动还款流程异常");
                            return false;
                        }
                    } else if(code == '0006'){
                        {
                            layer.msg("还款数据插入异常！");
                            return false;
                        }
                    } else if(code == '0007'){
                        {
                            layer.msg("流程实例不存在！");
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
        <li>催收列表</li>
    </ul>
</div>

<div class="main-con">
    <div class="table-area" id="con_one_1">
        <table border="0" cellspacing="0" cellpadding="0"
               class="table table-bordered table-condensed table-striped table-hover tb-01 tb-font-s">
            <tr>
                <th>项目名称</th>
                <th>还款期数</th>
                <th>还款本金</th>
                <th>还款利息</th>
                <th>gps费用</th>
                <th>停车费</th>
                <th>管理费用</th>
                <th>应还款时间</th>
                <th>实还款时间</th>
                <th>应还金额</th>
                <th>实还金额</th>
                <th>逾期天数</th>
                <th>产生罚息</th>
                <th>是否还款</th>
                <th>当前还款状态</th>
                <th>还款方式</th>
                <th>操作</th>
            </tr

            <c:set var="tp" value="${repaymentDetailPage}"/>
            <c:forEach items="${tp.context}" var="l">
                <tr>
                    <td align="center">${l.prodectName }</td>
                    <td align="center">${l.repayPeriod }</td>
                    <td align="center">${l.repayCap}</td>
                    <td align="center">${l.repayIns}</td>
                    <td align="center">${l.gpsCost}</td>
                    <td align='center'>${l.parkCost}</td>
                    <td align="center">${l.manageFee}</td>
                    <td align="center"><fmt:formatDate value="${l.repayDate}"
                                                       pattern="yyyy-MM-dd HH:mm"/></td>
                    <td align="center"><fmt:formatDate value="${l.acutRepaymentTime}"
                                                       pattern="yyyy-MM-dd HH:mm"/></td>
                    <td align="center">${l.repaymentSum}</td>
                    <td align="center">${l.actuRpaymentSum}</td>
                    <td align="center">${l.overdueDay}</td>
                    <td align="center">${l.overdueFee}</td>

                    <c:if test="${l.isRepay == 1}">
                        <td align="center">已还款</td>
                    </c:if>
                    <c:if test="${l.isRepay == 0}">
                        <td align="center">待还清</td>
                    </c:if>
                    <c:if test="${empty l.isRepay}">
                        <td align="center">待还清</td>
                    </c:if>
                    <c:if test="${l.repaymentType == 'commonRepayment'}">
                        <td align="center">正常还款</td>
                    </c:if>
                    <c:if test="${l.repaymentType == 'continueRepayment'}">
                        <td align="center">续借还款</td>
                    </c:if>
                    <c:if test="${l.repaymentType == 'advancedRepayment'}">
                        <td align="center">提前还款</td>
                    </c:if>
                    <c:if test="${l.repaymentType == 'vehicleNoSaleRepayment'}">
                        <td align="center">还款不提车</td>
                    </c:if>
                    <c:if test="${l.repaymentType == 'saleRepayment'}">
                        <td align="center">卖车还款</td>
                    </c:if>
                    <c:if test="${l.repaymentType == 'detainedCarRepayment'}">
                        <td align="center">还款提车</td>
                    </c:if>
                    <c:if test="${empty  l.repaymentType}">
                        <td align="center">尚未还款</td>
                    </c:if>
                    <c:if test="${l.repaymentType == ''}">
                        <td align="center">尚未还款</td>
                    </c:if>

                    <c:if test="${l.repayType == 'AverageCapitalPlusInterest'}">
                        <td align="center">等额本息</td>
                    </c:if>
                    <c:if test="${l.repayType == 'InterestRatesBefore'}">
                        <td align="center">先息后本</td>
                    </c:if>
                    <c:if test="${l.repayType == 'flexiblerepaymentv2'}">
                        <td align="center">灵活还款</td>
                    </c:if>
                    <c:if test="${l.repayType == 'averagePrincipalreduceinterest'}">
                        <td align="center">等本减息</td>
                    </c:if>
                    <c:if test="${l.repayType == 'averagePrincipalzerointerestrent'}">
                        <td align="center">等本零息(押证)</td>
                    </c:if>
                    <c:if test="${l.repayType == 'intrestbeforePrincipaltransfer'}">
                        <td align="center">先息后本(押车)</td>
                    </c:if>
                    <c:if test="${l.repayType == 'intrestbeforePrincipalrent'}">
                        <td align="center">先息后本(押证)</td>
                    </c:if>
                    <c:if test="${empty  l.repayType}">
                        <td align="center">默认方式</td>
                    </c:if>
                    <c:if test="${l.repayType == ''}">
                        <td align="center">默认方式</td>
                    </c:if>
                    <td align="center">
                        <a class="link-01" href="javascript:repaymentAppley('${l.loanId}')">还款</a>
                        <a href="${basePath}/admin/loan/adminShowLoanEndRepaymentOrderAllByProcessInds.html?loanId=${l.loanId}"
                           class="link-01">查看详情</a>
                    </td>
                </tr>

            </c:forEach>
            <tr>
                <td colspan="7">
                    共有<strong  style="color:red">${tp.totalcount }</strong>条记录,分为<strong style="color:red">${tp.totalpage }</strong>页,当前是<strong style="color:red">${tp.currentpage+1 }</strong>页
                    &nbsp; &nbsp;
                    <c:if test="${tp.haslast }">
                        <a href="${basePath}/admin/loan/findRepaymentLoanInfoVoListAll?page=0">首页</a>
                        <a href="${basePath}/admin/loan/findRepaymentLoanInfoVoListAll?page=${tp.currentpage-1 }">上一页</a>
                    </c:if>
                    <c:if test="${!tp.haslast }">
                        首页
                        上一页
                    </c:if>
                    <c:if test="${tp.hasnext }">
                        <a href="${basePath}/admin/loan/findRepaymentLoanInfoVoListAll?page=${tp.currentpage+1 }">下一页</a>
                        <a href="${basePath}/admin/loan/findRepaymentLoanInfoVoListAll?page=${tp.totalpage-1 }">尾页</a>
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
