<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="table-area" id="con_one_1">
    <table border="0" cellspacing="0" cellpadding="0"
           class="table table-bordered table-condensed table-striped table-hover tb-01 tb-font-s">
        <thead>
        <tr>
            <th>评审人</th>
            <th>评审环节</th>
            <th>评审结果</th>
            <th>审批金额</th>
            <th>评审结论</th>
            <th>评审时间</th>
        </tr>
        </thead>
        <tbody>
        <c:if test="${!empty loanReviewRecord}">
            <c:forEach items="${loanReviewRecord}" var="lrr">
                <tr>
                    <td>${lrr.user.realname}</td>
                    <td>
                        <c:if test="${lrr.reviewLevel eq 'vehicleAssess'}">车辆评估</c:if>
                        <c:if test="${lrr.reviewLevel eq 'departLeadAduit'}">初审</c:if>
                        <c:if test="${lrr.reviewLevel eq 'trialPhase'}">总部面审</c:if>
                        <c:if test="${lrr.reviewLevel eq 'callBack'}">总部电话回访</c:if>
                        <c:if test="${lrr.reviewLevel eq 'visiteCheck'}">线下上门核实</c:if>
                        <c:if test="${lrr.reviewLevel eq 'judgment'}">总部终审</c:if>
                        <c:if test="${lrr.reviewLevel eq 'signContract'}">签订相关合同</c:if>
                        <c:if test="${lrr.reviewLevel eq 'dataReview'}">资料复核</c:if>
                        <c:if test="${lrr.reviewLevel eq 'lended'}">出账</c:if>
                    </td>
                    <td>

                        <c:if test="${lrr.reviewLevel != 'signContract'}">
                            <c:if test="${lrr.reviewStatus eq 'passed'}">通过</c:if><c:if
                                test="${lrr.reviewStatus eq 'rejected'}">不通过</c:if>
                            <c:if test="${lrr.reviewStatus eq 'concludeAgain'}">合同调整</c:if>
                        </c:if>

                        <c:if test="${lrr.reviewLevel eq 'signContract'}"><c:if
                                test="${lrr.reviewStatus eq 'passed'}">已家访</c:if><c:if
                                test="${lrr.reviewStatus eq 'rejected'}">未家访</c:if>
                        </c:if>
                    </td>
                    <td>
                        <c:if test="${lrr.reviewLevel eq 'judgment' or lrr.reviewLevel eq 'trialPhase'}">
                            <fmt:formatNumber pattern="#.00" value="${lrr.reviewAmount}"/>
                        </c:if>
                        <c:if test="${lrr.reviewLevel != 'judgment' and lrr.reviewLevel !=
                        'trialPhase'}">
                            ----
                        </c:if>
                    </td>
                    <td>${lrr.reviewConclusion}</td>
                    <td><fmt:formatDate value="${lrr.createdAt}"
                                        pattern="yyyy-MM-dd HH:mm:ss" /></td>
                </tr>
            </c:forEach>
        </c:if>
        </tbody>
    </table>
</div>
